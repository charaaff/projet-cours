-- visualiser toutes les notes d’un étudiant.
create or replace function noteEtudiant(id int) 
    returns table (
        EtudiantsId integer,
        MatiereId integer,
        NomMatière varchar(100),
        Valeur float,
        CtrlCoeff integer,
        Compétence integer[]
    ) AS
    $$
    begin
        RETURN QUERY
        SELECT note.EtudiantsId, matiere.MatiereId, matiere.NomMatière, note.Valeur, controle.CtrlCoeff, note.Compétence
        from note, controle, matiere 
        where Note.EtudiantsId=$1 and note.CtrlId=controle.CtrlId and controle.MatiereId=matiere.MatiereId;
    end;
    $$
    LANGUAGE plpgsql SECURITY DEFINER;

-- visualiser toutes les moyennes d’un étudiant.
create or replace function moyenneEtudiant(id int)
    returns table (
        EtudiantsId integer,
        MoyenneId integer,
        NomMatière varchar(100),
        Valeur float,
        MatiereId integer
    ) AS
    $$
    begin
        RETURN QUERY
        SELECT noteEtudiant.EtudiantsId, cast(nextval('compteurMoyenne') as int), noteEtudiant.NomMatière, avg(noteEtudiant.Valeur), noteEtudiant.MatiereId
        from noteEtudiant($1)
        group by noteEtudiant.NomMatière, noteEtudiant.MatiereId, noteEtudiant.EtudiantsId;
    end;
    $$
    LANGUAGE plpgsql SECURITY DEFINER ;

-- donner la note minimale d'un examen
create or replace function minNoteControle(idControle int)
    returns float as
    $$
        select min(valeur) from note where CtrlId=$1;
    $$
    LANGUAGE sql;


-- donner la note maximale d'un examen
create or replace function maxNoteControle(idControle int)
    returns float as
    $$
        select max(valeur) from note where CtrlId=$1;
    $$
    LANGUAGE sql;

-- donner la moyenne d'un examen
create or replace function moyenneNoteControle(idControle int)
    returns float as
    $$
        select avg(valeur) from note where CtrlId=$1;
    $$
    LANGUAGE sql;

-- visualise les compétences d'un étudiant
create or replace function competenceEtudiant(idEtudiant int)
    RETURNS table (
        competence int,
        Valeur float,
        EtudiantsId int
    ) AS
    $$
        WITH RECURSIVE dataCompetence(Valeur, Compétence) as (
            select Valeur, Compétence from note where EtudiantsId=$1
        ),
        CompteurCTE AS (
            SELECT 1 AS i
            UNION ALL
            SELECT i + 1
            FROM CompteurCTE
            WHERE i < 6
            )

        select i as competenceId, (avg(Valeur)) as valeur, $1 as EtudiantsId 
        from dataCompetence, CompteurCTE, sae 
        where i=any(Compétence) 
        group by competenceId
        order by competenceId;
    $$
    LANGUAGE sql SECURITY DEFINER ;

-- visualiser toutes les moyennes d’un groupe.
create or replace function moyenneGroupe(nameGroupe varchar(20))
    returns table (
        nomGroupe varchar(20),
        moyenne float
    ) AS
    $$
    begin
        RETURN QUERY
        select etudiants.Groupe, avg(note.Valeur)
        from etudiants, note
        where etudiants.Groupe = $1 and note.EtudiantsId = etudiants.EtudiantsId
        group by etudiants.Groupe;
    end;
    $$
    LANGUAGE plpgsql SECURITY DEFINER;
-- afficher le nombre d'étudiants dans un groupe.
create or replace function numberEtudiantInGroupe(nameGroupe varchar(20))
    returns int as
    $$
        select count(EtudiantsId) 
        from etudiants 
        where etudiants.Groupe = $1 
        group by etudiants.Groupe;
    $$
    LANGUAGE sql SECURITY DEFINER;