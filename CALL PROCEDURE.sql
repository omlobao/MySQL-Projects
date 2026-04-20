
-- CADASTRA USUÁRIO 

CALL CadastrarUsuario(
'Matheus',
'Lobao',
'1999-05-19',
'mvlobao@gmail.com',
'senha_123',
'(71)',
'99117-5273'
);

--  Exemplo para adicionar uma música, sempre adiciona o Genero e sub- Genero caso ele nao existir no banco de dados
INSERT INTO Genero (nome_genero, descricao) VALUES ('Electronic', 'Música eletrônica e sintetizada');
INSERT INTO Subgenero (nome_sub_genero, descricao) VALUES ('French House', 'Estilo de house music da França');

CALL Adicionar_musica(
    'One More Time',         
    '00:05:20',               
    '2000-11-13',              
    'Discovery',              
    'Daft Punk',               
    'Thomas Bangalter',        
    'Electronic',              
    'French House'           
);

-- Checar se já está tudo Correto
SELECT 
    M.nome_musica, 
    A.nome_artista, 
    Alb.nome_album, 
    G.nome_genero 
FROM Musica M
JOIN Musica_Artista MA ON M.id_musica = MA.id_musica
JOIN Artista A ON MA.id_artista = A.id_artista
JOIN Album Alb ON M.fk_id_album = Alb.id_album
JOIN Musica_Categorias MC ON M.id_musica = MC.id_musica
JOIN Genero G ON MC.id_genero = G.id_genero; 


-- deleta a musica pelo id 

CALL sp_Excluir_Musica(1);


