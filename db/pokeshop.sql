DROP TABLE IF EXISTS pokemon;
DROP TABLE IF EXISTS owners;


CREATE TABLE trainers (
  id SERIAL8 primary key,
  name VARCHAR(255)
  );

CREATE TABLE pokemon (
  id SERIAL8 primary key,
  name VARCHAR(255),
  breed VARCHAR(255),
  date_arrived DATE,
  trainerid SERIAL8 references trainers(id)
  );