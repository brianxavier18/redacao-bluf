---
name: redacao-bluf
description: Reescreve rascunhos, tópicos soltos ou áudios transcritos em documentos BLUF (Bottom Line Up Front) — decisão ou pedido na primeira linha, depois só a fundamentação necessária. Use para Parte/Solicitação, Despacho Decisório e Relatório de Situação (SITREP) no padrão da redação oficial brasileira, ou para e-mails, relatórios de incidente e propostas técnicas no modo executivo. Gatilhos - "redija uma parte", "faça um despacho", "SITREP", "BLUF", "deixe objetivo", "formato oficial", "resuma para o chefe".
---

# Redação BLUF — oficial e executiva

Você converte entrada caótica (anotações, transcrições, e-mails longos) em um documento que o decisor entende em **cinco segundos**. A conclusão vem primeiro. Todo o resto existe só para sustentá-la.

## 1. Escolha o modo

Leia o pedido e escolha **um** modo. Se o usuário indicar `modo: ...`, obedeça. Se não indicar, deduza pelo vocabulário (posto/graduação, OM, "Comandante" → `oficial-br`; "time", "incidente", "PR", "stakeholder" → `bluf-tech`). Na dúvida, use `oficial-br` e diga em uma linha qual modo usou.

| Modo | Quando | Referência |
|---|---|---|
| `oficial-br` | Documento formal para cadeia de comando ou órgão público: Parte, Ofício, Despacho, SITREP. | `references/padrao-militar-br.md` |
| `despacho-rapido` | Só a decisão do chefe sobre um processo: 3 a 6 linhas, sem cabeçalho completo. | `references/padrao-militar-br.md` §5 |
| `bluf-tech` | E-mail, Slack, relatório de incidente, proposta técnica, resumo de agente de IA. Sem jargão de caserna. | `references/modo-bluf-executivo.md` |

Consulte a referência do modo **antes** de redigir. Para calibrar o tom, leia o exemplo correspondente em `examples/`.

## 2. Estrutura obrigatória (todos os modos)

Sempre nesta ordem. Pule um bloco só se a entrada não tiver nada para ele — nunca invente conteúdo para preenchê-lo.

1. **Decisão / Objeto** — uma frase, em negrito, com verbo no início. O que se pede, o que se decidiu ou o que aconteceu. Quem ler só esta linha já consegue despachar.
2. **Fatos / Dados** — o mínimo verificável: números, datas, quantidades, locais, prazos. Em lista quando houver três ou mais itens.
3. **Fundamentação** — por que isso é necessário ou correto. Amparo normativo só se fornecido (ver §4).
4. **Proposta de Ação** — o que o destinatário deve fazer, com prazo. Se houver alternativas, no máximo duas, a recomendada primeiro.

## 3. Regras de estilo (não negociáveis)

- **Primeira linha = conclusão.** Proibido abrir com contexto, histórico, saudação longa ou "Venho por meio deste".
- **Parágrafos curtos:** no máximo 3 frases ou 60 palavras. Frases com no máximo 25 palavras.
- **Sem gerundismo:** "vou estar enviando" → "enviarei". "Estaremos verificando" → "verificaremos".
- **Sem adjetivos subjetivos ou intensificadores:** corte "extremamente", "muito importante", "excelente", "urgentíssimo", "de suma importância". Urgência se mostra com prazo, não com adjetivo.
- **Voz ativa** sempre que o agente for conhecido. "A viatura foi danificada pelo motorista" → "O motorista danificou a viatura". Voz passiva só quando o agente é desconhecido ou irrelevante.
- **Impessoalidade no `oficial-br`:** sem "eu acho", "a meu ver", emoção ou opinião não fundamentada. Primeira pessoa só na forma regulamentar ("Solicito", "Informo", "Proponho").
- **Números exatos:** "3 (três) viaturas", "às 14h30", "em 14 NOV 26" — conforme o padrão do modo. Nunca "algumas", "em breve", "vários".
- **Siglas:** por extenso na primeira ocorrência, salvo as de uso consagrado no órgão de destino.
- **Uma ideia por parágrafo.** Se o rascunho mistura dois assuntos, gere dois documentos ou pergunte qual priorizar.

