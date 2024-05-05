-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  ranking INTEGER NOT NULL UNIQUE
);

CREATE TABLE seasons
(
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE games
(
  id SERIAL PRIMARY KEY,
  team_one_name TEXT REFERENCES teams(name),
  team_two_name TEXT REFERENCES teams(name),
  season_id INTEGER REFERENCES seasons
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  team_name TEXT REFERENCES teams(name)
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  time_of_goal TIMESTAMP NOT NULL,
  player_id INTEGER REFERENCES players,
  game_id INTEGER REFERENCES games
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  game_id INTEGER REFERENCES games
);

-- seed data

INSERT INTO teams
  (name, ranking)
VALUES
  ('Alligators', 1),
  ('Flamingos', 2),
  ('Pandas', 3);

INSERT INTO players
  (first_name, last_name, team_name)
VALUES
  ('Jennifer', 'Finch', NULL),
  ('Thadeus', 'Gathercoal', 'Alligators'),
  ('Sonja', 'Pauley', 'Flamingos'),
  ('Jennifer', 'Smith', 'Pandas');

  INSERT INTO referees
  (first_name, last_name)
VALUES
  ('Thadeus', 'Finch'),
  ('Jennifer', 'Gathercoal'),
  ('Jennifer', 'Pauley'),
  ('Sonja', 'Smith');
