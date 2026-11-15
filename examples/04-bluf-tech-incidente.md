# Exemplo 04 — Relatório de incidente (`modo: bluf-tech`)

> Dados fictícios.

## Entrada caótica (e-mail de 15 linhas)

```
Oi pessoal, tudo bem? Queria compartilhar um pouco do que aconteceu ontem à noite.
Por volta das 22h começamos a receber alertas do Grafana sobre latência na API de
pagamentos. Inicialmente achamos que fosse o banco, então o João foi olhar as
queries lentas, mas não era isso. Depois de um tempo, percebemos que o deploy das
21h40 tinha subido com o pool de conexões do Redis configurado com 5 em vez de 50,
porque alguém sobrescreveu a variável de ambiente no Helm chart. Fizemos rollback
às 23h15 e tudo normalizou. Durante esse tempo, cerca de 12% dos checkouts falharam,
o que dá mais ou menos 1.800 pedidos. A gente acha que seria importante ter uma
validação no CI que impeça esse tipo de coisa, e talvez um alerta mais cedo no pool.
Eu posso fazer a validação, mas precisaria de um dia de trabalho. O que vocês acham?
Abraço!
```

## Saída

```
Assunto: Resolvido: falha em 12% dos checkouts (13/11, 21h40–23h15) — aprovação de 1 dia para correção no CI

**Resolvido: a API de pagamentos falhou em 12% dos checkouts por 1h35 ontem; causa: pool do Redis com 5 conexões em vez de 50.**

Impacto: ~1.800 pedidos não concluídos, 13/11, entre 21h40 e 23h15.

Causa raiz: o deploy das 21h40 sobrescreveu a variável de pool no Helm chart.

Correção aplicada: rollback às 23h15; serviço normal desde então.

Aprovação solicitada: 1 dia de trabalho para uma validação no CI que bloqueie valores de pool fora da faixa esperada. Responsável: [PESSOA-1]. Início: [INSERIR DATA].

Também proposto: alerta de saturação do pool antes do alerta de latência — responsável e prazo a definir.
```

Modo: `bluf-tech`. Preencher: data de início. Dados mascarados: 1 nome. Confirmar: horário de início (o e-mail cita o deploy às 21h40 e os alertas às 22h).

## O que mudou

- O e-mail terminava em pergunta aberta ("O que vocês acham?"). Agora termina em pedido de aprovação com custo.
- A investigação descartada (queries do banco) saiu: não muda a decisão.
- 15 linhas → 6 blocos curtos; quem lê só o assunto já sabe o que aconteceu e o que se pede.
