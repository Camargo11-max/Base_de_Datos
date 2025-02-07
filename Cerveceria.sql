CREATE DATABASE cerveceria;
USE cerveceria;

CREATE TABLE materia_prima (
    id_materiap INT AUTO_INCREMENT PRIMARY KEY,
    nombre_mp varchar(40) NOT NULL,
    color_mp  varchar(20),
    sabor_mp varchar(30),
    textura_mp varchar(40),
    aroma_mp varchar(30)
);

CREATE TABLE cerveza_matprima (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cantidad INT NOT NULL,
    unidad INT NOT NULL,
    id_materiap INT NOT NULL,
    id_cerveza INT NOT NULL,
    FOREING KEY (id_materiap) REFERENCES materia_prima (id_materiap), 
    FOREING KEY (id_cerveza) REFERENCES materia_prima (id_cerveza)
);

CREATE TABLE cerveza (
    id_cerveza INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cer varchar(40) NOT NULL,
    color_cer  varchar(20),
    sabor_cer varchar(30),
    textura_cer varchar(40),
    aroma_cer varchar(30),
    id_categoria INT NOT NULL,
    FOREING KEY (id_categoria) REFERENCES categoria (id_categoria)
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cat varchar (30) NOT NULL ,
    detalle varchar (40) NOT NULL
);

CREATE TABLE tipo_categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    id_tipo INT NOT NULL,
    FOREING KEY (id_tipo) REFERENCES tipo (id_tipo),
    FOREING KEY (id_categoria) REFERENCES categoria (id_categoria)
);

CREATE TABLE tipo (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo varchar(30) NOT NULL
);
