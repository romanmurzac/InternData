--disply raw db
select* from db_holteadelia_raw limit 15;
--add users_id
alter table db_holteadelia_raw add COLUMN user_id SERIAL;
update db_holteadelia_raw set user_id=DEFAULT;
--1.
--create users
Create table users as(SELECT first_name, last_name, user_id FROM db_holteadelia_raw);
--add constraints
ALTER TABLE users ADD PRIMARY key (user_id);
--display users
select* from users limit 15;

--2.
--create account
Create table account as(SELECT iban, currency,balance, user_id FROM db_holteadelia_raw);
--add constraints
Alter TABLE account add PRIMARY key (iban);
ALTER TABLE account ADD FOREIGN key (user_id) REFERENCES users(user_id);
--display account
select *from account LIMIT 15;

--3.
--create place
Create table place as(SELECT latitude, longitude, address, county, user_id FROM db_holteadelia_raw);
--add constraints
Alter TABLE place add PRIMARY key (user_id);
ALTER TABLE place ADD FOREIGN key (user_id) REFERENCES users(user_id);
--display place
SELECT * from place LIMIT 15;

--4.
--create personal_data 
CREATE TABLE personal_data as (select personal_number, birthdate,phone_number,job, user_id from db_holteadelia_raw) ;
--add constraints
Alter TABLE personal_data add PRIMARY key (personal_number);
ALTER TABLE place ADD FOREIGN key (user_id) REFERENCES users(user_id);
--display perspersonal_data
SELECT* from personal_data limit 15;

select* from place;