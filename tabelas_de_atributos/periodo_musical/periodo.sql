CREATE TABLE Periodo_musical (
	id_periodo INT NOT NULL,
	descricao VARCHAR(50) NOT NULL,
	tempo_ativ VARCHAR(50) NOT NULL,

	CONSTRAINT periodo_musical_PK PRIMARY KEY (id_periodo),
	CONSTRAINT periodo_descricao_UNIQUE UNIQUE (descricao)
) on spotper_fg01
