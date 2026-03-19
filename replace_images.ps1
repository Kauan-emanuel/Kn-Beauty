$dict = @{
    "colares.html" = "./assets/images/produtos/colares.jpg"
    "pulseiras.html" = "./assets/images/produtos/pulseiras.jpg"
    "tornozeleiras.html" = "./assets/images/produtos/tornozeleira.jpg"
    "brincos-unitarios.html" = "./assets/images/produtos/brincos_unitários.jpg"
    "brincos-cartelas.html" = "./assets/images/produtos/brincos_cartelas.jpg"
}

foreach ($key in $dict.Keys) {
    if (Test-Path $key) {
        $c = Get-Content $key -Encoding UTF8 -Raw
        $c = [regex]::Replace($c, 'https://images\.unsplash\.com/[^\s"''\)]+', $dict[$key])
        Set-Content -Path $key -Value $c -Encoding UTF8
    }
}

$c = Get-Content index.html -Raw -Encoding UTF8
$c = $c -replace 'https://images\.unsplash\.com/photo-1616428796856-11f2672fa9bd[^\s"]*', './assets/images/produtos/tornozeleira.jpg'
$c = $c -replace 'https://images\.unsplash\.com/photo-1573408301145-b98c46234d60[^\s"]*', './assets/images/produtos/tornozeleira.jpg'
$c = $c -replace 'https://images\.unsplash\.com/photo-1599643477874-5c866f59eb83[^\s"]*', './assets/images/produtos/colares.jpg'
$c = $c -replace 'https://images\.unsplash\.com/photo-1599643478514-4a1ab6c429bf[^\s"]*', './assets/images/produtos/colares.jpg'
$c = $c -replace 'https://images\.unsplash\.com/photo-1535632066927-ab7c9ab60908[^\s"]*', './assets/images/produtos/brincos_unitários.jpg'
$c = $c -replace 'https://images\.unsplash\.com/photo-1611591437281-460bfbe1220a[^\s"]*', './assets/images/produtos/pulseiras.jpg'
$c = [regex]::Replace($c, 'https://images\.unsplash\.com/[^\s"''\)]+', './assets/images/produtos/brincos_cartelas.jpg')
Set-Content index.html -Value $c -Encoding UTF8

$cssPath = "./assets/css/style.css"
$css = Get-Content $cssPath -Encoding UTF8 -Raw
$css = [regex]::Replace($css, 'url\(''https://images\.unsplash\.com/[^'']+\''\)', "url('../images/produtos/colares.jpg')")
$css = [regex]::Replace($css, 'url\("https://images\.unsplash\.com/[^"]+"\)', "url('../images/produtos/colares.jpg')")
Set-Content $cssPath -Value $css -Encoding UTF8
