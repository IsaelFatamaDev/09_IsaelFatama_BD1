-- Active: 1698352821439@@127.0.0.1@3306@handslabs

-- Laboratorio Practico EN06

-- ALUMNO: Isael Javier Fatama Godoy

-- Segundo Semestre - Análisis de Sistemas

-- Periodo: AS231_BDI

-- Monito: Jesús Canales Guando

/* 01. Crear la base de datos HandsLabs, ponerla en uso y verificar en pantalla su existencia. */

DROP DATABASE IF EXISTS HandsLabs;

CREATE DATABASE HandsLabs;

USE HandsLabs;

SELECT DATABASE();

/* 02. Crear la tabla CLIENTE teniendo como referencia lo siguiente: */

CREATE TABLE
    CLIENTE (
        codigo CHAR(3),
        nombres VARCHAR(70),
        apellidos VARCHAR(90),
        dni CHAR(8),
        email VARCHAR(70),
        estado CHAR(1) DEFAULT 'A',
        CONSTRAINT PK_CLIENTE PRIMARY KEY (codigo)
    );

-- El campo código debe empezar con la letra C y dos dígitos numéricos. */

ALTER TABLE cliente
ADD
    CONSTRAINT codigo_cliente CHECK(codigo REGEXP '^[C][0-9][0-9]');

-- Los datos de DNI y Correo Electrónico deben ser valores únicos. */

ALTER TABLE cliente ADD CONSTRAINT dni_unico UNIQUE(dni);

ALTER TABLE cliente ADD CONSTRAINT email_unico UNIQUE(email);

-- El campo DNI solamente debe aceptar 8 dígitos numéricos. */

ALTER TABLE cliente
ADD
    CONSTRAINT dni_valido CHECK(dni REGEXP '^[0-9]{8}');

-- Se debe permitir el ingreso sólamente de correos válidos. */

ALTER TABLE cliente
ADD
    CONSTRAINT chk_correo_VALIDO CHECK (
        email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$'
    );

/* INSERTAR REGISTROS */

INSERT INTO
    cliente (
        codigo,
        nombres,
        apellidos,
        dni,
        email
    )
VALUES (
        'C01',
        'Eugenio',
        'BARRIOS PALOMINO',
        '78451211',
        'eugenio@yahoo.com'
    ), (
        'C02',
        'Carolina',
        'TARAZONA MEZA',
        '78451212',
        'carolina.tarazona@yahoo.com'
    ), (
        'C03',
        'Roberto',
        'MARTÍNEZ CAMPOS',
        '74125898',
        'roberto.martinez@gmail.com'
    ), (
        'C04',
        'Claudia',
        'RODRIGUEZ GUERRA',
        '15253698',
        'claudia.rodriguez@outlook.com'
    ), (
        'C05',
        'JULIO',
        'HUAMÁN PÉREZ',
        '45123698',
        'julio.huaman@gmail.com'
    ), (
        'C06',
        'Marcos',
        'MANCO ÁVILA',
        '45781236',
        'marcos.manco@yahoo.com'
    ), (
        'C07',
        'Micaela',
        'TAIPE ORMEÑO',
        '45127733',
        'micaela.taipe@gmail.com'
    ), (
        'C08',
        'Pedro',
        'ORÉ VASQUEZ',
        '15253398',
        'pedro.ore@gmail.com'
    ), (
        'C09',
        'Yolanda',
        'PALOMINO FARFÁN',
        '15223364',
        'yolanda.palomino@outlook.com'
    ), (
        'C10',
        'Luisa',
        'SÁNCHEZ ROMERO',
        '11223365',
        'luisa.sanchez@gmail.com'
    );

SELECT * FROM cliente;

SELECT
    codigo as 'Código',
    CONCAT(
        UPPER(apellidos),
        ', ',
        nombres
    ) as 'Cliente',
    dni as 'DNI',
    email as 'Email'
FROM cliente;

-- Al momento de ingresar datos de clientes el estado es Activo (tenerlo presente en el borrado lógico) */

