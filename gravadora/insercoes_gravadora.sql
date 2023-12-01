-- Inserções de exemplo para a tabela Gravadoras

-- Inserção 1
INSERT INTO Gravadoras (id_gravadora, nome, homepage, endereco)
VALUES 
    (1, 'Deutsche Grammophon', 'https://www.deutschegrammophon.com/', 'Berliner Str. 35, 10715 Berlin, Germany'),

    (2, 'Sony Classical', 'https://www.sonyclassical.com/', '550 Madison Ave, New York, NY 10022, United States'),

    (3, 'EMI Classics', 'https://www.emiclassics.com/', '43 Brook St, Mayfair, London W1K 4HJ, United Kingdom'),

    (4, 'Warner Classics', 'https://www.warnerclassics.com/', 'Warner Music France, 1 Rue Bayen, 75017 Paris, France'),

    (5, 'Naxos Records', 'https://www.naxos.com/', 'Hong Kong'),

    (6, 'BIS Records', 'https://bis.se/', 'Kungsgatan 33, 411 19 Gothenburg, Sweden'),

    (7, 'Harmonia Mundi', 'https://www.harmoniamundi.com/', 'Musikallee 15, 50678 Cologne, Germany'),

    (8, 'Chandos Records', 'https://www.chandos.net/', 'Chandos House, Chandos Road, Colchester CO1 1RJ, United Kingdom'),

    (9, 'Hyperion Records', 'https://www.hyperion-records.co.uk/', 'London, United Kingdom'),


    (10, 'Virgin Classics', 'https://www.virginclassics.com/', 'Paris, France');



INSERT INTO Telefones_Gravadoras (id_gravadora_fk, num_telefone)
VALUES 
    (1, '(83) 2707-3676'),
    (1, '(69) 2159-2373');

-- Para a gravadora Sony Classical (ID = 2)
INSERT INTO Telefones_Gravadoras (id_gravadora_fk, num_telefone)
VALUES 
    (2, '(69) 2207-5432'),
    (2, '(95) 2265-1402');

-- Para a gravadora EMI Classics (ID = 3)
INSERT INTO Telefones_Gravadoras (id_gravadora_fk, num_telefone)
VALUES 
    (3, '(67) 2784-1191'),
    (3, '(67) 3221-1034');

-- Para a gravadora Warner Classics (ID = 4)
INSERT INTO Telefones_Gravadoras (id_gravadora_fk, num_telefone)
VALUES 
    (4, '(51) 2580-6768'),
    (4, '(95) 2915-8848');

-- Para a gravadora Naxos Records (ID = 5)
INSERT INTO Telefones_Gravadoras (id_gravadora_fk, num_telefone)
VALUES 
    (5, '(11) 2129-9627'),
    (5, '(79) 2620-8543');

-- Para a gravadora BIS Records (ID = 6)
INSERT INTO Telefones_Gravadoras (id_gravadora_fk, num_telefone)
VALUES 
    (6, '(63) 3068-3646'),
    (6, '(27) 2281-1742');

-- Para a gravadora Harmonia Mundi (ID = 7)
INSERT INTO Telefones_Gravadoras (id_gravadora_fk, num_telefone)
VALUES 
    (7, '(85) 2208-6383'),
    (7, '(63) 3034-9453');

-- Para a gravadora Chandos Records (ID = 8)
INSERT INTO Telefones_Gravadoras (id_gravadora_fk, num_telefone)
VALUES 
    (8, '(61) 2811-2875'),
    (8, '(82) 2733-5360');

-- Para a gravadora Hyperion Records (ID = 9)
INSERT INTO Telefones_Gravadoras (id_gravadora_fk, num_telefone)
VALUES 
    (9, '(68) 2597-7291'),
    (9, '(62) 2223-4579');

-- Para a gravadora Virgin Classics (ID = 10)
INSERT INTO Telefones_Gravadoras (id_gravadora_fk, num_telefone)
VALUES 
    (10, '(73) 3692-4244'),
    (10, '(67) 3508-7531');