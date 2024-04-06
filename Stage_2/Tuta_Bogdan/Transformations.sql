-- Displaying the initial database ( raw form )
SELECT * FROM db_inda_tuta_bogdan_raw LIMIT 30;

-- Adding a new column meant to show the unicity of every row
alter table db_inda_tuta_bogdan_raw
add COLUMN user_id SERIAL;

-- Populating 'user_id' column wiht unique values
UPDATE db_inda_tuta_bogdan_raw
set user_id = DEFAULT;

-- Setting the new created column ( 'user_id' ) as a Primary Key
ALTER TABLE db_inda_tuta_bogdan_raw
ADD PRIMARY KEY(user_id);

-- Creating a new table to contain information about the users
CREATE TABLE USERS as
SELECT user_id, last_name, first_name 
FROM db_inda_tuta_bogdan_raw;

-- Giving a primary key to "Users" table
ALTER TABLE USERS
ADD PRIMARY KEY(user_id);

-- "Creating another table to contain personal information regarding the users
CREATE TABLE Personal_Information
(
	personal_id SERIAL PRIMARY KEY,
	personal_number VARCHAR(13),
	birthdate VARCHAR(20),
	address VARCHAR(200),
	phone_number VARCHAR(20),
	user_id INT,
	FOREIGN KEY ( user_id ) REFERENCES USERS(user_id)
);
-- Creating a third table to store information about the device used by a specific user
CREATE TABLE Device_Information
(
  device_id SERIAL PRIMARY KEY,
  mac_address VARCHAR(50),
  ip_address VARCHAR(50),
  user_id INT,
  FOREIGN KEY ( user_id ) REFERENCES USERS(user_id)
);

-- Creating the forth table in order to storage banking information
CREATE TABLE Banking_Information
(
  bank_id SERIAL PRIMARY KEY,
  iban VARCHAR(50),
  currency VARCHAR(30),
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES USERS(user_id)
);

-- Giving UNIQUE constraints for some attributes ( Personal_Number, Mac_Address and Iban )
ALTER TABLE PERSONAL_INFORMATION
ADD CONSTRAINT Personal_Number_UQ UNIQUE( personal_number );

ALTER TABLE DEVICE_INFORMATION 
ADD CONSTRAINT Mac_Address_UQ UNIQUE( mac_address );

ALTER TABLE BANKING_INFORMATION 
ADD CONSTRAINT Iban_UQ UNIQUE( iban );

-- Inserting data from RawDB to PERSONAL_INFORMATION table
INSERT INTO PERSONAL_INFORMATION(personal_number, birthdate, address, phone_number, user_id)
SELECT personal_number, birthdate, address, phone_number, user_id
FROM db_inda_tuta_bogdan_raw;

-- Checking if the table has been populated
SELECT *
FROM Personal_Information
LIMIT 30;

-- Inserting data from RawDB to DEVICE_INFORMATION table
INSERT INTO DEVICE_INFORMATION(ip_address, mac_address, user_id)
SELECT ip_address, mac_address, user_id
FROM db_inda_tuta_bogdan_raw;

-- Checking if the table has been populated
SELECT *
FROM Device_Information
LIMIT 30;

-- Inserting data from RawDB to BANKING_INFORMATION table
INSERT INTO BANKING_INFORMATION(iban, currency, user_id)
SELECT iban, currency, user_id
FROM db_inda_tuta_bogdan_raw;

-- Checking if the table has been populated
SELECT *
FROM Banking_Information
LIMIT 30;

-- Checking if there are not unique rows
SELECT COUNT(DISTINCT(user_id)) FROM db_inda_tuta_bogdan_raw;
SELECT COUNT(DISTINCT(personal_number)) FROM db_inda_tuta_bogdan_raw;
SELECT COUNT(DISTINCT(mac_address)) FROM db_inda_tuta_bogdan_raw;
SELECT COUNT(DISTINCT(iban)) FROM db_inda_tuta_bogdan_raw;
