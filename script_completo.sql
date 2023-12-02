CREATE DATABASE BDSpotPer
ON

PRIMARY
    (
        NAME = 'spotper',
        FILENAME = 'C:\BDSpotPer\spotper.mdf',
        SIZE = 5120KB,
        FILEGROWTH = 1024KB
    ),
    
FILEGROUP spotper_fg01
    (
        NAME = 'spotper_001',
        FILENAME = 'C:\BDSpotPer\spotper_001.ndf',
        SIZE = 1024KB,
        FILEGROWTH = 30%
    ),
    (
        NAME ='spotper_002',
        FILENAME = 'C:\BDSpotPer\spotper_002.ndf',
        SIZE = 1024KB,
        MAXSIZE = 3072KB,
        FILEGROWTH = 15%
    ),

FILEGROUP spotper_fg02
    (
    NAME = 'spotper_003',
    FILENAME = 'C:\BDSpotPer\spotper_003.ndf',
    SIZE = 2048KB,
    MAXSIZE = 5120KB,
    FILEGROWTH = 1024KB
    )

LOG ON
    (
    NAME = 'spotper_log',
    FILENAME = 'C:\BDSpotPer\spotper_log.ldf',
    SIZE = 1024KB,
    FILEGROWTH = 10%
    )



-- =============== TABELAS ====================
USE BDSpotPer
CREATE TABLE Gravadoras	(
	id_gravadora INT NOT NULL, -- gera o codigo de forma incremental
	nome VARCHAR(100) NOT NULL,
	homepage VARCHAR(100) NOT NULL,
	endereco VARCHAR(255) NOT NULL,

	CONSTRAINT gravadora_PK PRIMARY KEY (id_gravadora)
) on spotper_fg01

CREATE TABLE Telefones_Gravadoras (
	id_gravadora_fk INT NOT NULL,
	num_telefone VARCHAR(15) NOT NULL
	CONSTRAINT telefones_gravadora_PK PRIMARY KEY (num_telefone),
	CONSTRAINT telefones_gravadora_FK 
		FOREIGN KEY (id_gravadora_fk) 
		REFERENCES Gravadoras (id_gravadora) 
		ON DELETE CASCADE
) on spotper_fg01


CREATE TABLE Album (
    id_album INT NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    tipo_compra VARCHAR(50) NOT NULL,
    preco_compra DECIMAL(8, 2) NOT NULL,
    dt_compra DATE NOT NULL,
    dt_gravacao DATE NOT NULL,
    tipo_meio_fisico VARCHAR(10) NOT NULL,

    id_gravadora_fk INT NOT NULL,

    CONSTRAINT album_PK PRIMARY KEY (id_album),

    CONSTRAINT album_gravadora_FK 
        FOREIGN KEY (id_gravadora_fk) 
        REFERENCES Gravadoras (id_gravadora)
        ON DELETE NO ACTION,

    CONSTRAINT dt_gravacao_CHECK 
        CHECK (dt_gravacao >= '2000-01-01'),

    CONSTRAINT tipo_meio_fisico_CHECK 
        CHECK (tipo_meio_fisico IN ('CD', 'VINIL','DOWNLOAD'))
) on spotper_fg01


CREATE TABLE Composicao (
	id_composicao INT NOT NULL,
	descricao VARCHAR(100)NOT NULL,

	CONSTRAINT composicao_PK PRIMARY KEY (id_composicao),
) on spotper_fg01


CREATE TABLE Interprete (
	id_interprete INT NOT NULL,
	nome varchar(50) NOT NULL,
	tipo varchar(50) NOT NULL

	CONSTRAINT interprete_PK PRIMARY KEY (id_interprete)
) on spotper_fg01

CREATE TABLE Periodo_musical (
	id_periodo INT NOT NULL,
	descricao VARCHAR(50) NOT NULL,
	tempo_ativ VARCHAR(50) NOT NULL,

	CONSTRAINT periodo_musical_PK PRIMARY KEY (id_periodo),
	CONSTRAINT periodo_descricao_UNIQUE UNIQUE (descricao)
) on spotper_fg01

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



CREATE TABLE Faixas (
    id_faixa INT NOT NULL,
    desc_faixa VARCHAR(150) NOT NULL,
    tipo_gravacao VARCHAR(10),
    tempo_exec_faixa VARCHAR(10) NOT NULL,
    num_disco SMALLINT NULL,
    
    id_album_fk INT NOT NULL,
    id_composicao_fk INT NOT NULL,
    
    CONSTRAINT faixa_PK PRIMARY KEY NONCLUSTERED (id_faixa),
    
    CONSTRAINT faixa_album_FK
        FOREIGN KEY (id_album_fk)
        REFERENCES Album (id_album)
        ON DELETE CASCADE,
    
    CONSTRAINT composicao_fk
        FOREIGN KEY (id_composicao_fk)
        REFERENCES Composicao (id_composicao)
        ON DELETE NO ACTION,
) on spotper_fg02
    create nonclustered index Idx_TipoComposicao on 
    Faixas(id_composicao_fk)
    with(pad_index=on, fillfactor=100) 

    --Primario
    create clustered index Idx_CodAlbum on 
    Faixas(id_album_fk)
    with(pad_index=on, fillfactor=100) 


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
) ON spotper_fg01

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
) ON spotper_fg01

CREATE TABLE Playlist(
    id_playlist INT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	dt_criacao DATE DEFAULT getdate(),
	tempo_exec_playlist varchar(10)  NOT NULL default '00:00:00',

    CONSTRAINT playlist_PK PRIMARY KEY (id_playlist),
    CONSTRAINT dt_criacao_playlist_CHECK CHECK (dt_criacao > '2000-01-01')
) ON spotper_fg02


create table Playlist_Faixas(
	id_faixa_fk int not null,
	id_playlist_fk int not null,
    dt_ultimo_play date default getdate(),
	qntd_plays int default 1,

	CONSTRAINT playlist_faixas_PK PRIMARY KEY (id_faixa_fk, id_playlist_fk),

	CONSTRAINT playlist_faixa_FK_playlist FOREIGN KEY (id_playlist_fk) REFERENCES Playlist(id_playlist)
	ON DELETE CASCADE,
	CONSTRAINT playlist_faixa_FK_faixa FOREIGN KEY (id_faixa_fk) REFERENCES Faixas(id_faixa)
	ON DELETE CASCADE,

	CONSTRAINT dt_ultimo_play_CHECK CHECK (dt_ultimo_play > '2001-01-01'),
 
) ON spotper_fg02
