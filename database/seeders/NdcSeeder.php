<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Drug; 
use Illuminate\Support\Facades\DB;

class NdcSeeder extends Seeder
{
    public function run(): void
    {
        foreach (range(1, 50) as $i) {
            Drug::create([
                'ndc_code'     => '12345-' . str_pad($i, 4, '0', STR_PAD_LEFT),
                'brand_name'   => 'Brand ' . $i,
                'generic_name' => 'GenericName ' . $i,
                'labeler_name' => 'Labeler ' . $i,
                'product_type' => 'Human Prescription Drug',
            ]);
        }
    }
}
