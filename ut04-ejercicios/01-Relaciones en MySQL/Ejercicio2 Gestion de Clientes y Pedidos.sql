-- Crear la base de datos hospital con utf8mb4_unicode_ci
CREATE DATABASE hospital CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Cambiar la collation de la base de datos hospital a utf8mb4_general_ci
ALTER DATABASE hospital COLLATE = utf8mb4_general_ci;

-- Crear la tabla pacientes
CREATE TABLE pacientes (
    id UNSIGNED INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Crear la tabla historias_clinicas
CREATE TABLE historias_clinicas (
    paciente_id UNSIGNED INT PRIMARY KEY,
    diagnostico TEXT NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
) ENGINE=InnoDB;

-- Modificar la tabla historias_clinicas agregando la columna tratamiento
ALTER TABLE historias_clinicas ADD COLUMN tratamiento TEXT;

-- Cambiar el tamaño del campo nombre en la tabla pacientes a 150 caracteres
ALTER TABLE pacientes MODIFY nombre VARCHAR(150) NOT NULL;

-- Agregar la columna telefono en la tabla pacientes
ALTER TABLE pacientes ADD telefono VARCHAR(15) AFTER nombre;

-- Cambiar el tipo de dato de telefono en la tabla pacientes a BIGINT
ALTER TABLE pacientes MODIFY telefono BIGINT;

-- Eliminar la columna telefono de la tabla pacientes
ALTER TABLE pacientes DROP COLUMN telefono;

-- Insertar un paciente llamado "Juan Pérez"
INSERT INTO pacientes (nombre) VALUES ('Juan Pérez');

-- Insertar una historia clínica con diagnóstico "Hipertensión" para el paciente "Juan Pérez"
INSERT INTO historias_clinicas (paciente_id, diagnostico) VALUES (1, 'Hipertensión');

-- Insertar dos pacientes adicionales ("Ana Gómez" y "Carlos Ruiz")
INSERT INTO pacientes (nombre) VALUES ('Ana Gómez'), ('Carlos Ruiz');

-- Añadir historias clínicas para los nuevos pacientes
INSERT INTO historias_clinicas (paciente_id, diagnostico) VALUES (2, 'Gripe'), (3, 'Dolor de espalda');

-- Consultar todas las historias clínicas junto con el nombre del paciente
SELECT p.nombre, h.diagnostico FROM pacientes p
JOIN historias_clinicas h ON p.id = h.paciente_id;

-- Mostrar todos los pacientes que no tienen historia clínica registrada
SELECT p.nombre FROM pacientes p
LEFT JOIN historias_clinicas h ON p.id = h.paciente_id
WHERE h.paciente_id IS NULL;

-- Actualizar el diagnóstico de "Juan Pérez"
UPDATE historias_clinicas SET diagnostico = 'Hipertensión crónica' WHERE paciente_id = 1;

-- Eliminar la historia clínica de "Carlos Ruiz"
DELETE FROM historias_clinicas WHERE paciente_id = 3;

-- Consultar la estructura de la tabla historias_clinicas
DESCRIBE historias_clinicas;

-- Eliminar las tablas historias_clinicas y pacientes
DROP TABLE IF EXISTS historias_clinicas, pacientes;

-- Eliminar la base de datos hospital
DROP DATABASE IF EXISTS hospital;
