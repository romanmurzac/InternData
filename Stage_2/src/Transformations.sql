-- Display initial raw DB
SELECT *
FROM db_inda_murzac_roman_raw
LIMIT 10;

-- Add a new column
ALTER TABLE db_inda_murzac_roman_raw
ADD COLUMN user_id SERIAL;

-- Populate new column with unique values
UPDATE db_inda_murzac_roman_raw
SET user_id = DEFAULT;

-- Set the new column as a primary key
ALTER TABLE db_inda_murzac_roman_raw
ADD PRIMARY KEY(user_id);

-- Create Users table
CREATE TABLE Users AS
SELECT user_id, last_name, first_name
FROM db_inda_murzac_roman_raw;

-- Set the new column as a primary key
ALTER TABLE users
ADD PRIMARY KEY(user_id);

-- Display first staging table
SELECT *
FROM users
LIMIT 100;

-- Create Personal table
CREATE TABLE Personal (
  personal_id SERIAL PRIMARY KEY,
  personal_number VARCHAR(13),
  birthdate VARCHAR(20),
  address VARCHAR(200),
  phone_number VARCHAR(20),
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users(user_id));
  
-- Insert data from Raw DB to Personal table
INSERT INTO personal(personal_number, birthdate, address, phone_number, user_id)
SELECT personal_number, birthdate, address, phone_number, user_id
FROM db_inda_murzac_roman_raw;

-- Display second staging table
SELECT *
FROM personal
LIMIT 100;

-- Create Computer table
CREATE TABLE Computer (
  comp_id SERIAL PRIMARY KEY,
  ip_address VARCHAR(50),
  mac_address VARCHAR(50),
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users(user_id));
  
-- Insert data from Raw DB to Computer table
INSERT INTO computer(ip_address, mac_address, user_id)
SELECT ip_address, mac_address, user_id
FROM db_inda_murzac_roman_raw;

-- Display third staging table
SELECT *
FROM computer
LIMIT 100;

-- Create Economic table
CREATE TABLE Economic (
  bank_id SERIAL PRIMARY KEY,
  iban VARCHAR(50),
  currency VARCHAR(50),
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users(user_id));
  
-- Insert data from Raw DB to Economic table
INSERT INTO economic(iban, currency, user_id)
SELECT iban, currency, user_id
FROM db_inda_murzac_roman_raw;

-- Display fourth staging table
SELECT *
FROM economic
LIMIT 100;