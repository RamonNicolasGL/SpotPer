create view VPlaylist_Qtd_Album (nome_playlist, qtd_albuns)
as
select p.nome as 'Nome da Playlist', count(DISTINCT a.id_album) as 'Quantidade de Albuns'
FROM Playlist p
LEFT JOIN Playlist_Faixas pf ON p.id_playlist = pf.playlist
LEFT JOIN Faixas f ON pf.faixa = f.id_faixa
LEFT JOIN Album a ON f.id_album_fk = a.id_album
GROUP BY p.id_playlist, p.nome;

--left join p pegar as playlists sem albuns
