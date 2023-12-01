CREATE FUNCTION ListaAlbunsPorCompositor (@compositor VARCHAR(100))
RETURNS TABLE
AS
RETURN
(
	SELECT a.descricao as 'Álbum' FROM 
		Compositor c 
		join Faixa_Compositor fc on c.id_compositor = fc.id_compositor_fk
		join Faixas f on f.id_faixa = fc.id_faixa_fk
		join Album a on a.id_album = f.id_album_fk
	
	WHERE c.nome LIKE '%'+@compositor+'%'
	group by a.id_album, a.descricao
)