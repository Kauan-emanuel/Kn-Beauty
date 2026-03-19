$files = Get-ChildItem -Path '.' -Filter '*.html'
foreach ($f in $files) {
    $c = Get-Content $f.FullName -Encoding UTF8 -Raw
    $c = $c -replace 'href="brincos\.html"', 'href="brincos-unitarios.html"'
    Set-Content $f.FullName -Value $c -Encoding UTF8
}
