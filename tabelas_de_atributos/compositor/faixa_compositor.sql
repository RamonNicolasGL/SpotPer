CREATE TABLE Faixa_Compositor (
    id_compositor_fk INT NOT NULL,
    id_faixa_fk INT NOT NULL,

    CONSTRAINT faixa_compositor_PK PRIMARY KEY (id_compositor_fk, id_faixa_fk),

    CONSTRAINT compositor_faixa_FK 
        FOREIGN KEY (id_compositor_fk) 
        REFERENCES Compositor (id_compositor)
        ON DELETE CASCADE,

    CONSTRAINT faixa_compositor_FK 
        FOREIGN KEY (id_faixa_fk) 
        REFERENCES Faixas (id_faixa)
        ON DELETE CASCADE
)
