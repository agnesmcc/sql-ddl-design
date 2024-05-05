-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  release_date DATE NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album TEXT NOT NULL REFERENCES albums(name)
);

CREATE TABLE collaborations
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER NOT NULL REFERENCES songs,
  producer_id INTEGER REFERENCES producers,
  artist_id INTEGER REFERENCES artists
);


-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');

INSERT INTO artists
  (name)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'), 
  ('Boyz II Men'),
  ('Lady Gaga'), 
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'), 
  ('Alicia Keys'),
  ('Katy Perry'), 
  ('Juicy J'),
  ('Maroon 5'), 
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

INSERT INTO producers
  (name)
VALUES
  ('Dust Brothers'), 
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'), 
  ('Cirkut'),
  ('Shellback'), 
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

INSERT INTO albums
  (name, release_date)
VALUES
  ('Middle of Nowhere', '04-15-1997'),
  ('A Night at the Opera', '10-31-1975' ),
  ('Daydream', '11-14-1995'),
  ('A Star Is Born', '09-27-2018'),
  ('Silver Side Up', '08-21-2001'),
  ('The Blueprint 3', '10-20-2009'),
  ('Prism', '12-17-2013'),
  ('Hands All Over', '06-21-2011'),
  ('Let Go', '05-14-2002'),
  ('The Writing''s on the Wall', '11-07-1999');

INSERT INTO songs
  (title, duration_in_seconds, album)
VALUES
  ('MMMBop', 238, 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, 'A Night at the Opera'),
  ('One Sweet Day', 282, 'Daydream'),
  ('Shallow', 216, 'A Star Is Born'),
  ('How You Remind Me', 223, 'Silver Side Up'),
  ('New York State of Mind', 276, 'The Blueprint 3'),
  ('Dark Horse', 215, 'Prism'),
  ('Moves Like Jagger', 201, 'Hands All Over'),
  ('Complicated', 244, 'Let Go'),
  ('Say My Name', 240, 'The Writing''s on the Wall');

INSERT INTO collaborations
  (song_id, producer_id, artist_id)
VALUES
  (1, 1, NULL),
  (1, 2, NULL),
  (1, NULL, 1),
  (2, 3, NULL),
  (2, NULL, 2),
  (3, 4, NULL),
  (3, NULL, 3),
  (3, NULL, 4),
  (4, 5, NULL),
  (4, NULL, 5),
  (4, NULL, 6),
  (5, 6, NULL),
  (5, NULL, 7),
  (6, 7, NULL),
  (6, NULL, 8),
  (6, NULL, 9),
  (7, 8, NULL),
  (7, 9, NULL),
  (7, NULL, 10),
  (7, NULL, 11),
  (8, 10, NULL),
  (8, 11, NULL),
  (8, NULL, 12),
  (8, NULL, 13),
  (9, 12, NULL),
  (9, NULL, 14),
  (10, 13, NULL),
  (10, NULL, 15);
