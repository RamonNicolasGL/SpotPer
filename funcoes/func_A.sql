

CREATE FUNCTION preco_album_acima_media() 
RETURNS TABLE
AS
RETURN (
    select id_album, descricao, preco_compra from album alb where alb.preco_compra > 
    (select AVG(a.preco_compra) from Album a)
)


CREATE FUNCTION gravadora_com_mais_playlists()
RETURNS TABLE
AS
RETURN (
	select TOP 1 g.id_gravadora, g.nome, count(distinct p.id_playlist) as "countPlayslit" from
		Gravadoras g join 

		Album a on a.id_gravadora_fk = g.id_gravadora join
		Faixas f on f.id_album_fk = id_album join
		Faixa_Compositor fc on fc.id_faixa_fk = f.id_faixa join
		Compositor c on c.id_compositor = fc.id_compositor_fk join
		Playlist_Faixas pf on pf.faixa = f.id_faixa join
		Playlist p on p.id_playlist = pf.playlist join
		(
			select p.id_playlist from 
				Album a join
				Faixas f on f.id_album_fk = id_album join
				Faixa_Compositor fc on fc.id_faixa_fk = f.id_faixa join
				Compositor c on c.id_compositor = fc.id_compositor_fk join
				Playlist_Faixas pf on pf.faixa = f.id_faixa join
				Playlist p on p.id_playlist = pf.playlist
			where c.nome like '%_vor_k%'
			group by p.id_playlist
		) 
		as "d" on d.id_playlist = p.id_playlist
	
		group by g.id_gravadora, g.nome
		order by "countPlayslit" desc
)


CREATE FUNCTION faixas_barroco_concerto()
RETURNS TABLE
AS
RETURN (
select p.id_playlist, p.nome from 
	Album a join
	Faixas f on f.id_album_fk = id_album join
	Faixa_Compositor fc on fc.id_faixa_fk = f.id_faixa join
	Compositor c on c.id_compositor = fc.id_compositor_fk join
	Periodo_musical pm on pm.id_periodo = c.id_periodo_fk join 
	Composicao cp on cp.id_composicao = f.id_composicao_fk join 
	Playlist_Faixas pf on pf.faixa = f.id_faixa join
	Playlist p on p.id_playlist = pf. playlist

	where cp.descricao = 'Concerto' and pm.descricao = 'Barroco'  and 
		NOT EXISTS (SELECT 1 
    FROM Album a 
    JOIN Faixas f ON f.id_album_fk = id_album 
    JOIN Faixa_Compositor fc ON fc.id_faixa_fk = f.id_faixa 
    JOIN Compositor c ON c.id_compositor = fc.id_compositor_fk 
    JOIN Periodo_musical pm ON pm.id_periodo = c.id_periodo_fk 
    JOIN Composicao cp ON cp.id_composicao = f.id_composicao_fk 
    JOIN Playlist_Faixas pf ON pf.faixa = f.id_faixa 
    WHERE pf.playlist = p.id_playlist AND (cp.descricao != 'Concerto' OR pm.descricao != 'Barroco'))
	group by p.id_playlist, p.nome
)

CREATE FUNCTION compositor_mais_faixas_playlist()
RETURNS TABLE
AS
RETURN (
select TOP 1 c.id_compositor, c.nome, count(pf.faixa) as "num_faixas" from 
	Album a join
	Faixas f on f.id_album_fk = id_album join
	Faixa_Compositor fc on fc.id_faixa_fk = f.id_faixa join
	Compositor c on c.id_compositor = fc.id_compositor_fk join
	Playlist_Faixas pf on pf.faixa = f.id_faixa join
	Playlist p on p.id_playlist = pf.playlist

	group by c.id_compositor, c.nome
	order by "num_faixas" desc
)
