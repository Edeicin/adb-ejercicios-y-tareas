-- Ejercicio 6: Alumnos y Cursos (N:M)
CREATE DATABASE instituto CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER DATABASE instituto COLLATE utf8mb4_general_ci;

USE instituto;

CREATE TABLE profesores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE cursos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT
);

CREATE TABLE profesores_cursos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    profesor_id INT UNSIGNED,
    curso_id INT UNSIGNED,
    fecha_asignacion DATE NOT NULL,
    FOREIGN KEY (profesor_id) REFERENCES profesores(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

ALTER TABLE profesores_cursos ADD COLUMN horas_clase INT;
ALTER TABLE cursos MODIFY COLUMN nombre VARCHAR(200);
ALTER TABLE profesores_cursos DROP COLUMN horas_clase;
CREATE INDEX idx_nombre ON cursos(nombre);

INSERT INTO profesores (nombre) VALUES ('Juan Pérez');
INSERT INTO cursos (nombre, descripcion) VALUES ('Matemáticas', 'Curso de álgebra y geometría');
INSERT INTO profesores_cursos (profesor_id, curso_id, fecha_asignacion) VALUES (1, 1, CURDATE());

DROP DATABASE instituto;
