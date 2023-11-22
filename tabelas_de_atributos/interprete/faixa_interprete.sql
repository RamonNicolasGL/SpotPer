CREATE TABLE Faixa_Interprete (
    id_interprete_fk INT NOT NULL,
    id_faixa_fk INT NOT NULL,

    CONSTRAINT faixa_interprete_PK PRIMARY KEY (id_interprete_fk, id_faixa_fk),

    CONSTRAINT interprete_FK 
        FOREIGN KEY (id_interprete_fk) 
        REFERENCES Interprete (id_interprete)
        ON DELETE CASCADE,

    CONSTRAINT faixa_interprete_FK 
        FOREIGN KEY (id_faixa_fk) 
        REFERENCES Faixas (id_faixa)
        ON DELETE CASCADE
)