INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (1, 'Requiem - Introitus', 'ADD', '03:45', 1, 1, 1);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (2, 'Requiem - Kyrie', 'DDD', '02:20', 1, 1, 1);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (3, 'Requiem - Dies Irae', 'ADD', '06:15', 1, 1, 2);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (4, 'Requiem - Tuba Mirum', 'DDD', '04:30', 1, 1, 2);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (5, 'Requiem - Rex Tremendae', 'ADD', '02:55', 1, 1, 3);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (6, 'Requiem - Recordare', 'DDD', '03:10', 1, 1, 3);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (7, 'Requiem - Confutatis', 'ADD', '02:45', 1, 1, 4);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (8, 'Requiem - Lacrimosa', 'DDD', '03:25', 1, 1, 4);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (9, 'Requiem - Domine Jesu', 'ADD', '05:40', 2, 1, 5);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (10, 'Requiem - Hostias', 'DDD', '03:50', 2, 1, 5);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (11, 'Requiem - Sanctus', 'ADD', '03:15', 2, 1, 4);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (12, 'Requiem - Benedictus', 'DDD', '04:10', 2, 1, 3);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (13, 'Requiem - Agnus Dei', 'ADD', '03:30', 2, 1, 2);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (14, 'Requiem - Lux Aeterna', 'DDD', '05:20', 2, 1, 1);

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES (15, 'Requiem - Cum Sanctis Tuis', 'ADD', '04:40', 2, 1, 1);

INSERT INTO Faixa_Compositor (id_compositor_fk, id_faixa_fk)
VALUES
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    (2, 5),
    (2, 6),
    (2, 7),
    (2, 8),
    (2, 9),
    (2, 10),
    (2, 11),
    (2, 12),
    (2, 13),
    (2, 14),
    (2, 15);

select * from Interprete;

INSERT INTO Faixa_Interprete (id_faixa_fk, id_interprete_fk)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (7, 1),
    (8, 1),
    (9, 1),
    (10, 1),
    (11, 1),
    (12, 1),
    (13, 1),
    (14, 1),
    (15, 1);


INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES 
    (16, 'Danse Russe', NULL, '04:30', 1, 2, 7),
    (17, 'Swan Lake, Op.20 - Flute 1, 2', NULL, '05:15', 1, 2, 7),
    (18, 'Swan Lake, Op.20 - Bassoon 1, 2', NULL, '06:20', 1, 2, 7),
    (19, 'Swan Lake, Op.20 - Timpani', NULL, '02:45', 1, 2, 7),
    (20, 'Swan Lake, Op.20 - Triangle and Tanbourine, Snare Drum, Bass Drum and Cymbals', NULL, '03:55', 1, 2, 7),
    (21, 'Swan Lake, Op.20 - Act II, No.10. Scene', NULL, '04:10', 2, 2, 7),
    (22, 'Swan Lake, Op.20 - Act III, No.15', NULL, '05:30', 2, 2, 7),
    (23, 'Swan Lake, Op.20 - Act III, No.17. Scene', NULL, '03:45', 2, 2, 7),
    (24, 'Swan Lake, Op.20 - Act III, No.18. Scene', NULL, '04:20', 2, 2, 7),
    (25, 'Swan Lake, Op.20 - Act III, No.19. Scene', NULL, '03:30', 2, 2, 7),
    (26, 'Swan Lake, Op.20 - Act III, No.20. Hungarian Dance', NULL, '03:15', 2, 2, 7),
    (27, 'Swan Lake, Op.20 - Act III, No.21. Spanish Dance', NULL, '02:45', 2, 2, 7),
    (28, 'Swan Lake, Op.20 - Act III, No.22. Neapolitan Dance', NULL, '03:10', 2, 2, 7),
    (29, 'Swan Lake, Op.20 - Act III, No.23. Mazurka', NULL, '03:25', 2, 2, 7),
    (30, 'Swan Lake, Op.20 - Act III, No.24. Scene', NULL, '03:50', 2, 2, 7),
    (31, 'Swan Lake, Op.20 - Act III, No.25. Entrée and Scene', NULL, '03:15', 2, 2, 7),
    (32, 'Swan Lake, Op.20 - Act III, No.26. Scene', NULL, '03:10', 2, 2, 7),
    (33, 'Swan Lake, Op.20 - Act III, No.27. Dance of the Little Swans', NULL, '03:25', 2, 2, 7),
    (34, 'Swan Lake, Op.20 - Act III, No.28. Scene', NULL, '03:50', 2, 2, 7),
    (35, 'Swan Lake, Op.20 - Act III, No.29. Scene', NULL, '03:15', 2, 2, 7)

