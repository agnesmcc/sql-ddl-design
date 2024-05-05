-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  preferred_region TEXT REFERENCES regions(name) ON DELETE SET NULL
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users,
  title TEXT NOT NULL,
  text TEXT NOT NULL,
  location TEXT,
  region TEXT REFERENCES regions(name) ON DELETE SET NULL
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE posts_categories
(
  id SERIAL PRIMARY KEY,
  post_id INTEGER NOT NULL REFERENCES posts ON DELETE CASCADE,
  category TEXT NOT NULL REFERENCES categories(name) ON DELETE CASCADE
);


INSERT INTO regions
  (name)
VALUES
  ('San Francisco'),
  ('Atlanta'),
  ('Seattle');

INSERT INTO users
  (first_name, last_name, preferred_region)
VALUES
  ('Jennifer', 'Finch', NULL),
  ('Thadeus', 'Gathercoal', 'San Francisco'),
  ('Sonja', 'Pauley', 'Atlanta'),
  ('Jennifer', 'Finch', 'Seattle');

INSERT INTO categories
  (name)
VALUES
  ('Fun'),
  ('Not fun');
