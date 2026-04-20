USE DB_SPOTIFY;

-- 1. GÊNEROS E SUBGÊNEROS
INSERT INTO Genero (nome_genero, descricao) VALUES ('Rock', 'Guitarras'), ('Pop', 'Comercial');
INSERT INTO Subgenero (nome_sub_genero, descricao, ano_origem) VALUES ('Hard Rock', 'Pesado', '1970-01-01'), ('Synthpop', 'Eletrônico', '1980-01-01');
INSERT INTO Genero_sub_genero (id_genero, id_sub_genero) VALUES (1, 1), (2, 2);

-- 2. 10 ARTISTAS
INSERT INTO Artista (nome_artista, tipo_artista, nacionalidade, ano_inicio) VALUES 
('Queen', 'Banda', 'UK', 1970), ('Michael Jackson', 'Solo', 'EUA', 1964),
('Arctic Monkeys', 'Banda', 'UK', 2002), ('Lady Gaga', 'Solo', 'EUA', 2005),
('Daft Punk', 'Dupla', 'FRA', 1993), ('The Beatles', 'Banda', 'UK', 1960),
('Taylor Swift', 'Solo', 'EUA', 2006), ('Pink Floyd', 'Banda', 'UK', 1965),
('Imagine Dragons', 'Banda', 'EUA', 2008), ('Dua Lipa', 'Solo', 'UK', 2014);

-- 3. 10 COMPOSITORES (IDs 11 ao 20 na tabela Artista para as chaves estrangeiras)
INSERT INTO Artista (nome_artista, tipo_artista) VALUES 
('Freddie Mercury', 'Solo'), ('John Lennon', 'Solo'), ('Paul McCartney', 'Solo'), ('Max Martin', 'Solo'), 
('Quincy Jones', 'Solo'), ('Hans Zimmer', 'Solo'), ('Jack Antonoff', 'Solo'), ('Roger Waters', 'Solo'), 
('David Gilmour', 'Solo'), ('Kevin Parker', 'Solo');

INSERT INTO Compositor (nome_compositor, sobrenome_compositor) VALUES 
('Freddie', 'Mercury'), ('John', 'Lennon'), ('Paul', 'McCartney'), ('Max', 'Martin'), ('Quincy', 'Jones'),
('Hans', 'Zimmer'), ('Jack', 'Antonoff'), ('Roger', 'Waters'), ('David', 'Gilmour'), ('Kevin', 'Parker');

-- 4. 20 ÁLBUNS (2 POR ARTISTA)
INSERT INTO Album (nome_album, data_lancamento) VALUES 
('A Night at the Opera', '1975-11-21'), ('News of the World', '1977-10-28'), -- Queen (1,2)
('Thriller', '1982-11-30'), ('Bad', '1987-08-31'), -- Michael (3,4)
('AM', '2013-09-09'), ('Favourite Worst Nightmare', '2007-04-23'), -- Arctic (5,6)
('The Fame', '2008-08-19'), ('Chromatica', '2020-05-29'), -- Gaga (7,8)
('Discovery', '2001-02-26'), ('Random Access Memories', '2013-05-17'), -- Daft Punk (9,10)
('Abbey Road', '1969-09-26'), ('Let It Be', '1970-05-08'), -- Beatles (11,12)
('1989', '2014-10-27'), ('Midnights', '2022-10-21'), -- Taylor (13,14)
('The Dark Side of the Moon', '1973-03-01'), ('The Wall', '1979-11-30'), -- Pink Floyd (15,16)
('Night Visions', '2012-09-04'), ('Evolve', '2017-06-23'), -- Imagine Dragons (17,18)
('Future Nostalgia', '2020-03-27'), ('Radical Optimism', '2024-05-03'); -- Dua Lipa (19,20)

