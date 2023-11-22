CREATE TABLE Composicao (
	id_composicao INT IDENTITY(1, 1) NOT NULL, -- gera o codigo de forma incremental
	descricao VARCHAR(100)NOT NULL,

	CONSTRAINT composicao_PK PRIMARY KEY (id_composicao),
	CONSTRAINT composicao_descricao_UNIQUE UNIQUE (descricao)
)