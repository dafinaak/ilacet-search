Laravel NDC Lookup App

Ky është një aplikacion i ndërtuar me Laravel që lejon përdoruesit të kërkojnë për disa kode NDC njëkohësisht. Kërkimi fillimisht bëhet në bazën e të dhënave lokale dhe nëse ndonjë kod nuk gjendet, ai kërkohet në API-në OpenFDA. Rezultatet ruhen dhe shfaqen me burimin përkatës.

---

Udhëzime Instalimi

1. **Instalo varësitë e projektit**:
   ```bash
   composer install
   npm install && npm run build
   ```

2. **Kopjo konfigurimin e mjedisit**:
   ```bash
   cp .env.example .env
   ```

3. **Përditëso `.env` me të dhënat e databazës tënde**.

4. **Gjenero çelësin e aplikacionit**:
   ```bash
   php artisan key:generate
   ```

5. **Krijo tabelat në databazë**:
   ```bash
   php artisan migrate
   ```

6. **Nis serverin lokal**:
   ```bash
   php artisan serve
   ```

   7. **Nis front**
    ```npm run dev
   http://localhost:5173/

8. Vizito aplikacionin në:
   ```
   http://localhost:8000
   ```

---

Përshkrim i Shkurtër i Logjikës së Implementuar

- Përdoruesi fut disa kode NDC të ndara me presje në një input fushë.
- Sistemi:
  1. Ndërton një listë të kodeve të veçanta.
  2. Kontrollon në bazën e të dhënave për secilin kod.
  3. Për ata që nuk gjenden:
     - Bëhet **vetëm një API call** për të marrë të gjitha të dhënat nga OpenFDA.
     - Të dhënat e gjetura ruhen në DB dhe shfaqen me burimin `OpenFDA`.
     - Të pa gjeturat shfaqen me burimin `Not Found`.
- Tabela e rezultateve përfshin:
  - `ndc_code`, `brand_name`, `generic_name`, `labeler_name`, `product_type`, `burimi`
- Është përfshirë autentikimi me Laravel Breeze — vetëm përdoruesit e loguar mund të kërkojnë.

---

Ide për Përmirësime ose Funksionalitete Shtesë

- Mbështetje për historikun e kërkimeve për secilin përdorues.
- Kërkim me emrin e produktit ose prodhuesit përveç kodit.
- Grafika statistikore për përdorim dhe shpërndarje të produkteve.
- Filtrim dhe renditje të rezultateve në tabelë.
- Roli "admin" për menaxhimin e përdoruesve dhe kërkesave.
- Cache për kërkime të përsëritura për të reduktuar thirrjet API.


