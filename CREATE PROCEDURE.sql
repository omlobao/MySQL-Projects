/* CADASTRO DE USUARIO */

DELIMITER $$

CREATE PROCEDURE CadastrarUsuario(
IN p_nome VARCHAR(50),
IN p_sobrenome VARCHAR(100),
IN p_nascimento DATE,
IN p_email VARCHAR(100),
IN p_senha VARCHAR(255),
IN p_ddd VARCHAR(4),
IN p_numero_tel VARCHAR(15)
)
BEGIN 
	DECLARE v_usuario_id INT;
    
    START TRANSACTION; -- nao salva automaticamente
    
    INSERT INTO Usuario (nome_usuario, sobrenome_usuario, data_nascimento, email, senha)
    VALUES (p_nome, p_sobrenome, p_nascimento, p_email, p_senha);
    
    SET v_usuario_id = LAST_INSERT_ID();
    
    INSERT INTO Telefone(DDD, numero_telefone, id_usuario)
    VALUES (p_ddd, p_numero_tel, v_usuario_id);
    
    COMMIT; -- Quando deu certo nos outros dados, ele salva 
    
    SELECT v_usuario_id AS novo_id_usuario, 'Usuário cadastrado com sucesso!' AS mensagem;
    
END $$

DELIMITER ;


/* ----------------------------------------------------- */

/* Adiciona Música e as outras entidades no banco de dados(ainda nao é playlist) */

DELIMITER $$

CREATE PROCEDURE Adicionar_musica (
IN m_nome_musica VARCHAR(50),
IN m_duracao TIME,
IN m_data_lancamento DATE,
IN p_nome_album VARCHAR(50),
IN p_nome_artista VARCHAR(50),
IN p_nome_compositor VARCHAR(50),
IN p_nome_genero VARCHAR(50),
IN p_nome_sub_genero VARCHAR(50)
)
BEGIN 
	DECLARE v_id_album INT;
    DECLARE v_id_artista INT;
    DECLARE v_id_compositor INT;
    DECLARE v_id_genero INT;
    DECLARE v_id_sub_genero INT;
    DECLARE v_id_musica INT;
    
    -- se nao tiver album, cria um
    SELECT id_album INTO v_id_album FROM Album WHERE nome_album = p_nome_album LIMIT 1;
    if v_id_album IS NULL THEN
    INSERT INTO Album (nome_album, data_lancamento) VALUES (p_nome_album, m_data_lancamento);
    
    SET v_id_album = LAST_INSERT_ID();
    END IF;
    
    -- se nao tiver artista, cria um
    SELECT id_artista INTO v_id_artista FROM Artista WHERE nome_artista = p_nome_artista LIMIT 1;
    if v_id_artista IS NULL THEN
    INSERT INTO Artista (nome_artista, tipo_artista) VALUES (p_nome_artista, 'solo');
    
    SET v_id_artista = LAST_INSERT_ID();
    END IF;
    
    -- se nao tiver genero, cria um
    SELECT id_genero INTO v_id_genero FROM Genero WHERE nome_genero = p_nome_genero LIMIT 1;
    IF v_id_genero IS NULL THEN
    INSERT INTO Genero(nome_genero, descricao) VALUES (p_nome_genero, 'Novo Gênero Adicionado');
    SET v_id_genero = LAST_INSERT_ID();
    end if;
    
    -- Se nao tiver sub genero, vai criar um
    SELECT id_sub_genero INTO v_id_sub_genero FROM Subgenero WHERE nome_sub_genero = p_nome_sub_genero LIMIT 1;
    if v_id_sub_genero IS NULL THEN 
    INSERT INTO Genero(nome_sub_genero, descricao) VALUES (p_nome_sub_genero, 'Novo Sub-Gênero Adicionado');
    SET v_id_sub_genero = LAST_INSERT_ID();
    end if;
    
    -- faz o vinculo com a tabela Genero-sub-genero
    INSERT IGNORE INTO Genero_sub_genero(id_genero, id_sub_genero)
    VALUES (v_id_genero, v_id_sub_genero);
    
    -- insere uma nova musica
    INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album)
    VALUES (m_nome_musica, m_duracao, m_data_lancamento, v_id_album);
    
    SET v_id_musica = LAST_INSERT_ID();
    
    -- faz o vinculo com a tabela 
    INSERT INTO Musica_artista (id_musica, id_artista) VALUES (v_id_musica, v_id_artista);
    IF v_id_genero IS NOT NULL AND v_id_sub_genero IS NOT NULL THEN
    INSERT INTO Musica_Categorias (id_musica, id_genero, id_sub_genero)
    VALUES (v_id_musica, v_id_genero, v_id_sub_genero);
    END IF;
    
    SELECT CONCAT('Música com o id de: ', v_id_musica, 'Adicionada.') AS Status;
    
    END $$
    
    DELIMITER ;
    
-- EXCLUIR MÚSICA PELO ID

DELIMITER $$

CREATE PROCEDURE sp_Excluir_Musica (
IN p_id_musica INT
)
BEGIN 
	IF EXISTS (SELECT 1 FROM Musica WHERE id_musica = p_id_musica) THEN
    
    DELETE FROM Musica WHERE id_musica = p_id_musica;
    
    SELECT CONCAT('Musica de id: ', p_id_musica, 'Foi Deletada do banco de dados. ') AS STATUS;
    ELSE 
    SELECT 'Erro' AS Status;
    END IF;
END $$

DELIMITER ;

-- CRIAR PLAYLIST
DELIMITER $$
CREATE PROCEDURE sp_Criar_Playlist (
IN p_id_usuario INT,
IN p_nome_playlist VARCHAR(50),
IN p_descricao TEXT
)
BEGIN 
	DECLARE v_id_playlist INT;
    
    IF EXISTS (SELECT 1 FROM Usuario WHERE id_usuario = p_id_usuario) THEN
    INSERT INTO Playlist(nome_playlist, descricao)
    VALUES (p_nome_playlist, p_descricao);
    
    SET v_id_playlist = LAST_INSERT_ID();
    
    INSERT INTO Usuario_playlist(id_usuario, id_playlist, permissao)
    VALUES (p_id_usuario, v_id_playlist, 'Dono');
    
    SELECT CONCAT('Playlist "', p_nome_playlist, '" criada com Sucesso!' ) AS Status; 
    
    ELSE 
		SELECT 'Erro: Usuário não encontrado.' AS Status;
    END IF;
    
    END $$
    DELIMITER ;
    
    -- adiciona musica na playlist 
    
    DELIMITER $$ 
    
    CREATE PROCEDURE sp_Adicionar_Musica_playlist (
		IN p_id_musica INT,
        IN p_id_playlist INT
	)
    BEGIN 
	IF EXISTS( SELECT 1 FROM Musica WHERE id_musica = p_id_musica ) AND
    EXISTS (SELECT 1 FROM Playlist WHERE id_playlist = p_id_playlist ) THEN
     
	INSERT INTO Musica_Playlist (id_musica, id_playlist, data_adicao)
    VALUES (p_id_musica, p_id_playlist, CURDATE()); -- o Curdate coloca uma data automática
    
    SELECT 'Música Adicionada na Playlist' AS STATUS;
    ELSE 
    SELECT 'Erro: Música ou playlist nao encontrada.' AS STATUS ;
    END IF;
    
    END $$
    
    DELIMITER ;
    