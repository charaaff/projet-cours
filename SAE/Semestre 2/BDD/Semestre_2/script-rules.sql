-- on enlève les privilèges

revoke execute on function noteEtudiant, moyenneEtudiant, minNoteControle, maxNoteControle, moyenneNoteControle, competenceEtudiant from eleve;
revoke select on moyenne, competences, sae from eleve;
revoke select, update, delete on enseignant, matiere, controle, etudiants, note, competences, sae, moyenne, historiquemodif from prof;
revoke execute on function noteEtudiant, moyenneEtudiant, minNoteControle, maxNoteControle, moyenneNoteControle, competenceEtudiant from prof;


-- on supprime les roles
DROP ROLE IF EXISTS prof;
DROP ROLE IF EXISTS eleve;

-- Pour le prof.
CREATE ROLE prof CREATEDB LOGIN PASSWORD 'OnLeursMetUn20/20';
grant select, update, delete on enseignant, matiere, controle, etudiants, note, competences, sae, moyenne, historiquemodif to prof;
grant execute on function noteEtudiant, moyenneEtudiant, minNoteControle, maxNoteControle, moyenneNoteControle, competenceEtudiant to prof;

-- Pour l'élève.
CREATE ROLE eleve LOGIN PASSWORD '12345678';
grant select on moyenne, competences, sae to eleve;
grant execute on function noteEtudiant, moyenneEtudiant, minNoteControle, maxNoteControle, moyenneNoteControle, competenceEtudiant to eleve;