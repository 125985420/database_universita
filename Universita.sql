create table sede(
codice integer check (codice > 0) primary key,
indirizzo varchar(50),
citta varchar(30) not null
);

create table dipartimento (
codice integer check (codice > 0) primary key,
dipartimento varchar(40) not null unique
);

create table sede_dipartimento (
codice_sede integer,
codice_dipartimento integer,
note varchar(50),
primary key(codice_sede, codice_dipartimento),
foreign key (codice_sede) references sede(codice) on update cascade on delete no action,
foreign key(codice_dipartimento) references dipartimento(codice) on update cascade on delete no action
);

create table corso_laurea(
codice integer check (codice > 0) primary key,
nome varchar(40) unique not null,
descrizione varchar(50)
);

create table modulo (
codice integer check (codice > 0) primary key,
nome varchar(30) not null,
descrizione varchar(50),
cfu smallint check ( cfu >=3 and cfu <=12) not  null,
unique (nome,cfu)
);

create table studente (
matricola integer check (matricola > 0) primary key,
corso_laurea integer,
nome varchar(30) not null,
cognome varchar(30) not null,
data_nascita date,
codice_fiscale char(16) not null unique,
foto blob,
foreign key (corso_laurea) references corso_laurea(codice) on update cascade on delete no action
);

create table docente (
matricola integer check (matricola > 0) primary key,
dipartimento integer,
nome varchar(30) not null,
cognome varchar(30) not null,
data_nascita date,
codice_fiscale char(16) not null unique,
foto blob,
foreign key (dipartimento) references dipartimento(codice) on update cascade on delete no action
);

create table esame (
codice integer check (codice > 0) primary key, /* inserito per permettere ad esempio ad uno studente di fare lo stesso esame con lo stesso docente più volte(perchè è stato bocciato o rifiuta il voto)  */
matricola_studente integer,
codice_modulo integer,
matricola_docente integer,
data datetime not null,
voto smallint check (voto >=1 and voto<=30) not null,
note varchar(50),
foreign key (matricola_studente) references studente(matricola),
foreign key (codice_modulo) references modulo(codice),
foreign key (matricola_docente) references docente(matricola)
);


insert into sede
values(1,"Via delle palme","Bari");

insert into sede
values(2,"Via dei guardiani","Barletta");

insert into sede
values(3,"Via delle celebrità","Taranto");

insert into sede
values(4,"Via accademia","Foggia");

insert into sede
values(5,"Via standard","Andria");

insert into dipartimento
values(1,"Informatica");

insert into dipartimento
values(2,"Matematica");


insert into dipartimento
values(3,"Lettere");

insert into dipartimento
values(4,"Filosofia");

insert into dipartimento
values(5,"Lettere antiche");

insert into dipartimento
values(6,"Economia");

insert into sede_dipartimento(codice_sede,codice_dipartimento)
values(1,1);

insert into sede_dipartimento
values(3,1,"Sede distaccata che dipende dalla sede di Bari");

insert into sede_dipartimento(codice_sede,codice_dipartimento)
values(4,2);

insert into sede_dipartimento(codice_sede,codice_dipartimento)
values(5,2);

insert into sede_dipartimento(codice_sede,codice_dipartimento)
values(4,3);

insert into sede_dipartimento
values(2,3,"Sede distaccata che dipende dalla sede di Foggia");

insert into sede_dipartimento(codice_sede,codice_dipartimento)
values(1,4);

insert into sede_dipartimento(codice_sede,codice_dipartimento)
values(5,4);

insert into sede_dipartimento(codice_sede,codice_dipartimento)
values(2,5);

insert into sede_dipartimento
values(4,5,"Sede distaccata che dipende dalla sede di Barletta");

insert into sede_dipartimento(codice_sede,codice_dipartimento)
values(3,6);

insert into sede_dipartimento(codice_sede,codice_dipartimento)
values(4,6);

insert into corso_laurea
values(1,"Informatica","Laurea triennale");

insert into corso_laurea
values(2,"Economia e commercio","Laurea triennale");

insert into corso_laurea(codice,nome)
values(3,"Giurisprudenza");

insert into corso_laurea
values(4,"Latino e greco","Laurea magistrale");

insert into corso_laurea
values(5,"Statistica","Laurea magistrale");

insert into corso_laurea
values(6,"Informatica e comunicazione digitale","Laurea triennale");

insert into corso_laurea
values(7,"Lettere italiane","Laurea quinquiennale a ciclo unico");

insert into modulo
values(1,"Basi di dati","Materia informatica",9);

insert into modulo
values(2,"Ingegneria del sofware","Materia informatica",9);

insert into modulo(codice,nome,cfu)
values(4,"Inglese",6);

insert into modulo
values(5,"Calcolo numerico","Materia matematica",8);

insert into modulo(codice,nome,cfu)
values(6,"Diritto civile",12);

insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
values(1,1,"Antonio","Leuzzi","2000/01/25","LZZNTN00S25C345T");

insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
values(2,5,"Giovanni","Urso","1998/11/05","GTRTRY76Y76YTGT7");

insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
values(3,3,"Pasquale","Casa","1999/04/11","CSERTE43RDF34RTE");

insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
values(4,1,"Giselda","Cucci","2001/09/13","CCCGSD01RT54ERTS");

insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
values(5,6,"Francesca","Leonardi","2000/03/17","LNMSDF54RTFDR54R");

insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
values(1,1,"Pasquale","Bello","1980/04/30","NBVGFT56S43R543R");

insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
values(2,1,"Antonio","Rossi","1976/04/14","RSSNTN56T56E434R");

insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
values(3,1,"Mauro","Termosifone","1974/04/14","BRNCRT45RDFGJ89I");

insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
values(4,3,"Anna","Lodessana","1980/07/31","LDSANN89OLKJ654E");

insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
values(5,5,"Oronzo","Cana","1982/11/09","CNNOPO89UHFGRTSE");

insert into esame
values(1,1,1,1,"2020/05/07",16,"bocciato");

insert into esame(codice,matricola_studente,codice_modulo,matricola_docente,data,voto)
values(2,1,1,1,"2020/05/13",29);

insert into esame
values(3,3,1,1,"2020/05/07",14,"bocciato");

insert into esame(codice,matricola_studente,codice_modulo,matricola_docente,data,voto)
values(4,5,1,1,"2020/05/07",26);

insert into esame(codice,matricola_studente,codice_modulo,matricola_docente,data,voto)
values(5,5,2,2,"2020/05/17",18);
