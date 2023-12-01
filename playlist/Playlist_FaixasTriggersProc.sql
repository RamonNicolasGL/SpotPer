TRIGGERS

-- Gatilho para atualizar o tempo total após inserção de faixas
CREATE TRIGGER AttTempoExecTotal_Insert
ON Playlist_Faixas
AFTER INSERT
AS
BEGIN
    DECLARE @PlaylistID INT;

    -- Obtém a lista de PlaylistIDs afetados pela inserção
    SELECT DISTINCT playlist
    INTO #AffectedPlaylists
    FROM inserted;

    -- Atualiza o tempo total para cada playlist afetada
    WHILE EXISTS (SELECT 1 FROM #AffectedPlaylists)
    BEGIN
        SELECT TOP 1 @PlaylistID = playlist FROM #AffectedPlaylists;

        EXEC AttTempoExecPlaylist @PlaylistID;

        DELETE FROM #AffectedPlaylists WHERE playlist = @PlaylistID;
    END;
END;

-- Gatilho para atualizar o tempo total após remoção de faixas
CREATE TRIGGER AttTempoExecTotal_Delete
ON Playlist_Faixas
AFTER DELETE
AS
BEGIN
    DECLARE @PlaylistID INT;

    -- Obtém a lista de PlaylistIDs afetados pela remoção
    SELECT DISTINCT playlist
    INTO #AffectedPlaylists
    FROM deleted;

    -- Atualiza o tempo total para cada playlist afetada
    WHILE EXISTS (SELECT 1 FROM #AffectedPlaylists)
    BEGIN
        SELECT TOP 1 @PlaylistID = playlist FROM #AffectedPlaylists;

        EXEC AttTempoExecPlaylist @PlaylistID;

        DELETE FROM #AffectedPlaylists WHERE playlist = @PlaylistID;
    END;
END;


PROCEDURES

-- Att a tabela playlist com o tempo de exec total
CREATE PROCEDURE AttTempoExecPlaylist(@id_playlist INT)
AS
BEGIN
    DECLARE @TempoTotal INT; -- Armazena a soma em segundos

    -- Calcula a soma total em segundos
    SELECT @TempoTotal = COALESCE(SUM(
        CAST(SUBSTRING(tempo_exec_faixa, 1, 2) AS INT) * 3600 + 
        CAST(SUBSTRING(tempo_exec_faixa, 4, 2) AS INT) * 60 +
        CAST(SUBSTRING(tempo_exec_faixa, 7, 2) AS INT)
    ), 0)
    FROM Faixas
    JOIN Playlist_Faixas ON Faixas.id_faixa = Playlist_Faixas.faixa
    WHERE Playlist_Faixas.playlist = @id_playlist;

    -- Converte o tempo total em segundos para o formato 'HH:mm:ss'
    UPDATE Playlist
    SET tempo_exec_playlist = 
        RIGHT('0' + CAST(@TempoTotal / 3600 AS VARCHAR(2)), 2) + ':' +
        RIGHT('0' + CAST((@TempoTotal % 3600) / 60 AS VARCHAR(2)), 2) + ':' +
        RIGHT('0' + CAST(@TempoTotal % 60 AS VARCHAR(2)), 2)
    WHERE id_playlist = @id_playlist;
END;
