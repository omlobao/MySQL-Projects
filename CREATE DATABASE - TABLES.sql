
CREATE DATABASE DB_SPOTIFY;

USE DB_SPOTIFY;




CREATE TABLE Genero (
id_genero INT PRIMARY KEY AUTO_INCREMENT,
nome_genero VARCHAR(50) NOT NULL,
descricao TEXT 
);

CREATE TABLE Subgenero (
 id_sub_genero INT PRIMARY KEY AUTO_INCREMENT,
 nome_sub_genero VARCHAR(50) NOT NULL,
 descricao TEXT,
 ano_origem DATE 
 );
 
 
 CREATE TABLE Genero_sub_genero (
 id_genero INT NOT NULL,
 id_sub_genero INT NOT NULL,
 
 PRIMARY KEY (id_genero, id_sub_genero),
 
 FOREIGN KEY (id_genero) REFERENCES Genero (id_genero) 
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 FOREIGN KEY (id_sub_genero) REFERENCES Subgenero(id_sub_genero)
 ON DELETE CASCADE
 ON UPDATE CASCADE
 );
 
 CREATE TABLE Album (
 id_album INT PRIMARY KEY AUTO_INCREMENT,
 nome_album VARCHAR(50) NOT NULL,
 data_lancamento DATE 
 );
 
 CREATE TABLE Musica(
 id_musica INT PRIMARY KEY AUTO_INCREMENT,
 nome_musica VARCHAR(50) NOT NULL,
 duracao TIME,
 data_lancamento DATE,
 
 fk_id_album INT NOT NULL,
 
 FOREIGN KEY (fk_id_album) REFERENCES Album(id_album) ON DELETE CASCADE
 );
 
 
 CREATE TABLE Artista (
 id_artista INT PRIMARY KEY AUTO_INCREMENT,
 nome_artista VARCHAR(50) NOT NULL,
 tipo_artista ENUM ('Solo', 'Banda', 'Dupla', 'Orquestra'),
 biografia TEXT,
 nacionalidade VARCHAR(50),
 ano_inicio YEAR,
 foto_perfil VARCHAR(255),
 site_oficial VARCHAR(255),
 ativo BOOLEAN DEFAULT TRUE,
 data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 );
 
 CREATE TABLE Compositor(
 id_compositor INT PRIMARY KEY AUTO_INCREMENT,
 nome_compositor VARCHAR(50) NOT NULL,
 sobrenome_compositor VARCHAR(100) NOT NULL
 );
 
 CREATE TABLE Musica_Compositor (
 id_musica INT NOT NULL,
 id_compositor INT NOT NULL,
 porcentagem_direito FLOAT,
 papel_criativo ENUM(
 'Letrista',
 'Compositor Melódico',
 'Arranjador',
 'Produtor Músical',
 'Compositor Integral'
 ) DEFAULT 'Compositor Integral',
 
 PRIMARY KEY (id_musica, id_compositor),
 
 FOREIGN KEY(id_musica) REFERENCES Musica(id_musica)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 FOREIGN KEY(id_compositor) REFERENCES Artista(id_artista)
 ON DELETE CASCADE
 ON UPDATE CASCADE
 );
 
 
 CREATE TABLE Musica_Artista (
 id_musica INT NOT NULL,
 id_artista INT NOT NULL,
 papel VARCHAR(50) DEFAULT 'Principal',
 ordem_exibicao INT DEFAULT 1,
 
 PRIMARY KEY (id_musica, id_artista),
 
 FOREIGN KEY (id_musica) REFERENCES Musica(id_musica)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 FOREIGN KEY(id_artista) REFERENCES Artista(id_artista)
 ON DELETE CASCADE
 ON UPDATE CASCADE
 );
 
 CREATE TABLE Musica_Categorias (
 id_musica INT NOT NULL,
 id_genero INT NOT NULL,
 id_sub_genero INT NOT NULL,
 
 PRIMARY KEY(id_musica, id_genero, id_sub_genero),
 
 FOREIGN KEY (id_musica) REFERENCES Musica(id_musica)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 FOREIGN KEY (id_genero) REFERENCES Genero(id_genero)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 
 FOREIGN KEY (id_sub_genero) REFERENCES Subgenero(id_sub_genero)
 ON DELETE CASCADE
 ON UPDATE CASCADE
 );
 
 
 CREATE TABLE Playlist(
 id_playlist INT PRIMARY KEY AUTO_INCREMENT,
 nome_playlist VARCHAR(50) NOT NULL,
 descricao TEXT
 );
 
 CREATE TABLE Musica_Playlist (
 id_musica INT NOT NULL,
 id_playlist INT NOT NULL,
 data_adicao DATE,
 
 PRIMARY KEY(id_musica, id_playlist),
 
 FOREIGN KEY(id_musica) REFERENCES Musica(id_musica)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 FOREIGN KEY(id_playlist) REFERENCES Playlist(id_playlist)
 ON DELETE CASCADE
 ON UPDATE CASCADE
 );
 
 
 CREATE TABLE Usuario (
 id_usuario INT PRIMARY KEY AUTO_INCREMENT,
 nome_usuario VARCHAR(255) NOT NULL,
 sobrenome_usuario VARCHAR(100) NOT NULL,
 data_nascimento DATE NOT NULL,
 email VARCHAR(100) NOT NULL,
 senha VARCHAR(20) NOT NULL
 );
 
 
 
 CREATE TABLE Telefone(
 id_telefone INT PRIMARY KEY AUTO_INCREMENT,
 DDD VARCHAR(4) NOT NULL,
 numero_telefone VARCHAR(15) NOT NULL,
 
 id_usuario INT NOT NULL,
 
 FOREIGN KEY(id_usuario) REFERENCES Usuario(id_usuario)
 ON DELETE CASCADE
 ON UPDATE CASCADE
 );
 
 
 CREATE TABLE Usuario_playlist (
 id_usuario INT NOT NULL,
 id_playlist INT NOT NULL,
 permissao ENUM ('Dono','Editor', 'Ouvinte') DEFAULT 'Ouvinte',
 data_vinculo TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 notificacoes_ativas BOOLEAN DEFAULT TRUE,
 
 PRIMARY KEY(id_usuario, id_playlist),
 
 FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) 
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 FOREIGN KEY (id_playlist) REFERENCES Playlist(id_playlist)
 ON DELETE CASCADE
 ON UPDATE CASCADE
 );
 
 
 