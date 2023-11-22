CREATE TABLE Composicao (
	id_composicao INT NOT NULL, -- gera o codigo de forma incremental
	descricao VARCHAR(100)NOT NULL,

	CONSTRAINT composicao_PK PRIMARY KEY (id_composicao),
	CONSTRAINT composicao_descricao_UNIQUE UNIQUE (descricao)
) on spotper_fg01
