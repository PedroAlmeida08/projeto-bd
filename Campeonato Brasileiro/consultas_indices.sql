SET SCHEMA 'projeto_bd';

/* Nome e ano dos campeonatos */
SELECT C.nome, e.ano
  FROM campeonato C, edicao e, edicao_campeonato ec
 WHERE c.id = ec.id_campeonato
   AND ec.id_edicao = e.id;
   
/* Lista de jogadores que participaram de algum jogo */   
SELECT j1.nome, j2.id
  FROM jogador j1, jogo j2, jogador_jogo j3
 Where j1.id = j3.id_jogador
   AND j3.id_jogo = j2.id;
   
/* Lista de jogadores que participaram de um jogo e que estavam no time mandante */
SELECT j1.nome, j2.id
  FROM jogador j1, jogo j2, jogador_jogo j3
 Where j1.id = j3.id_jogador
   AND j3.id_jogo = j2.id
   AND j1.id_clube = j2.id_mandante;
   
 /* Lista de jogadores que participaram de um jogo e que estavam no time visitante */
SELECT j1.nome, j2.id
  FROM jogador j1, jogo j2, jogador_jogo j3
 Where j1.id = j3.id_jogador
   AND j3.id_jogo = j2.id
   AND j1.id_clube = j2.id_mandante;
   
/* Lista de jogadores do Flamengo */
SELECT j.nome
  FROM jogador j, clube c
 WHERE j.id_clube = c.id
   AND c.nome = 'Flamengo';
   
/* Lista de jogadores do time com id = 4 */
SELECT j.nome
  FROM jogador j, clube c
 WHERE j.id_clube = c.id
   AND c.id = 4;
