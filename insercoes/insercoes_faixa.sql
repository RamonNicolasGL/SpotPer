-- Inserções de 10 faixas de Beethoven associadas à mídia do tipo CD (exemplo fictício)
INSERT INTO Faixas (desc_faixa, tipo_gravacao, tempo_exec_faixa, id_interprete_fk, id_cd_fk)
VALUES 
    ('Symphony No. 1 in C Major', 'Estúdio', '30:00', 1, 4),
    ('Piano Sonata No. 8 "Pathétique"', 'Ao vivo', '8:00', 1, 4),
    ('Symphony No. 3 in E-flat Major "Eroica"', 'Estúdio', '45:00', 1, 4),
    ('Violin Concerto in D Major', 'Estúdio', '25:00', 2, 5),
    ('Piano Concerto No. 5 "Emperor"', 'Ao vivo', '35:00', 2, 5),
    ('Symphony No. 6 in F Major "Pastoral"', 'Estúdio', '40:00', 10, 9),
    ('String Quartet No. 9 in C Major', 'Estúdio', '20:00', 2, 5),
    ('Piano Sonata No. 23 "Appassionata"', 'Ao vivo', '10:00', 10, 9),
    ('Symphony No. 7 in A Major', 'Estúdio', '35:00', 10, 9),
    ('Mass in D Major "Missa Solemnis"', 'Estúdio', '60:00', 10, 9);

    ('Scene: Pas de deux', 'Ao vivo', '8:20', 7, 15),
    ('Scene: Dance of the Cygnets', 'Estúdio', '3:15', 7, 15),
    ('Scene: Finale', 'Estúdio', '6:00', 7, 15);

-- Inserção de faixas de Tchaikovsky associadas à mídia do tipo Vinil (exemplo fictício)
INSERT INTO Faixas (desc_faixa, tipo_gravacao, tempo_exec_faixa, id_interprete_fk, id_vinil_fk)
VALUES 
    ('Scene: Swan Theme', 'Estúdio', '4:30', 1, 3),
    ('Scene: Dance of the Little Swans', 'Ao vivo', '2:45', 2, 3),
    ('Scene: Waltz', 'Estúdio', '5:10', 3, 3),
    ('Scene: Pas de deux', 'Ao vivo', '8:20', 7, 15),
    ('Scene: Dance of the Cygnets', 'Estúdio', '3:15', 7, 15),
    ('Scene: Finale', 'Estúdio', '6:00', 7, 15);