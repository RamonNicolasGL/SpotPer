INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (1, 'Brandenburg Concerto No. 1', 'DDD', '12:30', 1, 4, 4)

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (2, 'Toccata and Fugue in D minor', 'DDD', '08:45', 1, 4, 3)


INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (3, 'Cello Suite No. 1 in G major', 'DDD', '17:20', 1, 4, 6)

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (4, 'Air on the G String', 'DDD', '05:40', 1, 4, 1)

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (5, 'Goldberg Variations', 'DDD', '22:15', 1, 4, 4)

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (6, 'Requiem in D minor, K. 626: I. Introitus','DDD', '05:00', 2, 4, 4);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (7, 'Requiem in D minor, K. 626: II. Kyrie','DDD', '02:30', 2, 4, 4);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (8, 'Requiem in D minor, K. 626: III. Sequentia','DDD', '08:00', 2, 4, 4);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (9, 'Requiem in D minor, K. 626: IV. Offertorium','DDD', '03:30', 2, 4, 4);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (10, 'Requiem in D minor, K. 626: V. Sanctus','DDD', '01:30', 2, 4, 4);

INSERT INTO Faixa_Compositor (id_faixa_fk, id_compositor_fk)
VALUES 
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(10,1);