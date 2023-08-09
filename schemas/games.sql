CREATE TABLE game (
     id SERIAl PRIMARY KEY,
     publish_date DATE NOT NULL,
     archived BOOLEAN,
     FOREIGN KEY (id) REFERENCES genre(id),
     FOREIGN KEY (id) REFERENCES author(id),
     FOREIGN KEY (id) REFERENCES label(id),
     FOREIGN KEY (id) REFERENCES label(id)
);