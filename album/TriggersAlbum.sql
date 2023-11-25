-- Ele Buga quando vc adiciona um album que tenha uma faixa DDD e outras diferentes de DDD, considera esse album pro calculo da média
-- Ou seja, nao pega SOMENTE os albuns com todas as musicas DDD
--Validar preeço da compra > 3*media dos albuns ocm todas as faixas DDD
CREATE TRIGGER validar_preco_compra_album
ON Album
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @MediaPrecoCompras DECIMAL(8, 2);

    SELECT @MediaPrecoCompras = AVG(a.preco_compra)
    FROM Album a
    WHERE (
        SELECT COUNT(*)
        FROM Faixas f
        WHERE f.id_album_fk = a.id_album
          AND f.tipo_gravacao <> 'DDD'
    ) = 0

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
