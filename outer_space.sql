-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space


CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  galaxy TEXT NOT NULL REFERENCES galaxies(name)
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL REFERENCES stars(name),
  galaxy TEXT NOT NULL REFERENCES galaxies(name)
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  planet TEXT NOT NULL REFERENCES planets(name),
  galaxy TEXT NOT NULL REFERENCES galaxies(name)
);

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');

INSERT INTO stars
  (name, galaxy)
VALUES
  ('The Sun', 'Milky Way'),
  ('Proxima Centauri', 'Milky Way'),
  ('Gliese 876', 'Milky Way');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way'),
  ('Mars', 1.88, 'The Sun', 'Milky Way'),
  ('Venus', 0.62, 'The Sun', 'Milky Way'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way');

INSERT INTO moons
  (name, planet, galaxy)
VALUES
  ('The Moon', 'Earth', 'Milky Way'),
  ('Phobos', 'Mars', 'Milky Way'),
  ('Deimos', 'Mars', 'Milky Way'),
  ('Naiad', 'Neptune', 'Milky Way'), 
  ('Thalassa', 'Neptune', 'Milky Way'), 
  ('Despina', 'Neptune', 'Milky Way'), 
  ('Galatea', 'Neptune', 'Milky Way'), 
  ('Larissa', 'Neptune', 'Milky Way'), 
  ('S/2004 N 1', 'Neptune', 'Milky Way'), 
  ('Proteus', 'Neptune', 'Milky Way'), 
  ('Triton', 'Neptune', 'Milky Way'), 
  ('Nereid', 'Neptune', 'Milky Way'), 
  ('Halimede', 'Neptune', 'Milky Way'), 
  ('Sao', 'Neptune', 'Milky Way'), 
  ('Laomedeia', 'Neptune', 'Milky Way'), 
  ('Psamathe', 'Neptune', 'Milky Way'), 
  ('Neso', 'Neptune', 'Milky Way');