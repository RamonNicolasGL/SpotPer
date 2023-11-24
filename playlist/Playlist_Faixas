create table Playlist_Faixas(
	dt_ultimo_play date not null,
	qntd_plays int not null,
	
	faixa int not null,
	playlist int not null,

	CONSTRAINT playlist_faixas_PK PRIMARY KEY (faixa, playlist),

	CONSTRAINT playlist_faixa_FK_playlist FOREIGN KEY (playlist) REFERENCES Playlist(id_playlist)
	ON DELETE CASCADE,
	CONSTRAINT playlist_faixa_FK_faixa FOREIGN KEY (faixa) REFERENCES Faixas(id_faixa)
	ON DELETE CASCADE,

	CONSTRAINT dt_ultimo_play_CHECK CHECK (dt_ultimo_play > '2001-01-01'),
 
) ON spotper_fg02
