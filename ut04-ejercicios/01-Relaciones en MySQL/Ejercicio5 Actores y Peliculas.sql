-- Ejercicio 5: Actores y Películas (N:M)
CREATE DATABASE cine CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER DATABASE cine COLLATE utf8mb4_general_ci;

USE cine;

CREATE TABLE actores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE peliculas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    anio_estreno YEAR NOT NULL
);

CREATE TABLE actores_peliculas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    actor_id INT UNSIGNED,
    pelicula_id INT UNSIGNED,
    personaje VARCHAR(100) NOT NULL,
    FOREIGN KEY (actor_id) REFERENCES actores(id),
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(id)
);

ALTER TABLE actores_peliculas ADD COLUMN salario DECIMAL(10,2);
ALTER TABLE actores MODIFY COLUMN nombre VARCHAR(150);
ALTER TABLE actores_peliculas DROP COLUMN salario;
CREATE INDEX idx_titulo ON peliculas(titulo);

INSERT INTO actores (nombre) VALUES ('Leonardo DiCaprio');
INSERT INTO peliculas (titulo, anio_estreno) VALUES ('Titanic', 1997);
INSERT INTO actores_peliculas (actor_id, pelicula_id, personaje) VALUES (1, 1, 'Jack Dawson');

DROP DATABASE cine;