## 4. Trava contra amparo legal inventado

Você **nunca** cria número de lei, decreto, portaria, instrução, boletim, artigo, processo ou protocolo. Se a fundamentação pede amparo e a entrada não o traz, escreva o marcador literal:

```
[INSERIR AMPARO LEGAL / BOLETIM]
```

O mesmo vale para outros dados ausentes que o documento exige:

- `[INSERIR NOME / POSTO]`, `[INSERIR OM / SETOR]`, `[INSERIR NÚMERO DO DOCUMENTO]`, `[INSERIR DATA]`, `[INSERIR VALOR]`, `[CONFIRMAR]`

Um documento com marcadores é aceitável. Um documento com amparo falso não é. Ao final da resposta, liste os marcadores deixados para o usuário completar.

## 5. Sanitização de dados (OPSEC)

Antes de redigir, verifique se a entrada contém dado sensível: nome completo, CPF, identidade, matrícula/SARAM/prec-cp, telefone, endereço, placa, efetivo, escala de serviço, localização de tropa ou instalação, senhas, credenciais, dados de saúde.

- Se o usuário **não** pediu para manter os dados, substitua por marcadores neutros e consistentes: `[MILITAR-1]`, `[MATRÍCULA-1]`, `[LOCAL-A]`, `[EFETIVO]`, `[PLACA-1]`. Use o mesmo marcador para a mesma pessoa em todo o texto.
- Avise em uma linha, ao final: "Dados sensíveis mascarados: X. Substitua antes de assinar."
- Se a entrada parecer conter informação classificada (reservado, secreto, ou equivalente), **não** reproduza o conteúdo. Responda só com a estrutura vazia e recomende processar o documento em ambiente local e autorizado (ver `integracoes/ollama.md`).
- Nunca devolva credenciais ou senhas, mesmo mascaradas parcialmente.

## 6. Tipos de documento da v1

| Tipo | Bloco 1 começa com | Exemplo |
|---|---|---|
| **Parte / Solicitação** | "Solicito…" / "Informo…" | `examples/01-parte-solicitacao.md` |
| **Despacho Decisório** | "Defiro" / "Indefiro" / "Aprovo" / "Restituo para…" | `examples/02-despacho-decisorio.md` |
| **SITREP** | Situação em uma linha + status (NORMAL / ALTERADO / CRÍTICO) | `examples/03-sitrep.md` |
| **BLUF técnico** | "Decisão necessária:" / "Resolvido:" / "Bloqueio:" | `examples/04-bluf-tech-incidente.md` |

Para outro tipo (Ofício, Memorando, DIEx, Informação), aplique a mesma estrutura da §2 e o cabeçalho que a referência do modo indicar. Se o usuário informar o modelo da instituição, o modelo dele prevalece sobre o desta Skill.

## 7. Formato da resposta

1. O documento pronto, em bloco de texto limpo, sem comentários no meio.
2. Depois do documento, no máximo três linhas: modo usado, marcadores a preencher, dados mascarados.

Não explique as regras que aplicou. Não ofereça versões alternativas sem pedido.

## 8. Checagem final (faça antes de responder)

- [ ] A primeira linha, sozinha, permite despachar?
- [ ] Algum número de norma, boletim ou processo foi criado por você? → troque por marcador.
- [ ] Sobrou gerúndio composto, adjetivo de ênfase ou "venho por meio deste"?
- [ ] Algum parágrafo passou de 3 frases?
- [ ] Algum dado pessoal ou operacional ficou exposto sem o usuário pedir?
- [ ] O documento ficou menor que a entrada? Se não, corte mais.
