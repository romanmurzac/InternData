-- display initial raw db
SELECT * FROM db_inda_musat_andra_raw LIMIT 10;

-- add a new column
ALTER TABLE db_inda_musat_andra_raw ADD COLUMN user_id SERIAL;

-- update the new column with unique values
UPDATE db_inda_musat_andra_raw 
SET user_id=DEFAULT;

-- create users table
CREATE TABLE users AS
SELECT user_id, first_name, last_name
FROM db_inda_musat_andra_raw;

-- set the new column as a primary key
ALTER TABLE users 
ADD PRIMARY KEY(user_id);

-- change the data type and size of the first_name and last_name
ALTER TABLE users 
ALTER COLUMN first_name TYPE VARCHAR(35),
alter COLUMN last_name TYPE VARCHAR(35); 

-- display first staging table 
select * FROM users LIMIT 10;

-- create personal_info table
CREATE TABLE personal_info(
  personal_id SERIAL PRIMARY KEY,
  phone_number VARCHAR(15),
  birthdate VARCHAR(15),
  address VARCHAR(100),
  job VARCHAR(200),
  user_id INT,
  FOREIGN KEY(user_id) REFERENCES users(user_id));

 -- insert data from raw db to personal_info table
INSERT INTO personal_info(phone_number, birthdate, address, job, user_id)
SELECT phone_number, birthdate, address, job, user_id
FROM db_inda_musat_andra_raw;

-- display second staging table
SELECT * FROM personal_info LIMIT 15;

-- create economic_info table
CREATE TABLE economic_info(
  economic_id SERIAL PRIMARY KEY,
  iban VARCHAR(25),
  currency VARCHAR(15),
  user_id INT,
  FOREIGN KEY(user_id) REFERENCES users(user_id));
  
-- insert data from raw db to economic_info table
INSERT INTO economic_info(iban, currency, user_id)
SELECT iban, currency, user_id
FROM db_inda_musat_andra_raw;

-- display third staging table
SELECT * FROM economic_info LIMIT 15;

-- create computer_info table
CREATE TABLE computer_info(
  computer_id SERIAL PRIMARY KEY,
  mac_address VARCHAR(35),
  ip_address VARCHAR(35),
  user_id INT, 
  FOREIGN KEY(user_id) REFERENCES users(user_id));
  
-- insert data from raw db to computer_info table
INSERT into computer_info(mac_address, ip_address, user_id)
SELECT mac_address, ip_address, user_id
FROM db_inda_musat_andra_raw;

-- display fourth staging table
SELECT * FROM computer_info LIMIT 15;