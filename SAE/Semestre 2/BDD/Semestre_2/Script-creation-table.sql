--On donne le rôle admin pour supprimer et créer une table.
set role Admin;

-- Supprimer les tables
DROP TABLE IF EXISTS HISTORIQUEMODIF;
DROP TABLE IF EXISTS MOYENNE;
DROP TABLE IF EXISTS NOTE;
DROP TABLE IF EXISTS COMPETENCES;
DROP TABLE IF EXISTS SAE;
DROP TABLE IF EXISTS ETUDIANTS;
DROP TABLE IF EXISTS CONTROLE;
DROP TABLE IF EXISTS MATIERE;
DROP TABLE IF EXISTS ENSEIGNANT;

-- Supprimer les sequences
drop sequence if exists compteurHistorique;
drop sequence if exists compteurMoyenne;

-- créer les sequences

-- La sequence 'compteurHistorique' permet de créer des HistoriqueId pour la table HistoriqueId. 
CREATE SEQUENCE compteurHistorique START WITH 1 INCREMENT BY 1;

-- La sequence 'compteurMoyenne' permet de créer des MoyenneId pour la table MOYENNE. 
CREATE SEQUENCE compteurMoyenne START WITH 1 INCREMENT BY 1;

-- créer les tables

-- La table enseignant qui contient les datas des différents professeurs
CREATE TABLE ENSEIGNANT(
    ProfId integer,
    Nom varchar(30),
    Prenom varchar(30),
    PRIMARY KEY (ProfId)
);

-- La table matiere qui contient les datas des différentes matières
CREATE TABLE MATIERE(
    MatiereId integer,
    NomMatière varchar(100), 
    Compétence integer[],
    ProfId integer,
    FOREIGN KEY (ProfId) REFERENCES ENSEIGNANT (ProfId),
    PRIMARY KEY (MatiereId)
);

-- La table controle qui contient les datas des différents controles
CREATE TABLE CONTROLE(
    CtrlId integer,
    CtrlDate Date,
    CtrlCoeff integer,
    MatiereId integer,
    FOREIGN KEY (MatiereId) REFERENCES MATIERE (MatiereId),
    PRIMARY KEY (CtrlId)
);

-- La table etudiants qui contient les datas des différents etudiants.
CREATE TABLE ETUDIANTS(
    EtudiantsId integer,
    Nom varchar(30),
    Prenom varchar(20),
    Groupe varchar(20),
    PRIMARY KEY (EtudiantsId)
);

-- La table sae qui contient les datas des différentes sae d'un étudiant
CREATE TABLE SAE(
    SaeId integer,
    NomSae varchar(30),
    ValeurSae integer,
    EtudiantsId integer,
    FOREIGN KEY (EtudiantsId) REFERENCES ETUDIANTS (EtudiantsId),
    PRIMARY KEY (SaeId)
);


-- La table competences qui contient les datas des différents competences d'un étudiant
CREATE TABLE COMPETENCES(
    CompetenceId integer,
    ValeurCompetence float,
    EtudiantsId integer,
    FOREIGN KEY (EtudiantsId) REFERENCES ETUDIANTS (EtudiantsId),
    PRIMARY KEY (CompetenceId)
);



-- La table note qui contient les datas de toutes les notes d'un étudiant.
CREATE TABLE NOTE(
    NoteId integer,
    Valeur float,
    NoteCoeff integer,
    EtudiantsId integer,
    CtrlId integer,
    Compétence integer[],
    FOREIGN KEY (EtudiantsId) REFERENCES ETUDIANTS (EtudiantsId),
    FOREIGN KEY (CtrlId) REFERENCES CONTROLE (CtrlId),
    PRIMARY KEY (NoteId)
);

-- La table moyenne qui contient les datas des différentes moyenne d'un étudiant
CREATE TABLE MOYENNE(
    MoyenneId integer, 
    Valeur float,
    EtudiantsId integer,
    MatiereId integer,
    FOREIGN KEY (EtudiantsId) REFERENCES ETUDIANTS (EtudiantsId),
    FOREIGN KEY (MatiereId) REFERENCES MATIERE (MatiereId),
    PRIMARY KEY (MoyenneId)
);

-- La table historiquemodif qui contient les datas des différentes modifications faites dans les tables ci-dessus.
CREATE TABLE HISTORIQUEMODIF(
    HistoriqueId integer,
    DateModif date,
    Action text,
    old_saisie text,
    new_saisie text
);

-- A modifier selon ton chemin.
\i '/Users/samueldorismond/Desktop/Cours_BUT1/BDD/SAE2/sae-bdd/Script-triggers.sql';
\i '/Users/samueldorismond/Desktop/Cours_BUT1/BDD/SAE2/sae-bdd/Script-fonction-table.sql';
\i '/Users/samueldorismond/Desktop/Cours_BUT1/BDD/SAE2/sae-bdd/Script-insert.sql';
\i '/Users/samueldorismond/Desktop/Cours_BUT1/BDD/SAE2/sae-bdd/script-rules.sql';