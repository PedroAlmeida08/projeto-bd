CREATE SCHEMA trabalho_final;

SET SCHEMA 'trabalho_final';

-- Table: trabalho_finalFinal.animador
-- DROP TABLE IF EXISTS "trabalho_final".animador;
CREATE TABLE IF NOT EXISTS "trabalho_final".animador (
    func_estudio_fk integer NOT NULL,
    animador_chefe_fk integer NOT NULL,
    avali_desemp character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT animador_pkey PRIMARY KEY (func_estudio_fk)
    
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final".animador OWNER to postgres;


-- Table: trabalho_final.animadorEpisodioAnima
-- DROP TABLE IF EXISTS trabalho_final."animadorEpisodioAnima";

CREATE TABLE IF NOT EXISTS trabalho_final."animadorEpisodioAnima"
(
    animador_fk integer NOT NULL,
    episodio_fk integer NOT NULL,
    CONSTRAINT "animadorEpisodioAnima_pkey" PRIMARY KEY (animador_fk, episodio_fk)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS trabalho_final."animadorEpisodioAnima"
    OWNER to postgres;


-- Table: trabalho_finalFinal.anime
-- DROP TABLE IF EXISTS "trabalho_final".anime;
CREATE TABLE IF NOT EXISTS "trabalho_final".anime (
    id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    class_ind integer NOT NULL,
    obra_manga_fk integer NOT NULL,
    CONSTRAINT anime_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final".anime OWNER to postgres;

-- Table: trabalho_finalFinal.animeEstudioProduz
-- DROP TABLE IF EXISTS "trabalho_final"."animeEstudioProduz";
CREATE TABLE IF NOT EXISTS "trabalho_final"."animeEstudioProduz" (
    anime_fk integer NOT NULL,
    estudio_fk integer NOT NULL,
    CONSTRAINT "animeEstudioProduz_pkey" PRIMARY KEY (anime_fk, estudio_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final"."animeEstudioProduz" OWNER to postgres;

-- Table: trabalho_finalFinal.animeFunc_estudioEscalam
-- DROP TABLE IF EXISTS "trabalho_final"."animeFunc_estudioEscalam";
CREATE TABLE IF NOT EXISTS "trabalho_final"."animeFunc_estudioEscalam" (
    anime_fk integer NOT NULL,
    func_estudio_fk integer NOT NULL,
    "dt_escalacao" date NOT NULL,
    CONSTRAINT "animeFunc_estudioEscalam_pkey" PRIMARY KEY (anime_fk,func_estudio_fk)
    
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final"."animeFunc_estudioEscalam" OWNER to postgres;

-- Table: trabalho_finalFinal.animeGeneroClassifica
-- DROP TABLE IF EXISTS "trabalho_final"."animeGeneroClassifica";
CREATE TABLE IF NOT EXISTS "trabalho_final"."animeGeneroClassifica" (
    anime_fk integer NOT NULL,
    genero_fk integer NOT NULL,
    CONSTRAINT "animeGeneroClassifica_pkey" PRIMARY KEY (anime_fk, genero_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final"."animeGeneroClassifica" OWNER to postgres;

-- Table: trabalho_finalFinal.animeStreamingLancados
-- DROP TABLE IF EXISTS "trabalho_final"."animeStreamingLancados";
CREATE TABLE IF NOT EXISTS "trabalho_final"."animeStreamingLancados" (
    streaming_fk integer NOT NULL,
    anime_fk integer NOT NULL,
    CONSTRAINT "animeStreamingLancados_pkey" PRIMARY KEY (streaming_fk, anime_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final"."animeStreamingLancados" OWNER to postgres;

-- Table: trabalho_finalFinal.categoria
-- DROP TABLE IF EXISTS "trabalho_final".categoria;
CREATE TABLE IF NOT EXISTS "trabalho_final".categoria (
    id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT categoria_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final".categoria OWNER to postgres;

-- Table: trabalho_finalFinal.editor
-- DROP TABLE IF EXISTS "trabalho_final".editor;
CREATE TABLE IF NOT EXISTS "trabalho_final".editor (
    func_editora_fk integer NOT NULL,
    editor_chefe_fk integer NOT NULL,
    avali_desemp character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT editor_pkey PRIMARY KEY (func_editora_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final".editor OWNER to postgres;

-- Table: trabalho_finalFinal.editor_obraMangaEdita
-- DROP TABLE IF EXISTS "trabalho_final"."editor_obraMangaEdita";
CREATE TABLE IF NOT EXISTS "trabalho_final"."editor_obraMangaEdita" (
    obra_manga_fk integer NOT NULL,
    func_editora_fk integer NOT NULL,
    CONSTRAINT "editor_obraMangaEdita_pkey" PRIMARY KEY (obra_manga_fk, func_editora_fk)
    
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final"."editor_obraMangaEdita" OWNER to postgres;

-- Table: trabalho_finalFinal.editora
-- DROP TABLE IF EXISTS "trabalho_final".editora;
CREATE TABLE IF NOT EXISTS "trabalho_final".editora (
    cnpj integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    "endereco" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT editora_pkey PRIMARY KEY (cnpj)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final".editora OWNER to postgres;

-- Table: trabalho_finalFinal.episodio
-- DROP TABLE IF EXISTS "trabalho_final".episodio;
CREATE TABLE IF NOT EXISTS "trabalho_final".episodio (
    num integer NOT NULL,
    titulo character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT episodio_pkey PRIMARY KEY (num)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final".episodio OWNER to postgres;

-- Table: trabalho_finalFinal.estudio
-- DROP TABLE IF EXISTS "trabalho_final".estudio;
CREATE TABLE IF NOT EXISTS "trabalho_final".estudio (
    cnpj integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    endereco character varying COLLATE pg_catalog."default" NOT NULL,
    editora_fk integer NOT NULL,
    CONSTRAINT estudio_pkey PRIMARY KEY (cnpj)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final".estudio OWNER to postgres;

-- Table: trabalho_finalFinal.estudioFunc_estudioContrata
-- DROP TABLE IF EXISTS "trabalho_final"."estudioFunc_estudioContrata";
CREATE TABLE IF NOT EXISTS "trabalho_final"."estudioFunc_estudioContrata" (
    estudio_fk integer NOT NULL,
    func_estudio_fk integer NOT NULL,
    dt_fim date,
    dt_inicio date,
    CONSTRAINT "estudioFunc_estudioContrata_pkey" PRIMARY KEY (estudio_fk, func_estudio_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final"."estudioFunc_estudioContrata" OWNER to postgres;

-- Table: trabalho_finalFinal.estudioStreamingLicencia
-- DROP TABLE IF EXISTS "trabalho_final"."estudioStreamingLicencia";
CREATE TABLE IF NOT EXISTS "trabalho_final"."estudioStreamingLicencia" (
    estudio_fk integer NOT NULL,
    streaming_fk integer NOT NULL,
    CONSTRAINT "estudioStreamingLicencia_pkey" PRIMARY KEY (estudio_fk, streaming_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final"."estudioStreamingLicencia" OWNER to postgres;

-- Table: trabalho_finalFinal.func_editora
-- DROP TABLE IF EXISTS "trabalho_final".func_editora;
CREATE TABLE IF NOT EXISTS "trabalho_final".func_editora (
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
    IF EXISTS "trabalho_final".func_editora OWNER to postgres;

-- Table: trabalho_finalFinal.func_estudio
-- DROP TABLE IF EXISTS "trabalho_final".func_estudio;
CREATE TABLE IF NOT EXISTS "trabalho_final".func_estudio (
    id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    salario double precision NOT NULL,
    tipo character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT func_estudio_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final".func_estudio OWNER to postgres;

-- Table: trabalho_finalFinal.genero
-- DROP TABLE IF EXISTS "trabalho_final".genero;
CREATE TABLE IF NOT EXISTS "trabalho_final".genero (
    id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genero_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final".genero OWNER to postgres;

-- Table: trabalho_finalFinal.mangaka_obraMangaEscreve
-- DROP TABLE IF EXISTS "trabalho_final"."mangaka_obraMangaEscreve";
CREATE TABLE IF NOT EXISTS "trabalho_final"."mangaka_obraMangaEscreve" (
    obra_manga_fk integer NOT NULL,
    func_editora_fk integer NOT NULL,
    CONSTRAINT "mangaka_obraMangaEscreve_pkey" PRIMARY KEY (obra_manga_fk, func_editora_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final"."mangaka_obraMangaEscreve" OWNER to postgres;

-- Table: trabalho_finalFinal.obra_manga
-- DROP TABLE IF EXISTS "trabalho_final".obra_manga;
CREATE TABLE IF NOT EXISTS "trabalho_final".obra_manga (
    id integer NOT NULL,
    num_leitores integer NOT NULL,
    num_cap integer NOT NULL,
    revista_fk integer NOT NULL,
    CONSTRAINT obra_manga_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final".obra_manga OWNER to postgres;

-- Table: trabalho_finalFinal.obra_mangaAnimeAdapta
-- DROP TABLE IF EXISTS "trabalho_final"."obra_mangaAnimeAdapta";
CREATE TABLE IF NOT EXISTS "trabalho_final"."obra_mangaAnimeAdapta" (
    anime_fk integer NOT NULL,
    obra_manga_fk integer NOT NULL,
    CONSTRAINT "Obra_mangaAnimeAdapta_pkey" PRIMARY KEY (anime_fk, obra_manga_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final"."obra_mangaAnimeAdapta" OWNER to postgres;

-- Table: trabalho_finalFinal.obra_mangaCategoriaClassifica
-- DROP TABLE IF EXISTS "trabalho_final"."obra_mangaCategoriaClassifica";
CREATE TABLE IF NOT EXISTS "trabalho_final"."obra_mangaCategoriaClassifica" (
    obra_manga_fk integer NOT NULL,
    categoria_fk integer NOT NULL,
    CONSTRAINT "obra_mangaCategoriaClassifica_pkey" PRIMARY KEY (obra_manga_fk, categoria_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final"."obra_mangaCategoriaClassifica" OWNER to postgres;

-- Table: trabalho_finalFinal.pais
-- DROP TABLE IF EXISTS "trabalho_final"."pais";
CREATE TABLE IF NOT EXISTS "trabalho_final"."pais" (
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "pais_pkey" PRIMARY KEY (nome)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final"."pais" OWNER to postgres;

-- Table: trabalho_finalFinal.personagem
-- DROP TABLE IF EXISTS "trabalho_final".personagem;
CREATE TABLE IF NOT EXISTS "trabalho_final".personagem (
    id integer NOT NULL,
    dublador_fk integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    func_estudio_fk integer NOT NULL,
    CONSTRAINT personagem_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final".personagem OWNER to postgres;

-- Table: trabalho_finalFinal.revista
-- DROP TABLE IF EXISTS "trabalho_final".revista;
CREATE TABLE IF NOT EXISTS "trabalho_final".revista (
    isbn integer NOT NULL,
    num_vol integer NOT NULL,
    num_cap integer,
    titulo character varying COLLATE pg_catalog."default" NOT NULL,
    volume_fk integer,
    CONSTRAINT revista_pkey PRIMARY KEY (isbn)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final".revista OWNER to postgres;

-- Table: trabalho_finalFinal.roteiristaEpisodioRoteirizam
-- DROP TABLE IF EXISTS "trabalho_final"."roteiristaEpisodioRoteirizam";
CREATE TABLE IF NOT EXISTS "trabalho_final"."roteiristaEpisodioRoteirizam" (
    roteirista_fk integer NOT NULL,
    episodio_fk integer NOT NULL,
    CONSTRAINT "roteiristaEpisodioRoteirizam_pkey" PRIMARY KEY (roteirista_fk, episodio_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final"."roteiristaEpisodioRoteirizam" OWNER to postgres;

-- Table: trabalho_finalFinal.streaming
-- DROP TABLE IF EXISTS "trabalho_final".streaming;
CREATE TABLE IF NOT EXISTS "trabalho_final".streaming (
    cnpj integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    estudio_fk integer NOT NULL,
    CONSTRAINT streaming_pkey PRIMARY KEY (cnpj)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final".streaming OWNER to postgres;

-- Table: trabalho_finalFinal.streamingPaisDisponibilidade
-- DROP TABLE IF EXISTS "trabalho_final"."streamingPaisDisponibilidade";
CREATE TABLE IF NOT EXISTS "trabalho_final"."streamingPaisDisponibilidade" (
    streaming_fk integer NOT NULL,
    pais_fk character varying(200) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "streamingPaisDisponibilidade_pkey" PRIMARY KEY (streaming_fk, pais_fk)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final"."streamingPaisDisponibilidade" OWNER to postgres;

-- Table: trabalho_finalFinal.volume
-- DROP TABLE IF EXISTS "trabalho_final".volume;
CREATE TABLE IF NOT EXISTS "trabalho_final".volume (
    isbn integer NOT NULL,
    num_vol integer NOT NULL,
    titulo character varying COLLATE pg_catalog."default" NOT NULL,
    obra_manga_fk integer NOT NULL,
    CONSTRAINT volume_pkey PRIMARY KEY (isbn)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS "trabalho_final".volume OWNER to postgres;



----------------------------  CRIAÇÃO DE FKS ----------------------------------------------------------------------

ALTER TABLE IF EXISTS trabalho_final.animador
    ADD FOREIGN KEY (func_estudio_fk)
    REFERENCES trabalho_final.func_estudio (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final.animador
    ADD FOREIGN KEY (animador_chefe_fk)
    REFERENCES trabalho_final.animador (func_estudio_fk) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."animadorEpisodioAnima"
    ADD FOREIGN KEY (animador_fk)
    REFERENCES trabalho_final.animador (func_estudio_fk) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."animadorEpisodioAnima"
    ADD FOREIGN KEY (episodio_fk)
    REFERENCES trabalho_final.episodio (num) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final.anime
    ADD FOREIGN KEY (obra_manga_fk)
    REFERENCES trabalho_final.obra_manga (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."animeEstudioProduz"
    ADD FOREIGN KEY (anime_fk)
    REFERENCES trabalho_final.anime (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."animeEstudioProduz"
    ADD FOREIGN KEY (estudio_fk)
    REFERENCES trabalho_final.estudio (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."animeFunc_estudioEscalam"
    ADD FOREIGN KEY (anime_fk)
    REFERENCES trabalho_final.anime (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."animeFunc_estudioEscalam"
    ADD FOREIGN KEY (func_estudio_fk)
    REFERENCES trabalho_final.func_estudio (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."animeGeneroClassifica"
    ADD FOREIGN KEY (anime_fk)
    REFERENCES trabalho_final.anime (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."animeGeneroClassifica"
    ADD FOREIGN KEY (genero_fk)
    REFERENCES trabalho_final.genero (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."animeStreamingLancados"
    ADD FOREIGN KEY (streaming_fk)
    REFERENCES trabalho_final.streaming (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."animeStreamingLancados"
    ADD FOREIGN KEY (anime_fk)
    REFERENCES trabalho_final.anime (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final.editor
    ADD FOREIGN KEY (func_editora_fk)
    REFERENCES trabalho_final.func_editora (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final.editor
    ADD FOREIGN KEY (editor_chefe_fk)
    REFERENCES trabalho_final.func_editora (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."editor_obraMangaEdita"
    ADD FOREIGN KEY (obra_manga_fk)
    REFERENCES trabalho_final.obra_manga (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."editor_obraMangaEdita"
    ADD FOREIGN KEY (func_editora_fk)
    REFERENCES trabalho_final.func_editora (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final.estudio
    ADD FOREIGN KEY (editora_fk)
    REFERENCES trabalho_final.editora (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."estudioFunc_estudioContrata"
    ADD FOREIGN KEY (estudio_fk)
    REFERENCES trabalho_final.estudio (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."estudioFunc_estudioContrata"
    ADD FOREIGN KEY (func_estudio_fk)
    REFERENCES trabalho_final.func_estudio (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."estudioStreamingLicencia"
    ADD FOREIGN KEY (estudio_fk)
    REFERENCES trabalho_final.estudio (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."estudioStreamingLicencia"
    ADD FOREIGN KEY (streaming_fk)
    REFERENCES trabalho_final.streaming (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final.func_editora
    ADD FOREIGN KEY (editora_fk)
    REFERENCES trabalho_final.editora (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."mangaka_obraMangaEscreve"
    ADD FOREIGN KEY (obra_manga_fk)
    REFERENCES trabalho_final.obra_manga (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."mangaka_obraMangaEscreve"
    ADD FOREIGN KEY (func_editora_fk)
    REFERENCES trabalho_final.func_editora (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final.obra_manga
    ADD FOREIGN KEY (revista_fk)
    REFERENCES trabalho_final.revista (isbn) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."obra_mangaAnimeAdapta"
    ADD FOREIGN KEY (anime_fk)
    REFERENCES trabalho_final.anime (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."obra_mangaAnimeAdapta"
    ADD FOREIGN KEY (obra_manga_fk)
    REFERENCES trabalho_final.obra_manga (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."obra_mangaCategoriaClassifica"
    ADD FOREIGN KEY (obra_manga_fk)
    REFERENCES trabalho_final.obra_manga (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."obra_mangaCategoriaClassifica"
    ADD FOREIGN KEY (categoria_fk)
    REFERENCES trabalho_final.categoria (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final.personagem
    ADD FOREIGN KEY (func_estudio_fk)
    REFERENCES trabalho_final.func_estudio (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final.personagem
    ADD FOREIGN KEY (dublador_fk)
    REFERENCES trabalho_final.func_estudio (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final.revista
    ADD FOREIGN KEY (volume_fk)
    REFERENCES trabalho_final.volume (isbn) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."roteiristaEpisodioRoteirizam"
    ADD FOREIGN KEY (roteirista_fk)
    REFERENCES trabalho_final.func_estudio (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."roteiristaEpisodioRoteirizam"
    ADD FOREIGN KEY (episodio_fk)
    REFERENCES trabalho_final.episodio (num) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final.streaming
    ADD FOREIGN KEY (estudio_fk)
    REFERENCES trabalho_final.estudio (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."streamingPaisDisponibilidade"
    ADD FOREIGN KEY (streaming_fk)
    REFERENCES trabalho_final.streaming (cnpj) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final."streamingPaisDisponibilidade"
    ADD FOREIGN KEY (pais_fk)
    REFERENCES trabalho_final.pais (nome) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS trabalho_final.volume
    ADD FOREIGN KEY (obra_manga_fk)
    REFERENCES trabalho_final.obra_manga (id) MATCH SIMPLE
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

CREATE INDEX idx_avaliacao
ON obra_manga
USING btree(num_leitores);

CREATE INDEX idx_salario_estudio
ON func_estudio
USING btree(salario);

CREATE INDEX idx_salario_estudio
ON func_editora
USING btree(salario);


/* Índices para Chaves Estrangeiras (sempre na tabela que referencia) */
CREATE INDEX idx_genero_fk
ON animeGeneroClassifica
USING hash(genero_fk);

CREATE INDEX idx_anime_fk
ON animeGeneroClassifica
USING hash(anime_fk);

CREATE INDEX idx_pais_fk
ON streamingPaisDisponibilidade
USING hash(pais_fk);

CREATE INDEX idx_streaming_fk_pais
ON streamingPaisDisponibilidade
USING hash(streaming_fk);

CREATE INDEX idx_streaming_fk
ON animeStreamingLancados
USING hash(streaming_fk);

CREATE INDEX idx_streaming_anime_fk
ON animeStreamingLancados
USING hash(anime_fk);

CREATE INDEX idx_func_editora
ON mangakaObra_mangaEscreve 
USING hash(func_editora_fk);

CREATE INDEX idx_obra_manga
ON mangakaObra_mangaEscreve 
USING hash(obra_manga);

CREATE INDEX idx_categoria_fk
ON obra_mangaCategoriaClassifica 
USING hash(categoria_fk);

CREATE INDEX idx_obra_manga_fk
ON obra_mangaCategoriaClassifica 
USING hash(obra_manga_fk);

CREATE INDEX idx_obra_manga_fk_2
ON editorObra_mangaEdita
USING hash(obra_manga_fk);

CREATE INDEX idx_func_editora_fk
ON editorObra_mangaEdita
USING hash(func_editora_fk);

CREATE INDEX idx_editor_chefe_fk
ON editor
USING hash(editor_chefe_fk);

CREATE INDEX idx_func_estudio_fk
ON animeFunc_estudioEscalam
USING hash(func_estudio_fk);

CREATE INDEX idx_func_estudio_fk_2
ON estudioFunc_estudioContratam
USING hash(func_estudio_fk);

CREATE INDEX idx_anime_fk_2
ON animeEstudioProduz
USING hash(anime_fk);

CREATE INDEX idx_estudio_fk
ON animeEstudioProduz
USING hash(estudio_fk);

----------------------------  CONSULTAS ----------------------------------------------------------------------
-- 1
SELECT DISTINCT trabalho_final.anime.nome
  FROM trabalho_final.anime, trabalho_final.genero, trabalho_final."animeGeneroClassifica"
 WHERE (trabalho_final.genero.nome = 'horror'
    OR trabalho_final.genero.nome = 'ação')
   AND trabalho_final.genero.id = trabalho_final."animeGeneroClassifica".genero_fk
   AND trabalho_final.anime.id = trabalho_final."animeGeneroClassifica".anime_fk;
   
-- 2
SELECT DISTINCT trabalho_final.anime.nome
  FROM trabalho_final.anime, trabalho_final.streaming, trabalho_final.pais,
	   trabalho_final."streamingPaisDisponibilidade", trabalho_final."animeStreamingLancados"
 WHERE trabalho_final.pais.nome = 'brasil'
   AND trabalho_final."streamingPaisDisponibilidade".pais_fk = trabalho_final.pais.nome
   AND trabalho_final."streamingPaisDisponibilidade".streaming_fk = trabalho_final.streaming.cnpj
   AND trabalho_final."animeStreamingLancados".streaming_fk = trabalho_final.streaming.cnpj
   AND trabalho_final."animeStreamingLancados".anime_fk = trabalho_final.anime.id
   AND trabalho_final.anime.nome LIKE 'a%';

-- 3
SELECT trabalho_final.func_editora.nome
  FROM trabalho_final.editor, trabalho_final.func_editora
 WHERE trabalho_final.editor.func_editora_fk = trabalho_final.func_editora.id
   AND trabalho_final.editor.avali_desemp <= 7
   AND trabalho_final.editor.avali_desemp >= 6;
   
-- 4
SELECT DISTINCT trabalho_final.func_editora.nome
  FROM trabalho_final.obra_manga, trabalho_final."mangakaObra_mangaEscreve", trabalho_final.func_editora
 WHERE trabalho_final.func_editora.id = trabalho_final."mangakaObra_mangaEscreve".func_editora_fk
   AND trabalho_final."mangakaObra_mangaEscreve".obra_manga_fk = trabalho_final.obra_manga.id
   AND trabalho_final.obra_manga.num_leitores > 1000;
   
-- 5
SELECT DISTINCT trabalho_final.func_editora.nome
  FROM trabalho_final.editor, trabalho_final.categoria, trabalho_final.obra_manga,
       trabalho_final."obra_mangaCategoriaClassifica" AS C,
       trabalho_final."editorObra_mangaEdita" AS E,
       trabalho_final.func_editora
 WHERE (trabalho_final.categoria.nome = 'acao'
    OR trabalho_final.categoria.nome = 'drama')
   AND trabalho_final.categoria.id = C.categoria_fk
   AND C.obra_manga_fk = trabalho_final.obra_manga.id
   AND E.obra_manga_fk = trabalho_final.obra_manga.id
   AND E.func_editora_fk = trabalho_final.editor.func_editora_fk
   AND trabalho_final.func_editora.id = trabalho_final.editor.editor_chefe_fk
ORDER BY trabalho_final.func_editora.nome DESC;

-- 6
(SELECT trabalho_final.func_editora.nome
   FROM trabalho_final.func_editora
  WHERE trabalho_final.func_editora.nome LIKE '%porto'
)
UNION
(SELECT trabalho_final.func_estudio.nome
  FROM trabalho_final.func_estudio
 WHERE trabalho_final.func_estudio.nome LIKE '%porto'
);

-- 7
(SELECT nome
   FROM trabalho_final.func_estudio,
        trabalho_final."animeFunc_estudioEscalam" AS E,
        trabalho_final."estudioFunc_estudioContratam" AS CONTRATA
  WHERE trabalho_final.func_estudio.salario > 10000
    AND E.func_estudio = trabalho_final.func_estudio.id
    AND CONTRATA.func_estudio_fk = trabalho_final.func_estudio.id
    AND (CAST(CURRENT_DATE AS date) - CAST(CONTRATA.dt_inicio AS date)) between 0 and 30
)
UNION
(SELECT trabalho_final.func_editora.nome
   FROM trabalho_final.func_editora
  WHERE trabalho_final.func_editora.salario > 10000
    AND (CAST(CURRENT_DATE AS date) - CAST(trabalho_final.func_editora.dt_inicio AS date)) between 0 and 30
);

-- 8
SELECT trabalho_final.anime.nome
  FROM trabalho_final.estudio, trabalho_final.anime, trabalho_final."animeEstudioProduz" AS P
 WHERE trabalho_final.anime.id = P.anime_fk
   AND P.estudio_fk = trabalho_final.estudio.cnpj
   AND trabalho_final.estudio.cnpj 
   IN(SELECT P.estudio_fk
        FROM(SELECT P.estudio_fk, MAX(quantidade)
               FROM(SELECT P.estudio_fk, count(P.estudio_fk) AS quantidade
                      FROM trabalho_final."animeEstudioProduz" AS P
                    GROUP by P.estudio_fk) AS primeiro
        ) AS segundo
   );

-- 9
SELECT trabalho_final.func_estudio.nome
  FROM trabalho_final.func_estudio
INNER JOIN trabalho_final.func_editora 
        ON trabalho_final.func_estudio.nome = trabalho_final.func_editora.nome
     WHERE trabalho_final.func_estudio.nome LIKE 'matheus%';
	 
-- 10
SELECT AVG(trabalho_final.obra_manga.num_leitores) AS Media
  FROM trabalho_final.obra_manga
GROUP BY trabalho_final.obra_manga.num_cap;

