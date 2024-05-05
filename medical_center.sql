-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE patient_doctors
(
  id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patients,
  doctor_id INTEGER REFERENCES doctors
);

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE visit
(
  id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patients,
  doctor_id INTEGER REFERENCES doctors,
  disease_id INTEGER REFERENCES diseases
);


INSERT INTO doctors
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch');

INSERT INTO patients
  (first_name, last_name)
VALUES
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');

INSERT INTO diseases
  (name)
VALUES
  ('Stoneman Syndrome'),
  ('Alice In Wonderland Syndrome'),
  ('Hutchinson-Gilford Progeria Syndrome'),
  ('Alkaptonuria'),
  ('Chronic Focal Encephalitis');