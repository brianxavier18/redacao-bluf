# Exemplo 03 — Relatório de Situação / SITREP (`modo: oficial-br`)

> Dados fictícios.

## Entrada caótica (mensagem de WhatsApp do plantão)

```
cmt, a rede caiu aqui no bloco B desde umas 13h, o pessoal do sistema de pessoal
não consegue acessar nada, já reiniciei o switch duas vezes e nada. liguei pro
CTI e eles disseram que pode ser o link da operadora, abriram chamado. o bloco A
tá normal. se não voltar até o fim do dia vai atrasar o fechamento da folha que
é amanhã cedo. talvez dê pra levar o pessoal pro bloco A e usar as máquinas de lá,
tem umas 6 livres. aguardo
```

## Saída

```
SITREP nº 1 – Indisponibilidade de rede no Bloco B – 141430P NOV 26
STATUS: ALTERADO

1. SITUAÇÃO: **Rede do Bloco B fora do ar desde 1300; fechamento da folha de 15 NOV 26 em risco.**
2. IMPACTO: Seção de Pessoal sem acesso aos sistemas. Bloco A opera normalmente.
3. AÇÕES REALIZADAS:
   a) 1300–1400 – 2 (duas) reinicializações do switch do Bloco B, sem efeito.
   b) 1410 – Contato com o CTI; chamado aberto com a operadora. Nº: [INSERIR NÚMERO DO CHAMADO].
   c) Causa provável, segundo o CTI: falha no link da operadora. [CONFIRMAR]
4. NECESSIDADES / APOIO: Autorização para transferir a Seção de Pessoal para 6 (seis) estações livres no Bloco A, caso a rede não retorne até 1700.
5. PRÓXIMO SITREP: 1700 ou no restabelecimento da rede.

[Posto – nome de guerra – função]
```

Modo: `oficial-br` (SITREP). Preencher: número do chamado, identificação. Confirmar: horário das reinicializações e da ligação (estimados a partir de "desde umas 13h").

## O que mudou

- O risco real (folha de pagamento) subiu para a linha de situação, ao lado do fato.
- A sugestão solta ("talvez dê pra...") virou um pedido de autorização com condição e horário.
- A hipótese do CTI ficou marcada como hipótese, não como causa confirmada.
