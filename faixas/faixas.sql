CREATE TABLE Faixas (
    id_faixa INT IDENTITY(1, 1) NOT NULL,
    desc_faixa VARCHAR(150) NOT NULL,
    tipo_gravacao VARCHAR(50) NOT,
    tempo_exec_faixa VARCHAR(10) NOT NULL,
    num_disco SMALLINT NULL,
    
    id_album_fk INT NOT NULL,
    id_composicao_fk INT NOT NULL,
    
    CONSTRAINT faixa_PK PRIMARY KEY (id_faixa),
    
    CONSTRAINT faixa_album_FK
        FOREIGN KEY (id_album_fk)
        REFERENCES Album (id_album)
        ON DELETE CASCADE,
    
    CONSTRAINT composicao_fk
        FOREIGN KEY (composicao_fk)
        REFERENCES Composicao (id_composicao)
        ON DELETE NO ACTION,
) on spotper_fg02