insert into Faixa_Compositor (id_compositor_fk, id_faixa_fk)
values
    (3, 16),
    (3, 17),
    (3, 18),
    (3, 19),
    (3, 20),
    (3, 21),
    (3, 22),
    (3, 23),
    (3, 24),
    (3, 25),
    (3, 26),
    (3, 27),
    (3, 28),
    (3, 29),
    (3, 30),
    (3, 31),
    (3, 32),
    (3, 33),
    (3, 34),
    (3, 35)

insert into Faixa_Interprete (id_faixa_fk, id_interprete_fk)
VALUES
    (16, 7),
    (17, 7),
    (18, 7),
    (19, 7),
    (20, 7),
    (21, 7),
    (22, 7),
    (23, 7),
    (24, 7),
    (25, 7),
    (26, 7),
    (27, 7),
    (28, 7),
    (29, 7),
    (30, 7),
    (31, 7),
    (32, 7),
    (33, 7),
    (34, 7),
    (35, 7)




INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES 
    (40, 'Brandenburg Concerto No. 1 in F Major, BWV 1046: I. Allegro', 'DDD', '04:12', 1, 4, 4),
    (41, 'Brandenburg Concerto No. 3 in G Major, BWV 1048: III. Allegro', 'DDD', '05:42', 1, 4, 4),
    (42, 'Orchestral Suite No. 2 in B Minor, BWV 1067: VII. Badinerie', 'DDD', '01:26', 1, 4, 4),
    (43, 'Toccata and Fugue in D Minor, BWV 565', 'DDD', '08:34', 1, 4, 4),
    (44, 'Cello Suite No. 1 in G Major, BWV 1007: I. Prelude', 'DDD', '02:22', 1, 4, 4),
    (45, 'Cello Suite No. 1 in G Major, BWV 1007: IV. Sarabande', 'DDD', '03:47', 1, 4, 4),
    (46, 'Violin Partita No. 2 in D Minor, BWV 1004: I. Allemande', 'DDD', '05:19', 1, 4, 4),
    (47, 'The Well-Tempered Clavier: Book 1, BWV 846-869: Prelude No. 1 in C Major', 'DDD', '01:58', 2, 4, 4),
    (48, 'The Well-Tempered Clavier: Book 1, BWV 846-869: Fugue No. 2 in C Minor', 'DDD', '02:13', 2, 4, 4),
    (49, 'Goldberg Variations, BWV 988: Aria', 'DDD', '03:12', 2, 4, 4),
    (50, 'Goldberg Variations, BWV 988: Variation 1', 'DDD', '02:21', 2, 4, 4),
    (51, 'Goldberg Variations, BWV 988: Variation 2', 'DDD', '01:42', 2, 4, 4),
    (52, 'Goldberg Variations, BWV 988: Variation 3', 'DDD', '02:08', 2, 4, 4),
    (53, 'Goldberg Variations, BWV 988: Variation 4', 'DDD', '01:55', 2, 4, 4),
    (54, 'Goldberg Variations, BWV 988: Variation 5', 'DDD', '01:43', 2, 4, 4),
    (55, 'Goldberg Variations, BWV 988: Variation 6', 'DDD', '01:58', 2, 4, 4),
    (56, 'Goldberg Variations, BWV 988: Variation 7', 'DDD', '02:29', 2, 4, 4)