/* 03. Crear la tabla EMPLEADO teniendo como referencia lo siguiente: */

-- El campo código, clave principal, debe empezar con la letra E y dos dígitos numéricos. */

-- El tipo de empleado es V (vendedor) y A (administrador), no existe otro tipo. */

-- El estado civil es S (soltero), C (casado) y  D (divorciado), no existe otro tipo. */

-- Sólo se debe permitir correos únicos y válidos. */

-- El sexo es M (masculino) y F (femenino) */

-- El número de horas de trabajo mensual máximo es 160. */

-- El estado sólo debe permitir A (activo) e I (inactivo), no se admite otro tipo de estado. */

-- El pago por hora es máximo de S/. 12.00 */

DROP TABLE EMPLEADO;

CREATE TABLE
    EMPLEADO (
        Codigo CHAR(3),
        Nombres VARCHAR(80),
        Apellidos VARCHAR(70),
        TipoEmpleado CHAR(1),
        EstadoCivil CHAR(1),
        Email VARCHAR(80),
        Sexo CHAR(1),
        NumHoras INT,
        Estado CHAR(1),
        PagoPorHora DECIMAL(6, 2),
        CONSTRAINT PK_EMPLEADO PRIMARY KEY (Codigo),
        CONSTRAINT CHK_codigo_formato CHECK (Codigo REGEXP '^E[0-9]{2}$'),
        CONSTRAINT CHK_tipo_empleado CHECK (TipoEmpleado IN ('V', 'A')),
        CONSTRAINT CHK_estado_civil CHECK (EstadoCivil IN ('S', 'C', 'D')),
        CONSTRAINT UQ_email UNIQUE (Email),
        CONSTRAINT CHK_email_format CHECK (
            Email REGEXP '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$'
        ),
        CONSTRAINT CHK_sexo CHECK (Sexo IN ('M', 'F')),
        CONSTRAINT CHK_horas_trabajo CHECK (NumHoras <= 160),
        CONSTRAINT CHK_estado CHECK (Estado IN ('A', 'I')),
        CONSTRAINT CHK_pago_por_hora CHECK (PagoPorHora <= 12.00)
    );

INSERT INTO
    EMPLEADO (
        Codigo,
        Nombres,
        Apellidos,
        TipoEmpleado,
        EstadoCivil,
        Email,
        Sexo,
        NumHoras,
        Estado,
        PagoPorHora
    )
VALUES (
        'E01',
        'Eulalio',
        'MARTÍNEZ OCARES',
        'V',
        'S',
        'eulalio.martinez@laempresa.com',
        'M',
        120,
        'A',
        10
    ), (
        'E02',
        'Maria',
        'LOMBARDI GUERRA',
        'V',
        'C',
        'maria.lombardi@laempresa.com',
        'F',
        110,
        'A',
        12
    ), (
        'E03',
        'Bruno',
        'RODRIGUEZ ROJAS',
        'A',
        'S',
        'bruno.rodriguez@laempresa.com',
        'M',
        160,
        'A',
        12
    ), (
        'E04',
        'Bernardo',
        'PARRA GRAU',
        'A',
        'C',
        'bernardo.parra@laempresa.com',
        'M',
        160,
        'A',
        12
    ), (
        'E05',
        'Yolanda',
        'BENAVIDES CENTENO',
        'V',
        'C',
        'yolanda.benavides@laempresa.com',
        'F',
        100,
        'A',
        8
    ), (
        'E06',
        'Fabiana',
        'OSCORIMA PEÑA',
        'V',
        'S',
        'fabiana.oscorima@laempresa.com',
        'F',
        125,
        'A',
        8
    );

