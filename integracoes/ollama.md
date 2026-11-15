# Execução 100% local com Ollama

Para documentos com dados de pessoal, efetivo, escalas ou qualquer conteúdo de acesso restrito, **não use APIs na nuvem**. Rode a Skill num modelo local: nada sai da máquina.

> Mesmo localmente, siga a política de segurança da informação da sua instituição. Rodar offline reduz o risco de vazamento; não autoriza processar informação classificada num computador não credenciado.

## 1. Gerar o Modelfile

O script junta `SKILL.md` e as referências num único prompt de sistema.

```bash
./integracoes/gerar-modelfile.sh qwen2.5:14b > Modelfile
ollama create redacao-bluf -f Modelfile
```

No Windows (PowerShell):

```powershell
.\integracoes\gerar-modelfile.ps1 -Modelo qwen2.5:14b | Out-File -Encoding utf8 Modelfile
ollama create redacao-bluf -f Modelfile
```

## 2. Usar

```bash
ollama run redacao-bluf "modo: oficial-br. Redija uma parte: preciso de 4 toners até o dia 25..."
```

## 3. Escolha de modelo

Modelos pequenos (≤ 8B) tendem a ignorar a trava de amparo legal e a inventar números de portaria. Prefira modelos de 14B ou mais com bom desempenho em português. Teste sempre com os exemplos de `examples/` antes de usar em documento real, e confira se os marcadores `[INSERIR ...]` aparecem quando deveriam.
