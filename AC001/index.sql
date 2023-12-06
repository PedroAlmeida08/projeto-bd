CREATE SCHEMA index001;

CREATE TABLE index001."crime"(id int, total_feminicide int, total_homicide int, total_felony_murder int, total_bodily_harm int, total_theft_cellphone int, total_armed_robbery_cellphone int, total_theft_auto int, total_armed_robbery_auto int, segment_id int, time_id int);

CREATE TABLE index001."district"(id int, name varchar, geometry varchar);

CREATE TABLE index001."neighborhood"(id int, name varchar, geometry varchar);

CREATE TABLE index001."segment"(id int, geometry varchar, oneway varchar, length varchar, final_vertice_id int, start_vertice_id int);

CREATE TABLE index001."time"(id int, period varchar, day int, month int, year int, weekday varchar);

CREATE TABLE index001."vertice"(id int, label int, district_id int, neighborhood_id int, zone_id int);

/* CREATE INDEX */

/* Índices de Match Exato */
CREATE INDEX idx_ano_hash
ON index001."time"
USING hash(year);

CREATE INDEX idx_mes
ON index001."time"
USING hash(month);

CREATE INDEX idx_weekday
ON index001."time"
USING hash(weekday);

CREATE INDEX idx_cidade
ON index001."district"
USING hash(name);

CREATE INDEX idx_vizinhanca
ON index001."neighborhood"
USING hash(name);

CREATE INDEX idx_oneway
ON index001."segment"
USING hash(oneway);

/* Índices de Intervalo de Valores */
CREATE INDEX idx_ano_btree
ON index001."time"
USING btree(year);

/* Índice para chaves estrangeiras (sempre na tabela que referencia) */
CREATE INDEX idx_segment_id
on index001."crime"
USING hash(segment_id);

CREATE INDEX idx_time_id
on index001."crime"
USING hash(time_id);

CREATE INDEX idx_district_id
on index001."vertice"
USING hash(district_id);

CREATE INDEX idx_neighborhood_id
on index001."vertice"
USING hash(neighborhood_id);

CREATE INDEX idx_start_vertice_id
ON index001."segment"
USING hash(start_vertice_id);

/* ----------------------------------------------------------------- */

/* 1. Qual o total de crimes por tipo e por segmento das ruas do distrito de IGUATEMI durante o ano de 2016? */
EXPLAIN ANALYZE
SELECT s.id as segment, SUM(total_feminicide) as total_feminicide, 
       SUM(total_homicide) as total_homicide, 
	   SUM(total_felony_murder) as total_felony_murder,
       SUM(total_bodily_harm) as total_bodily_harm, 
	   SUM(total_theft_cellphone) as total_theft_cellphone, 
	   SUM(total_armed_robbery_cellphone) as total_armed_robbery_cellphone,
	   SUM(total_theft_auto) as total_theft_auto, 
	   SUM(total_armed_robbery_auto) as total_armed_robbery_auto, year
  FROM index001."crime" c, index001."time" t, index001."segment" s, 
       index001."vertice" v, index001."district" d
 WHERE c.time_id = t.id
   AND t.year = 2016
   AND c.segment_id = s.id
   AND s.start_vertice_id = v.id
   AND v.district_id = d.id
   AND d.name = 'IGUATEMI'
   GROUP BY s.id, year;
   
/* 2. Qual o total de crimes por tipo e por segmento das ruas do distrito de IGUATEMI entre 2006 e 2016? */
EXPLAIN ANALYZE
SELECT s.id as segment, SUM(total_feminicide) as total_feminicide, 
       SUM(total_homicide) as total_homicide, 
	   SUM(total_felony_murder) as total_felony_murder,
       SUM(total_bodily_harm) as total_bodily_harm, 
	   SUM(total_theft_cellphone) as total_theft_cellphone, 
	   SUM(total_armed_robbery_cellphone) as total_armed_robbery_cellphone,
	   SUM(total_theft_auto) as total_theft_auto, 
	   SUM(total_armed_robbery_auto) as total_armed_robbery_auto, year
  FROM index001."crime" c, index001."time" t, index001."segment" s,
       index001."vertice" v, index001."district" d
 WHERE c.time_id = t.id
   AND t.year BETWEEN 2006 AND 2016
   AND c.segment_id = s.id
   AND s.start_vertice_id = v.id
   AND v.district_id = d.id
   AND d.name = 'IGUATEMI'
   GROUP BY s.id, year;
   
