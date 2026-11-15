# redacao-bluf

**Uma Skill para agentes de IA que coloca a decisão na primeira linha.** Converte rascunhos, áudios transcritos e e-mails longos em documentos BLUF (*Bottom Line Up Front*) no padrão da redação oficial brasileira — ou em BLUF executivo puro, para times de tecnologia.

Funciona com Claude Code, Cursor, qualquer agente que aceite instruções em Markdown e, **100% offline**, com Ollama.

---

## Antes e depois

**Antes** — mensagem do plantão, 7 linhas, o risco real aparece no fim:

> cmt, a rede caiu aqui no bloco B desde umas 13h, o pessoal do sistema de pessoal não consegue acessar nada, já reiniciei o switch duas vezes e nada. liguei pro CTI e eles disseram que pode ser o link da operadora, abriram chamado. o bloco A tá normal. se não voltar até o fim do dia vai atrasar o fechamento da folha que é amanhã cedo. talvez dê pra levar o pessoal pro bloco A e usar as máquinas de lá, tem umas 6 livres. aguardo

**Depois** — o Comandante lê a linha 3 e já sabe o que decidir:

```
SITREP nº 1 – Indisponibilidade de rede no Bloco B – 141430P NOV 26
STATUS: ALTERADO
1. SITUAÇÃO: Rede do Bloco B fora do ar desde 1300; fechamento da folha de 15 NOV 26 em risco.
4. NECESSIDADES / APOIO: Autorização para transferir a Seção de Pessoal para 6 estações livres no Bloco A, caso a rede não retorne até 1700.
```

(Versão completa em [`examples/03-sitrep.md`](examples/03-sitrep.md).)

---

## O que a Skill faz

| Para quem | Problema | Entrega |
|---|---|---|
| Militares e servidores (FAB, EB, MB, Forças Auxiliares, órgãos públicos) | Rascunho informal que precisa virar documento impessoal e regulamentar | Parte/Solicitação, Despacho e SITREP prontos para assinatura |
| Tech leads e gestores | E-mails e relatórios que escondem o pedido no último parágrafo | BLUF puro: Decisão → Impacto → Contexto → Próximo passo |
| Quem constrói agentes de IA | Logs e resumos verbosos | Camada de formatação de saída: `STATUS / RESULTADO / PENDENTE / AÇÃO HUMANA` |

### Modos

| Modo | Uso |
|---|---|
| `modo: oficial-br` | Correspondência formal: Parte, Ofício, SITREP |
| `modo: despacho-rapido` | Só a decisão do chefe, em 3 a 6 linhas |
| `modo: bluf-tech` | E-mail, Slack, incidente, proposta técnica, saída de agente |

### Três travas de segurança

1. **Sem amparo legal inventado.** A Skill nunca cria número de portaria, boletim ou artigo. Onde falta a fonte, ela escreve `[INSERIR AMPARO LEGAL / BOLETIM]` e lista os marcadores no fim.
2. **Sanitização automática (OPSEC).** Nomes, matrículas, efetivos, locais e placas viram `[MILITAR-1]`, `[LOCAL-A]`, `[EFETIVO]` — a menos que você peça para manter.
3. **Recusa de conteúdo classificado.** Se a entrada parecer sigilosa, a Skill devolve só a estrutura vazia e recomenda o processamento local.

---

## Instalação

### Claude Code

Skill pessoal (vale em todos os projetos):

```bash
git clone https://github.com/brianxavier18/redacao-bluf ~/.claude/skills/redacao-bluf
```

Ou só num projeto: clone em `.claude/skills/redacao-bluf/`. Depois, peça normalmente: *"faça um despacho indeferindo..."*, *"transforme isso num SITREP"*, *"modo: bluf-tech, reescreva este e-mail"*.

### Cursor

Copie o conteúdo de `SKILL.md` (sem o bloco `---` do topo) para `.cursor/rules/redacao-bluf.mdc` e mantenha a pasta `references/` no repositório para o agente consultar.

### Outros agentes

Use `SKILL.md` como instrução de sistema e anexe o arquivo de `references/` do modo desejado.

### Ollama (offline)

Ver [`integracoes/ollama.md`](integracoes/ollama.md). Resumo:

```bash
./integracoes/gerar-modelfile.sh qwen2.5:14b > Modelfile
ollama create redacao-bluf -f Modelfile
ollama run redacao-bluf "modo: oficial-br. Redija uma parte: ..."
```

---

## ⚠️ Segurança da informação

- **Não cole em serviços de IA na nuvem** escalas, efetivos, dados pessoais ou documentos de acesso restrito. Para isso, use a execução local via Ollama.
- A sanitização automática é uma camada extra, não uma garantia. Revise o texto antes de enviar a qualquer serviço externo.
- Rodar offline não autoriza processar informação classificada em computador não credenciado. Siga a política da sua instituição.

## Aviso sobre normas

As referências resumem práticas comuns da redação oficial (Manual de Redação da Presidência da República) e da correspondência militar. Cada instituição tem normas próprias e atualizadas; **o modelo da sua OM prevalece sobre o desta Skill**. Confira pronomes, fechos e cabeçalhos antes de assinar.

---

## Estrutura

```
redacao-bluf/
├── SKILL.md                         # regras centrais e travas
├── references/
│   ├── padrao-militar-br.md         # tratamento, fechos, cabeçalhos, DTG
│   └── modo-bluf-executivo.md       # BLUF sem caserna
├── examples/                        # entrada caótica → saída formatada
│   ├── 01-parte-solicitacao.md
│   ├── 02-despacho-decisorio.md
│   ├── 03-sitrep.md
│   └── 04-bluf-tech-incidente.md
└── integracoes/
    ├── ollama.md
    ├── gerar-modelfile.sh
    └── gerar-modelfile.ps1
```

## Contribuindo

Pull requests são bem-vindos, principalmente:

- Novos pares de exemplo (entrada → saída), **sempre com dados fictícios**.
- Variações de cabeçalho por instituição (DIEx, Ofício, Memorando), citando a norma pública de origem.
- Casos em que o modelo inventou amparo ou vazou dado sensível — abra uma issue com a entrada (sanitizada) e a saída.

## Licença

[MIT](LICENSE).
