
CREATE USER IF NOT EXISTS 'dev_spotify'@'localhost' IDENTIFIED BY 'Dev@Pass123';
GRANT CREATE, INSERT, SELECT ON DB_SPOTIFY.* TO 'dev_spotify'@'localhost';

CREATE USER IF NOT EXISTS 'suporte_spotify'@'localhost' IDENTIFIED BY 'Sup@Pass123';
GRANT SELECT, DELETE ON DB_SPOTIFY.* TO 'suporte_spotify'@'localhost';

CREATE USER IF NOT EXISTS 'admin_dados'@'localhost' IDENTIFIED BY 'Adm@Pass123';
GRANT UPDATE, SELECT, DROP ON DB_SPOTIFY.* TO 'admin_dados'@'localhost';

FLUSH PRIVILEGES;


-- 1 listar nome da musica e album

SELECT m.id_musica,m.nome_musica, m.duracao, m.data_lancamento, al.nome_album
FROM Musica m
INNER JOIN Album al
ON m.fk_id_album = al.id_album;

-- 2 listar artista e musica

SELECT  m.id_musica, ar.nome_artista, ar.tipo_artista, m.nome_musica 
FROM Artista ar 
INNER JOIN musica_artista ma
ON ar.id_artista = ma.id_artista
INNER JOIN Musica m 
on m.id_musica = ma.id_musica
GROUP BY m.id_musica;

-- 3 listar genero e sub genero
SELECT ge.id_genero, ge.nome_genero, ge.descricao, sub.nome_sub_genero, sub.ano_origem
FROM Genero ge
INNER JOIN Genero_sub_genero gesu
ON ge.id_genero = gesu.id_genero 
INNER JOIN Subgenero sub 
ON sub.id_sub_genero = gesu.id_sub_genero;

-- 4 lista música e artista, se o artista não tiver música cadastrada ele retorna null no campo da musica

SELECT ar.nome_artista, m.nome_musica
FROM Artista ar 
LEFT JOIN musica_artista ma ON ar.id_artista = ma.id_artista
LEFT JOIN Musica m ON ma.id_musica = m.id_musica;

-- 5  Mostra todos os albuns mesmo os que nao tiver música mostrando a direita(no nosso banco de dados, nao possuimos nenhum albúm sem música.

SELECT m.nome_musica, al.nome_album 
FROM Musica m 
RIGHT JOIN Album al ON m.fk_id_album = al.id_album;

-- 6 mostra as músicas excluidas com o seu album 

SELECT me.nome_musica, ale.nome_album 
FROM tg_musicas_excluidas me
INNER JOIN tg_albuns_excluidos ale ON me.idtg_musica_excluida = ale.id_tg_album; 


-- 7 listar playslists

SELECT *
FROM playlist;

-- 8 lista playlists e musicas

SELECT pl.nome_playlist, m.nome_musica
FROM Playlist pl 
INNER JOIN musica_playlist mp 
ON mp.id_playlist = pl.id_playlist
INNER JOIN Musica m 
ON mp.id_musica = m.id_musica;

-- 9 listar nome dos compositores 

SELECT * 
FROM Compositor;

-- 10 listar nome dos compositores e suas músicas 

SELECT m.id_musica, m.nome_musica, a.nome_artista AS 'Compositor'
FROM Musica m 
LEFT JOIN musica_compositor mc
ON m.id_musica = mc.id_musica
LEFT JOIN Artista a ON a.id_artista = mc.id_compositor;


-- 11 lista usuários cadastrados com a procedure
SELECT * FROM Usuario;

-- 12 SELECIONA TODAS AS MUSICAS INSERIDAS COM A PROCEDURE 
SELECT * FROM 
tg_inserir_musica;

-- 13 -- seleciona musicas excluidas

SELECT * from 
tg_musicas_excluidas;

-- 14 seleciona artistas excluidos 

SELECT * FROM tg_artista_excluido;

--  15 seleciona playlists excluidas

SELECT * FROM tg_playlist_excluida;