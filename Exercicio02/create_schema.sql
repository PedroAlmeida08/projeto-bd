/* Criação do esquema*/
CREATE SCHEMA exercicio02;

/* Uso do esquema*/
SET SCHEMA 'exercicio02';

CREATE TABLE projeto(
  IDPROJETO INT not NULL,
  ORCAMENTO DOUBLE PRECISION NOT NULL,
  CIDADE VARCHAR(100) NOT NULL,
  PRIMARY KEY(IDPROJETO)
);

CREATE TABLE depesa(
  TIPODESPESA CHAR(1) not NULL,
  NRDOCUMENTO INT NOT NULL,
  IDPROJETO INT NOT NULL,
  VALOR DOUBLE PRECISION NOT NULL,
  PRIMARY KEY(TIPODESPESA, NRDOCUMENTO),
  FOREIGN KEY(IDPROJETO) REFERENCES projeto(IDPROJETO)
);