-- 5. 200 MÚSICAS DIFERENTES (10 POR ÁLBUM)
-- Queen
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Death on Two Legs', '03:43', '1975-11-21', 1), ('Lazing on a Sunday Afternoon', '01:07', '1975-11-21', 1), ('Im in Love with My Car', '03:05', '1975-11-21', 1), ('Youre My Best Friend', '02:52', '1975-11-21', 1), ('39', '03:31', '1975-11-21', 1), ('Sweet Lady', '04:03', '1975-11-21', 1), ('Seaside Rendezvous', '02:15', '1975-11-21', 1), ('The Prophets Song', '08:21', '1975-11-21', 1), ('Love of My Life', '03:39', '1975-11-21', 1), ('Bohemian Rhapsody', '05:55', '1975-11-21', 1);
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('We Will Rock You', '02:01', '1977-10-28', 2), ('We Are the Champions', '02:59', '1977-10-28', 2), ('Sheer Heart Attack', '03:26', '1977-10-28', 2), ('All Dead, All Dead', '03:10', '1977-10-28', 2), ('Spread Your Wings', '04:34', '1977-10-28', 2), ('Fight from the Inside', '03:03', '1977-10-28', 2), ('Get Down, Make Love', '03:51', '1977-10-28', 2), ('Sleep on the Sidewalk', '03:06', '1977-10-28', 2), ('Who Needs You', '03:05', '1977-10-28', 2), ('Its Late', '06:26', '1977-10-28', 2);
-- Michael Jackson
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Wanna Be Startin Somethin', '06:03', '1982-11-30', 3), ('Baby Be Mine', '04:20', '1982-11-30', 3), ('The Girl Is Mine', '03:41', '1982-11-30', 3), ('Thriller', '05:57', '1982-11-30', 3), ('Beat It', '04:18', '1982-11-30', 3), ('Billie Jean', '04:54', '1982-11-30', 3), ('Human Nature', '04:06', '1982-11-30', 3), ('P.Y.T.', '03:58', '1982-11-30', 3), ('The Lady in My Life', '04:59', '1982-11-30', 3), ('Carousel', '03:39', '1982-11-30', 3);
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Bad', '04:07', '1987-08-31', 4), ('The Way You Make Me Feel', '04:57', '1987-08-31', 4), ('Speed Demon', '04:01', '1987-08-31', 4), ('Liberian Girl', '03:53', '1987-08-31', 4), ('Just Good Friends', '04:06', '1987-08-31', 4), ('Another Part of Me', '03:54', '1987-08-31', 4), ('Man in the Mirror', '05:19', '1987-08-31', 4), ('I Just Cant Stop Loving You', '04:11', '1987-08-31', 4), ('Dirty Diana', '04:41', '1987-08-31', 4), ('Smooth Criminal', '04:17', '1987-08-31', 4);
-- Arctic Monkeys
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Do I Wanna Know?', '04:32', '2013-09-09', 5), ('R U Mine?', '03:20', '2013-09-09', 5), ('One for the Road', '03:26', '2013-09-09', 5), ('Arabella', '03:27', '2013-09-09', 5), ('I Want It All', '03:04', '2013-09-09', 5), ('No.1 Party Anthem', '04:03', '2013-09-09', 5), ('Mad Sounds', '03:35', '2013-09-09', 5), ('Fireside', '03:01', '2013-09-09', 5), ('Whyd You Only Call Me', '03:04', '2013-09-09', 5), ('Snap Out of It', '03:12', '2013-09-09', 5);
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Brianstorm', '02:50', '2007-04-23', 6), ('Teddy Picker', '02:43', '2007-04-23', 6), ('D Is for Dangerous', '02:16', '2007-04-23', 6), ('Balaclava', '02:49', '2007-04-23', 6), ('Fluorescent Adolescent', '02:57', '2007-04-23', 6), ('Only Ones Who Know', '03:02', '2007-04-23', 6), ('Do Me a Favour', '03:27', '2007-04-23', 6), ('This House Is a Circus', '03:09', '2007-04-23', 6), ('If You Were There', '03:10', '2007-04-23', 6), ('Old Yellow Bricks', '03:11', '2007-04-23', 6);
-- Lady Gaga
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Just Dance', '04:01', '2008-08-19', 7), ('LoveGame', '03:36', '2008-08-19', 7), ('Paparazzi', '03:28', '2008-08-19', 7), ('Poker Face', '03:57', '2008-08-19', 7), ('Eh, Eh', '02:55', '2008-08-19', 7), ('Beautiful, Dirty, Rich', '02:52', '2008-08-19', 7), ('The Fame', '03:42', '2008-08-19', 7), ('Money Honey', '02:50', '2008-08-19', 7), ('Starstruck', '03:37', '2008-08-19', 7), ('Boys Boys Boys', '03:20', '2008-08-19', 7);
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Chromatica I', '01:00', '2020-05-29', 8), ('Alice', '02:57', '2020-05-29', 8), ('Stupid Love', '03:13', '2020-05-29', 8), ('Rain on Me', '03:02', '2020-05-29', 8), ('Free Woman', '03:11', '2020-05-29', 8), ('Fun Tonight', '02:53', '2020-05-29', 8), ('Chromatica II', '00:41', '2020-05-29', 8), ('911', '02:52', '2020-05-29', 8), ('Plastic Doll', '03:41', '2020-05-29', 8), ('Sour Candy', '02:37', '2020-05-29', 8);
-- Daft Punk
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('One More Time', '05:20', '2001-02-26', 9), ('Aerodynamic', '03:27', '2001-02-26', 9), ('Digital Love', '04:58', '2001-02-26', 9), ('Harder, Better, Faster, Stronger', '03:44', '2001-02-26', 9), ('Crescendolls', '03:31', '2001-02-26', 9), ('Nightvision', '01:44', '2001-02-26', 9), ('Superheroes', '03:57', '2001-02-26', 9), ('High Life', '03:22', '2001-02-26', 9), ('Something About Us', '03:51', '2001-02-26', 9), ('Voyager', '03:47', '2001-02-26', 9);
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Give Life Back to Music', '04:34', '2013-05-17', 10), ('The Game of Love', '05:21', '2013-05-17', 10), ('Giorgio by Moroder', '09:04', '2013-05-17', 10), ('Within', '03:48', '2013-05-17', 10), ('Instant Crush', '05:37', '2013-05-17', 10), ('Lose Yourself to Dance', '05:53', '2013-05-17', 10), ('Touch', '08:18', '2013-05-17', 10), ('Get Lucky', '06:08', '2013-05-17', 10), ('Beyond', '04:50', '2013-05-17', 10), ('Motherboard', '05:41', '2013-05-17', 10);
-- The Beatles
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Come Together', '04:19', '1969-09-26', 11), ('Something', '03:02', '1969-09-26', 11), ('Maxwells Silver Hammer', '03:27', '1969-09-26', 11), ('Oh! Darling', '03:26', '1969-09-26', 11), ('Octopuss Garden', '02:51', '1969-09-26', 11), ('I Want You', '07:47', '1969-09-26', 11), ('Here Comes the Sun', '03:05', '1969-09-26', 11), ('Because', '02:45', '1969-09-26', 11), ('You Never Give Me Your Money', '04:02', '1969-09-26', 11), ('Sun King', '02:26', '1969-09-26', 11);
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Two of Us', '03:36', '1970-05-08', 12), ('Dig a Pony', '03:54', '1970-05-08', 12), ('Across the Universe', '03:48', '1970-05-08', 12), ('I Me Mine', '02:25', '1970-05-08', 12), ('Dig It', '00:50', '1970-05-08', 12), ('Let It Be', '04:03', '1970-05-08', 12), ('Maggie Mae', '00:40', '1970-05-08', 12), ('Ive Got a Feeling', '03:37', '1970-05-08', 12), ('One After 909', '02:54', '1970-05-08', 12), ('The Long and Winding Road', '03:37', '1970-05-08', 12);
-- Taylor Swift
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Welcome to New York', '03:32', '2014-10-27', 13), ('Blank Space', '03:51', '2014-10-27', 13), ('Style', '03:51', '2014-10-27', 13), ('Out of the Woods', '03:55', '2014-10-27', 13), ('All You Had to Do Was Stay', '03:13', '2014-10-27', 13), ('Shake It Off', '03:39', '2014-10-27', 13), ('I Wish You Would', '03:27', '2014-10-27', 13), ('Bad Blood', '03:31', '2014-10-27', 13), ('Wildest Dreams', '03:40', '2014-10-27', 13), ('How You Get the Girl', '04:07', '2014-10-27', 13);
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Lavender Haze', '03:22', '2022-10-21', 14), ('Maroon', '03:38', '2022-10-21', 14), ('Anti-Hero', '03:20', '2022-10-21', 14), ('Snow on the Beach', '04:16', '2022-10-21', 14), ('Youre on Your Own, Kid', '03:14', '2022-10-21', 14), ('Midnight Rain', '02:54', '2022-10-21', 14), ('Question...?', '03:30', '2022-10-21', 14), ('Vigilante Shit', '02:44', '2022-10-21', 14), ('Bejeweled', '03:14', '2022-10-21', 14), ('Labyrinth', '04:07', '2022-10-21', 14);
-- Pink Floyd
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Speak to Me', '01:05', '1973-03-01', 15), ('Breathe', '02:49', '1973-03-01', 15), ('On the Run', '03:45', '1973-03-01', 15), ('Time', '06:53', '1973-03-01', 15), ('The Great Gig in the Sky', '04:43', '1973-03-01', 15), ('Money', '06:22', '1973-03-01', 15), ('Us and Them', '07:49', '1973-03-01', 15), ('Any Colour You Like', '03:26', '1973-03-01', 15), ('Brain Damage', '03:46', '1973-03-01', 15), ('Eclipse', '02:10', '1973-03-01', 15);
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('In the Flesh?', '03:16', '1979-11-30', 16), ('The Thin Ice', '02:27', '1979-11-30', 16), ('Another Brick in the Wall P1', '03:11', '1979-11-30', 16), ('The Happiest Days of Our Lives', '01:46', '1979-11-30', 16), ('Another Brick in the Wall P2', '03:59', '1979-11-30', 16), ('Mother', '05:32', '1979-11-30', 16), ('Goodbye Blue Sky', '02:45', '1979-11-30', 16), ('Empty Spaces', '02:10', '1979-11-30', 16), ('Young Lust', '03:29', '1979-11-30', 16), ('One of My Turns', '03:35', '1979-11-30', 16);
-- Imagine Dragons
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Radioactive', '03:06', '2012-09-04', 17), ('Tiptoe', '03:14', '2012-09-04', 17), ('Its Time', '04:00', '2012-09-04', 17), ('Demons', '02:57', '2012-09-04', 17), ('On Top of the World', '03:12', '2012-09-04', 17), ('Amsterdam', '04:01', '2012-09-04', 17), ('Hear Me', '03:55', '2012-09-04', 17), ('Every Night', '03:37', '2012-09-04', 17), ('Bleeding Out', '03:43', '2012-09-04', 17), ('Underdog', '03:29', '2012-09-04', 17);
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('I Dont Know Why', '03:10', '2017-06-23', 18), ('Whatever It Takes', '03:21', '2017-06-23', 18), ('Believer', '03:24', '2017-06-23', 18), ('Walking the Wire', '03:52', '2017-06-23', 18), ('Rise Up', '03:51', '2017-06-23', 18), ('Ill Make It Up to You', '04:22', '2017-06-23', 18), ('Yesterday', '03:25', '2017-06-23', 18), ('Mouth of the River', '03:41', '2017-06-23', 18), ('Thunder', '03:07', '2017-06-23', 18), ('Start Over', '03:06', '2017-06-23', 18);
-- Dua Lipa
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('Future Nostalgia', '03:04', '2020-03-27', 19), ('Dont Start Now', '03:03', '2020-03-27', 19), ('Cool', '03:29', '2020-03-27', 19), ('Physical', '03:13', '2020-03-27', 19), ('Levitating', '03:23', '2020-03-27', 19), ('Pretty Please', '03:14', '2020-03-27', 19), ('Hallucinate', '03:28', '2020-03-27', 19), ('Love Again', '04:18', '2020-03-27', 19), ('Break My Heart', '03:41', '2020-03-27', 19), ('Good in Bed', '03:38', '2020-03-27', 19);
INSERT INTO Musica (nome_musica, duracao, data_lancamento, fk_id_album) VALUES 
('End of an Era', '03:16', '2024-05-03', 20), ('Houdini', '03:05', '2024-05-03', 20), ('Training Season', '03:29', '2024-05-03', 20), ('These Walls', '03:37', '2024-05-03', 20), ('Whatcha Doing', '03:18', '2024-05-03', 20), ('French Exit', '02:26', '2024-05-03', 20), ('Illusion', '03:08', '2024-05-03', 20), ('Falling Forever', '03:43', '2024-05-03', 20), ('Anything for Love', '02:21', '2024-05-03', 20), ('Maria', '03:07', '2024-05-03', 20);

