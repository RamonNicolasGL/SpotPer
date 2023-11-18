CREATE TABLE Composicao (
	id_composicao INT IDENTITY(1, 1) NOT NULL, -- gera o codigo de forma incremental
	descricao VARCHAR(100)NOT NULL,

	CONSTRAINT composicao_PK PRIMARY KEY (id_composicao),
	CONSTRAINT descricao_UNIQUE UNIQUE (descricao)
)


CREATE TABLE Periodo_musical (
	id_periodo INT IDENTITY(1, 1) NOT NULL,
	descricao VARCHAR(50) NOT NULL,
	tempo_ativ VARCHAR(50) NOT NULL,

	CONSTRAINT periodo_musical_PK PRIMARY KEY (id_periodo),
	CONSTRAINT descricao_UNIQUE UNIQUE (descricao)
)


CREATE TABLE Compositor (
	id_compositor INT IDENTITY(1, 1)NOT NULL,
	nome VARCHAR(50) NOT NULL,
	data_nasc DATE NOT NULL,
	data_morte DATE,
	local_nasc VARCHAR(50) NOT NULL,
	id_periodo_fk INT NOT NULL,

    CONSTRAINT compositor_PK PRIMARY KEY (id_compositor),
	CONSTRAINT periodo_musical_FK 
		FOREIGN KEY (id_periodo_fk) 
		REFERENCES Periodo_musical (id_periodo)
		ON DELETE NO ACTION
)

-- Relacionamento N para N
CREATE TABLE Faixa_Compositor (
    id_compositor_fk INT NOT NULL,
    id_faixa_fk INT NOT NULL,

    CONSTRAINT faixa_compositor_PK PRIMARY KEY (id_compositor_fk, id_faixa_fk),

    CONSTRAINT compositor_FK 
        FOREIGN KEY (id_compositor_fk) 
        REFERENCES Compositor (id_compositor)
        ON DELETE CASCADE,

    CONSTRAINT faixa_FK 
        FOREIGN KEY (id_faixa_fk) 
        REFERENCES Faixa (id_faixa)
        ON DELETE CASCADE
)



CREATE TABLE Interprete (
	id_interprete INT IDENTITY(1, 1) NOT NULL,
	nome varchar(50) NOT NULL,
	tipo varchar(50) NOT NULL

	CONSTRAINT interprete_PK PRIMARY KEY (id_interprete)
)


CREATE TABLE Faixa_Interprete (
    id_interprete_fk INT NOT NULL,
    id_faixa_fk INT NOT NULL,

    CONSTRAINT faixa_interprete_PK PRIMARY KEY (id_interprete_fk, id_faixa_fk),

    CONSTRAINT interprete_FK 
        FOREIGN KEY (id_interprete_fk) 
        REFERENCES Interprete (id_interprete)
        ON DELETE CASCADE,

    CONSTRAINT faixa_FK 
        FOREIGN KEY (id_faixa_fk) 
        REFERENCES Faixa (id_faixa)
        ON DELETE CASCADE
)