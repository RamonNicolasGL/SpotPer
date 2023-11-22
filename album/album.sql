CREATE TABLE Album (
    id_album INT NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    tipo_compra VARCHAR(50) NOT NULL,
    preco_compra DECIMAL(8, 2) NOT NULL,
    dt_compra DATE NOT NULL,
    dt_gravacao DATE NOT NULL,
    tipo_meio_fisico VARCHAR(10) NOT NULL,

    id_gravadora_fk INT NOT NULL,

    CONSTRAINT album_PK PRIMARY KEY (id_album),

    CONSTRAINT album_gravadora_FK 
        FOREIGN KEY (id_gravadora_fk) 
        REFERENCES Gravadoras (id_gravadora)
        ON DELETE NO ACTION,

    CONSTRAINT dt_gravacao_CHECK 
        CHECK (dt_gravacao >= '2000-01-01'),

    CONSTRAINT tipo_meio_fisico_CHECK 
        CHECK (tipo_meio_fisico IN ('CD', 'VINIL','DOWNLOAD'))
) on spotper_fg01
