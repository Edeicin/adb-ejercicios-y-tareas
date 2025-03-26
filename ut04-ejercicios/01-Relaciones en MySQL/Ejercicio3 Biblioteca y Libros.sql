-- Ejercicio 3: Biblioteca y Libros (1:N)
CREATE DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER DATABASE biblioteca COLLATE utf8mb4_general_ci;

USE biblioteca;

CREATE TABLE bibliotecas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE libros (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    biblioteca_id INT UNSIGNED,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    anio_publicacion YEAR NOT NULL,
    FOREIGN KEY (biblioteca_id) REFERENCES bibliotecas(id)
);

ALTER TABLE libros ADD COLUMN genero VARCHAR(50);
ALTER TABLE bibliotecas MODIFY COLUMN nombre VARCHAR(150);
ALTER TABLE libros DROP COLUMN genero;
ALTER TABLE libros ADD COLUMN isbn VARCHAR(20) AFTER titulo;
ALTER TABLE libros MODIFY COLUMN isbn CHAR(13);

INSERT INTO bibliotecas (nombre) VALUES ('Biblioteca Central');
INSERT INTO libros (biblioteca_id, titulo, autor, anio_publicacion) 
VALUES (1, 'El Quijote', 'Miguel de Cervantes', 1605);
INSERT INTO libros (biblioteca_id, titulo, autor, anio_publicacion) 
VALUES (1, '1984', 'George Orwell', 1949), (1, 'Cien años de soledad', 'Gabriel García Márquez', 1967);

SELECT libros.*, bibliotecas.nombre AS biblioteca 
FROM libros JOIN bibliotecas ON libros.biblioteca_id = bibliotecas.id;

SELECT * FROM bibliotecas WHERE id NOT IN (SELECT DISTINCT biblioteca_id FROM libros);
UPDATE libros SET anio_publicacion = 1950 WHERE titulo = '1984';
DELETE FROM libros WHERE id = 1;
DELETE FROM bibliotecas WHERE id = 1;

DESC libros;
DROP TABLE libros, bibliotecas;
DROP DATABASE biblioteca;
