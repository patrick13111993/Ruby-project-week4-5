DROP TABLE IF EXISTS pokemon;
DROP TABLE IF EXISTS owners;


CREATE TABLE owners (
  id SERIAL8 primary key,
  name VARCHAR(255)
  );

CREATE TABLE pokemon (
  id SERIAL8 primary key,
  pokeid SERIAL8 references pokemon(id),
  name VARCHAR(255),
  breed VARCHAR(255),
  date_arrived DATE
  );