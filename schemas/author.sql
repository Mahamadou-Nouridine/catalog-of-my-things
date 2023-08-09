CREATE TABLE author (
  id SERIAl PRIMARY KEY,
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL
);

CREATE TABLE item (
  id SERIAl PRIMARY KEY,
  publish_date DATE NOT NULL,
  FOREIGN KEY (id) REFERENCES author (id)
);


