DROP DATABASE IF EXISTS dbGamarraMarket;
CREATE DATABASE dbGamarraMarket
DEFAULT CHARACTER SET utf8;

USE dbGamarraMarket;
/*
/*tabla cliente*/
CREATE TABLE CLIENTE (
    id int  NOT NULL,
    tipo_documento char(3)  NOT NULL,
    numero_documento char(15)  NOT NULL,
    nombres varchar(60)  NOT NULL,
    apellidos varchar(90)  NOT NULL,
    email varchar(80)  NULL,
    celular char(9)  NULL,
    fecha_nacimiento date  NOT NULL,
    activo bool  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY (id)
);
SHOW COLUMNS IN CLIENTE;

CREATE TABLE PRENDA (
    id int  NOT NULL,
    descripcion varchar(90)  NOT NULL,
    marca varchar(60)  NOT NULL,
    cantidad int  NOT NULL,
    talla varchar(10)  NOT NULL,
    precio decimal(8,2)  NOT NULL,
    activo bool  NOT NULL,
    CONSTRAINT PRENDA_pk PRIMARY KEY (id)
);
SHOW COLUMNS IN PRENDA;

CREATE TABLE VENDEDOR (
    id int  NOT NULL,
    tipo_documento char(3)  NOT NULL,
    numero_documento char(15)  NOT NULL,
    nombres varchar(60)  NOT NULL,
    apellidos varchar(90)  NOT NULL,
    salario decimal(8,2)  NOT NULL,
    celular char(9)  NULL,
    email varchar(80)  NULL,
    activo bool  NOT NULL,
    CONSTRAINT VENDEDOR_pk PRIMARY KEY (id)
);
SHOW COLUMNS IN VENDEDOR;

CREATE TABLE VENTA (
    id int  NOT NULL,
    fecha_hora timestamp  NOT NULL,
    activo bool  NOT NULL,
    cliente_id int  NOT NULL,
    vendedor_id int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY (id)
);
SHOW COLUMNS IN VENTA;

CREATE TABLE VENTA_DETALLE (
    id int  NOT NULL,
    cantidad int  NOT NULL,
    venta_id int  NOT NULL,
    prenda_id int  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (id)
);
SHOW COLUMNS IN VENTA_DETALLE;
SHOW TABLES;
DROP TABLE CLIENTE;
/*CREAR RELACIONES*/
/*CLIENTE_VENTA*/
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY VENTA_CLIENTE (cliente_id)
    REFERENCES CLIENTE (id);
/*VENTA_DETALLE_PRENDA*/
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRENDA FOREIGN KEY VENTA_DETALLE_PRENDA (prenda_id)
    REFERENCES PRENDA (id);
/*VENTA_DETALLE_VENTA*/
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY VENTA_DETALLE_VENTA (venta_id)
    REFERENCES VENTA (id);
/*VENTA_VENDEDOR*/
ALTER TABLE VENTA ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY VENTA_VENDEDOR (vendedor_id)
    REFERENCES VENDEDOR (id);
/* Listar relaciones de tablas de la base de datos activa */
SELECT 
    i.constraint_name, k.table_name, k.column_name, 
    k.referenced_table_name, k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();

/*INSERTAR DATOS EN LA BASE DE DATOS*/






