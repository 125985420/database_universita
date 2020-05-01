insert into sede
values(5,"Via tv","Roma");  /*fallisce perchè esiste già la sede con codice 5*/

insert into sede
values(-2,"Via tv","Roma");  /*fallisce perchè il codice si richiede che sia un numero > 0 */

insert into sede(codice,indirizzo)
values(8,"Via tv");  /*fallisce perchè sull'attributo città non può esserci NULL */

insert into dipartimento
values(7,"Informatica");  /* fallisce perchè abbiamo già un dipartimento di Informatica e può essercene uno solo */

insert into sede_dipartimento(codice_sede,codice_dipartimento)
values(6,2);  /*fallisce perchè non esiste il codice 6 nell'attributo codice della tabella sede */

insert into sede_dipartimento(codice_sede,codice_dipartimento)
values(3,7);  /*fallisce perchè non esiste il codice 7 nell'attributo codice della tabella dipartimento */

insert into corso_laurea(codice)
values(8);  /*fallisce perchè sull'attributo nome non può esserci NULL */

insert into corso_laurea(codice,nome)
values(8,"Statistica");  /*fallisce perchè il nome Statistica esiste già e c'è ne può essere solo uno */

insert into modulo(codice,nome,cfu)
values(7,"Francese",2);  /*fallisce perchè sull'attributo cfu non può esserci un valore < 3 */

insert into modulo(codice,nome,cfu)
values(7,"Francese",13);  /*fallisce perchè sull'attributo cfu non può esserci un valore > 12 */

insert into modulo(codice,nome,cfu)
values(7,"Basi di dati",9);  /*fallisce perchè Basi di dati con 9 cfu esiste già */

insert into studente(matricola,corso_laurea,nome,cognome,codice_fiscale)
values(14,2,"Maria","Graziosa","CSERTE43RDF34RTE");  /*fallisce perchè quel codice fiscale appartiene a un altro studente */

insert into studente(matricola,corso_laurea,nome,cognome,codice_fiscale)
values(14,25,"Maria","Graziosa","MRTFRT54RFGY65RE");  /*fallisce perchè non esiste il codice 25 nell'attributo codice della tabella corso_laurea */

insert into docente(matricola,dipartimento,nome,cognome,codice_fiscale)
values(14,25,"Maria","Graziosa","MRTFRT54RFGY65RE");  /*fallisce perchè non esiste il codice 25 nell'attributo codice della tabella dipartimento */

insert into esame
values(6,9,1,1,"2020/05/07",14,"bocciato");  /*fallisce perchè non esiste nell'attributo matricola della tabella studente il valore 9 */

insert into esame
values(6,3,9,1,"2020/05/07",14,"bocciato");  /*fallisce perchè non esiste nell'attributo codice della tabella modulo il valore 9 */

insert into esame
values(6,3,3,9,"2020/05/07",14,"bocciato");  /*fallisce perchè non esiste nell'attributo matricola della tabella docente il valore 9 */

insert into esame(codice,matricola_studente,codice_modulo,matricola_docente,data,voto)
values(7,5,2,2,"2020/05/17",36);  /*fallisce perchè non si può mettere un voto > 30 */

insert into esame(codice,matricola_studente,codice_modulo,matricola_docente,data,voto)
values(7,5,2,2,"2020/05/17",-5);  /*fallisce perchè non si può mettere un voto < 1