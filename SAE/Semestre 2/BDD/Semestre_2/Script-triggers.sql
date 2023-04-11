-- créer procedure pour triggers
create or replace function historique()
    returns TRIGGER as
    $$  
    BEGIN 
        IF TG_OP = 'INSERT'
            THEN
                INSERT INTO historiquemodif(
                    HistoriqueId,
                    DateModif,
                    action,
                    new_saisie
                ) values (
                    nextval('COMPTEURHistorique'),
                    DATE(NOW()),
                    'INSERT',
                    NEW
                );
        END IF;

        IF TG_OP = 'UPDATE' 
            THEN
                INSERT INTO historiquemodif(
                    HistoriqueId,
                    DateModif,
                    action,
                    old_saisie,
                    new_saisie
                ) values (
                    nextval('COMPTEURHistorique'),
                    DATE(NOW()),
                    'UPDATE',
                    OLD,
                    NEW
                );
        END IF;

        IF TG_OP = 'DELETE' 
            THEN
                INSERT INTO historiquemodif(
                    HistoriqueId,
                    DateModif,
                    action,
                    old_saisie
                ) values (
                    nextval('COMPTEURHistorique'),
                    DATE(NOW()),
                    'DELETE',
                    OLD
                );
        END IF;
    return NULL;
    END;
    $$ LANGUAGE plpgsql;


-- créer les triggers

-- le trigger pour enseignant
CREATE TRIGGER historiqueTriggers1 
AFTER
    INSERT or UPDATE or DELETE ON enseignant
    FOR EACH ROW
    EXECUTE PROCEDURE historique();

-- le trigger pour matière
CREATE TRIGGER historiqueTriggers2
AFTER
    INSERT or UPDATE or DELETE ON matiere
    FOR EACH ROW
    EXECUTE PROCEDURE historique();

-- le trigger pour controle
CREATE TRIGGER historiqueTriggers3
AFTER
    INSERT or UPDATE or DELETE ON controle
    FOR EACH ROW
    EXECUTE PROCEDURE historique();

-- le trigger pour competences
CREATE TRIGGER historiqueTriggers4
AFTER
    INSERT or UPDATE or DELETE ON competences
    FOR EACH ROW
    EXECUTE PROCEDURE historique();

-- le trigger pour sae
CREATE TRIGGER historiqueTriggers5
AFTER
    INSERT or UPDATE or DELETE ON sae
    FOR EACH ROW
    EXECUTE PROCEDURE historique();

-- le trigger pour etudiants
CREATE TRIGGER historiqueTriggers6
AFTER
    INSERT or UPDATE or DELETE ON etudiants
    FOR EACH ROW
    EXECUTE PROCEDURE historique();

-- le trigger pour note
CREATE TRIGGER historiqueTriggers7
AFTER
    INSERT or UPDATE or DELETE ON note
    FOR EACH ROW
    EXECUTE PROCEDURE historique();