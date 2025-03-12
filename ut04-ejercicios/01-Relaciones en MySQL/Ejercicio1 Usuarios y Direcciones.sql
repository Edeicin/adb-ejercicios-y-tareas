-- Crear la base de datos usuarios_db con utf8mb4_unicode_ci
CREATE DATABASE usuarios_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Cambiar la collation de la base de datos usuarios_db a utf8mb4_general_ci
ALTER DATABASE usuarios_db COLLATE = utf8mb4_general_ci;

-- Crear la tabla usuarios
CREATE TABLE usuarios (
    id UNSIGNED INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Crear la tabla direcciones
CREATE TABLE direcciones (
    id UNSIGNED INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id UNSIGNED INT UNIQUE,
    direccion VARCHAR(255) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
) ENGINE=InnoDB;

-- Modificar la tabla direcciones para que usuario_id sea la clave primaria
ALTER TABLE direcciones DROP PRIMARY KEY, ADD PRIMARY KEY (usuario_id), ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id);

-- Cambiar el tamaño del campo nombre en la tabla usuarios a 150 caracteres
ALTER TABLE usuarios MODIFY nombre VARCHAR(150) NOT NULL;

-- Agregar la columna telefono en la tabla usuarios
ALTER TABLE usuarios ADD telefono VARCHAR(15) AFTER nombre;

-- Cambiar el tipo de dato de telefono en la tabla usuarios a BIGINT
ALTER TABLE usuarios MODIFY telefono BIGINT;

-- Eliminar la columna telefono de la tabla usuarios
ALTER TABLE usuarios DROP COLUMN telefono;

-- Insertar un usuario llamado "Juan Pérez"
INSERT INTO usuarios (nombre) VALUES ('Juan Pérez');

-- Insertar una dirección para el usuario "Juan Pérez"
INSERT INTO direcciones (usuario_id, direccion) VALUES (1, 'Calle Mayor 123');

-- Insertar dos usuarios adicionales ("Ana Gómez" y "Carlos Ruiz")
INSERT INTO usuarios (nombre) VALUES ('Ana Gómez'), ('Carlos Ruiz');

-- Añadir direcciones para los nuevos usuarios
INSERT INTO direcciones (usuario_id, direccion) VALUES (2, 'Calle Secundaria 456'), (3, 'Avenida Principal 789');

-- Consultar todas las direcciones junto con el nombre del usuario
SELECT u.nombre, d.direccion FROM usuarios u
JOIN direcciones d ON u.id = d.usuario_id;

-- Mostrar todos los usuarios que no tienen dirección registrada
SELECT u.nombre FROM usuarios u
LEFT JOIN direcciones d ON u.id = d.usuario_id
WHERE d.usuario_id IS NULL;

-- Actualizar la dirección de "Juan Pérez"
UPDATE direcciones SET direccion = 'Avenida Central 456' WHERE usuario_id = 1;

-- Eliminar la dirección de "Carlos Ruiz"
DELETE FROM direcciones WHERE usuario_id = 3;

-- Consultar la estructura de la tabla direcciones
DESCRIBE direcciones;

-- Eliminar las tablas direcciones y usuarios
DROP TABLE IF EXISTS direcciones, usuarios;

-- Eliminar la base de datos usuarios_db
DROP DATABASE IF EXISTS usuarios_db;
