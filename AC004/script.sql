CREATE SCHEMA ac004;

SET SCHEMA 'ac004';

CREATE TABLE funcionario(
	id SERIAL,
	nome VARCHAR(60) NOT NULL,
	email VARCHAR(60) NOT NULL,
    sexo VARCHAR(10) NOT NULL,
	ddd INT,
	salario FLOAT,
	telefone VARCHAR(8),
	ativo VARCHAR(1) DEFAULT 'S',
	endereco VARCHAR(70) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
	cidade VARCHAR(20) NOT NULL,
	estado VARCHAR(2) NOT NULL,
	bairro VARCHAR(20) NOT NULL,
	pais VARCHAR(20) NOT NULL,
	login VARCHAR(12) NOT NULL,
	senha VARCHAR(12) NOT NULL,
	news VARCHAR(8),
	PRIMARY KEY(id)
);

CREATE TABLE faltas_func(
	id_falta SERIAL,
	id_func_ff INT NOT NULL,
	justificativa VARCHAR(200),
	PRIMARY KEY(id_falta),
	FOREIGN KEY(id_func_ff) REFERENCES funcionario(id)
);

CREATE TABLE faltas_nao_justificadas(
	id_func_fnj INT NOT NULL,
	num_faltas INT NOT NULL DEFAULT 0,
	PRIMARY KEY(id_func_fnj),
	FOREIGN KEY(id_func_fnj) REFERENCES funcionario(id)
);

CREATE TABLE cargo_nivel_func(
	id_func_cn INT NOT NULL,
	cargo INT NOT NULL DEFAULT 1,
	nivel INT NOT NULL DEFAULT 1,
	ultima_promocao DATE NOT NULL DEFAULT CURRENT_DATE,
	PRIMARY KEY(id_func_cn),
	FOREIGN KEY(id_func_cn) REFERENCES funcionario(id)
);

/* 1. Implemente uma função para diminuir o salário de um funcionário em um determinado percentual. 
      A sua função deve se chamar DiminuirSalario e deve receber como parâmetros de entrada o CPF do 
	  funcionário e um valor inteiro que representa o percentual de redução. */
	  
CREATE OR REPLACE FUNCTION DiminuirSalario(func_cpf VARCHAR(11), perc INT)
RETURNS VOID AS 
$$
DECLARE
    id_func INT;
    salario_atual FLOAT;
    novo_salario FLOAT;
BEGIN
    SELECT id INTO id_func 
	  FROM funcionario 
	 WHERE cpf = func_cpf;
    
    SELECT salario INTO salario_atual 
	  FROM funcionario 
	 WHERE id = id_func;

    SELECT (salario_atual - (salario_atual * perc / 100)) INTO novo_salario;
    
    UPDATE funcionario 
	   SET salario = novo_salario 
	 WHERE id = id_func;
END;
$$ LANGUAGE plpgsql;

/* ------------------------------------------------------------------------------------------------------------------------- */
	  
/* 2. Além da redução de salários, o governo prevê demissões para funcionários que faltem sem 
      justificativa apresentada. Esse tipo de controle não existe hoje no banco de dados. Sua 
	  tarefa é desenvolver um mecanismo que controle as faltas de cada um dos funcionários. 
	  A partir da 5a (quinta) falta sem justificativa o campo ATIVO da tabela funcionário deve 
	  ser setado para 'N" significando que ele foi demitido.

	  Sugestão: criem uma tabela que controle as faltas e justificativas e uma trigger associada 
	  a essa tabela para verificar a quantidade de faltas. */
	  
/* Insere registro de funcionário na tabela faltas_nao_justificadas sempre que é registrado um novo funcionário */
CREATE OR REPLACE FUNCTION insere_func()
RETURNS TRIGGER AS 
$$
BEGIN
    INSERT INTO faltas_nao_justificadas (id_func_fnj) VALUES (NEW.id);
    RETURN NEW;
END
$$ LANGUAGE plpgsql;

/* Trigger para inserir funcionarios na tabela de faltas */
CREATE TRIGGER inserir_func
AFTER INSERT ON funcionario
FOR EACH ROW
EXECUTE FUNCTION insere_func();

/* Função que realiza a inserção de faltas não justificadas */
CREATE OR REPLACE FUNCTION insere_falta()
RETURNS TRIGGER AS 
$$
BEGIN
    IF NEW.justificativa = '' 
	    OR 
	   NEW.justificativa IS NULL 
	THEN
        UPDATE faltas_nao_justificadas
           SET num_faltas = num_faltas + 1
         WHERE id_func_fnj = NEW.id_func_ff;
    END IF;
    RETURN NEW;
END
$$ LANGUAGE plpgsql;

/* Trigger para registrar uma falta não justificada */
CREATE TRIGGER registra_falta
AFTER INSERT ON faltas_func
FOR EACH ROW
EXECUTE FUNCTION insere_falta();

/* Função que desativa funcionarios */
CREATE OR REPLACE FUNCTION desativar_funcionario()
RETURNS TRIGGER AS 
$$
BEGIN
    IF NEW.num_faltas > 5 
	THEN
        UPDATE funcionario
           SET ativo = 'N'
         WHERE id = NEW.id_func_fnj;
    END IF;
    RETURN NEW;
END
$$ LANGUAGE plpgsql;

/* Trigger que desliga um funcionário caso ele possua mais que 5 faltas */
CREATE TRIGGER desativa_funcionario
AFTER UPDATE ON faltas_nao_justificadas
FOR EACH ROW
EXECUTE FUNCTION desativar_funcionario();

