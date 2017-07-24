-- psql -a -f db/migrations.sql

CREATE DATABASE cookbooks;

\c cookbooks;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  password_digest VARCHAR(255),
  image_url VARCHAR(255)
);

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  instructions VARCHAR(255),
  user_id INT references users(id)
);

ALTER TABLE recipes ADD name VARCHAR(255);
ALTER TABLE recipes ADD image_url VARCHAR(255);
