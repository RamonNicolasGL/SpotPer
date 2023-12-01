CREATE TABLE Gravadoras	(
	id_gravadora INT NOT NULL, -- gera o codigo de forma incremental
	nome VARCHAR(100) NOT NULL,
	homepage VARCHAR(100) NOT NULL,
	endereco VARCHAR(255) NOT NULL,

	CONSTRAINT gravadora_PK PRIMARY KEY (id_gravadora)
) on spotper_fg01

CREATE TABLE Telefones_Gravadoras (
	id_gravadora_fk INT NOT NULL,
	num_telefone VARCHAR(20) NOT NULL
	CONSTRAINT telefones_gravadora_PK PRIMARY KEY (num_telefone),
	CONSTRAINT telefones_gravadora_FK 
		FOREIGN KEY (id_gravadora_fk) 
		REFERENCES Gravadoras (id_gravadora) 
		ON DELETE CASCADE
) on spotper_fg01
