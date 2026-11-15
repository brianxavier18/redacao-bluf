# Exemplo 02 — Despacho Decisório (`modo: despacho-rapido`)

> Dados fictícios.

## Entrada caótica (anotação do chefe ditada por áudio)

```
sobre aquele pedido de dispensa do cabo pra fazer o curso de inglês sexta à tarde,
olha, eu até acho legal, mas sexta tem a formatura e eu preciso de todo mundo,
então essa sexta não dá. se ele quiser pode ser a partir da outra semana,
manda ele ver com a S1 a troca de horário do serviço. e manda pra S1 resolver
até quarta.
```

## Saída

```
DESPACHO

1. **Indefiro a dispensa de [MILITAR-1] em 20 NOV 26. Autorizo a dispensa às sextas-feiras, à tarde, a partir de 27 NOV 26.**
2. Motivo: formatura em 20 NOV 26, com presença de todo o efetivo.
3. À S1 para ajustar a escala de serviço de [MILITAR-1] até 18 NOV 26.

[Local], 14 de novembro de 2026.
[Assinatura – posto – função]
```

Modo: `despacho-rapido`. Preencher: local e assinatura. Dados mascarados: 1 militar. Confirmar: datas calculadas a partir de "sexta" e "quarta" da semana corrente.

## O que mudou

- "Eu até acho legal, mas..." virou uma decisão de duas partes (indefere a data, autoriza a alternativa) na primeira linha.
- O motivo do indeferimento ficou explícito — obrigatório quando se indefere.
- O encaminhamento tem destinatário (S1) e prazo absoluto.
