-- INSERIR MUSICA E EXCLUIR MUSICA
CREATE TABLE tg_inserir_musica (
idtg_inserir_musica INT PRIMARY KEY AUTO_INCREMENT,
id_musica INT,
nome_musica VARCHAR(50),
duracao TIME,
data_lancamento DATE,
usuario_log VARCHAR(100),
data_log DATETIME

);
DELIMITER $$
CREATE TRIGGER tg_inserir_musica  AFTER INSERT on Musica
FOR EACH ROW
BEGIN 
INSERT INTO tg_inserir_musica VALUES(null, new.id_musica, new.nome_musica, new.duracao, new.data_lancamento, user(), now());

END $$
DELIMITER ;



CREATE TABLE tg_musicas_excluidas (
idtg_musica_excluida INT PRIMARY KEY AUTO_INCREMENT,
id_musica INT,
nome_musica VARCHAR(50),
duracao TIME,
data_lancamento DATE,
usuario_log VARCHAR(100),
data_log DATETIME

);

DELIMITER $$

CREATE TRIGGER tg_excluir_musica BEFORE DELETE on Musica
FOR EACH ROW 
BEGIN 
INSERT INTO tg_musicas_excluidas VALUES (null, old.id_musica, old.nome_musica, old.duracao, old.data_lancamento, user(), now());

END $$

DELIMITER ;

-- ---------------------------------------------------------------------------------------------------------------

CREATE TABLE tg_inserir_album (
idtg_album INT PRIMARY KEY AUTO_INCREMENT,
id_album INT,
nome_album VARCHAR(50),
data_lancamento DATE,
usuario_log VARCHAR(100),
data_log DATETIME
);

DELIMITER $$ 
CREATE TRIGGER tg_inserir_album AFTER INSERT ON ALBUM
FOR EACH ROW
BEGIN
INSERT INTO tg_inserir_album VALUES (null, new.id_album, new.nome_album, new.data_lancamento, user(), now());

END $$ 

DELIMITER ;

CREATE TABLE tg_albuns_excluidos (
id_tg_album INT PRIMARY KEY AUTO_INCREMENT, 
id_album INT,
nome_album VARCHAR(50),
data_lancamento DATE,
usuario_log VARCHAR(100),
data_log DATETIME
);

DELIMITER $$
CREATE TRIGGER tg_excluir_album BEFORE DELETE ON Album 
FOR EACH ROW
BEGIN 
INSERT INTO tg_albuns_exluidos VALUES(null, old.id_album, old.nome_album, old.data_lancamento, user(), now());

END $$

DELIMITER ;

SELECT * FROM Musica;

-- ------------------------------------------------------------------------------------------------------
CREATE TABLE tg_inserir_artista (
id_tg_artista INT PRIMARY KEY AUTO_INCREMENT,
id_artista INT,
nome_artista VARCHAR(50),
tipo_artista ENUM('Solo', 'Banda', 'Dupla', ' Orquestra'),
biografia TEXT,
nacionalidade VARCHAR(50),
ano_inicio YEAR,
foto_perfil VARCHAR(255),
site_oficial VARCHAR(255),
ativo TINYINT(1),
data_cadastro TIMESTAMP,
usuario_log VARCHAR(100),
data_log DATETIME
);

DELIMITER $$ 
CREATE TRIGGER tg_inserir_artista AFTER INSERT ON Artista
FOR EACH ROW
BEGIN 
INSERT INTO tg_inserir_artista VALUES(null, new.id_artista, new.nome_artista, new.tipo_artista, new.biografia, new.nacionalidade, new.ano_inicio, new.foto_perfil, new.site_oficial, new.ativo, new.data_cadastro, user(), now());

END $$
DELIMITER ;

CREATE TABLE tg_artista_excluido (
id_tg_artista_excluido INT PRIMARY KEY AUTO_INCREMENT,
id_artista INT,
nome_artista VARCHAR(50),
tipo_artista ENUM('Solo', 'Banda', 'Dupla', 'Orquestra'),
biografia TEXT,
nacionalidade VARCHAR(50),
ano_inicio YEAR,
foto_perfil VARCHAR(255),
site_oficial VARCHAR(255),
ativo TINYINT(1),
data_cadastro TIMESTAMP,
usuario_log VARCHAR(100),
data_log DATETIME
);

DELIMITER $$
CREATE TRIGGER tg_excluir_artista BEFORE DELETE ON Artista
FOR EACH ROW
BEGIN 
INSERT INTO tg_artista_excluido VALUES (null, old.id_artista, old.nome_artista, old.tipo_artista, old.biografia, old.nacionalidade, old.ano_inicio, old.foto_perfil, old.site_oficial, old.ativo, old.data_cadastro, user(), now());

END $$
DELIMITER ;

-- ------------------------------------------------------------------------------------------

CREATE TABLE tg_inserir_compositor (
id_tg_compositor INT PRIMARY KEY AUTO_INCREMENT,
id_compositor INT, 
nome_compositor VARCHAR(50),
sobrenome_compositor VARCHAR(100),
usuario_log VARCHAR(100),
data_log DATETIME
);

DELIMITER $$

CREATE TRIGGER tg_inserir_compositor AFTER INSERT ON Compositor 
FOR EACH ROW 
BEGIN 
INSERT INTO tg_inserir_compositor VALUES(NULL, new.id_compositor, new.nome_compositor, new.sobrenome_compositor, user(), now() );

END $$

DELIMITER ;

