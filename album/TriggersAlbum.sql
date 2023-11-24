-- Ele Buga quando vc adiciona um album que tenha uma faixa DDD e outras diferentes de DDD, considera esse album pro calculo da média
-- Ou seja, nao pega SOMENTE os albuns com todas as musicas DDD
--Validar preeço da compra > 3*media dos albuns ocm todas as faixas DDD
CREATE TRIGGER valdiar_preco_compra_album
ON Album
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @MediaPrecoCompras DECIMAL(8, 2);

    SELECT @MediaPrecoCompras = AVG(a.preco_compra)
    FROM Album a
    JOIN Faixas f ON a.id_album = f.id_album_fk
    WHERE f.tipo_gravacao = 'DDD';

    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.preco_compra > 3 * @MediaPrecoCompras
    )
    BEGIN
        RAISERROR('O preço de compra não pode ser superior a três vezes a média dos albuns com todas as Faixas tipo DDD.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