/* ------------------------------------------------------------------------------------------------------------------------- */

/* 3. O governo do estado também deseja controlar todas as promoções dos funcionários 
      ao longo do anos. Assim como no caso das faltas, esse mecanismo não se encontra 
	  implementado no banco de dados. É sua responsabilidade implementar esse controle. 
	  Cada funcionário possui um cargo (que por simplificação pode variar entre CARGO1, 
	  CARGO2 e CARGO 3) e seu nível pode variar entre 1 e 7. Ou seja, o funcionário pode 
	  ter o CARGO1 e Nível 5 no momento, e, na próxima promoção ele terá o CARGO1 (que 
	  não muda) e Nível 6, e assim por diante. 
	  
	  Lembrando que cada funcionário só pode aumentar seu nível de 3 em 3 anos e não pode 
	  haver interseção de períodos entre dois níveis. Além disso, um funcionário só pode ser
	  promovido para o nível imediatamente superior ao atual, logo uma promoção do Nível 1 
	  para o Nível 3 é proibida. Desenvolva uma função que implemente a promoção de um 
	  determinado funcionário. Sua função deve receber o CPF do funcionário e o nível para 
	  promoção como parâmetros de entrada. */
	  
/* Função que cria a tupla referente ao novo funcionário inserido */
CREATE OR REPLACE FUNCTION inserir_cargo_nivel()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO cargo_nivel_func (id_func_cn) VALUES (NEW.id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

/* Trigger para adicionar informações de cargo e nível toda vez que um novo funcionário é inserido */
CREATE TRIGGER insere_cargo_nivel
AFTER INSERT ON funcionario
FOR EACH ROW
EXECUTE FUNCTION inserir_cargo_nivel();

CREATE OR REPLACE FUNCTION PromoverFuncionario(func_cpf VARCHAR(11), novo_nivel INT)
RETURNS VOID AS $$
DECLARE
    id_func INT;
    func_ativo VARCHAR(1);
    nivel_atual INT;
    tempo INT;
BEGIN
    SELECT id INTO id_func
	  FROM funcionario 
	 WHERE cpf = func_cpf;
	 
	 SELECT ativo INTO func_ativo
        FROM funcionario
       WHERE id = id_func;
	   
	 IF func_ativo = 'S' THEN
	 	SELECT nivel INTO nivel_atual 
	  	  FROM cargo_nivel_func 
	 	 WHERE id_func_cn = id_func;

     	IF novo_nivel <= 7 AND novo_nivel = nivel_atual + 1 THEN
    		SELECT EXTRACT(YEAR FROM AGE(CURRENT_DATE, ultima_promocao)) INTO tempo
              FROM cargo_nivel_func
             WHERE id_func_cn = id_func;
			 
			IF tempo >= 3 THEN
				IF novo_nivel = nivel_atual + 1 THEN
					UPDATE cargo_nivel_func 
				       SET nivel = novo_nivel, 
					       ultima_promocao = CURRENT_DATE 
				     WHERE id_func_cn = id_func;
					 
				END IF;
			END IF;
		END IF;
	END IF;
END;
$$ LANGUAGE plpgsql;
	  
/* ------------------------------------------------------------------------------------------------------------------------- */

/* População da tabela funcionário */
INSERT INTO funcionario (nome, email, sexo, endereco, cpf, cidade, estado, bairro, pais, login, senha)
	 VALUES ('João Silva', 'joao@example.com', 'Masculino', 'Rua A, 123', '12345678901', 
			 'São Paulo', 'SP', 'Centro', 'Brasil', 'joao123', 'senha123'),
			('Maria Oliveira', 'maria@example.com', 'Feminino', 'Avenida B, 456', '98765432101', 
			 'Rio de Janeiro', 'RJ', 'Copacabana', 'Brasil', 'maria456', 'senha456');
			 
UPDATE funcionario
   SET salario = 1000
 WHERE id = 2;
 
/* Teste da função DiminuirSalário */
SELECT DiminuirSalario('98765432101', 20);
			 
/* Inserção de faltas não justificadas para teste de triggers e funções */
INSERT INTO faltas_func (id_func_ff) VALUES (1);
INSERT INTO faltas_func (id_func_ff) VALUES (1);
INSERT INTO faltas_func (id_func_ff) VALUES (1);
INSERT INTO faltas_func (id_func_ff) VALUES (1);
INSERT INTO faltas_func (id_func_ff) VALUES (1);
INSERT INTO faltas_func (id_func_ff) VALUES (1);

/* Testes da função PromoverFuncionario */
SELECT PromoverFuncionario('12345678901', 2);
SELECT PromoverFuncionario('98765432101', 1);
SELECT PromoverFuncionario('98765432101', 3);
SELECT PromoverFuncionario('98765432101', 2);
SELECT PromoverFuncionario('98765432101', 8);

SELECT *
FROM funcionario;

SELECT *
FROM faltas_func;

SELECT *
FROM faltas_nao_justificadas;

SELECT nome, cpf, cargo, nivel, ultima_promocao, ativo
FROM funcionario, cargo_nivel_func
WHERE id = id_func_cn;

UPDATE cargo_nivel_func
SET ultima_promocao = CURRENT_DATE - INTERVAL '4 years'
WHERE id_func_cn = 2;

UPDATE cargo_nivel_func
SET nivel = 1
WHERE id_func_cn = 2;

UPDATE cargo_nivel_func
SET nivel = 7
WHERE id_func_cn = 2;



