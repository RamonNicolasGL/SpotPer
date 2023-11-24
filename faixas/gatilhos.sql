CREATE TRIGGER gatilho_validacao_numero_disco
on Faixas 
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @tipo_meio_fisico VARCHAR(10);
    
    SELECT @tipo_meio_fisico = a.tipo_meio_fisico
    FROM Album a
    JOIN inserted i ON a.id_album = i.id_album_fk;

	IF @tipo_meio_fisico IN ('VINIL', 'CD') AND EXISTS (
		SELECT 1
		FROM inserted where num_disco IS NULL
	)
	  BEGIN
        RAISERROR ('O número do disco não pode ser nulo em um Álbum do armazendo em CD ou VINIL.', 16, 1);
        ROLLBACK TRANSACTION;
    END;

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
    
    SELECT @tipo_meio_fisico = a.tipo_meio_fisico
    FROM Album a
    JOIN inserted i ON a.id_album = i.id_album_fk;

    IF @tipo_meio_fisico = 'CD' AND EXISTS (
        SELECT 1
        FROM inserted
        WHERE tipo_gravacao NOT IN ('ADD', 'DDD') OR tipo_gravacao IS NULL
    )
    BEGIN
        RAISERROR ('O tipo de gravação para um album armazenado em um CD deve ser "ADD" ou "DDD".', 16, 1);
        ROLLBACK TRANSACTION;
    END;

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