insert into Faixa_Compositor (id_compositor_fk, id_faixa_fk)
values
    (1, 40),
    (1, 41),
    (1, 42),
    (1, 43),
    (1, 44),
    (1, 45),
    (1, 46),
    (1, 47),
    (1, 48),
    (1, 49),
    (1, 50),
    (1, 51),
    (1, 52),
    (1, 53),
    (1, 54),
    (1, 55),
    (1, 56)


insert into Faixa_Interprete (id_faixa_fk, id_interprete_fk)
VALUES
    (40, 3),
    (41, 3),
    (42, 3),
    (43, 3),
    (44, 3),
    (45, 3),
    (46, 3),
    (47, 3),
    (48, 3),
    (49, 3),
    (50, 3),
    (51, 3),
    (52, 3),
    (53, 3),
    (54, 3),
    (55, 3),
    (56, 3)


INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES 
    (60, 'Concerto No. 1 in E Major, Op. 8, RV 269 "Spring": I. Allegro', 'DDD', '03:18', 1, 7, 5),
    (61, 'Concerto No. 1 in E Major, Op. 8, RV 269 "Spring": II. Largo', 'DDD', '02:43', 1, 7, 5),
    (62, 'Concerto No. 1 in E Major, Op. 8, RV 269 "Spring": III. Allegro', 'DDD', '04:18', 1, 7, 5),
    (63, 'Concerto No. 2 in G Minor, Op. 8, RV 315 "Summer": I. Allegro non molto', 'DDD', '05:12', 1, 7, 5),
    (64, 'Concerto No. 2 in G Minor, Op. 8, RV 315 "Summer": II. Adagio', 'DDD', '02:33', 1, 7, 5),
    (65, 'Concerto No. 2 in G Minor, Op. 8, RV 315 "Summer": III. Presto', 'DDD', '02:59', 1, 7, 5),
    (66, 'Concerto No. 3 in F Major, Op. 8, RV 293 "Autumn": I. Allegro', 'DDD', '05:12', 1, 7, 5),
    (67, 'Concerto No. 3 in F Major, Op. 8, RV 293 "Autumn": II. Adagio molto', 'DDD', '02:29', 1, 7, 5),
    (68, 'Concerto No. 3 in F Major, Op. 8, RV 293 "Autumn": III. Allegro', 'DDD', '03:33', 1, 7, 5),
    (69, 'Concerto No. 4 in F Minor, Op. 8, RV 297 "Winter": I. Allegro non molto', 'DDD', '04:18', 1, 7, 5)


insert into Faixa_Compositor (id_compositor_fk, id_faixa_fk)
values
    (5, 60),
    (5, 61),
    (5, 62),
    (5, 63),
    (5, 64),
    (5, 65),
    (5, 66),
    (5, 67),
    (5, 68),
    (5, 69)

insert into Faixa_Interprete (id_faixa_fk, id_interprete_fk)
VALUES
    (60, 3),
    (61, 3),
    (62, 3),
    (63, 3),
    (64, 3),
    (65, 3),
    (66, 3),
    (67, 3),
    (68, 3),
    (69, 3)


INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES 
    (70, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - I. Allegro ma non troppo, un poco maestoso', NULL, '15:34', NULL, 3, 4),
    (71, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - II. Molto vivace', NULL, '11:05', NULL, 3, 4),
    (72, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - III. Adagio molto e cantabile', NULL, '14:22', NULL, 3, 4),
    (73, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - IV. Presto', NULL, '23:59', NULL, 3, 4),
    (74, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - V. Recitative - Allegro assai vivace', NULL, '12:45', NULL, 3, 4),
    (75, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - VI. Final', NULL, '18:32', NULL, 3, 4),
    (76, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - VII. Freude, schöner Götterfunken', NULL, '24:36', NULL, 3, 4),
    (77, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - VIII. Alla marcia - Allegro assai vivace', NULL, '14:27', NULL, 3, 4),
    (78, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - IX. Andante maestoso', NULL, '17:04', NULL, 3, 4),
    (79, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - X. Allegro energico, sempre ben marcato', NULL, '13:39', NULL, 3, 4),
    (80, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XI. Adagio ma non troppo', NULL, '18:53', NULL, 3, 4),
    (81, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XII. Allegro energico, sempre ben marcato', NULL, '14:25', NULL, 3, 4),
    (82, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XIII. Vivace', NULL, '13:17', NULL, 3, 4),
    (83, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XIV. Andante ma non troppo', NULL, '17:45', NULL, 3, 4),
    (84, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XV. Presto', NULL, '15:28', NULL, 3, 4),
    (85, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XVI. Adagio', NULL, '19:03', NULL, 3, 4),
    (86, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XVII. Allegro assai', NULL, '13:39', NULL, 3, 4),
    (87, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XVIII. Allegro assai vivace', NULL, '17:04', NULL, 3, 4),
    (88, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XIX. Recitative', NULL, '14:36', NULL, 3, 4),
    (89, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XX. Chorus', NULL, '18:32', NULL, 3, 4),
    (90, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XXI. Recitative', NULL, '19:23', NULL, 3, 4),
    (91, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XXII. Chorus', NULL, '16:27', NULL, 3, 4),
    (92, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XXIII. Recitative', NULL, '20:11', NULL, 3, 4),
    (93, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XXIV. Chorus', NULL, '17:45', NULL, 3, 4),
    (94, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - XXV. Finale', NULL, '24:15', NULL, 3, 4),
    (95, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - Allegro energico e sempre ben marcato', NULL, '16:43', NULL, 3, 4),
    (96, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - Scherzo. Molto vivace', NULL, '12:55', NULL, 3, 4),
    (97, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - Adagio molto e cantabile', NULL, '15:50', NULL, 3, 4),
    (98, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - Presto - Allegro ma non troppo - Vivace - Adagio cantabile - Allegro assai', NULL, '25:05', NULL, 3, 4),
    (99, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - Adagio - Allegro molto vivace', NULL, '13:54', NULL, 3, 4),
    (100, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - Allegro moderato', NULL, '11:48', NULL, 3, 4),
    (101, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - Scherzo. Molto vivace - Presto', NULL, '17:23', NULL, 3, 4),
    (102, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - Adagio molto e cantabile - Andante moderato', NULL, '16:58', NULL, 3, 4),
    (103, 'Symphony No. 9 in D Minor, Op. 125 "Choral" - Finale. Presto - Allegro assai - Moderato maestoso', NULL, '19:42', NULL, 3, 4)



insert into Faixa_Compositor (id_compositor_fk, id_faixa_fk)
values
    (3, 70),
    (3, 71),
    (3, 72),
    (3, 73),
    (3, 74),
    (3, 75),
    (3, 76),
    (3, 77),
    (3, 78),
    (3, 79),
    (3, 80),
    (3, 81),
    (3, 82),
    (3, 83),
    (3, 84),
    (3, 85),
    (3, 86),
    (3, 87),
    (3, 88),
    (3, 89),
    (3, 90),
    (3, 91),
    (3, 92),
    (3, 93),
    (3, 94),
    (3, 95),
    (3, 96),
    (3, 97),
    (3, 98),
    (3, 99),
    (3, 100),
    (3, 101),
    (3, 102),
    (3, 103)

insert into Faixa_Interprete (id_faixa_fk, id_interprete_fk)
VALUES
    (70, 1),
    (71, 1),
    (72, 1),
    (73, 1),
    (74, 1),
    (75, 1),
    (76, 1),
    (77, 1),
    (78, 1),
    (79, 1),
    (80, 1),
    (81, 1),
    (82, 1),
    (83, 1),
    (84, 1),
    (85, 1),
    (86, 1),
    (87, 1),
    (88, 1),
    (89, 1),
    (90, 1),
    (91, 1),
    (92, 1),
    (93, 1),
    (94, 1),
    (95, 1),
    (96, 1),
    (97, 1),
    (98, 1),
    (99, 1),
    (100, 1),
    (101, 1),
    (102, 1),
    (103, 1)
    

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES
    (105, 'Allegro con fuoco', null, '12:30', 1, 13, 4),
    (106, 'Largo', null, '9:20', 1, 13, 4),
    (107, 'Scherzo: Molto vivace', null, '6:30', 1, 13, 4),
    (108, 'Adagio', null, '10:00', 1, 13, 4),
    (109, 'Andante sostenuto', null, '11:15', 1, 13, 4),
    (110, 'Allegro con fuoco (Reprise)', null, '8:45', 2, 13, 4),
    (111, 'Largo (Reprise)', null, '7:20', 2, 13, 4),
    (112, 'Scherzo: Molto vivace (Reprise)', null, '5:50', 2, 13, 4),
    (113, 'Adagio (Reprise)', null, '8:30', 2, 13, 4),
    (114, 'Andante sostenuto (Reprise)', null, '10:10', 2, 13, 4);


update Faixas set id_album_fk = 15 where id_faixa in (105, 106, 107, 108, 109, 110, 111, 112, 113, 114)
update album set id_gravadora_fk = 2 where id_album = 15

insert into Faixa_Compositor (id_compositor_fk, id_faixa_fk)
values
    (8, 105),
    (8, 106),
    (8, 107),
    (8, 108),
    (8, 109),
    (8, 110),
    (8, 111),
    (8, 112),
    (8, 113),
    (8, 114)

insert into Faixa_Interprete (id_faixa_fk, id_interprete_fk)
VALUES
    (105, 1),
    (106, 1),
    (107, 1),
    (108, 1),
    (109, 1),
    (110, 1),
    (111, 1),
    (112, 1),
    (113, 1),
    (114, 1)

INSERT INTO Faixas (id_faixa, desc_faixa, tipo_gravacao, tempo_exec_faixa, num_disco, id_album_fk, id_composicao_fk)
VALUES
    (115, 'Stabat Mater dolorosa', NULL, '6:45', NULL, 14, 4),
    (116, 'Quis est homo, qui non fleret', NULL, '5:30', NULL, 14, 4),
    (117, 'Eja, Mater, fons amoris', NULL, '7:15', NULL, 14, 4),
    (118, 'Fac, ut ardeat cor meum', NULL, '4:50', NULL, 14, 4),
    (119, 'Tui Nati vulnerat', NULL, '6:20', NULL, 14, 4),
    (120, 'Fac me vere tecum flere', NULL, '5:10', NULL, 14, 4),
    (121, 'Virgo virginum præclara', NULL, '4:30', NULL, 14, 4),
    (122, 'Fac, ut portem Christi mortem', NULL, '6:00', NULL, 14, 4),
    (123, 'Inflamatus et accensus', NULL, '5:45', NULL, 14, 4),
    (124, 'Quando corpus morietur', NULL, '7:20', NULL, 14, 4);



INSERT INTO Faixa_Compositor (id_compositor_fk, id_faixa_fk)
VALUES
    (8, 115),
    (8, 116),
    (8, 117),
    (8, 118),
    (8, 119),
    (8, 120),
    (8, 121),
    (8, 122),
    (8, 123),
    (8, 124);

INSERT INTO Faixa_Interprete (id_interprete_fk, id_faixa_fk)
VALUES
    (1, 115),
    (1, 116),
    (1, 117),
    (1, 118),
    (1, 119),
    (1, 120),
    (1, 121),
    (1, 122),
    (1, 123),
    (1, 124);



-- select * from Faixa_Compositor
-- select * from Compositor c join Periodo_musical p on c.id_periodo_fk = p.id_periodo

-- select * from Interprete

-- select * from Composicao

-- select * from Faixas

-- select * from Album