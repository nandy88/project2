CREATE DATABASE which_captain_are_you;

CREATE TABLE captains (
    id SERIAL PRIMARY KEY,
    name TEXT,
    image_url TEXT,
    bio TEXT,
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    username TEXT,
    password_digest TEXT  
);

ALTER TABLE users ADD COLUMN captain_id INTEGER;





