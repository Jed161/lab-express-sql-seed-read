-- Creating DB and Table

DROP DATABASE IF EXISTS songs_dev;
-- DROP TABLE IF EXISTS songs;
-- DROP TABLE IF EXISTS reviews;


CREATE DATABASE songs_dev;

\c songs_dev;

CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    url TEXT,
    category TEXT,
    description TEXT,
    is_favorite BOOLEAN
);

CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    reviewer TEXT,
    title TEXT,
    content TEXT,
    rating NUMERIC,
    CHECK (rating >= 0 AND rating <= 5),
    song_id INTEGER REFERENCES songs (id)
    ON DELETE CASCADE
);