CREATE TABLE Gravadoras	(
	cod_gravadora INT IDENTITY(1, 1) not NOT NULL, -- gera o codigo de forma incremental
	nome VARCHAR(100) NOT NULL,
	homepage VARCHAR(100) NOT NULL,
	endereço VARCHAR(255) NOT NULL,

	CONSTRAINT cod_gravadora_PK PRIMARY KEY (cod_gravadora)
)

CREATE TABLE Telefones_gravadoras (
	cod_gravadora INT NOT NULL,
	num_telefone VARCHAR(15) NOT NULL
	CONSTRAINT telefones_gravadora_PK PRIMARY KEY (num_telefone),
	CONSTRAINT cod_gravadora_FK 
		FOREIGN KEY (cod_gravadora) 
		REFERENCES Gravadoras (cod_gravadora) 
		ON DELETE CASCADE
)

