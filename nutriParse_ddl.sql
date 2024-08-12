DROP DATABASE IF EXISTS nutriParse_ddl;

CREATE DATABASE nutriParse_ddl;

\c nutriParse_ddl

CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(150) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(256) NOT NULL
);

CREATE TABLE Recipes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES Users(id),
    title VARCHAR(200) NOT NULL,
    total_calories FLOAT,
    total_weight FLOAT
);

CREATE TABLE Ingredients (
    id SERIAL PRIMARY KEY,
    recipe_id INTEGER REFERENCES Recipes(id),
    food VARCHAR(200) NOT NULL,
    quantity FLOAT NOT NULL,
    measure VARCHAR(50),
    weight FLOAT,
    calories FLOAT
);

CREATE TABLE Nutrients (
    id SERIAL PRIMARY KEY,
    ingredient_id INTEGER REFERENCES Ingredients(id),
    label VARCHAR(100) NOT NULL,
    quantity FLOAT NOT NULL,
    unit VARCHAR(20) NOT NULL
);