/* 3. Qual o total de ocorrências de Roubo de Celular e roubo de carro no bairro de SANTA EFIGÊNIA em 2015? */
EXPLAIN ANALYZE
SELECT s.id as segment, 
       SUM(total_theft_cellphone + total_armed_robbery_cellphone) as total_theft_cellphone, 
       SUM(total_theft_auto + total_armed_robbery_auto) as total_theft_auto, t.year
  FROM index001."crime" c, index001."time" t, index001."segment" s, 
       index001."vertice" v, index001."neighborhood" n
 WHERE c.time_id = t.id
   AND t.year = 2015
   AND c.segment_id = s.id
   AND s.start_vertice_id = v.id
   AND v.neighborhood_id = n.id
   AND n.name = 'Santa Efig�nia'
   GROUP BY s.id, year;
   
/* 4. Qual o total de crimes por tipo em vias de mão única da cidade durante o ano de 2012? */
EXPLAIN ANALYZE
SELECT oneway, SUM(total_feminicide) as total_feminicide, 
       SUM(total_homicide) as total_homicide, 
	   SUM(total_felony_murder) as total_felony_murder,
       SUM(total_bodily_harm) as total_bodily_harm, 
	   SUM(total_theft_cellphone) as total_theft_cellphone, 
	   SUM(total_armed_robbery_cellphone) as total_armed_robbery_cellphone,
	   SUM(total_theft_auto) as total_theft_auto, 
	   SUM(total_armed_robbery_auto) as total_armed_robbery_auto, year
  FROM index001."crime" c, index001."time" t, index001."segment" s
 WHERE c.time_id = t.id
   AND t.year = 2012
   AND c.segment_id = s.id
   AND s.oneway = 'yes'
   GROUP BY year, oneway;
   
/* 5. Qual o total de roubos de carro e celular em todos os segmentos durante o ano de 2017? */
EXPLAIN ANALYZE
SELECT s.id as segment, 
       SUM(total_theft_cellphone + total_armed_robbery_cellphone) as total_theft_cellphone, 
       SUM(total_theft_auto + total_armed_robbery_auto) as total_theft_auto, t.year
  FROM index001."crime" c, index001."time" t, index001."segment" s
 WHERE c.time_id = t.id
   AND t.year = 2017
   AND c.segment_id = s.id
   GROUP BY s.id, year;
   
/* 6. Quais os IDs de segmentos que possuíam o maior índice criminal (soma de ocorrências de todos os tipos de crimes), durante o mês de Novembro de 2010? */
EXPLAIN ANALYZE
SELECT MAX(soma_crimes) as max_soma_crimes
  FROM ( SELECT s.id as segment, 
		        SUM(total_feminicide + total_homicide + total_felony_murder + 
					total_bodily_harm + total_theft_cellphone + 
				    total_armed_robbery_cellphone + total_theft_auto + 
					total_armed_robbery_auto) as soma_crimes
  		   FROM index001."crime" c, index001."time" t, index001."segment" s
		  WHERE c.time_id = t.id
		    AND t.year = 2010
		    AND t.month = 11
		    AND c.segment_id = s.id
	     GROUP BY s.id
  );
   
/* 7. Quais os IDs dos segmentos que possuíam o maior índice criminal (soma de ocorrências de todos os tipos de crimes) durante os finais de semana do ano de 2018? */
EXPLAIN ANALYZE
SELECT MAX(soma_crimes) as max_soma_crimes
  FROM ( SELECT s.id as segment, 
		        SUM(total_feminicide + total_homicide + total_felony_murder + 
					total_bodily_harm + total_theft_cellphone + 
				    total_armed_robbery_cellphone + total_theft_auto + 
					total_armed_robbery_auto) as soma_crimes
  		   FROM index001."crime" c, index001."time" t, index001."segment" s
 		  WHERE c.time_id = t.id
   			AND t.year = 2018
		    AND (t.weekday = 'friday' OR t.weekday = 'saturday' OR t.weekday = 'sunday')
		    AND c.segment_id = s.id
		 GROUP BY s.id
  );

