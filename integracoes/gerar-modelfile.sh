#!/usr/bin/env sh
# Gera um Modelfile do Ollama com a Skill como prompt de sistema.
# Uso: ./integracoes/gerar-modelfile.sh [modelo] > Modelfile
set -eu
MODELO="${1:-qwen2.5:14b}"
RAIZ="$(cd "$(dirname "$0")/.." && pwd)"

printf 'FROM %s\n' "$MODELO"
printf 'PARAMETER temperature 0.2\n'
printf 'SYSTEM """\n'
# Remove o frontmatter YAML do SKILL.md e escapa aspas triplas.
awk 'NR==1 && /^---$/ {f=1; next} f && /^---$/ {f=0; next} !f' "$RAIZ/SKILL.md" | sed 's/"""/" " "/g'
for ref in "$RAIZ"/references/*.md; do
  printf '\n\n---\n\n'
  sed 's/"""/" " "/g' "$ref"
done
printf '\n"""\n'
