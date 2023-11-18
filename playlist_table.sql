CREATE TABLE Playlist(
    id_playlist INT IDENTITY(1, 1) NOT NULL,
	nome VARCHAR(100) NOT NULL,
	dt_criacao DATE DEFAULT getdate(),
	tempo_exec_playlist varchar(10)  NOT NULL default '00:00:00',

    CONSTRAINT playlist_PK PRIMARY KEY (id_playlist),
    CONSTRAINT dt_criacao_playlist_CHECK CHECK (dt_criacao > '2000-01-01')
)


