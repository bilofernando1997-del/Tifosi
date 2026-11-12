-- ============================================
-- Projet Tifosi - script de creation de la base
-- ============================================

-- on supprime la base si elle existe deja
DROP DATABASE IF EXISTS tifosi;

CREATE DATABASE tifosi CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- creation de l'utilisateur admin tifosi
DROP USER IF EXISTS 'tifosi'@'localhost';
CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'Tifosi2026!';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

USE tifosi;

-- ----- tables principales -----

CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom_client VARCHAR(45) NOT NULL,
    age INT,
    cp_client INT
);

CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom_focaccia VARCHAR(45) NOT NULL,
    prix_focaccia FLOAT NOT NULL
);

CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom_ingredient VARCHAR(45) NOT NULL
);

CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom_marque VARCHAR(45) NOT NULL
);

-- une boisson appartient a une seule marque (1-1)
CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom_boisson VARCHAR(45) NOT NULL,
    id_marque INT NOT NULL,
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);

-- un menu est constitue d'une seule focaccia (1-1)
CREATE TABLE menu (
    id_menu INT AUTO_INCREMENT PRIMARY KEY,
    nom_menu VARCHAR(45) NOT NULL,
    prix_menu FLOAT NOT NULL,
    id_focaccia INT NOT NULL,
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);

-- ----- tables de liaison -----

-- focaccia <-> ingredient
CREATE TABLE comprend (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);

-- menu <-> boisson
CREATE TABLE contient (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    PRIMARY KEY (id_menu, id_boisson),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);

-- client achete une focaccia
CREATE TABLE achete (
    id_client INT NOT NULL,
    id_focaccia INT NOT NULL,
    jour DATE NOT NULL,
    PRIMARY KEY (id_client, id_focaccia, jour),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);

-- client paye un menu
CREATE TABLE paye (
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    jour DATE NOT NULL,
    PRIMARY KEY (id_client, id_menu, jour),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);