-- 6. VÍNCULOS N:N (Música <-> Artista / Compositor / Categorias)
INSERT INTO Musica_Artista (id_musica, id_artista) SELECT id_musica, CEIL(fk_id_album/2) FROM Musica;
INSERT INTO Musica_Compositor (id_musica, id_compositor, papel_criativo) SELECT id_musica, (10 + (id_musica % 10) + 1), 'Compositor Integral' FROM Musica;
INSERT INTO Musica_Categorias (id_musica, id_genero, id_sub_genero) SELECT id_musica, 1, 1 FROM Musica WHERE fk_id_album IN (1,2,5,6,11,12,15,16,17,18);
INSERT INTO Musica_Categorias (id_musica, id_genero, id_sub_genero) SELECT id_musica, 2, 2 FROM Musica WHERE fk_id_album IN (3,4,7,8,9,10,13,14,19,20);

-- 7. 4 PLAYLISTS E 40 MÚSICAS VINCULADAS
INSERT INTO Playlist (nome_playlist, descricao) VALUES ('Rock Classics', 'Melhores do Rock'), ('Pop Hits 2024', 'Mais ouvidas'), ('Focus Study', 'Concentração'), ('Party Time', 'Para agitar');
INSERT INTO Musica_Playlist (id_musica, id_playlist, data_adicao) SELECT id_musica, 1, CURDATE() FROM Musica WHERE id_musica BETWEEN 1 AND 10;
INSERT INTO Musica_Playlist (id_musica, id_playlist, data_adicao) SELECT id_musica, 2, CURDATE() FROM Musica WHERE id_musica BETWEEN 21 AND 30;
INSERT INTO Musica_Playlist (id_musica, id_playlist, data_adicao) SELECT id_musica, 3, CURDATE() FROM Musica WHERE id_musica BETWEEN 41 AND 50;
INSERT INTO Musica_Playlist (id_musica, id_playlist, data_adicao) SELECT id_musica, 4, CURDATE() FROM Musica WHERE id_musica BETWEEN 61 AND 70;