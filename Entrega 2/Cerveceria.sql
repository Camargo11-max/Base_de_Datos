CREATE DATABASE cerveceria;
USE cerveceria;

CREATE TABLE materia_prima (
    id_materiap INT NOT NULL AUTO_INCREMENT,
    nombre_mp VARCHAR(30) NOT NULL,
    color_mp  VARCHAR(30) NOT NULL,
    sabor_mp  VARCHAR(30) NOT NULL,
    textura_mp VARCHAR(30) NOT NULL,
    aroma_mp VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id_materiap`)
);

CREATE TABLE cerveza_matprima (
    id_cer_matprima INT NOT NULL AUTO_INCREMENT,
    cantidad INT NOT NULL,
    unidad INT NOT NULL,
    id_materiap INT NOT NULL,
    id_cerveza INT NOT NULL,
    PRIMARY KEY (`id_cer_matprima`),
    FOREIGN KEY (`id_materiap`) REFERENCES `cerveceria`.`materia_prima` (`id_materiap`),
    FOREIGN KEY (`id_cerveza`) REFERENCES `cerveceria`.`cerveza` (`id_cerveza`)
);

CREATE TABLE cerveza (
    id_cerveza INT NOT NULL AUTO_INCREMENT,
    nombre_cer VARCHAR(30) NOT NULL,
    color_cer  VARCHAR(30) NOT NULL,
    sabor_cer VARCHAR(30) NOT NULL,
    textura_cer VARCHAR(30) NOT NULL,
    aroma_cer VARCHAR(30) NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (`id_cerveza`),
    FOREIGN KEY (`id_categoria`) REFERENCES `cerveceria`.`categoria` (`id_categoria`)
);

CREATE TABLE categoria (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre_cat VARCHAR(30) NOT NULL ,
    detalle VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id_categoria`)
);

CREATE TABLE tipo_categoria (
    id_tipo_cat INT NOT NULL AUTO_INCREMENT,
    nombre_tipo_cat VARCHAR(30) NOT NULL,
    categoria_id_categoria INT NOT NULL,
    id_tipo INT NOT NULL,
    FOREIGN KEY (`categoria_id_categoria`) REFERENCES `cerveceria`.`categoria` (`id_categoria`),
    FOREIGN KEY (`id_tipo`) REFERENCES `cerveceria`.`tipo` (`id_tipo`)
);

CREATE TABLE tipo (
    id_tipo INT NOT NULL AUTO_INCREMENT,
    nombre_tipo VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id_tipo`)
);
