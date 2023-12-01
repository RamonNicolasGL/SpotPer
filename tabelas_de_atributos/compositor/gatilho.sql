CREATE TRIGGER gatilho_validacao_periodo_barroco_faixa_compositor
on Faixa_Compositor
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @tipo_gravacao VARCHAR(3);
	DECLARE @periodo_compositor VARCHAR(20);
	DECLARE @faixa INT;	
	DECLARE @album INT;

	SELECT @faixa = i.id_faixa_fk from inserted i 

	-- Pegar o id do album correspondente a Faixa que desejamos associar ao compositor
	SELECT @album = f.id_album_fk 
	FROM 
		inserted i join Faixas f 
		on f.id_faixa = i.id_faixa_fk

	-- Pegar o tipo_gravacao da Faixa
	select @tipo_gravacao = f.tipo_gravacao
	from inserted i 
		join Faixas f on i.id_faixa_fk = f.id_faixa;

	-- Pegar o periodo do compositor que desejamos associar
	select @periodo_compositor = p.descricao
	from inserted i
		join Compositor c on i.id_compositor_fk = c.id_compositor
		join Periodo_musical p on p.id_periodo = c.id_periodo_fk;

	-- PRINT CONCAT ('Tipo de gravação: ', @tipo_gravacao);
	-- PRINT CONCAT ('Periodo do compositor', @periodo_compositor);
	 
	-- Se o tipo_gravação for diferente de DDD e o periodo do compositor que desejamos associar for igual a barroco, ocorre um erro
	IF @tipo_gravacao <> 'DDD' AND @periodo_compositor = 'Barroco'
	BEGIN
		RAISERROR ('Uma faixa com tipo de gravação diferente de DDD não pode ser associado com um compositor do período barroco.', 16,1);
		ROLLBACK TRANSACTION;
		DELETE FROM Faixas WHERE id_faixa = @faixa;  -- Deleta a faixa que não pode ser associada
	END;

	-- Se o periodo do compositor é barroco e o tipo_gravacao é DDD, mas no álbum existe alguma faixa com tipo de gravação diferente de DDD, não é permitido associar a faixa com o compositor
	IF @periodo_compositor = 'Barroco' and @tipo_gravacao = 'DDD'  and EXISTS(
		select 1 from Faixas f
		WHERE
			f.id_album_fk = @album and
			f.tipo_gravacao <> 'DDD'
	)
	BEGIN
		RAISERROR ('O álbum ao qual a faixa pertence possui faixas com tipo de gravação diferente de DDD, por tanto não é possível associá-la a um compositor do periodo barroco', 16,1);
		ROLLBACK TRANSACTION;
		DELETE FROM Faixas WHERE id_faixa = @faixa;  -- Deleta a faixa que não pode ser associada
	END;
END;
