/* Criação do esquema*/
CREATE SCHEMA exercicio02;

/* Uso do esquema*/
SET SCHEMA 'exercicio02';

/* Criando tabela projeto*/
CREATE TABLE projeto(
  idprojeto INT not NULL,
  orcamento DOUBLE PRECISION NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  PRIMARY KEY(idprojeto)
);

/* Criando tabela despesa */
CREATE TABLE despesa(
  tipodespesa CHAR(1) not NULL,
  nrdocumento INT NOT NULL,
  idprojeto INT NOT NULL,
  valor DOUBLE PRECISION NOT NULL,
  PRIMARY KEY(tipodespesa, nrdocumento),
  FOREIGN KEY(idprojeto) REFERENCES projeto(idprojeto)
);
