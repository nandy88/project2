CREATE DATABASE ;

CREATE TABLE dishes (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200),
    image_url TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT
);

ALTER TABLE dishes ADD COLUMN user_id INTEGER;


ALTER TABLE users ADD COLUMN password_digest TEXT;