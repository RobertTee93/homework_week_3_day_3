DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  age int2
);

CREATE TABLE albums(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  genre VARCHAR(255),
  release_year INT2,
  artist_id INT4 REFERENCES artists(id)
);
