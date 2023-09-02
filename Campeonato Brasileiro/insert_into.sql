/* População das Tabelas */ 
INSERT INTO campeonato(id, nome) VALUES (1, 'Brasileiro');

UPDATE campeonato
	SET nome = 'Brasileirão' 
	WHERE id = 1;

INSERT INTO edicao(id, ano) VALUES (1, 2023);

INSERT INTO edicao_campeonato(id_campeonato, id_edicao) VALUES (1, 1);

SELECT nome, ano
	FROM campeonato c, edicao e
	WHERE c.id = e.id;

INSERT INTO clube(id, nome, cartola) VALUES (1, 'Flamengo', 'Marcos Braz');
INSERT INTO clube(id, nome, cartola) VALUES (2, 'Vasco', 'Jorge Salgado');
INSERT INTO clube(id, nome, cartola) VALUES (3, 'Fluminense', 'Mário Bittencourt');
INSERT INTO clube(id, nome, cartola) VALUES (4, 'Botafogo', 'John Textor');

INSERT INTO jogo(id, id_edicao, id_mandante, id_visitante) VALUES (1, 1, 1, 2);
INSERT INTO jogo(id, id_edicao, id_mandante, id_visitante) VALUES (2, 1, 1, 3);
INSERT INTO jogo(id, id_edicao, id_mandante, id_visitante) VALUES (3, 1, 1, 4);
INSERT INTO jogo(id, id_edicao, id_mandante, id_visitante) VALUES (4, 1, 2, 1);
INSERT INTO jogo(id, id_edicao, id_mandante, id_visitante) VALUES (5, 1, 2, 3);
INSERT INTO jogo(id, id_edicao, id_mandante, id_visitante) VALUES (6, 1, 2, 4);
INSERT INTO jogo(id, id_edicao, id_mandante, id_visitante) VALUES (7, 1, 3, 1);
INSERT INTO jogo(id, id_edicao, id_mandante, id_visitante) VALUES (8, 1, 3, 2);
INSERT INTO jogo(id, id_edicao, id_mandante, id_visitante) VALUES (9, 1, 3, 4);
INSERT INTO jogo(id, id_edicao, id_mandante, id_visitante) VALUES (10, 1, 4, 1);
INSERT INTO jogo(id, id_edicao, id_mandante, id_visitante) VALUES (11, 1, 4, 2);
INSERT INTO jogo(id, id_edicao, id_mandante, id_visitante) VALUES (12, 1, 4, 3);

INSERT INTO jogador(id, nome, id_clube) VALUES (1, 'Pedro', 1);
INSERT INTO jogador(id, nome, id_clube) VALUES (2, 'Gabigol', 1);
INSERT INTO jogador(id, nome, id_clube) VALUES (3, 'Bruno Henrique', 1);
INSERT INTO jogador(id, nome, id_clube) VALUES (4, 'Arrascaeta', 1);
INSERT INTO jogador(id, nome, id_clube) VALUES (5, 'Léo Pelé', 2);
INSERT INTO jogador(id, nome, id_clube) VALUES (6, 'Robson Bambu', 2);
INSERT INTO jogador(id, nome, id_clube) VALUES (7, 'Gabriel Pec', 2);
INSERT INTO jogador(id, nome, id_clube) VALUES (8, 'Lucas Piton', 2);
INSERT INTO jogador(id, nome, id_clube) VALUES (9, 'Marcelo', 3);
INSERT INTO jogador(id, nome, id_clube) VALUES (10, 'Germán Cano', 3);
INSERT INTO jogador(id, nome, id_clube) VALUES (11, 'Felipe Melo', 3);
INSERT INTO jogador(id, nome, id_clube) VALUES (12, 'PH Ganso', 3);
INSERT INTO jogador(id, nome, id_clube) VALUES (13, 'Matías Segovia', 4);
INSERT INTO jogador(id, nome, id_clube) VALUES (14, 'Tiquinho Soares', 4);
INSERT INTO jogador(id, nome, id_clube) VALUES (15, 'Matheus Nascimento', 4);
INSERT INTO jogador(id, nome, id_clube) VALUES (16, 'Adryelson', 4);

SELECT j.nome, c.nome
	FROM jogador j, clube c
	WHERE j.id_clube = c.id;

INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (1, 1, 1, 1, 2);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (2, 1, 1, 1, 2);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (3, 2, 1, 1, 3);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (4, 2, 1, 1, 3);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (2, 3, 1, 1, 4);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (4, 3, 1, 1, 4);
	
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (5, 4, 1, 2, 1);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (6, 4, 1, 2, 1);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (7, 5, 1, 2, 3);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (8, 5, 1, 2, 3);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (6, 6, 1, 2, 4);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (8, 6, 1, 2, 4);

INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (9, 7, 1, 3, 1);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (10, 7, 1, 3, 1);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (11, 8, 1, 3, 2);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (12, 8, 1, 3, 2);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (10, 9, 1, 3, 4);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (12, 9, 1, 3, 4);
	 
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (13, 10, 1, 4, 1);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (14, 10, 1, 4, 1);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (15, 11, 1, 4, 2);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (16, 11, 1, 4, 2);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (14, 12, 1, 4, 3);
INSERT INTO jogador_jogo(id_jogador, id_jogo, id_edicao, id_mandante, id_visitante)
	 VALUES (16, 12, 1, 4, 3);