SELECT
    Codigo AS 'CÓDIGO',
    CONCAT(Apellidos, ', ', Nombres) AS 'EMPLEADO',
    CASE TipoEmpleado
        WHEN 'V' THEN 'Vendedor'
        WHEN 'A' THEN 'Administrador'
        ELSE 'TIPO EMPLEADO'
    END AS 'TIPO EMPLEADO',
    CASE EstadoCivil
        WHEN 'S' THEN 'Soltero'
        WHEN 'C' THEN 'Casado'
        WHEN 'D' THEN 'Divorciado'
        ELSE 'ESTADO CIVIL'
    END AS 'ESTADO CIVIL',
    Email AS 'EMAIL',
    CASE Sexo
        WHEN 'M' THEN 'Masculino'
        WHEN 'F' THEN 'Femenino'
        ELSE 'SEXO'
    END AS 'SEXO',
    NumHoras AS 'NUM. HORAS',
    Estado AS 'ESTADO',
    CONCAT('S/. ', PagoPorHora) AS 'PAG. X HORA'
FROM EMPLEADO;

SELECT * FROM EMPLEADO;

/* 04. Crear la tabla PRODUCTO teniendo como referencia lo siguiente: */

-- El campo código, clave principal, debe empezar con la letra P y dos dígitos numéricos. */

-- El stock y precio no debe ser nulo y el valor por defecto es 0. */

-- El estado sólo permite A (activo) e I (inactivo) no se permite ninguna otra letra, por defecto es A. */

DROP TABLE PRODUCTO;

CREATE TABLE
    PRODUCTO (
        Codigo CHAR(3),
        Producto VARCHAR(160),
        Marca VARCHAR(80),
        Color VARCHAR(50),
        Stock INT NOT NULL DEFAULT 0,
        Precio DECIMAL(10, 2) DEFAULT 0.00,
        Descripcion TEXT,
        Estado CHAR(1) DEFAULT 'A',
        CONSTRAINT PK_PRODUCTO PRIMARY KEY (Codigo),
        CONSTRAINT CHK_codigo_formato CHECK (Codigo REGEXP '^P[0-9]{2}$'),
        CONSTRAINT CHK_estado CHECK (Estado IN ('A', 'I'))
    );

INSERT INTO
    PRODUCTO (
        Codigo,
        Producto,
        Marca,
        Color,
        Stock,
        Precio,
        Descripcion,
        Estado
    )
VALUES (
        'P01',
        'Combo inalambrico de teclado y mouse',
        'Logitech',
        'Negro',
        '60',
        '32.75',
        'Fácil de usar: este combo de teclado y mouse inalabrico',
        'A'
    ), (
        'P02',
        'Monitor LED ultradelgado sin marco',
        'Sceptre',
        'Negro y Rojo',
        '50',
        '120.42',
        'Perfil ultra delgado de 24 pulgadas',
        'A'
    ), (
        'P03',
        'Mouse inalámbrico para computador',
        'Logitech',
        'Negro',
        '75',
        '75.35',
        'Comodidad hora tras con este mouse de diseño ergonómico',
        'A'
    ), (
        'P04',
        'AMD Ryzen 7 5800X Procesador',
        'AMD',
        '',
        '120',
        '245.88',
        'AMD El procesador de 8 núcleos más rapido para escritorio principal',
        'A'
    ), (
        'P05',
        'Lenono IdeaPad Gaming 3 - 2022',
        'Lenovo',
        'Azul',
        '135',
        '599.99',
        'Aumenta el rendimiento de tu juego con los procesadores AMD Ryzen serie 6000',
        'A'
    ), (
        'P06',
        'TP-Link AC1750 - Enrutador WiFi',
        'TP-Link',
        'Negro',
        '92',
        '53.99',
        'El enrutador de Internet inalámbrico funciona con Alexia, compatible con todos los dispositivos WiFi',
        'A'
    ), (
        'P07',
        'Cámara Web C920e HD 1080p',
        'Logitech',
        'Negro',
        '72',
        '66.99',
        'La cámara web C920e cuenta con dos micrófonos omnidireccionales integrados',
        'A'
    ), (
        'P08',
        'Estación de acoplamiento USB C',
        'WAVLINK ',
        'Gris',
        '65',
        '55.87',
        'Base USB C 12 en 1: Plug and Play',
        'A'
    );

