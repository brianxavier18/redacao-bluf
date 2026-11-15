# Gera um Modelfile do Ollama com a Skill como prompt de sistema.
# Uso: .\integracoes\gerar-modelfile.ps1 -Modelo qwen2.5:14b | Out-File -Encoding utf8 Modelfile
param([string]$Modelo = "qwen2.5:14b")
$ErrorActionPreference = "Stop"
$raiz = Split-Path -Parent $PSScriptRoot

$skill = Get-Content -Raw -Encoding UTF8 (Join-Path $raiz "SKILL.md")
# Remove o frontmatter YAML.
$skill = $skill -replace '(?s)^---\r?\n.*?\r?\n---\r?\n', ''

$partes = @($skill)
Get-ChildItem (Join-Path $raiz "references") -Filter *.md | Sort-Object Name | ForEach-Object {
    $partes += (Get-Content -Raw -Encoding UTF8 $_.FullName)
}
$corpo = ($partes -join "`n`n---`n`n") -replace '"""', '" " "'

"FROM $Modelo"
"PARAMETER temperature 0.2"
'SYSTEM """'
$corpo
'"""'
