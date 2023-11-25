--Secundario
create nonclustered index Idx_TipoComposicao on 
Faixas(id_composicao_fk)
with(pad_index=on, fillfactor=100) 

--Primario
create clustered index Idx_CodAlbum on 
Faixas(id_album_fk)
with(pad_index=on, fillfactor=100) 

-------------------------------------------------------------------------------------------------
--Att

  --Tirando as fk que usam a pk de faixa
alter table Faixa_Interprete
drop constraint faixa_interprete_FK

alter table Playlist_Faixas
drop constraint playlist_faixa_FK_faixa

alter table Faixa_Compositor
drop constraint faixa_compositor_FK

-- tirando a pk de faixa e recolocando nonclustered
alter table Faixas
drop constraint faixa_PK

alter table Faixas
add constraint faixa_PK PRIMARY KEY NONCLUSTERED (id_Faixa)

--recolocando as fk que foram tiradas
alter table Faixa_Interprete
add CONSTRAINT faixa_interprete_FK 
        FOREIGN KEY (id_faixa_fk) 
        REFERENCES Faixas (id_faixa)
        ON DELETE CASCADE

alter table Playlist_Faixas
add CONSTRAINT playlist_faixa_FK_faixa FOREIGN KEY (faixa) REFERENCES Faixas(id_faixa)
	ON DELETE CASCADE

alter table Faixa_Compositor
add     CONSTRAINT faixa_compositor_FK 
        FOREIGN KEY (id_faixa_fk) 
        REFERENCES Faixas (id_faixa)
        ON DELETE CASCADE