SELECT
    Codigo AS "CODIGO",
    Producto AS "PRODUCTO",
    Marca AS "MARCA",
    Color AS "COLOR",
    Stock AS "STOCK",
    Precio AS "PRECIO",
    Descripcion AS "DESCRIPCION",
    CASE
        WHEN Estado = 'A' THEN 'Activo'
        WHEN Estado = 'I' THEN 'Inactivo'
        ELSE 'Nose encuentra'
    END AS "ESTADO"
FROM PRODUCTO;

/* 05.Crear la tabla VENTA teniendo como referencia lo siguiente: */

-- El código de venta es auto incrementable de uno en uno. */

-- Se recoge la fecha del servidor de la base de datos al momento de registrar una venta. */

-- Los Cliente y Empleados considerados en la Venta deben existir previamente en las tablas respectivas. */

-- Los posibles tipos de pago son: E (efectivo), T (transferencia) y Y (yape). */

-- El estado sólo puede ser A (activo) e I (inactivo), no se acepta otro tipo de estado. */

CREATE TABLE
    VENTA (
        CodigoVenta INT AUTO_INCREMENT PRIMARY KEY,
        FechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CodigoCliente CHAR(3),
        CodigoEmpleado CHAR(3),
        TipoPago CHAR(1) NOT NULL,
        Estado CHAR(1) NOT NULL,
        FOREIGN KEY (CodigoCliente) REFERENCES CLIENTE(Codigo),
        FOREIGN KEY (CodigoEmpleado) REFERENCES EMPLEADO(Codigo),
        CONSTRAINT CHK_tipo_pago CHECK (TipoPago IN ('E', 'T', 'Y')),
        CONSTRAINT CHK_estado CHECK (Estado IN ('A', 'I'))
    );

INSERT INTO
    VENTA(
        CodigoCliente,
        CodigoEmpleado,
        TipoPago,
        Estado
    )
VALUES ('C03', 'E02', 'E', 'A'), ('C02', 'E04', 'T', 'A'), ('C05', 'E05', 'Y', 'A'), ('C08', 'E01', 'E', 'A');

SELECT
    V.CodigoVenta AS "CÓDIGO",
    DATE_FORMAT(V.FechaRegistro, '%d/%m/%Y') AS "FECHA",
    CONCAT(CA.Apellidos, ', ', CA.Nombres) AS "CLIENTE",
    CONCAT(EA.Apellidos, ', ', EA.Nombres) AS "VENDEDOR",
    CASE V.TipoPago
        WHEN 'E' THEN 'EFECTIVO'
        WHEN 'T' THEN 'TRANSFERENCIA'
        WHEN 'Y' THEN 'YAPE'
        ELSE 'TIPO DE PAGO DESCONOCIDO'
    END AS "TIPO PAGO",
    CASE V.Estado
        WHEN 'A' THEN 'ACTIVO'
        WHEN 'I' THEN 'INACTIVO'
        ELSE 'ESTADO DESCONOCIDO'
    END AS "ESTADO"
FROM VENTA V
    JOIN CLIENTE CA ON V.CodigoCliente = CA.Codigo
    JOIN EMPLEADO EA ON V.CodigoEmpleado = EA.Codigo;

/* 06. Crear la tabla VENTA DETALLE teniendo como referencia lo siguiente: */

-- El identificador de la Venta Detalle será autoincrementable y empezará en 100. */

-- Sólo se pueden vender productos que existen en la tabla producto, la cantidad mínima de venta es 1 */

/* 07. Establecer las siguientes relaciones entre las tablas: */

/* 08. Agregar la fecha de nacimiento de los siguientes CLIENTES de acuerdo a lo siguiente: */

/* 09. Dos empleados han renunciado a la empresa, por tanto hay que eliminarlos lógicamente: */

/* 10. Actualizar el stock y precio de los siguientes productos de acuerdo a la imagen: */

/* 11. En la tabla EMPLEADO agregar columna y obtener el sueldo de acuerdo a las horas trabajadas y el pago por hora: */

/* 12. Obtener el monto a pagar por cada producto vendido. */