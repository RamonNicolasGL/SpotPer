CREATE TABLE Compositor (
	id_compositor INT NOT NULL,
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
) on spotper_fg01
