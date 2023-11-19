CREATE TABLE Faixas (
    id_faixa INT IDENTITY(1, 1) NOT NULL,
    desc_faixa VARCHAR(150) NOT NULL,
    tipo_gravacao VARCHAR(50) NOT NULL,
    tempo_exec_faixa VARCHAR(10) NOT NULL,
    
    id_interprete_fk INT NOT NULL,
    
    id_cd_fk INT,
    id_vinil_fk INT,
    id_download_fk INT,
    
    CONSTRAINT faixa_interprete_album_UNIQUE UNIQUE (id_interprete_fk, id_cd_fk, id_vinil_fk, id_download_fk),
    CONSTRAINT faixa_PK PRIMARY KEY (id_faixa),
    CONSTRAINT faixa_interprete_FK
        FOREIGN KEY (id_interprete_fk)
        REFERENCES Interprete (id_interprete)
        ON DELETE NO ACTION,

    CONSTRAINT faixa_cd_FK
        FOREIGN KEY (id_cd_fk)
        REFERENCES CD (id_cd)
        ON DELETE CASCADE,
    CONSTRAINT faixa_vinil_FK
        FOREIGN KEY (id_vinil_fk)
        REFERENCES Vinil (id_vinil)
        ON DELETE CASCADE,
    CONSTRAINT faixa_download_FK
        FOREIGN KEY (id_download_fk)
        REFERENCES Download (id_download)
        ON DELETE CASCADE
)


CREATE TRIGGER selecionar_apenas_um_tipo_midia
ON Faixas
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE( 
            (id_cd_fk IS NOT NULL AND id_vinil_fk IS NOT NULL) OR
            (id_cd_fk IS NOT NULL AND id_download_fk IS NOT NULL) OR
            (id_vinil_fk IS NOT NULL AND id_download_fk IS NOT NULL)
			)
    )
    BEGIN
		
        RAISERROR('Somente um tipo de mídia deve ser especificado por faixa.', 16, 1) 
		ROLLBACK TRANSACTION 
    END
END