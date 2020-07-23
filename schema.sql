CREATE DATABASE which_captain_are_you;

CREATE TABLE captains (
    id SERIAL PRIMARY KEY,
    name TEXT,
    image_url TEXT,
    bio TEXT,
    user_id INTEGER
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    username TEXT,
    password_digest TEXT  
);
