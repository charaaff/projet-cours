CREATE OR REPLACE PROCEDURE insert_data() as
$$
    -- On insert les datas des enseignants
    insert into enseignant values (1, 'Azzag', 'Hanene');
    insert into enseignant values (2, 'NAIT OUSLIMANE', 'KARIM');
    insert into enseignant values (3, 'Gérard', 'Pierre');
    insert into enseignant values (4, 'DE SAINT SERNIN', 'DOMINIQUE');
    insert into enseignant values (5, 'ABIR', 'HOCINE');
    insert into enseignant values (6, 'MARTINEZ', 'LOUIS-ANTONY');
    insert into enseignant values (7, 'BUTELLE', 'FRANCK');
    insert into enseignant values (8, 'CROS', 'KEVIN');
    insert into enseignant values (9, 'BOSC', 'MARCEL');
    insert into enseignant values (10, 'HEBERT', 'DAVID');

    -- On insert les datas des matieres
    insert into matiere values (1, 'Java', array[1, 2], 1);
    insert into matiere values (2, 'PPP', array[1, 3, 5, 6], 2);
    insert into matiere values (3, 'Qualite de developpement', array[1, 5], 3);
    insert into matiere values (4, 'Gestion de projet et des organisations', array[4, 5], 4);
    insert into matiere values (5, 'Exploitation BD', array[4], 5);
    insert into matiere values (6, 'Anglais d entreprise', array[4, 5, 6], 6);
    insert into matiere values (7, 'Introduction aux services reseaux', array[3], 7);
    insert into matiere values (8, 'Outils numeriques pour les statistiques descriptives', array[4], 8);
    insert into matiere values (9, 'Developpement d applications avec IHM', array[1, 5, 6], 9);
    insert into matiere values (10, 'Graphes', array[2, 5], 10);

    -- -- On insert les datas des controles
    insert into controle values (1, '2022-05-05', 1, 1);
    insert into controle values (2, '2022-05-10', 2, 1);
    insert into controle values (3, '2022-05-15', 1, 2);
    insert into controle values (4, '2022-05-20', 2, 2);
    insert into controle values (5, '2022-05-25', 1, 3);
    insert into controle values (6, '2022-06-30', 2, 3);
    insert into controle values (7, '2022-03-15', 1, 4);
    insert into controle values (8, '2022-03-10', 2, 4);
    insert into controle values (9, '2022-04-05', 1, 5);
    insert into controle values (10, '2022-04-20', 2, 5);
    insert into controle values (11, '2022-04-15', 1, 6);
    insert into controle values (12, '2022-06-20', 2, 6);
    insert into controle values (13, '2022-01-05', 1, 7);
    insert into controle values (14, '2022-02-10', 2, 7);
    insert into controle values (15, '2022-02-15', 1, 8);
    insert into controle values (16, '2022-01-20', 2, 8);
    insert into controle values (17, '2022-02-05', 1, 9);
    insert into controle values (18, '2022-05-10', 2, 9);
    insert into controle values (19, '2022-03-17', 1, 10);
    insert into controle values (20, '2022-05-20', 2, 10);

    -- On insert les datas des etudiants
    insert into etudiants values (1, 'Aguetai', 'Lucas', 'Pegasus');
    insert into etudiants values (2, 'Dorismond', 'Samuel', 'Pegasus');
    insert into etudiants values (3, 'Essayah', 'Charaf', 'Pegasus');
    insert into etudiants values (4, 'Soares', 'Lilian', 'Draco');
    insert into etudiants values (5, 'OUBELLA', 'Walid', 'Phoenix');

    -- On insert les datas des sae
    insert into sae values (1, 20, 1);
    insert into sae values (2, 12, 1);
    insert into sae values (3, 14, 1);
    insert into sae values (4, 8, 1);
    insert into sae values (5, 10, 1);
    insert into sae values (6, 16, 1);


    -- -- On insert les datas des notes
    insert into note values (1, 12, 1, 1, 1, array[1, 2]);
    insert into note values (2, 9, 2, 1, 2, array[1, 2]);
    insert into note values (3, 14, 1, 2, 3, array[1, 3, 5, 6]);
    insert into note values (4, 10, 2, 2, 4, array[1, 3, 5, 6]);
    insert into note values (5, 6, 1, 1, 5, array[1, 5]);
    insert into note values (6, 13, 2, 1, 6, array[1, 5]);
    insert into note values (7, 18, 1, 2, 7, array[4, 5]);
    insert into note values (8, 20, 2, 2, 8, array[4, 5]);
    insert into note values (9, 14.5, 1, 1, 9, array[4]);
    insert into note values (10, 12, 2, 1, 10, array[4]);
    insert into note values (11, 9, 1, 2, 11, array[4, 5, 6]);
    insert into note values (12, 0, 2, 2, 12, array[4, 5, 6]);
    insert into note values (13, 17.5, 1, 1, 13, array[3]);
    insert into note values (14, 5, 2, 1, 14, array[3]);
    insert into note values (15, 13.6, 1, 2, 15, array[4]);
    insert into note values (16, 18, 2, 2, 16, array[4]);
    insert into note values (17, 20, 1, 1, 17, array[1, 5, 6]);
    insert into note values (18, 11, 2, 1, 18, array[1, 5, 6]);
    insert into note values (19, 7, 1, 2, 19, array[2, 5]);
    insert into note values (20, 12, 2, 2, 20, array[2, 5]);
$$
LANGUAGE SQL;

CREATE OR REPLACE PROCEDURE insert_data_etudiant(idEtudiant int) as
$$
    insert into MOYENNE select MoyenneId, Valeur, EtudiantsId, MatiereId from moyenneEtudiant($1);
    insert into COMPETENCES select * from competenceEtudiant($1);
$$
    LANGUAGE SQL;

CALL insert_data();
CALL insert_data_etudiant(1);