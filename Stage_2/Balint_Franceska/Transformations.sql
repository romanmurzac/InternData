SELECT *
FROM db_inda_balint_franceska_raw
LIMIT 10;

ALTER TABLE db_inda_balint_franceska_raw
ADD COLUMN user_id SERIAL;

UPDATE db_inda_balint_franceska_raw
SET user_id = DEFAULT;

ALTER TABLE db_inda_balint_franceska_raw
ADD PRIMARY KEY(user_id);

CREATE TABLE users AS
SELECT user_id, last_name, first_name
FROM db_inda_balint_franceska_raw;

ALTER TABLE users
ADD PRIMARY KEY(user_id);

CREATE TABLE personal (
  personal_id SERIAL PRIMARY KEY,
  user_id INT,
  personal_number VARCHAR(13),
  birthdate VARCHAR(20),
  address VARCHAR(100),
  country VARCHAR(50),
  phone_number VARCHAR(20),
  FOREIGN KEY (user_id) REFERENCES users(user_id));

INSERT INTO personal(personal_number, birthdate, address, country, phone_number, user_id)
SELECT personal_number, birthdate, address, county, phone_number, user_id
FROM db_inda_balint_franceska_raw;

SELECT * FROM personal
LIMIT 100;

CREATE TABLE banking_info (
  bank_id SERIAL PRIMARY KEY,
  user_id INT,
  iban VARCHAR(34),
  FOREIGN KEY (user_id) REFERENCES users(user_id));

INSERT INTO banking_info(user_id, iban) 
  SELECT user_id, iban FROM db_inda_balint_franceska_raw;

CREATE TABLE computer_info (
  computer_id SERIAL PRIMARY KEY,
  user_id INT,
  mac_address VARCHAR(30),
  ip_address VARCHAR(30),
  FOREIGN KEY (user_id) REFERENCES users(user_id));

INSERT INTO computer_info(user_id, mac_address, ip_address)
  SELECT user_id, mac_address, ip_address
  FROM db_inda_balint_franceska_raw;
  drop table computer_info;

select * from computer_info
LIMIT 100;