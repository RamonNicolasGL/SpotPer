CREATE TABLE Vinil (
	id_vinil INT NOT NULL,
	id_album_fk INT NOT NULL,
    id_midia_fk INT NOT NULL,

	CONSTRAINT vinil_PK PRIMARY KEY (id_vinil),
    CONSTRAINT midia_vinil_CHECK CHECK (id_midia_fk = 3),
    CONSTRAINT vinil_album_FK 
        FOREIGN KEY (id_midia_fk, id_album_fk) 
        REFERENCES Midia (id_tipo_midia_fk, id_album_fk)
        ON DELETE CASCADE
)


CREATE TABLE CD (
    id_cd INT NOT NULL,
    id_album_fk INT NOT NULL,
    id_midia_fk INT NOT NULL,

    CONSTRAINT cd_PK PRIMARY KEY (id_cd),
    CONSTRAINT midia_cd_CHECK CHECK (id_midia_fk = 2),

    CONSTRAINT cd_album_FK
        FOREIGN KEY (id_midia_fk,id_album_fk) 
        REFERENCES Midia (id_tipo_midia_fk, id_album_fk)
        ON DELETE CASCADE
)

CREATE TABLE Download (
    id_download INT NOT NULL,
    id_album_fk INT NOT NULL,
    id_midia_fk INT NOT NULL,

    CONSTRAINT download_PK PRIMARY KEY (id_download),
    CONSTRAINT id_album_fk_UNIQUE UNIQUE (id_album_fk),
    CONSTRAINT midia_download_CHECK CHECK (id_midia_fk = 1),
    CONSTRAINT download_album_FK 
        FOREIGN KEY (id_midia_fk,id_album_fk) 
        REFERENCES Midia (id_tipo_midia_fk, id_album_fk)
        ON DELETE CASCADE
)

CREATE TABLE Midia (
    id_tipo_midia_fk INT NOT NULL,
    id_album_fk INT NOT NULL,

    CONSTRAINT midia_PK PRIMARY KEY (id_midia, id_album_fk),
    CONSTRAINT id_midia_album_fk_UNIQUE UNIQUE (id_album_fk),
    CONSTRAINT midia_tipo_midia_FK 
        FOREIGN KEY (id_tipo_midia_fk) 
        REFERENCES Tipo_Midia_Enum (id_tipo_midia)
        ON DELETE CASCADE,
    CONSTRAINT midia_album_FK 
        FOREIGN KEY (id_album_fk) 
        REFERENCES Album (id_album)
        ON DELETE CASCADE
)

INSERT INTO Midia (id_tipo_midia_fk, id_album_fk)


CREATE TABLE Tipo_Midia_Enum (
    id_tipo_midia INT NOT NULL,
    descricao VARCHAR(50) NOT NULL,

    CONSTRAINT tipo_midia_PK PRIMARY KEY (id_tipo_midia),
    CONSTRAINT descricao_tipo_midia_UNIQUE UNIQUE (descricao)
)

INSERT INTO Tipo_Midia_Enum (id_tipo_midia, descricao)
VALUES (1, 'Download'),
       (2, 'CD'),
       (3, 'Vinil')

