/* Criação do esquema*/
CREATE SCHEMA projeto_bd;

/* Uso do esquema*/
SET SCHEMA 'projeto_bd';

/* ----------------------------------------------------------------------------------------------------- */
/* Criação de Tabelas */
CREATE TABLE campeonato(
	id INT NOT NULL,
	nome VARCHAR(30) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE edicao(
	id INT NOT NULL,
	ano INT NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE edicao_campeonato(
	id_campeonato INT NOT NULL,
	id_edicao INT NOT NULL,
	PRIMARY KEY(id_campeonato, id_edicao),
	FOREIGN KEY(id_campeonato) REFERENCES campeonato(id),
	FOREIGN KEY(id_edicao) REFERENCES edicao(id)
);

CREATE TABLE clube(
	id INT NOT NULL,
	nome VARCHAR(30) NOT NULL,
	cartola INT NOT NULL,
	PRIMARY KEY(id)
);

ALTER TABLE clube 
	ALTER COLUMN cartola TYPE VARCHAR(30);

CREATE TABLE jogo(
	id INT NOT NULL,
	id_edicao INT NOT NULL,
	id_mandante INT NOT NULL,
	id_visitante INT NOT NULL,
	PRIMARY KEY(id, id_edicao, id_mandante, id_visitante),
	FOREIGN KEY(id_edicao) REFERENCES edicao(id),
	FOREIGN KEY(id_mandante) REFERENCES clube(id),
	FOREIGN KEY(id_visitante) REFERENCES clube(id)
);

CREATE TABLE jogador(
	id INT NOT NULL,
	nome VARCHAR(30) NOT NULL,
	cpf CHAR(14) NOT NULL,
	data_nasc CHAR(10) NOT NULL,
	id_clube INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(id_clube) REFERENCES clube(id)
);

ALTER TABLE jogador ALTER COLUMN cpf DROP NOT NULL;
ALTER TABLE jogador ALTER COLUMN data_nasc DROP NOT NULL;

CREATE TABLE jogador_jogo(
	id_jogador INT NOT NULL,
	id_jogo INT NOT NULL,
	id_edicao INT NOT NULL,
	id_mandante INT NOT NULL,
	id_visitante INT NOT NULL,
	PRIMARY KEY(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante),
	FOREIGN KEY(id_jogador) REFERENCES jogador(id),
	FOREIGN KEY(id_jogo, id_edicao, id_mandante, id_visitante) REFERENCES jogo(id, id_edicao, id_mandante, id_visitante)
);
