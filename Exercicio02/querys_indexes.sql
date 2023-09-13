/* ------------ ÍNDICES ------------ */
/* ---------- 1ª Consulta ---------- */
/* Índice para consultas em um intervalo de valor */
CREATE INDEX idx_orcamento
ON projeto
USING btree(orcamento);

/* Índice para chave estrangeira (sempre na tabela que referencia) */
CREATE INDEX idx_projeto
on despesa
USING hash(idprojeto);

/* ---------- 2ª Consulta ---------- */

/* também utiliza o idx-projeto */

/* Índice para consultas com especificação de cidade */
CREATE INDEX idx_cidade
ON projeto
USING hash(cidade);

/* ---------- 3ª Consulta ---------- */

/* também utiliza o idx-projeto */

/* Índice para parâmetro usado em função de agregação*/
CREATE INDEX idx_tipo_despesa
on despesa
USING hash(tipodespesa);

/* --------------------------------- */

/* ----------- CONSULTAS ----------- */
/* A consulta deve retornar despesas de projetos com orçamento maior que 100.000,00 */
SELECT d.*
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
SELECT sum(d.valor), d.tipodespesa
  FROm despesa d, projeto p
 WHERE d.idprojeto = p.idprojeto
   AND p.cidade = 'Rio de Janeiro'
GROUP BY (d.tipodespesa);
 
