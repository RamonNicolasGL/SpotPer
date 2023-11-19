-- Inserções na tabela Interprete
INSERT INTO Interprete (nome, tipo) VALUES ('London Symphony Orchestra', 'Orquestra');
INSERT INTO Interprete (nome, tipo) VALUES ('Amadeus Quartet', 'Quarteto');
INSERT INTO Interprete (nome, tipo) VALUES ('Maria Callas', 'Soprano');
INSERT INTO Interprete (nome, tipo) VALUES ('Andrea Bocelli', 'Tenor');
INSERT INTO Interprete (nome, tipo) VALUES ('Emerson String Quartet', 'Quarteto');
INSERT INTO Interprete (nome, tipo) VALUES ('Boston Symphony Orchestra', 'Orquestra');
INSERT INTO Interprete (nome, tipo) VALUES ('Berlin Philharmonic', 'Orquestra');
INSERT INTO Interprete (nome, tipo) VALUES ('Yo-Yo Ma', 'Violoncelista');
INSERT INTO Interprete (nome, tipo) VALUES ('Diana Damrau', 'Soprano');
INSERT INTO Interprete (nome, tipo) VALUES ('Vladimir Horowitz', 'Pianista');

-- Inserções na tabela Composicao

INSERT INTO Composicao (descricao) VALUES ('Sinfonia');
INSERT INTO Composicao (descricao) VALUES ('Ópera');
INSERT INTO Composicao (descricao) VALUES ('Sonata');
INSERT INTO Composicao (descricao) VALUES ('Concerto');
INSERT INTO Composicao (descricao) VALUES ('Quarteto de Cordas');
INSERT INTO Composicao (descricao) VALUES ('Música de Câmara');
INSERT INTO Composicao (descricao) VALUES ('Balé');
INSERT INTO Composicao (descricao) VALUES ('Música Coral');
INSERT INTO Composicao (descricao) VALUES ('Poema Sinfônico');
INSERT INTO Composicao (descricao) VALUES ('Rapsódia');

-- Inserções na tabela Periodo_musical

INSERT INTO Periodo_musical (descricao, tempo_ativ)
VALUES ('Idade Média', '476 - 1450');

INSERT INTO Periodo_musical (descricao, tempo_ativ)
VALUES ('Renascença', '1400 - 1600');

INSERT INTO Periodo_musical (descricao, tempo_ativ)
VALUES ('Barroco', '1600 - 1750');

INSERT INTO Periodo_musical (descricao, tempo_ativ)
VALUES ('Clássico', '1750 - 1820');

INSERT INTO Periodo_musical (descricao, tempo_ativ)
VALUES ('Romântico', '1815 - 1910');

INSERT INTO Periodo_musical (descricao, tempo_ativ)
VALUES ('Moderno', '1900 - Presente');



-- Inserções na tabela Compositor considerando a situação de vida dos compositores
-- Compositores falecidos
INSERT INTO Compositor (nome, data_nasc, data_morte, local_nasc, id_periodo_fk)
VALUES ('Johann Sebastian Bach', '1685-03-31', '1750-07-28', 'Eisenach, Alemanha', 3);

INSERT INTO Compositor (nome, data_nasc, data_morte, local_nasc, id_periodo_fk)
VALUES ('Wolfgang Amadeus Mozart', '1756-01-27', '1791-12-05', 'Salzburg, Áustria', 4);

INSERT INTO Compositor (nome, data_nasc, data_morte, local_nasc, id_periodo_fk)
VALUES ('Ludwig van Beethoven', '1770-12-17', '1827-03-26', 'Bonn, Alemanha', 5);

INSERT INTO Compositor (nome, data_nasc, data_morte, local_nasc, id_periodo_fk)
VALUES ('Pyotr Ilyich Tchaikovsky', '1840-05-07', '1893-11-06', 'Votkinsk, Rússia', 5);

INSERT INTO Compositor (nome, data_nasc, data_morte, local_nasc, id_periodo_fk)
VALUES ('Claude Debussy', '1862-08-22', '1918-03-25', 'Saint-Germain-en-Laye, França', 6);

-- Compositores vivos (sem data de morte)
INSERT INTO Compositor (nome, data_nasc, local_nasc, id_periodo_fk)
VALUES ('John Williams', '1932-02-08', 'Floral Park, Nova Iorque, EUA', 6);

INSERT INTO Compositor (nome, data_nasc, local_nasc, id_periodo_fk)
VALUES ('Hans Zimmer', '1957-09-12', 'Frankfurt, Alemanha', 6);

INSERT INTO Compositor (nome, data_nasc, local_nasc, id_periodo_fk)
VALUES ('Ennio Morricone', '1928-11-10', 'Roma, Itália', 6);

INSERT INTO Compositor (nome, data_nasc, local_nasc, id_periodo_fk)
VALUES ('Philip Glass', '1937-01-31', 'Baltimore, Maryland, EUA', 6);
