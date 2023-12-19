CREATE SCHEMA trabalho_final;

SET SCHEMA 'trabalho_final';

-- Table: .animador
-- DROP TABLE IF EXISTS animador;
CREATE TABLE IF NOT EXISTS animador (
    func_estudio_fk integer NOT NULL,
    animador_chefe_fk integer NOT NULL,
    avali_desemp character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT animador_pkey PRIMARY KEY (func_estudio_fk)
    
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS animador OWNER to postgres;


-- Table: animadorEpisodioAnima
-- DROP TABLE IF EXISTS "animadorEpisodioAnima";

CREATE TABLE IF NOT EXISTS "animadorEpisodioAnima"
(
    animador_fk integer NOT NULL,
    episodio_fk integer NOT NULL,
    CONSTRAINT "animadorEpisodioAnima_pkey" PRIMARY KEY (animador_fk, episodio_fk)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "animadorEpisodioAnima"
    OWNER to postgres;


-- Table: anime
-- DROP TABLE IF EXISTS anime;
CREATE TABLE IF NOT EXISTS anime (
    id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    class_ind integer NOT NULL,
    obra_manga_fk integer NOT NULL,
    CONSTRAINT anime_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS anime OWNER to postgres;

-- Table: animeEstudioProduz
-- DROP TABLE IF EXISTS "animeEstudioProduz";
CREATE TABLE IF NOT EXISTS "animeEstudioProduz" (
    anime_fk integer NOT NULL,
    estudio_fk integer NOT NULL,
    CONSTRAINT "animeEstudioProduz_pkey" PRIMARY KEY (anime_fk, estudio_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "animeEstudioProduz" OWNER to postgres;

-- Table: animeFunc_estudioEscalam
-- DROP TABLE IF EXISTS "animeFunc_estudioEscalam";
CREATE TABLE IF NOT EXISTS "animeFunc_estudioEscalam" (
    anime_fk integer NOT NULL,
    func_estudio_fk integer NOT NULL,
    "dt_escalacao" date NOT NULL,
    CONSTRAINT "animeFunc_estudioEscalam_pkey" PRIMARY KEY (anime_fk,func_estudio_fk)
    
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "animeFunc_estudioEscalam" OWNER to postgres;

-- Table: animeGeneroClassifica
-- DROP TABLE IF EXISTS "animeGeneroClassifica";
CREATE TABLE IF NOT EXISTS "animeGeneroClassifica" (
    anime_fk integer NOT NULL,
    genero_fk integer NOT NULL,
    CONSTRAINT "animeGeneroClassifica_pkey" PRIMARY KEY (anime_fk, genero_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "animeGeneroClassifica" OWNER to postgres;

-- Table: animeStreamingLancados
-- DROP TABLE IF EXISTS "animeStreamingLancados";
CREATE TABLE IF NOT EXISTS "animeStreamingLancados" (
    streaming_fk integer NOT NULL,
    anime_fk integer NOT NULL,
    CONSTRAINT "animeStreamingLancados_pkey" PRIMARY KEY (streaming_fk, anime_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "animeStreamingLancados" OWNER to postgres;

-- Table: categoria
-- DROP TABLE IF EXISTS categoria;
CREATE TABLE IF NOT EXISTS categoria (
    id SERIAL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT categoria_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS categoria OWNER to postgres;

-- Table: editor
-- DROP TABLE IF EXISTS editor;
CREATE TABLE IF NOT EXISTS editor (
    func_editora_fk integer NOT NULL,
    editor_chefe_fk integer NOT NULL,
    avali_desemp character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT editor_pkey PRIMARY KEY (func_editora_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS editor OWNER to postgres;

-- Table: editor_obraMangaEdita
-- DROP TABLE IF EXISTS "editor_obraMangaEdita";
CREATE TABLE IF NOT EXISTS "editor_obraMangaEdita" (
    obra_manga_fk integer NOT NULL,
    func_editora_fk integer NOT NULL,
    CONSTRAINT "editor_obraMangaEdita_pkey" PRIMARY KEY (obra_manga_fk, func_editora_fk)
    
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "editor_obraMangaEdita" OWNER to postgres;

-- Table: editora
-- DROP TABLE IF EXISTS editora;
CREATE TABLE IF NOT EXISTS editora (
    cnpj integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    "endereco" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT editora_pkey PRIMARY KEY (cnpj)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS editora OWNER to postgres;

-- Table: episodio
-- DROP TABLE IF EXISTS episodio;
CREATE TABLE IF NOT EXISTS episodio (
    num integer NOT NULL,
    titulo character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT episodio_pkey PRIMARY KEY (num)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS episodio OWNER to postgres;

-- Table: estudio
-- DROP TABLE IF EXISTS estudio;
CREATE TABLE IF NOT EXISTS estudio (
    cnpj integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    endereco character varying COLLATE pg_catalog."default" NOT NULL,
    editora_fk integer NOT NULL,
    CONSTRAINT estudio_pkey PRIMARY KEY (cnpj)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS estudio OWNER to postgres;

-- Table: estudioFunc_estudioContrata
-- DROP TABLE IF EXISTS "estudioFunc_estudioContrata";
CREATE TABLE IF NOT EXISTS "estudioFunc_estudioContrata" (
    estudio_fk integer NOT NULL,
    func_estudio_fk integer NOT NULL,
    dt_fim date,
    dt_inicio date,
    CONSTRAINT "estudioFunc_estudioContrata_pkey" PRIMARY KEY (estudio_fk, func_estudio_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "estudioFunc_estudioContrata" OWNER to postgres;

-- Table: estudioStreamingLicencia
-- DROP TABLE IF EXISTS "estudioStreamingLicencia";
CREATE TABLE IF NOT EXISTS "estudioStreamingLicencia" (
    estudio_fk integer NOT NULL,
    streaming_fk integer NOT NULL,
    CONSTRAINT "estudioStreamingLicencia_pkey" PRIMARY KEY (estudio_fk, streaming_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "estudioStreamingLicencia" OWNER to postgres;

-- Table: func_editora
-- DROP TABLE IF EXISTS func_editora;
CREATE TABLE IF NOT EXISTS func_editora (
    id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    salario double precision NOT NULL,
    tipo character varying COLLATE pg_catalog."default" NOT NULL,
    editora_fk integer NOT NULL,
    dt_inicio date NOT NULL,
    dt_fim date,
    CONSTRAINT func_editora_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS func_editora OWNER to postgres;

-- Table: func_estudio
-- DROP TABLE IF EXISTS func_estudio;
CREATE TABLE IF NOT EXISTS func_estudio (
    id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    salario double precision NOT NULL,
    tipo character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT func_estudio_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS func_estudio OWNER to postgres;

-- Table: genero
-- DROP TABLE IF EXISTS genero;
CREATE TABLE IF NOT EXISTS genero (
    id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genero_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS genero OWNER to postgres;

-- Table: mangaka_obraMangaEscreve
-- DROP TABLE IF EXISTS "mangaka_obraMangaEscreve";
CREATE TABLE IF NOT EXISTS "mangaka_obraMangaEscreve" (
    obra_manga_fk integer NOT NULL,
    func_editora_fk integer NOT NULL,
    CONSTRAINT "mangaka_obraMangaEscreve_pkey" PRIMARY KEY (obra_manga_fk, func_editora_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "mangaka_obraMangaEscreve" OWNER to postgres;

-- Table: obra_manga
-- DROP TABLE IF EXISTS obra_manga;
CREATE TABLE IF NOT EXISTS obra_manga (
    id integer NOT NULL,
    num_leitores integer NOT NULL,
    num_cap integer NOT NULL,
    revista_fk integer NOT NULL,
    CONSTRAINT obra_manga_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS obra_manga OWNER to postgres;

-- Table: obra_mangaAnimeAdapta
-- DROP TABLE IF EXISTS "obra_mangaAnimeAdapta";
CREATE TABLE IF NOT EXISTS "obra_mangaAnimeAdapta" (
    anime_fk integer NOT NULL,
    obra_manga_fk integer NOT NULL,
    CONSTRAINT "Obra_mangaAnimeAdapta_pkey" PRIMARY KEY (anime_fk, obra_manga_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "obra_mangaAnimeAdapta" OWNER to postgres;

-- Table: obra_mangaCategoriaClassifica
-- DROP TABLE IF EXISTS "obra_mangaCategoriaClassifica";
CREATE TABLE IF NOT EXISTS "obra_mangaCategoriaClassifica" (
    obra_manga_fk integer NOT NULL,
    categoria_fk integer NOT NULL,
    CONSTRAINT "obra_mangaCategoriaClassifica_pkey" PRIMARY KEY (obra_manga_fk, categoria_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "obra_mangaCategoriaClassifica" OWNER to postgres;

-- Table: pais
-- DROP TABLE IF EXISTS "pais";
CREATE TABLE IF NOT EXISTS "pais" (
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "pais_pkey" PRIMARY KEY (nome)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "pais" OWNER to postgres;

-- Table: personagem
-- DROP TABLE IF EXISTS personagem;
CREATE TABLE IF NOT EXISTS personagem (
    id integer NOT NULL,
    dublador_fk integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    func_estudio_fk integer NOT NULL,
    CONSTRAINT personagem_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS personagem OWNER to postgres;

-- Table: revista
-- DROP TABLE IF EXISTS revista;
CREATE TABLE IF NOT EXISTS revista (
    isbn integer NOT NULL,
    num_vol integer NOT NULL,
    num_cap integer,
    titulo character varying COLLATE pg_catalog."default" NOT NULL,
    volume_fk integer,
    CONSTRAINT revista_pkey PRIMARY KEY (isbn)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS revista OWNER to postgres;

-- Table: roteiristaEpisodioRoteirizam
-- DROP TABLE IF EXISTS "roteiristaEpisodioRoteirizam";
CREATE TABLE IF NOT EXISTS "roteiristaEpisodioRoteirizam" (
    roteirista_fk integer NOT NULL,
    episodio_fk integer NOT NULL,
    CONSTRAINT "roteiristaEpisodioRoteirizam_pkey" PRIMARY KEY (roteirista_fk, episodio_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "roteiristaEpisodioRoteirizam" OWNER to postgres;

-- Table: streaming
-- DROP TABLE IF EXISTS streaming;
CREATE TABLE IF NOT EXISTS streaming (
    cnpj integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    estudio_fk integer NOT NULL,
    CONSTRAINT streaming_pkey PRIMARY KEY (cnpj)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS streaming OWNER to postgres;

-- Table: streamingPaisDisponibilidade
-- DROP TABLE IF EXISTS "streamingPaisDisponibilidade";
CREATE TABLE IF NOT EXISTS "streamingPaisDisponibilidade" (
    streaming_fk integer NOT NULL,
    pais_fk character varying(200) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "streamingPaisDisponibilidade_pkey" PRIMARY KEY (streaming_fk, pais_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "streamingPaisDisponibilidade" OWNER to postgres;

-- Table: volume
-- DROP TABLE IF EXISTS volume;
CREATE TABLE IF NOT EXISTS volume (
    isbn integer NOT NULL,
    num_vol integer NOT NULL,
    titulo character varying COLLATE pg_catalog."default" NOT NULL,
    obra_manga_fk integer NOT NULL,
    CONSTRAINT volume_pkey PRIMARY KEY (isbn)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS volume OWNER to postgres;

----------------------------  CRIAÇÃO DE FKS ----------------------------------------------------------------------

ALTER TABLE IF EXISTS animador
    ADD FOREIGN KEY (func_estudio_fk)
    REFERENCES func_estudio (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS animador
    ADD FOREIGN KEY (animador_chefe_fk)
    REFERENCES animador (func_estudio_fk) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "animadorEpisodioAnima"
    ADD FOREIGN KEY (animador_fk)
    REFERENCES animador (func_estudio_fk) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "animadorEpisodioAnima"
    ADD FOREIGN KEY (episodio_fk)
    REFERENCES episodio (num) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS anime
    ADD FOREIGN KEY (obra_manga_fk)
    REFERENCES obra_manga (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "animeEstudioProduz"
    ADD FOREIGN KEY (anime_fk)
    REFERENCES anime (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "animeEstudioProduz"
    ADD FOREIGN KEY (estudio_fk)
    REFERENCES estudio (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "animeFunc_estudioEscalam"
    ADD FOREIGN KEY (anime_fk)
    REFERENCES anime (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "animeFunc_estudioEscalam"
    ADD FOREIGN KEY (func_estudio_fk)
    REFERENCES func_estudio (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "animeGeneroClassifica"
    ADD FOREIGN KEY (anime_fk)
    REFERENCES anime (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "animeGeneroClassifica"
    ADD FOREIGN KEY (genero_fk)
    REFERENCES genero (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "animeStreamingLancados"
    ADD FOREIGN KEY (streaming_fk)
    REFERENCES streaming (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "animeStreamingLancados"
    ADD FOREIGN KEY (anime_fk)
    REFERENCES anime (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS editor
    ADD FOREIGN KEY (func_editora_fk)
    REFERENCES func_editora (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS editor
    ADD FOREIGN KEY (editor_chefe_fk)
    REFERENCES func_editora (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "editor_obraMangaEdita"
    ADD FOREIGN KEY (obra_manga_fk)
    REFERENCES obra_manga (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "editor_obraMangaEdita"
    ADD FOREIGN KEY (func_editora_fk)
    REFERENCES func_editora (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS estudio
    ADD FOREIGN KEY (editora_fk)
    REFERENCES editora (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "estudioFunc_estudioContrata"
    ADD FOREIGN KEY (estudio_fk)
    REFERENCES estudio (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "estudioFunc_estudioContrata"
    ADD FOREIGN KEY (func_estudio_fk)
    REFERENCES func_estudio (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "estudioStreamingLicencia"
    ADD FOREIGN KEY (estudio_fk)
    REFERENCES estudio (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "estudioStreamingLicencia"
    ADD FOREIGN KEY (streaming_fk)
    REFERENCES streaming (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS func_editora
    ADD FOREIGN KEY (editora_fk)
    REFERENCES editora (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "mangaka_obraMangaEscreve"
    ADD FOREIGN KEY (obra_manga_fk)
    REFERENCES obra_manga (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "mangaka_obraMangaEscreve"
    ADD FOREIGN KEY (func_editora_fk)
    REFERENCES func_editora (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS obra_manga
    ADD FOREIGN KEY (revista_fk)
    REFERENCES revista (isbn) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "obra_mangaAnimeAdapta"
    ADD FOREIGN KEY (anime_fk)
    REFERENCES anime (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "obra_mangaAnimeAdapta"
    ADD FOREIGN KEY (obra_manga_fk)
    REFERENCES obra_manga (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "obra_mangaCategoriaClassifica"
    ADD FOREIGN KEY (obra_manga_fk)
    REFERENCES obra_manga (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "obra_mangaCategoriaClassifica"
    ADD FOREIGN KEY (categoria_fk)
    REFERENCES categoria (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS personagem
    ADD FOREIGN KEY (func_estudio_fk)
    REFERENCES func_estudio (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS personagem
    ADD FOREIGN KEY (dublador_fk)
    REFERENCES func_estudio (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS revista
    ADD FOREIGN KEY (volume_fk)
    REFERENCES volume (isbn) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "roteiristaEpisodioRoteirizam"
    ADD FOREIGN KEY (roteirista_fk)
    REFERENCES func_estudio (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "roteiristaEpisodioRoteirizam"
    ADD FOREIGN KEY (episodio_fk)
    REFERENCES episodio (num) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS streaming
    ADD FOREIGN KEY (estudio_fk)
    REFERENCES estudio (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "streamingPaisDisponibilidade"
    ADD FOREIGN KEY (streaming_fk)
    REFERENCES streaming (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS "streamingPaisDisponibilidade"
    ADD FOREIGN KEY (pais_fk)
    REFERENCES pais (nome) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS volume
    ADD FOREIGN KEY (obra_manga_fk)
    REFERENCES obra_manga (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

----------------------------  CRIAÇÃO DE ÍNDICES ----------------------------------------------------------------------

/* Match Exato */
CREATE INDEX idx_genero
ON genero
USING hash(nome);

CREATE INDEX idx_pais
ON pais
USING hash(nome);

CREATE INDEX idx_categoria
ON categoria
USING hash(nome);

/* Intervalo de Valores */

CREATE INDEX idx_avaliacao
ON editor
USING btree(avali_desemp);

CREATE INDEX idx_num_leitores
ON obra_manga
USING btree(num_leitores);

CREATE INDEX idx_salario_estudio
ON func_estudio
USING btree(salario);

CREATE INDEX idx_salario_editora
ON func_editora
USING btree(salario);

/* Índices para Chaves Estrangeiras (sempre na tabela que referencia) */
CREATE INDEX idx_genero_fk
ON "animeGeneroClassifica"
USING hash(genero_fk);

CREATE INDEX idx_anime_fk
ON "animeGeneroClassifica"
USING hash(anime_fk);

CREATE INDEX idx_pais_fk
ON "streamingPaisDisponibilidade"
USING hash(pais_fk);

CREATE INDEX idx_streaming_fk_pais
ON "streamingPaisDisponibilidade"
USING hash(streaming_fk);

CREATE INDEX idx_streaming_fk
ON "animeStreamingLancados"
USING hash(streaming_fk);

CREATE INDEX idx_streaming_anime_fk
ON "animeStreamingLancados"
USING hash(anime_fk);

CREATE INDEX idx_func_editora
ON "mangaka_obraMangaEscreve"
USING hash(func_editora_fk);

CREATE INDEX idx_obra_manga_fk
ON "mangaka_obraMangaEscreve" 
USING hash(obra_manga_fk);

CREATE INDEX idx_categoria_fk
ON "obra_mangaCategoriaClassifica"
USING hash(categoria_fk);

CREATE INDEX idx_obra_manga_fk_2
ON "obra_mangaCategoriaClassifica" 
USING hash(obra_manga_fk);

CREATE INDEX idx_obra_manga_fk_3
ON "editor_obraMangaEdita"
USING hash(obra_manga_fk);

CREATE INDEX idx_func_editora_fk
ON "editor_obraMangaEdita"
USING hash(func_editora_fk);

CREATE INDEX idx_editor_chefe_fk
ON editor
USING hash(editor_chefe_fk);

CREATE INDEX idx_func_estudio_fk
ON "animeFunc_estudioEscalam"
USING hash(func_estudio_fk);

CREATE INDEX idx_func_estudio_fk_2
ON "estudioFunc_estudioContrata"
USING hash(func_estudio_fk);

CREATE INDEX idx_anime_fk_2
ON "animeEstudioProduz"
USING hash(anime_fk);

CREATE INDEX idx_estudio_fk
ON "animeEstudioProduz"
USING hash(estudio_fk);

----------------------------  TRIGGERS E FUNÇÕES ----------------------------------------------------------------------
-- Função que cria ou associa categoria a uma Obra_manga
CREATE OR REPLACE FUNCTION criar_ou_associar_categoria()
RETURNS TRIGGER AS $$
BEGIN
    /* Verifica se existe categoria correspondente na tabela Categoria */
    IF NOT EXISTS (
		SELECT 1 
		  FROM Categoria 
		  WHERE id = NEW.categoria_fk
	) THEN
    /* Cria uma nova entrada em Categoria caso não exista categoria correspondente*/
    	INSERT INTO Categoria (nome)
        VALUES (NEW.categoria_fk);
    END IF;
    
	/* Associa categoria_fk a uma categoria existente */
    UPDATE "obra_mangaCategoriaClassifica"
       SET categoria_fk = NEW.categoria_fk
     WHERE obra_manga_fk = NEW.obra_manga_fk;
	 
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Cria um gatilho que chama uma função que ao classificar uma Obra_manga em uma categoria, verifica se
-- essa categoria já existe na tabela de categorias, caso exista, associa categoria_fk a ela, caso não,
-- cria uma nova entrada na tabela Categoria.
CREATE TRIGGER cria_ou_associa_categoria
BEFORE INSERT ON "obra_mangaCategoriaClassifica"
FOR EACH ROW
EXECUTE FUNCTION criar_ou_associar_categoria();

-- Função que promove funcionário
CREATE OR REPLACE FUNCTION promover_animador()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.avali_desemp > 9 
   AND OLD.avali_desemp <= 9 
  THEN
       UPDATE Func_estudio
       SET salario = salario * 1.6, 
		   tipo = 'animador chefe'
       WHERE id = NEW.func_estudio_fk;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Cria um gatilho que promove um animador caso sua avaliação de desempenho seja atualizada para um 
-- valor maior do que 9.
CREATE TRIGGER promove_animador
AFTER UPDATE OF avali_desemp ON animador
FOR EACH ROW
EXECUTE FUNCTION promover_animador();

----------------------------  CONSULTAS ----------------------------------------------------------------------
-- 1
SELECT DISTINCT anime.nome
  FROM anime, genero, "animeGeneroClassifica"
 WHERE (genero.nome = 'horror'
    OR genero.nome = 'ação')
   AND genero.id = "animeGeneroClassifica".genero_fk
   AND anime.id = "animeGeneroClassifica".anime_fk;
   
-- 2
SELECT DISTINCT anime.nome
  FROM anime, streaming, pais,
	   "streamingPaisDisponibilidade", "animeStreamingLancados"
 WHERE pais.nome = 'brasil'
   AND "streamingPaisDisponibilidade".pais_fk = pais.nome
   AND "streamingPaisDisponibilidade".streaming_fk = streaming.cnpj
   AND "animeStreamingLancados".streaming_fk = streaming.cnpj
   AND "animeStreamingLancados".anime_fk = anime.id
   AND anime.nome LIKE 'a%';

-- 3
SELECT func_editora.nome
  FROM editor, func_editora
 WHERE editor.func_editora_fk = func_editora.id
   AND editor.avali_desemp <= 7
   AND editor.avali_desemp >= 6;
   
-- 4
SELECT DISTINCT func_editora.nome
  FROM obra_manga, "mangaka_obraMangaEscreve", func_editora
 WHERE func_editora.id = "mangaka_obraMangaEscreve".func_editora_fk
   AND "mangaka_obraMangaEscreve".obra_manga_fk = obra_manga.id
   AND obra_manga.num_leitores > 1000;
   
-- 5
SELECT DISTINCT func_editora.nome
  FROM editor, categoria, obra_manga,
       "obra_mangaCategoriaClassifica" AS C,
       "editor_obraMangaEdita" AS E,
       func_editora
 WHERE (categoria.nome = 'acao'
    OR categoria.nome = 'drama')
   AND categoria.id = C.categoria_fk
   AND C.obra_manga_fk = obra_manga.id
   AND E.obra_manga_fk = obra_manga.id
   AND E.func_editora_fk = editor.func_editora_fk
   AND func_editora.id = editor.editor_chefe_fk
ORDER BY func_editora.nome DESC;

-- 6
(SELECT func_editora.nome
   FROM func_editora
  WHERE func_editora.nome LIKE '%porto'
)
UNION
(SELECT func_estudio.nome
  FROM func_estudio
 WHERE func_estudio.nome LIKE '%porto'
);

-- 7
(SELECT nome
   FROM func_estudio,
        "animeFunc_estudioEscalam" AS E,
        "estudioFunc_estudioContrata" AS CONTRATA
  WHERE func_estudio.salario > 10000
    AND E.func_estudio = func_estudio.id
    AND CONTRATA.func_estudio_fk = func_estudio.id
    AND (CAST(CURRENT_DATE AS date) - CAST(CONTRATA.dt_inicio AS date)) between 0 and 30
)
UNION
(SELECT func_editora.nome
   FROM func_editora
  WHERE func_editora.salario > 10000
    AND (CAST(CURRENT_DATE AS date) - CAST(func_editora.dt_inicio AS date)) between 0 and 30
);

-- 8
SELECT anime.nome
  FROM estudio, anime, "animeEstudioProduz" AS P
 WHERE anime.id = P.anime_fk
   AND P.estudio_fk = estudio.cnpj
   AND estudio.cnpj 
   IN(SELECT P.estudio_fk
        FROM(SELECT P.estudio_fk, MAX(quantidade)
               FROM(SELECT P.estudio_fk, count(P.estudio_fk) AS quantidade
                      FROM "animeEstudioProduz" AS P
                    GROUP by P.estudio_fk) AS primeiro
        ) AS segundo
   );

-- 9
SELECT func_estudio.nome
  FROM func_estudio
INNER JOIN func_editora 
        ON func_estudio.nome = func_editora.nome
     WHERE func_estudio.nome LIKE 'matheus%';
	 
-- 10
SELECT AVG(obra_manga.num_leitores) AS Media
  FROM obra_manga
GROUP BY obra_manga.num_cap;

