CREATE PROCEDURE relatorio as
BEGIN
	DECLARE c2 cursor for
		select  
			a.nome,
			ISNULL(d.nome, 'Aluno sem aprovações'),
			ISNULL (ap.media, 0),
			ISNULL (d.qtde_creditos, 0) as 'Qtde de Creditos' 
	
		from
			Curso c join 
			Aluno a left join
			aprovados(null) ap  join
			Disciplina d 

			on ap.disc = d.cod_disc
			on ap.matricula = a.matr_aluno
			on a.cod_curso = c.cod_curso


		WHERE (c.nome = 'Ciencia da computacao')
		
	DECLARE @aluno varchar(50), @disc varchar(100), @media dec (4,2), @creditos int

	OPEN c2
	FETCH NEXT FROM c2
	INTO @aluno, @disc, @media, @creditos
	 
	WHILE (@@fetch_status = 0)
	BEGIN
		PRINT 'Aluno: ' + @aluno + ' Disciplina: ' + @disc + ' Média: ' + cast(@media as varchar(6)) + ' Créditos: ' + cast(@creditos as varchar(2))
	
		FETCH  NEXT FROM c2
		INTO @aluno, @disc, @media, @creditos
	END
	CLOSE c2
	DEALLOCATE c2
END




CREATE FUNCTION aprovados (@matricula SMALLINT = NULL)
RETURNS TABLE 
AS 
RETURN(
select 
	a.matr_aluno as 'matricula', 
	a.nome as 'nome', 
	d.cod_disc as 'disc', 
	SUM((ad.I_AP + ad.II_AP)/2 + ISNULL(ad.AF, (ad.I_AP + ad.II_AP)/2))/2 as 'media',
	d.qtde_creditos as 'Qtde de Creditos'
	
from
	Curso c join 
	Aluno a on a.cod_curso = c.cod_curso join
	Aluno_Disc ad on a.matr_aluno = ad.matr_aluno join 
	Disciplina d on ad.cod_disc = d.cod_disc


WHERE (c.nome = 'Ciencia da computacao') and (((ad.I_AP+ad.II_AP)/2 >= 7 and ad.AF IS NULL) or (((ad.I_AP+ad.II_AP)/2 + ad.AF)/2  >= 5 and ad.AF IS NOT NULL))
group by a.matr_aluno, a.nome, d.cod_disc, d.qtde_creditos
)









create view View_AlunoAprovado_Curso_QtdDisc_QtdCred (AlunoAprovado, Curso, QtdDisc, QtdCred)
as
select a.nome as Nome_aluno, c.nome as Curso, count(ad.cod_disc) as 'qtd disciplinas', sum(d.qtde_creditos) as 'Qtde créditos'
from aluno a 
left join curso c on c.cod_curso = a.cod_curso
left join aluno_disc ad on ad.matr_aluno=a.matr_aluno
left join disciplina d on d.cod_disc=ad.cod_disc
WHERE ((ad.I_AP+ad.II_AP)/2 >= 7 and ad.AF IS NULL) or ((((ad.I_AP+ad.II_AP)/2)+ad.AF)/2  >= 5 and ad.AF IS NOT NULL)
group by a.matr_aluno, a.nome, c.nome;

select * from View_AlunoAprovado_Curso_QtdDisc_QtdCred

CREATE FUNCTION Q1 (@matricula SMALLINT = NULL)
RETURNS TABLE 
AS 
RETURN
(
	select 
		a.matr_aluno as 'matricula', 
		a.nome as 'nome', d.nome as 'disc', 
		SUM((ad.I_AP + ad.II_AP)/2 + ISNULL(ad.AF, (ad.I_AP + ad.II_AP)/2))/2 as 'media'

		--  ((AP1 + AP2)/2 + { IF(AF == NULL)  (AP1 + AP2)/2  ELSE AF } )/2
	from
		Curso c join 
		Aluno a on a.cod_curso = c.cod_curso join 
		Aluno_Disc ad on a.matr_aluno = ad.matr_aluno join 
		Disciplina d on ad.cod_disc = d.cod_disc


	WHERE
		  
		(
			@matricula IS NOT NULL and @matricula = a.matr_aluno and
			(	
				(
					(ad.I_AP+ad.II_AP)/2 >= 7 and ad.AF IS NULL
				) 
			or 
				(
					((ad.I_AP+ad.II_AP)/2 + ad.AF)/2  >= 5 and ad.AF IS NOT NULL
				)
			)
		)

		or

		(
			@matricula IS NULL and
			(	
				(
					(ad.I_AP+ad.II_AP)/2 <= 5  and ad.AF IS NULL
				) 
			or 
				(
					((ad.I_AP+ad.II_AP)/2 + ad.AF)/2  <= 5 and ad.AF IS NOT NULL
				)
			)
		)


		

	group by a.matr_aluno, a.nome, d.nome
);


select * from Q1(NULL)