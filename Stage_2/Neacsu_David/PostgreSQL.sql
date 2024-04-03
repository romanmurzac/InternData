select * from db_inda_neacsu_david_raw
limit 10;

ALTER TABLE db_inda_neacsu_david_raw
ADD COLUMN id_utilizator SERIAL;

UPDATE db_inda_neacsu_david_raw
SET id_utilizator = DEFAULT;

ALTER TABLE db_inda_neacsu_david_raw
ADD PRIMARY KEY(id_utilizator);

create TABLE Angajat AS
select nume, prenume 
FROM db_inda_neacsu_david_raw;

ALTER TABLE Angajat
ADD COLUMN id_utilizator SERIAL;

ALTER TABLE Angajat
ADD PRIMARY KEY(id_utilizator);

ALTER TABLE Angajat
ADD COLUMN id_job SERIAL;

CREATE Table Info_Personale AS
SELECT telefon, cnp, data_nastere, adresa
from db_inda_neacsu_david_raw;

ALTER TABLE Info_Personale
ADD COLUMN id_utilizator SERIAL;

ALTER TABLE Info_Personale
ADD COLUMN index_cont SERIAL;

ALTER TABLE Info_Personale
ADD PRIMARY KEY(id_utilizator);

create Table Job_Info As
SELECT job, salariu_anual 
FROM db_inda_neacsu_david_raw;

ALTER TABLE Job_Info
ADD COLUMN id_job SERIAL;

ALTER TABLE Job_Info
ADD PRIMARY KEY(id_job);

create table Cont AS
SELECT iban, valuta, sold
from db_inda_neacsu_david_raw;

ALTER TABLE Cont
ADD COLUMN index_cont SERIAL;

ALTER TABLE Cont
ADD PRIMARY KEY(index_cont);

ALTER TABLE Angajat
ADD FOREIGN KEY (id_utilizator) REFERENCES Info_personale(id_utilizator);

ALTER TABLE Angajat
ADD FOREIGN KEY (id_job) REFERENCES Job_info(id_job);

ALTER TABLE Info_personale
ADD FOREIGN KEY (index_cont) REFERENCES Cont(index_cont);

UPDATE db_inda_neacsu_david_raw
SET id_utilizator = DEFAULT;
