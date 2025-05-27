<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Drug;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

class DrugSearch extends Component
{
    public $input;
    public $results = [];
    public $loading = false;
    public $authErrorMessage = null;

    // Pagination vars
    public $page = 1;
    public $perPage = 5;

    public function search()
    {
        // Check if the user is authenticated
        if (!Auth::check()) {
            $this->authErrorMessage = 'Ju nuk jeni lloguar ende';
            $this->results = []; // Clear previous results
            return;
        }

        $this->authErrorMessage = null; // Clear previous error message if authenticated
        $this->loading = true;
        $this->results = [];
        $this->page = 1;

        // Merr kodet NDC nga input, ndaj me presje dhe fshij boshllëqet
        $ndcCodes = collect(explode(',', $this->input))
            ->map(fn($code) => trim($code))
            ->filter(fn($code) => !empty($code));

        if ($ndcCodes->isEmpty()) {
            $this->loading = false;
            return;
        }

        // Merr të dhënat nga DB për kodet që ekzistojnë
        $existingDrugs = Drug::whereIn('ndc_code', $ndcCodes)->get()->keyBy('ndc_code');

        // Këto kode nuk i kemi në DB, duhet t'i kërkojmë në API
        $missingCodes = $ndcCodes->diff($existingDrugs->keys());

        // Shto në rezultatet tona ato që i kemi në DB me source Database
        foreach ($existingDrugs as $drug) {
            $this->results[] = [
                'ndc_code' => $drug->ndc_code,
                'brand_name' => $drug->brand_name ?? '-',
                'generic_name' => $drug->generic_name ?? '-',
                'labeler_name' => $drug->labeler_name ?? '-',
                'product_type' => $drug->product_type ?? '-',
                'source' => 'Database',
            ];
        }

        if ($missingCodes->isNotEmpty()) {
            // Përgatit query string për OpenFDA
            $query = $missingCodes->map(fn($code) => 'product_ndc:"' . $code . '"')->implode('+OR+');
            $url = "https://api.fda.gov/drug/ndc.json?search={$query}&limit=100";

            try {
                $response = Http::get($url);

                if ($response->ok()) {
                    $items = $response->json('results') ?? [];

                    // Ruaj dhe shto në rezultatet tona ato që na ktheu API
                    $fetchedCodes = collect();

                    foreach ($items as $item) {
                        // Ruaj në DB duke e mbushur çdo fushë me string bosh nëse mungon
                        $drug = Drug::updateOrCreate(
                            ['ndc_code' => $item['product_ndc'] ?? ''],
                            [
                                'brand_name' => $item['brand_name'] ?? '',
                                'generic_name' => $item['generic_name'] ?? '',
                                'labeler_name' => $item['labeler_name'] ?? '',
                                'product_type' => $item['product_type'] ?? '',
                            ]
                        );

                        $this->results[] = [
                            'ndc_code' => $drug->ndc_code,
                            'brand_name' => $drug->brand_name ?: '-',
                            'generic_name' => $drug->generic_name ?: '-',
                            'labeler_name' => $drug->labeler_name ?: '-',
                            'product_type' => $drug->product_type ?: '-',
                            'source' => 'OpenFDA',
                        ];

                        $fetchedCodes->push($drug->ndc_code);
                    }

                    // Për ato që nuk i gjeti as në DB as në API shfaq "Not Found"
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
                } else {
                    // Në rast që API nuk punoi, shfaq "Not Found"
                    foreach ($missingCodes as $code) {
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
                Log::error('OpenFDA API Exception: ' . $e->getMessage());
                foreach ($missingCodes as $code) {
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
        }

        $this->loading = false;
    }

    // Paginimi i rezultateve
    public function getPaginatedResultsProperty()
    {
        $offset = ($this->page - 1) * $this->perPage;
        return array_slice($this->results, $offset, $this->perPage);
    }

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

    public function exportCsv()
    {
        if (empty($this->results)) {
            return;
        }

        $filename = 'ndc_search_results_' . now()->format('YmdHis') . '.csv';

        $headers = [
            'Content-Type' => 'text/csv',
            'Content-Disposition' => 'attachment; filename="' . $filename . '"',
        ];

        $callback = function() {
            $file = fopen('php://output', 'w');

            // Add CSV headers
            fputcsv($file, ['NDC', 'Brand Name', 'Generic Name', 'Labeler', 'Type', 'Source']);

            // Add data rows
            foreach ($this->results as $row) {
                fputcsv($file, [
                    $row['ndc_code'],
                    $row['brand_name'],
                    $row['generic_name'],
                    $row['labeler_name'],
                    $row['product_type'],
                    $row['source'],
                ]);
            }

            fclose($file);
        };

        return response()->streamDownload($callback, $filename, $headers);
    }

    public function deleteDrug($ndcCode)
    {
        // Find and delete the drug from the database
        Drug::where('ndc_code', $ndcCode)->delete();

        // Remove the deleted drug from the current results list
        $this->results = collect($this->results)->filter(fn($item) => $item['ndc_code'] !== $ndcCode)->values()->all();

        // Reset pagination to ensure deleted item is removed from current page view
        $this->page = 1;
    }
}
