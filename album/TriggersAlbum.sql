-- Ele Buga quando vc adiciona um album que tenha uma faixa DDD e outras diferentes de DDD, considera esse album pro calculo da média
-- Ou seja, nao pega SOMENTE os albuns com todas as musicas DDD
--Validar preeço da compra > 3*media dos albuns ocm todas as faixas DDD
CREATE TRIGGER validar_preco_compra_album
ON Album
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @MediaPrecoCompras DECIMAL(8, 2);
    DECLARE @faixas_nao_ddd INT;

    SELECT @MediaPrecoCompras = AVG(a.preco_compra)
    FROM Album a
    WHERE (
        SELECT COUNT(*)
        FROM Faixas f
        WHERE f.id_album_fk = a.id_album
          AND f.tipo_gravacao <> 'DDD'
    ) = 0

    SELECT @faixas_nao_ddd = COUNT(*) 
    FROM Faixas f, inserted i WHERE f.tipo_gravacao <> 'DDD'

    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.preco_compra > 3 * @MediaPrecoCompras
    )
    BEGIN
        RAISEERROR('O preço de compra não pode ser superior a três vezes a média dos álbuns com todas as faixas tipo DDD.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;



-- Trigger Corrigido
CREATE TRIGGER validar_preco_compra_album
ON Album
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @MediaPrecoCompras DECIMAL(8, 2);

    SELECT @MediaPrecoCompras = AVG(a.preco_compra) 
	FROM (

		-- Seleciona os albuns que possuem faixas do tipo DDD
		SELECT a.id_album, a.descricao, a.preco_compra
		FROM Album a join Faixas f on a.id_album = f.id_album_fk
		WHERE f.tipo_gravacao = 'DDD'

		-- Remove os albuns que contem faixas diferentes de DDD
		EXCEPT

		SELECT a.id_album, a.descricao, a.preco_compra FROM Album a join Faixas f on a.id_album = f.id_album_fk
		WHERE f.tipo_gravacao NOT IN ('DDD')
	
	) as "a"

    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.preco_compra > 3 * @MediaPrecoCompras
    )
	
	DECLARE @mensagem NVARCHAR(200);
	SET @mensagem = 'O preço de compra não pode ser superior a três vezes a média dos álbuns com todas as faixas tipo DDD. Média = ' + CONVERT(NVARCHAR(20), @MediaPrecoCompras);

    BEGIN
        RAISERROR(@mensagem, 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
