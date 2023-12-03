create view Playlist_Qtd_Album (nome_playlist, qtd_albuns)
with schemabinding
as
select p.nome as 'Nome da Playlist', count(DISTINCT a.id_album) as 'Quantidade de Albuns'
FROM dbo.Playlist p
left JOIN dbo.Playlist_Faixas pf ON p.id_playlist = pf.playlist
left JOIN dbo.Faixas f ON pf.faixa = f.id_faixa
left JOIN dbo.Album a ON f.id_album_fk = a.id_album
GROUP BY p.id_playlist, p.nome;

--left join p pegar as playlists sem albuns