CREATE TABLE tg_compositor_excluido (
id_tg_compositor INT PRIMARY KEY AUTO_INCREMENT, 
id_compositor INT,
nome_compositor VARCHAR(50),
sobrenome_compositor VARCHAR(100),
usuario_log VARCHAR(100),
data_log DATETIME
);


DELIMITER $$
CREATE TRIGGER tg_excluir_compositor BEFORE DELETE ON Compositor 
FOR EACH ROW 
BEGIN 
INSERT INTO tg_compositor_excluido VALUES (null, old.id_compositor, old.nome_compositor, old.sobrenome_compositor, user(), now());

END $$

DELIMITER ;


-- -----------------------------------------------------------------------------------------------------
CREATE TABLE tg_inserir_genero (
id_tg_genero INT PRIMARY KEY AUTO_INCREMENT, 
id_genero INT,
nome_genero VARCHAR(50),
descricao TEXT,
usuario_log VARCHAR(100),
data_log DATETIME
);

DELIMITER $$
 
CREATE TRIGGER tg_inserir_genero AFTER INSERT ON Genero 
FOR EACH ROW
BEGIN 
INSERT INTO tg_inserir_genero VALUES(NULL, new.id_genero, new.nome_genero, new.descricao, user(), now());

END $$

DELIMITER ;

CREATE TABLE tg_genero_excluido (
id_tg_genero INT PRIMARY KEY AUTO_INCREMENT, 
id_genero INT, 
nome_genero VARCHAR(50),
descricao TEXT,
usuario_log VARCHAR(100),
data_log DATETIME
);

DELIMITER $$

CREATE TRIGGER tg_excluir_genero BEFORE DELETE ON Genero 
FOR EACH ROW 
BEGIN 
INSERT INTO tg_inserir_genero VALUES(NULL, old.id_genero, old.nome_genero, old.descricao, user(), now());

END $$

DELIMITER ;

-- ---------------------------------------------------------------------------------------------------------------
CREATE TABLE tg_inserir_subgenero (
id_tg_subgenero INT PRIMARY KEY AUTO_INCREMENT,
id_sub_genero INT,
nome_sub_genero VARCHAR(50),
descricao TEXT,
ano_origem DATE,
usuario_log VARCHAR(100),
data_log DATETIME
);

DELIMITER $$

CREATE TRIGGER tg_inserir_subgenero AFTER INSERT ON Subgenero 
FOR EACH ROW 
BEGIN 
INSERT INTO tg_inserir_subgenero VALUES (NULL, new.id_sub_genero, new.nome_sub_genero, new.descricao, new.ano_origem, user(), now());

END $$

DELIMITER ;


CREATE TABLE tg_subgenero_excluido(
id_tg_subgenero INT PRIMARY KEY AUTO_INCREMENT,
id_sub_genero INT,
nome_sub_genero VARCHAR(50),
descricao TEXT,
ano_origem DATE,
usuario_log VARCHAR(100),
data_log DATETIME
);

DELIMITER $$

CREATE TRIGGER tg_excluir_subgenero BEFORE DELETE ON Subgenero 
FOR EACH ROW
BEGIN 
INSERT INTO tg_subgenero_excluido VALUES(NULL, old.id_sub_genero, old.nome_sub_genero, old.descricao, old.ano_origem, user(), now());

END $$

DELIMITER ;


-- ---------------------------------------------------------------------------------------------------
CREATE TABLE tg_telefone(
id_tg_telefone INT PRIMARY KEY AUTO_INCREMENT, 
id_telefone INT,
DDD VARCHAR(4),
numero_telefone VARCHAR(15)
);

DELIMITER $$
CREATE TRIGGER tg_inserir_telefone AFTER INSERT ON Telefone
FOR EACH ROW
BEGIN 
INSERT INTO tg_telefone VALUES (null, new.id_telefone, new.DDD, new.numero_telefone, user(), now());

END $$

DELIMITER ;

CREATE TABLE tg_telefone_excluido(
id_tg_telefone INT PRIMARY KEY AUTO_INCREMENT,
id_telefone INT,
DDD VARCHAR(4),
numero_telefone VARCHAR(15),
usuario_log VARCHAR(100),
data_log DATETIME
);

DELIMITER $$
CREATE TRIGGER tg_excluir_telefone BEFORE DELETE ON Telefone
FOR EACH ROW
BEGIN 
INSERT INTO tg_telefone VALUES (null, old.id_telefone, old.DDD, old.numero_telefone, user(), now());

END $$

DELIMITER ;

-- ----------------------------------------------------------------------

CREATE TABLE tg_playlist (
id_tg_playlist INT PRIMARY KEY AUTO_INCREMENT,
id_playlist INT,
nome_playlist VARCHAR(50),
descricao TEXT,
usuario_log VARCHAR(100),
data_log DATETIME
);

DELIMITER $$
CREATE TRIGGER tg_criar_playlist AFTER INSERT ON Playlist
FOR EACH ROW 
BEGIN 
INSERT INTO tg_playlist VALUES(NULL, new.id_playlist, new.nome_playlist, new.descricao, user(), now());
END $$

DELIMITER ;

CREATE TABLE tg_playlist_excluida (
id_tg_playlist INT PRIMARY KEY AUTO_INCREMENT,
id_playlist INT,
nome_playlist VARCHAR(50),
descricao TEXT,
usuario_log VARCHAR(100),
data_log DATETIME
);

DELIMITER $$

CREATE TRIGGER tg_excluir_playlist BEFORE DELETE ON Playlist 
FOR EACH ROW
BEGIN 
INSERT INTO tg_playlist VALUES(null, old.id_playlist, old.nome_playlist, old.descricao);

END $$

DELIMITER ; 

-- --------------------------------------

