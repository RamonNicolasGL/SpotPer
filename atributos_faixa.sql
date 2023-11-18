CREATE TABLE Composicao (
	id_composicao INT IDENTITY(1, 1) NOT NULL, -- gera o codigo de forma incremental
	descricao VARCHAR(100)NOT NULL,

	CONSTRAINT composicao_PK PRIMARY KEY (id_composicao),
	CONSTRAINT descricao_UNIQUE UNIQUE (descricao)
)


CREATE TABLE Periodo_musical (
	id_periodo smallint IDENTITY(1, 1) not null,
	descricao varchar(50) not null,
	tempo_ativ varchar(50) not null,

	CONSTRAINT periodo_musical_PK PRIMARY KEY (id_periodo),
	CONSTRAINT descricao_UNIQUE UNIQUE (descricao)
)


CREATE TABLE Compositor (
	id_compositor smallint IDENTITY(1, 1) not null,
	nome varchar(50) not null,
	data_nasc DATE not null,
	data_morte DATE,
	local_nasc varchar(50) not null,
	id_periodo smallint not null,