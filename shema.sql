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

CREATE TABLE book(
  ID SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR(30) NOT NULL,
  cover_state VARCHAR(10) NOT NULL,
  author_ID INT,
  genre_ID INT,
  label_ID INT,
  FOREIGN KEY (label_ID) REFERENCES label(ID),
  FOREIGN KEY (author_ID) REFERENCES author(ID),
  FOREIGN KEY(genre_ID) REFERENCES genre(ID)
);

CREATE TABLE game (
     id SERIAl PRIMARY KEY,
     publish_date DATE NOT NULL,
     archived BOOLEAN,
     FOREIGN KEY (id) REFERENCES genre(id),
     FOREIGN KEY (id) REFERENCES author(id),
     FOREIGN KEY (id) REFERENCES label(id),
     FOREIGN KEY (id) REFERENCES source(id)
);

CREATE TABLE genre(
    id SERIAl PRIMARY KEY,
    name VARCHAR(100),
)

CREATE TABLE label(
  ID SERIAL PRIMARY KEY,
  title VARCHAR(50),
  color VARCHAR(30),
);

CREATE TABLE musicALbum (
    id SERIAL PRIMARY KEY,
    publish_date DATE,
    archived BOOLEAN,
    on_spotify BOOLEAN,
    genre_id INT,
    author_id INT,
    label_id INT,
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (label_id) REFERENCES label(id),
)
