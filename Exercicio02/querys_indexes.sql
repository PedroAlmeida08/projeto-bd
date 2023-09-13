/* Índice para consultas com especificação de cidade */
CREATE INDEX idx_cidade
ON projeto
USING hash(cidade);

/* Índice para consultas em um intervalo de valor */
CREATE INDEX idx_orcamento
ON projeto
USING btree(orcamento);

/* Índice para chave estrangeira */
CREATE INDEX idx_projeto
on projeto
USING hash(idprojeto);

/* Índice para parâmetro usado em função de agregação*/
CREATE INDEX idx_valor
on despesa
USING btree(valor);

/* A consulta deve retornar despesas de projetos com orçamento maior que 100.000,00 */
SELECT d.valor
  FROM despesa d, projeto p
 WHERE d.idprojeto = p.idprojeto
   AND p.orcamento > 100000;

/* A consulta deve retornar o total de despesas de projetos de Niterói */
SELECT SUM(d.valor)
  FROM despesa d, projeto p
 WHERE d.idprojeto = p.idprojeto
  AND p.cidade = 'Niterói';

/* A consulta deve retornar o total de despesas de projetos do Rio de Janeiro 
agrupado por tipo de despesa. */
SELECT sum(d.valor)
  FROm despesa d, projeto p
 WHERE d.idprojeto = p.idprojeto
   AND p.cidade = 'Rio de Janeiro'
GROUP BY (d.tipodespesa);
 
