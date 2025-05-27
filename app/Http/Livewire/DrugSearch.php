<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Drug;
use Illuminate\Support\Facades\Http;

class DrugSearch extends Component
{
    public $input;
    public $results = [];
    public $loading = false;

    // Pagination vars
    public $page = 1;
    public $perPage = 5;

    public function search()
    {
        $this->loading = true;
        $this->results = [];
        $this->page = 1; // reset page kur kërkohet ri

        $ndcCodes = collect(explode(',', $this->input))
            ->map(fn($code) => trim($code))
            ->filter();

        $existingDrugs = Drug::whereIn('ndc_code', $ndcCodes)->get()->keyBy('ndc_code');
        $missingCodes = $ndcCodes->diff($existingDrugs->keys());

        foreach ($existingDrugs as $drug) {
            $this->results[] = [
                'ndc_code' => $drug->ndc_code,
                'brand_name' => $drug->brand_name,
                'generic_name' => $drug->generic_name,
                'labeler_name' => $drug->labeler_name,
                'product_type' => $drug->product_type,
                'source' => 'Database',
            ];
        }

        if ($missingCodes->isNotEmpty()) {
            $query = $missingCodes->map(fn($code) => 'product_ndc:"' . $code . '"')->implode('+OR+');
            $url = "https://api.fda.gov/drug/ndc.json?search={$query}&limit=100";

            try {
                $response = Http::get($url);

                if ($response->ok()) {
                    $items = $response->json('results') ?? [];

                    $fetched = collect($items)->map(function ($item) {
                        $drug = Drug::create([
                            'ndc_code' => $item['product_ndc'] ?? '',
                            'brand_name' => $item['brand_name'] ?? '',
                            'generic_name' => $item['generic_name'] ?? '',
                            'labeler_name' => $item['labeler_name'] ?? '',
                            'product_type' => $item['product_type'] ?? '',
                        ]);

                        return [
                            'ndc_code' => $drug->ndc_code,
                            'brand_name' => $drug->brand_name,
                            'generic_name' => $drug->generic_name,
                            'labeler_name' => $drug->labeler_name,
                            'product_type' => $drug->product_type,
                            'source' => 'OpenFDA',
                        ];
                    });

                    $this->results = array_merge($this->results, $fetched->toArray());

                    $fetchedCodes = $fetched->pluck('ndc_code');
                    $notFound = $missingCodes->diff($fetchedCodes);

                    foreach ($notFound as $code) {
                        $this->results[] = [
                            'ndc_code' => $code,
                            'brand_name' => '-',
                            'generic_name' => '-',
                            'labeler_name' => '-',
                            'product_type' => '-',
                            'source' => 'Not Found',
                        ];
                    }
                }
            } catch (\Exception $e) {
                // Log or handle error if needed
            }
        }

        $this->loading = false;
    }

    // Computed property për subsetin e rezultateve sipas faqes
    public function getPaginatedResultsProperty()
    {
        $offset = ($this->page - 1) * $this->perPage;
        return array_slice($this->results, $offset, $this->perPage);
    }

    // Metodat për navigim në faqe
    public function nextPage()
    {
        if ($this->page < ceil(count($this->results) / $this->perPage)) {
            $this->page++;
        }
    }

    public function previousPage()
    {
        if ($this->page > 1) {
            $this->page--;
        }
    }

    public function render()
    {
        return view('livewire.drug-search', [
            'paginatedResults' => $this->paginatedResults,
            'page' => $this->page,
            'perPage' => $this->perPage,
            'total' => count($this->results),
        ])->layout('layouts.app');
    }
}
