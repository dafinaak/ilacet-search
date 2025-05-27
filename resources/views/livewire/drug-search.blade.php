<div class="p-6 max-w-4xl mx-auto">

    <h1 class="text-3xl font-bold mb-4 text-center">Aplikacioni për Menaxhimin e llaqeve</h1>

    <div class="flex gap-2 items-start">
        <input
            type="text"
            wire:model.defer="input"
            autocomplete="off"
            placeholder="Shkruaj kodet NDC të ndara me presje, p.sh. 12345-6789, 11111-2222, 99999-0000"
            class="w-full border rounded px-4 py-2 shadow-sm focus:outline-none focus:ring focus:ring-blue-300"
        >

        <button
            wire:click="search"
            wire:loading.attr="disabled"
            class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition"
        >
            Kërko
        </button>
    </div>

    <button
    wire:click="exportCsv"
    class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 transition mt-4"
    >
    Eksporto në CSV
    </button>

    {{-- Authentication Error Message --}}
    @if ($authErrorMessage)
        <p class="mt-4 text-red-600">{{ $authErrorMessage }}</p>
    @endif

    {{-- Spinner gjatë kërkimit --}}
    <div wire:loading class="mt-4 flex items-center text-blue-600 gap-2">
        <svg class="animate-spin h-5 w-5 text-blue-600" xmlns="http://www.w3.org/2000/svg" fill="none"
             viewBox="0 0 24 24">
            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor"
                    stroke-width="4"></circle>
            <path class="opacity-75" fill="currentColor"
                  d="M4 12a8 8 0 018-8v4a4 4 0 00-4 4H4z"></path>
        </svg>
        Duke Kerkuar...
    </div>

    {{-- Tabela e rezultateve ose mesazhi nëse nuk ka --}}
    @if(!empty($results))
        <div class="mt-6 overflow-x-auto">
            <table class="min-w-full border text-sm">
                <thead>
                    <tr class="bg-gray-100">
                        <th class="border px-2 py-1 min-w-[93px]">Kodi</th>
                        <th class="border px-2 py-1 min-w-[153px]">Emri i Produktit</th>
                        <th class="border px-2 py-1">Emri Generik</th>
                        <th class="border px-2 py-1 min-w-[130px]">Prodhuesi</th>
                        <th class="border px-2 py-1 min-w-[150px]">Lloji i Produktit</th>
                        <th class="border px-2 py-1 min-w-[88px]">Burimi</th>
                        <th class="border px-2 py-1">Veprime</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($paginatedResults as $item)
                        <tr class="odd:bg-white even:bg-gray-50 hover:bg-blue-50">
                            <td class="border px-2 py-1">{{ $item['ndc_code'] }}</td>
                            <td class="border px-2 py-1 whitespace-normal min-w-[150px]">{{ $item['brand_name'] }}</td>
                            <td class="border px-2 py-1 whitespace-normal min-w-[150px]">{{ $item['generic_name'] }}</td>
                            <td class="border px-2 py-1">{{ $item['labeler_name'] }}</td>
                            <td class="border px-2 py-1">{{ $item['product_type'] }}</td>
                            <td class="border px-2 py-1 font-semibold">
                                {{ $item['source'] }}
                            </td>
                            <td class="border px-2 py-1">
                                @if($item['source'] === 'Database')
                                    <button
                                        wire:click="deleteDrug('{{ $item['ndc_code'] }}')"
                                        wire:confirm="A jeni i sigurt që dëshironi të fshini këtë ilaç?"
                                        class="bg-red-600 text-white px-2 py-1 rounded hover:bg-red-700 text-xs"
                                    >
                                        Fshi
                                    </button>
                                @else
                                    -
                                @endif
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        {{-- Pagination Controls --}}
        <div class="mt-4 flex justify-between items-center">
            <button
                wire:click="previousPage"
                @if($page <= 1) disabled @endif
                class="bg-gray-300 text-gray-700 px-4 py-1 rounded disabled:opacity-50"
            >
                Previous
            </button>

            <span>Faqja {{ $page }} nga {{ ceil($total / $perPage) }}</span>

            <button
                wire:click="nextPage"
                @if($page >= ceil($total / $perPage)) disabled @endif
                class="bg-gray-300 text-gray-700 px-4 py-1 rounded disabled:opacity-50"
            >
                Next
            </button>
        </div>

    @elseif($input && !$authErrorMessage)
        <p class="mt-4 text-red-600">
            Nuk u gjetën rezultate për kodet e shkruara.
            <br>
            Ju lutemi kontrolloni nëse kodet NDC janë të saktë dhe të ndarë me presje, p.sh. <code>59762-3722</code>.
        </p>
    @endif

</div>
