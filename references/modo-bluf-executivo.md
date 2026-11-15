# Modo `bluf-tech` — BLUF executivo, sem caserna

Mesma espinha da redação militar, sem posto, sem fecho regulamentar, sem numeração de parágrafo obrigatória. Público: tech leads, gestores, clientes, canais assíncronos (e-mail, Slack, Teams, issues, PRs) e saídas de agentes de IA.

## 1. Estrutura: Decisão → Impacto → Contexto → Próximo passo

```
**[Rótulo]: [conclusão em uma frase].**

Impacto: [quem/o quê é afetado, em número: usuários, R$, horas, SLA].

Contexto:
- [fato 1]
- [fato 2]
- [fato 3]

Próximo passo: [ação] — [responsável] — [prazo].
```

Rótulos para a primeira linha (escolha um):

| Rótulo | Quando |
|---|---|
| **Decisão necessária:** | Você precisa que o leitor escolha algo. Termine a frase com as opções e a sua recomendação. |
| **Aprovação solicitada:** | Há uma recomendação única aguardando "sim". |
| **Resolvido:** | Incidente encerrado; o leitor só precisa saber. |
| **Em andamento:** | Incidente aberto; diga o ETA. |
| **Bloqueio:** | Algo parou e depende de outra pessoa. Nomeie quem. |
| **Para conhecimento:** | Nada a fazer; informe e saia. Use raramente. |

## 2. Regras específicas

- **Assunto do e-mail = primeira linha.** Ex.: "Decisão até 6ª: migrar fila para SQS ou manter RabbitMQ".
- **Uma pergunta por mensagem.** Se houver duas decisões, duas mensagens ou uma lista numerada explícita.
- **Recomendação explícita.** "Recomendo A" — nunca "deixo a seu critério" sem opinião.
- **Números em vez de adjetivos.** "p95 subiu de 180 ms para 2,4 s", não "ficou bem lento".
- **Prazos absolutos.** "até 18/11, 12h", não "amanhã" ou "ASAP".
- **Sem desculpas preliminares.** Corte "Desculpe o e-mail longo", "Só para contextualizar".
- **Detalhes técnicos vão para o fim ou para link.** Logs, stack traces e tabelas extensas ficam em "Anexos" ou num link, nunca antes da decisão.
- **Tamanho-alvo:** até 120 palavras acima de "Anexos". Se passar, o problema é de escopo, não de redação.

## 3. Variações

**Incidente (postmortem curto)**

```
**Resolvido: [serviço] ficou indisponível por [duração] em [data]; causa: [causa em 8 palavras].**
Impacto: [usuários / requisições / R$].
Causa raiz: [1–2 frases].
Correção aplicada: [o que foi feito].
Prevenção: [ação] — [responsável] — [prazo].
```

**Proposta técnica**

```
**Aprovação solicitada: [mudança] para [ganho mensurável].**
Custo: [horas, R$, risco].
Alternativa descartada: [opção] — [motivo em uma linha].
Se aprovado: [primeiro marco] em [data].
```

**Saída de agente de IA (log/resumo)**

```
STATUS: [OK | FALHOU | PARCIAL] — [tarefa] — [duração]
RESULTADO: [o que foi entregue, com caminho/link].
PENDENTE: [o que não foi feito e por quê].
AÇÃO HUMANA: [o que alguém precisa decidir, ou "nenhuma"].
```

Nesta variação, é proibido narrar o processo ("Primeiro eu li o arquivo, depois..."). Só estado final.

## 4. Amparo e dados sensíveis

As travas do `SKILL.md` §4 e §5 valem aqui. Em vez de normas, o risco é inventar números de ticket, versão, métrica ou SLA: use `[INSERIR TICKET]`, `[INSERIR MÉTRICA]`, `[CONFIRMAR]`. Mascare e-mails, tokens, IPs internos, nomes de clientes e hostnames de produção se o usuário não pediu para mantê-los.
