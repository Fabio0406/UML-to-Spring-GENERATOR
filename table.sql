-- =====================================================================
-- UML to Spring Generator — esquema de la base de datos (MySQL 8)
--
-- Uso:
--   mysql -u root -p < table.sql
--
-- Crea la base "sw" (la que usa database/db.js por defecto; cámbiala aquí y en
-- DB_DATABASE si quieres otro nombre). Se puede volver a ejecutar.
-- =====================================================================

SET NAMES utf8mb4;   -- para que la ñ y los acentos se guarden bien

CREATE DATABASE IF NOT EXISTS sw CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE sw;

DROP TABLE IF EXISTS proyecto;
DROP TABLE IF EXISTS users;

-- Usuarios
CREATE TABLE users (
    id   INT NOT NULL AUTO_INCREMENT,
    user VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    rol  VARCHAR(20)  NOT NULL,
    pass VARCHAR(255) NOT NULL,      -- hash bcrypt
    PRIMARY KEY (id)
) ENGINE = InnoDB;

-- Proyectos (pizarras). "link" es el código para compartir la pizarra
-- y "objetos" guarda el diagrama como JSON.
CREATE TABLE proyecto (
    id      INT NOT NULL AUTO_INCREMENT,
    name    VARCHAR(50)  NOT NULL,
    link    VARCHAR(255) NOT NULL UNIQUE,
    user_id INT NOT NULL,
    objetos JSON DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE = InnoDB;
