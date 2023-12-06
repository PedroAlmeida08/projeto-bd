/* 
	Usando essa base de dados, faça a fragmentação horizontal usando os algoritmos de fragmentação horizontal primária e derivada. 
   	Mostre todos os passos do projeto. Considere as consultas a seguir como consultas frequentes nessa base de dados. 
   	Não usar mais tabelas que o estritamente necessário!

   	a. Mostrar a representação de dono (owner) e membro (member) das tabelas da aplicação. Fazer a escolha das tabelas que irão adotar FHP ou FHD.

   	b. Aplicar o algoritmo visto em aula de FHP para cada tabela escolhida para FHP. Apresentar os predicados simples, a geração dos mintermos, 
	implicações e apresentar a definição de cada fragmento gerado para cada tabela de fragmentação primária. Mostrar explicitamente a eliminação 
	de predicados contraditórios, i.e. que geram fragmentos vazios. Explique o porquê da eliminação e da simplificação dos predicados.

   	c. Apresente e justifique as fragmentações derivadas.
*/

CREATE SCHEMA ac002;

CREATE TABLE ac002."Pessoa"(CodPessoa int, Nome varchar, idade int, UF char(2), 
							PRIMARY KEY(CodPessoa)
);

CREATE TABLE ac002."Receita"(CodReceita int, DataPostagem varchar, Titulo varchar, ModoPreparo varchar, CodPessoa int, 
							 PRIMARY KEY(CodReceita),
  							 FOREIGN KEY(CodPessoa) REFERENCES ac002."Pessoa"(CodPessoa)
);

CREATE TABLE ac002."Ingrediente"(CodIngrediente int, Descrição varchar, Unidade varchar,
								PRIMARY KEY(CodIngrediente)
);

CREATE TABLE ac002."Ingrediente_Receita"(CodReceita int, CodIngrediente int, Quantidade double
										 PRIMARY KEY(CodReceita, CodIngrediente),
										 FOREIGN KEY(CodReceita) REFERENCES ac002."Receita"(CodReceita),
										 FOREIGN KEY(CodIngrediente) REFERENCES ac002."Ingrediente"(CodIngrediente)
);

/* Uma consulta que retorna os códigos das receitas que foram postadas por pessoas com menos de 14 anos */
SELECT r.CodReceita
  FROM ac002."Pessoa" p, ac002."Receita" r
 WHERE r.CodPessoa = p.codPessoa
   AND p.idade < 14;
   
/* Uma consulta que retorna os códigos das receitas que foram postadas por pessoas com mais de 18 anos */
SELECT r.CodReceita
  FROM ac002."Pessoa" p, ac002."Receita" r
 WHERE r.CodPessoa = p.codPessoa
   AND p.idade > 18;
   
/* Um consulta que retorna os nomes das pessoas que residem no Rio de Janeiro (UF = "RJ") */
SELECT p.Nome
  FROM ac002."Pessoa" p
 WHERE p.UF = 'RJ';
 
/* Um consulta que retorna os nomes das pessoas que residem em São Paulo (UF = "SP") */
SELECT p.Nome
  FROM ac002."Pessoa" p
 WHERE p.UF = 'SP';
