CREATE TRIGGER gatilho_validacao_numero_disco
on Faixas 
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @tipo_meio_fisico VARCHAR(10);
    
    -- Pegar o tipo de meio fisico do album que a faixa pertence
    SELECT @tipo_meio_fisico = a.tipo_meio_fisico
    FROM Album a
    JOIN inserted i ON a.id_album = i.id_album_fk;

    -- Se o tipo de meio fisico for CD ou VINIL, o numero do disco não pode ser nulo
	IF @tipo_meio_fisico IN ('VINIL', 'CD') AND EXISTS (
		SELECT 1
		FROM inserted where num_disco IS NULL
	)
	  BEGIN
        RAISERROR ('O número do disco não pode ser nulo em um Álbum do armazendo em CD ou VINIL.', 16, 1);
        ROLLBACK TRANSACTION;
    END;

    -- Se o tipo de meio fisico for DOWNLOAD, o numero do disco deve ser nulo
	IF @tipo_meio_fisico = 'DOWNLOAD' AND EXISTS (
		SELECT 1
		FROM inserted where num_disco IS NOT NULL
	)
	  BEGIN
        RAISERROR ('O número do disco deve ser nulo em um Álbum do armazendo como DOWNLOAD.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;



CREATE TRIGGER gatilho_validacao_tipo_gravacao
ON Faixas
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @tipo_meio_fisico VARCHAR(10);
    
    -- Pegar o tipo de meio fisico do album que a faixa pertence
    SELECT @tipo_meio_fisico = a.tipo_meio_fisico
    FROM Album a
    JOIN inserted i ON a.id_album = i.id_album_fk;

    -- Se o tipo de meio fisico for CD, o tipo de gravação deve ser ADD ou DDD
    IF @tipo_meio_fisico = 'CD' AND EXISTS (
        SELECT 1
        FROM inserted
        WHERE tipo_gravacao NOT IN ('ADD', 'DDD') OR tipo_gravacao IS NULL
    )
    BEGIN
        RAISERROR ('O tipo de gravação para um album armazenado em um CD deve ser "ADD" ou "DDD".', 16, 1);
        ROLLBACK TRANSACTION;
    END;

    -- Se o tipo de meio fisico for VINIL ou DOWNLOAD, o tipo de gravação deve ser NULL
    IF @tipo_meio_fisico IN ('DOWNLOAD', 'VINIL') AND EXISTS (
        SELECT 1
        FROM inserted
        WHERE tipo_gravacao IS NOT NULL
    )
    BEGIN
        RAISERROR ('O tipo de gravação para um album armazenado em Download ou Vinil deve ser NULL.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;


CREATE TRIGGER gatilho_validacao_periodo_barroco_faixas
on Faixas
AFTER INSERT, UPDATE
AS
BEGIN 
    DECLARE @barroco_in_album INT;
	DECLARE @id_album_inserted INT;

    -- Pegar o id do album que a faixa pertence
	SELECT @id_album_inserted = id_album_fk FROM inserted;


    -- Pegar o numero de faixas barrocas do album
    SELECT @barroco_in_album = COUNT(f.id_faixa) from 
		Album a join 
		Faixas f on a.id_album = f.id_album_fk join 
		Faixa_Compositor fc on f.id_faixa = fc.id_faixa_fk join 
		Compositor c on fc.id_compositor_fk = c.id_compositor join 
		Periodo_musical p on c.id_periodo_fk = p.id_periodo
	WHERE
		p.descricao = 'Barroco' and a.id_album = @id_album_inserted;

		--PRINT CONCAT ('Album de id: ', @id_album_inserted);
		--PRINT CONCAT ('Faixas Barrocas: ', @barroco_in_album);
        
	-- Se o album possui faixas barrocas e o tipo de gravação da faixa que estamos inserindo ou atualizando não é DDD, ocorre um erro
	IF @barroco_in_album <> 0 AND EXISTS (
		SELECT 1 
		FROM inserted
		where tipo_gravacao <> 'DDD'
	)
	BEGIN
		RAISERROR ('O álbum possui faixas do período barroco só é permitido adicionar ou atualizar faixas com o tipo de gravação DDD', 16,1);
		ROLLBACK TRANSACTION;
	END;
END;