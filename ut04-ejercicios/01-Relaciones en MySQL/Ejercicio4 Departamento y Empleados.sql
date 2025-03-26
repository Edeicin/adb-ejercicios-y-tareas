-- Ejercicio 4: Departamento y Empleados (1:N)
CREATE DATABASE universidad CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER DATABASE universidad COLLATE utf8mb4_general_ci;

USE universidad;

CREATE TABLE alumnos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE asignaturas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE matriculas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    alumno_id INT UNSIGNED,
    asignatura_id INT UNSIGNED,
    fecha_matricula DATE NOT NULL,
    FOREIGN KEY (alumno_id) REFERENCES alumnos(id),
    FOREIGN KEY (asignatura_id) REFERENCES asignaturas(id)
);

ALTER TABLE matriculas ADD COLUMN nota DECIMAL(4,2);
ALTER TABLE asignaturas MODIFY COLUMN nombre VARCHAR(150);
ALTER TABLE matriculas DROP COLUMN nota;
CREATE INDEX idx_nombre ON asignaturas(nombre);

INSERT INTO alumnos (nombre) VALUES ('Luis Gómez');
INSERT INTO asignaturas (nombre) VALUES ('Matemáticas');
INSERT INTO matriculas (alumno_id, asignatura_id, fecha_matricula) VALUES (1,  CURDATE());

INSERT INTO alumnos (nombre) VALUES ('María Fernández'), ('Carlos Ruiz');
INSERT INTO asignaturas (nombre) VALUES ('Física', 'Historia', 'Química');
INSERT INTO matriculas (alumno_id, asignatura_id, fecha_matricula) VALUES (2, 2, CURDATE()), (3, 3, CURDATE());

SELECT asignaturas.* FROM asignaturas 
JOIN matriculas ON asignaturas.id = matriculas.asignatura_id
JOIN alumnos ON alumnos.id = matriculas.alumno_id
WHERE alumnos.nombre = 'Luis Gómez';

DELETE FROM matriculas WHERE alumno_id = 1 AND asignatura_id = 1;
DELETE FROM alumnos WHERE id = 1;
DROP DATABASE universidad;

