# Exemplo 01 — Parte / Solicitação (`modo: oficial-br`)

> Dados fictícios. Nomes e OM inventados para ilustração.

## Entrada caótica

```
bom dia chefe, então, to escrevendo pq a gente ta com problema na seção,
as impressoras tão dando pau direto e o toner acabou faz uma semana,
o pessoal ta tendo q imprimir as escalas lá no setor do lado o que atrasa tudo,
ja pedi pro almox mas disseram q tem q ser por parte. precisa de uns 4 toner
e se der 2 cabo usb tbm pq um quebrou. o sgt silva q ta cuidando disso.
seria bom chegar antes do dia 25 pq tem a inspeção. valeu
```

## Saída

```
[INSERIR OM / SETOR]
Parte nº [INSERIR NÚMERO]/[SETOR]            [Local], 14 de novembro de 2026.

Do: [MILITAR-1], Encarregado da Seção
Ao: Sr. Chefe da Divisão Administrativa
Assunto: Solicitação de suprimentos de impressão

1. **Solicito 4 (quatro) cartuchos de toner e 2 (dois) cabos USB para a Seção, com entrega até 24 NOV 26.**

2. O toner da Seção acabou em 07 NOV 26. Desde então, a Seção imprime escalas em setor vizinho, o que atrasa a publicação. Um cabo USB de impressora está danificado.

3. A Inspeção prevista para 25 NOV 26 exige a documentação da Seção impressa e atualizada. O Almoxarifado informou que a liberação depende desta Parte. Amparo: [INSERIR AMPARO LEGAL / BOLETIM].

4. Proponho o encaminhamento ao Almoxarifado para atendimento até 24 NOV 26. O [MILITAR-2] acompanhará o recebimento.

Respeitosamente,

[NOME COMPLETO – POSTO/GRADUAÇÃO]
Encarregado da Seção
```

Modo: `oficial-br`. Preencher: OM, número da Parte, amparo, modelo do toner. Dados mascarados: 1 nome (Sgt Silva → `[MILITAR-2]`).

## O que mudou

- O pedido saiu da 5ª linha para a 1ª, com quantidade e prazo.
- "Uns 4" virou "4 (quatro)". "Antes do dia 25" virou "até 24 NOV 26" — data absoluta, com folga para a inspeção.
- A data de "faz uma semana" foi calculada a partir da data do documento. Se a data real for outra, o usuário corrige.
- Gírias e saudação cortadas. Nenhum número de norma inventado.
