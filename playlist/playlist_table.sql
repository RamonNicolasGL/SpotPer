CREATE TABLE Playlist(
    id_playlist INT IDENTITY(1, 1) NOT NULL,
	nome VARCHAR(100) NOT NULL,
	dt_criacao DATE DEFAULT getdate(),
	tempo_exec_playlist varchar(10)  NOT NULL default '00:00:00',

    CONSTRAINT playlist_PK PRIMARY KEY (id_playlist),
    CONSTRAINT dt_criacao_playlist_CHECK CHECK (dt_criacao > '2000-01-01')
) ON spotper_fg02


create table Playlist_Faixas(
	id_faixa_fk int not null,
	id_playlist_fk int not null,
    dt_ultimo_play date not null,
	qntd_plays int not null,

	CONSTRAINT playlist_faixas_PK PRIMARY KEY (faixa, playlist),

	CONSTRAINT playlist_faixa_FK_playlist FOREIGN KEY (id_playlist_fk) REFERENCES Playlist(id_playlist)
	ON DELETE CASCADE,
	CONSTRAINT playlist_faixa_FK_faixa FOREIGN KEY (id_faixa_fk) REFERENCES Faixas(id_faixa)
	ON DELETE CASCADE,

	CONSTRAINT dt_ultimo_play_CHECK CHECK (dt_ultimo_play > '2001-01-01'),
 
) ON spotper_fg02
