-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country TEXT NOT NULL REFERENCES countries(name)
);

CREATE TABLE travelers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL REFERENCES airlines(name)
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  traveler_id INTEGER NOT NULL REFERENCES travelers,
  seat TEXT NOT NULL,
  flight_id INTEGER NOT NULL REFERENCES flights,
  from_city_id INTEGER NOT NULL REFERENCES cities,
  to_city_id INTEGER NOT NULL REFERENCES cities
);


-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');


INSERT INTO countries
  (name)
VALUES
  ('United States'),
  ('United Kingdom'),
  ('Mexico'),
  ('Morocco'),
  ('China'),
  ('Chile'),
  ('Japan'),
  ('France'),
  ('UAE'),
  ('Brazil');

INSERT INTO airlines
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('Chile'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO travelers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO flights
  (departure, arrival, airline)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United'),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways'),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta'),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta'),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium'),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China'),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United'),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines'),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines'),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil');

INSERT INTO cities
  (name, country)
VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Paris', 'France'),
  ('Casablanca', 'Morocco'),
  ('Dubai', 'UAE'),
  ('Beijing', 'China'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('Santiago', 'Chile');

INSERT INTO tickets
  (traveler_id, seat, flight_id, from_city_id, to_city_id)
VALUES
  (1, '33B', 1, 1, 2),
  (2, '8A', 2, 3, 4),
  (3, '12F', 3, 5, 6),
  (1, '20A', 4, 2, 7),
  (4, '23D', 5, 8, 9),
  (2, '18C', 6, 10, 11),
  (5, '9E', 7, 12, 13),
  (6, '1A', 8, 14, 15),
  (5, '32B', 9, 13, 16),
  (7, '10D', 10, 17, 18);