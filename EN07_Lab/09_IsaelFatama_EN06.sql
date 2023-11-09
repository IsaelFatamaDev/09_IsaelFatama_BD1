-- Active: 1698352821439@@127.0.0.1@3306@handslabs

USE HANDSLABS;

--2. LISTAR LAS TABLAS QUE PERTENECEN A LA BASE DE DATOS ACTIVA

SHOW TABLES FROM handslabs;

----------------------------------------------------------------

--3. LISTAR LOS CLIENTES QUE NO TIENEN FECHA DE NACIMIENTO

SELECT
    CONCAT(apellidos, ', ', nombres) AS 'CLIENTE',
    dni AS 'DNI',
    FechaNacimiento AS 'FECHA DE NACIMIENTO'
FROM CLIENTE
WHERE
    `FECHANACIMIENTO` IS NULL;

----------------------------------------------------------------

--4. COMPLETAR LAS FECHAS DE NACIMIENTO TENIENDO COMO REFERENCIA

UPDATE CLIENTE
SET
    FechaNacimiento = CASE
        WHEN codigo = 'C08' THEN '2005-12-25'
        WHEN codigo = 'C04' THEN '2003-01-20'
        WHEN codigo = 'C10' THEN '2003-10-08'
        WHEN codigo = 'C07' THEN '1975-10-30'
        WHEN codigo = 'C02' THEN '1995-05-20'
        ELSE NULL
    END
WHERE
    codigo IN (
        'C08',
        'C04',
        'C10',
        'C07',
        'C02'
    );

SELECT
    CONCAT(apellidos, ', ', nombres) AS 'CLIENTE',
    dni AS 'DNI',
    DATE_FORMAT(
        FechaNacimiento,
        '%d - %M - %Y'
    ) AS 'FECHA DE NACIMIENTO'
FROM CLIENTE
WHERE
    codigo IN (
        'C08',
        'C04',
        'C10',
        'C07',
        'C02'
    );

----------------------------------------------------------------

--5. LISTAR CLIENTES QUE TIENEN 30 AÑOS O MENOS

SELECT
    CONCAT(apellidos, ', ', nombres) AS 'CLIENTE',
    email AS 'EMAIL',
    TIMESTAMPDIFF(
        YEAR,
        FechaNacimiento,
        CURDATE()
    ) AS 'EDAD'
FROM CLIENTE
WHERE
    TIMESTAMPDIFF(
        YEAR,
        FechaNacimiento,
        CURDATE()
    ) <= 30;

--TIMESTAMPDIFF (fecha actual - fecha nacimiento)

----------------------------------------------------------------

--6. CUANTAS PERSONAS TIENEN EDAD ENTRE 25 Y 40

SELECT
    COUNT(*) AS 'ENTRE 25 Y 40'
FROM CLIENTE
WHERE
    TIMESTAMPDIFF(
        YEAR,
        FechaNacimiento,
        CURDATE()
    ) BETWEEN 25 AND 40;

----------------------------------------------------------------

-- 7. CANTIDAD DE EMPLEADOS DE TIPO VENDEDOR

SELECT
    COUNT(*) AS 'CANTIDAD DE VENDEDORES'
FROM EMPLEADO
WHERE TipoEmpleado = 'V';

----------------------------------------------------------------

-- 8.Total de todos los sueldos de los empleadosde tipo administrador

SELECT
    SUM(NumHoras * PagoPorHora) AS 'TOTAL DE SUELDO DE ADMINISTRADOR'
FROM EMPLEADO
WHERE TipoEmpleado = 'A';

----------------------------------------------------------------

-- 9. Eliminar lógicamente al empleado Bernardo Parra Grau

UPDATE EMPLEADO
SET Estado = 'I'
WHERE
    Nombres = 'Bernardo'
    AND Apellidos = 'Parra Grau';

SELECT
    CONCAT(Apellidos, ', ', Nombres) AS "EMPLEADO",
    Estado
FROM EMPLEADO;

----------------------------------------------------------------

-- 10. OBTENER EL TOTAL DE SUELDOS DE TODOS LOS EMPLEADOS VENDEDORES QUE HAN SIDO ELIMINADOS LÓGICAMENTE

SELECT
    SUM(NumHoras * PagoPorHora) AS "TOTAL SUELDO"
FROM EMPLEADO
WHERE
    TipoEmpleado = 'V'
    AND Estado = 'I';

----------------------------------------------------------------

-- 11. OBTENER EL TOTAL DE SUELDOS DE TODOS LOS EMPLEADOS QUE SON CASADOS Y ESTEN ACTIVOS

SELECT
    SUM(PagoPorHora * NumHoras) AS "Total de Sueldos"
FROM EMPLEADO
WHERE
    EstadoCivil = 'C'
    AND Estado = 'A';

----------------------------------------------------------------

-- 12. LISTAR A AQUELLOS CLIENTES CUYA EDAD ES MENOR E IGUAL A 25

SELECT
    CONCAT(apellidos, ', ', nombres) AS 'CLIENTE',
    email AS 'EMAIL',
    TIMESTAMPDIFF(
        YEAR,
        FechaNacimiento,
        CURDATE()
    ) AS 'EDAD',
    estado AS 'ESTADO'
FROM CLIENTE
WHERE
    TIMESTAMPDIFF(
        YEAR,
        FechaNacimiento,
        CURDATE()
    );

----------------------------------------------------------------

-- 13. LISTAR TODOS LOS PRODUCTOS DE TODAS LAS MARCAS EXCEPTO LOGITECH

SELECT
    Producto AS 'PRODUCTO',
    Marca AS 'MARCA',
    Stock AS 'STOCK',
    CONCAT('S/. ', Precio) AS 'PRECIO'
FROM PRODUCTO
WHERE Marca <> 'Logitech';

----------------------------------------------------------------

-- 14. LISTAR PRODUCTOS CUYO STOCK ES MAYOR E IGUAL QUE 90 Y EL PRECIO ES UNITARIO MAYOR E IGUAL QUE 200

SELECT
    codigo AS `Codigo`,
    Producto AS 'PRODUCTO',
    Marca AS 'MARCA',
    Stock AS 'STOCK',
    CONCAT('$', Precio) AS 'PRECIO'
FROM PRODUCTO
WHERE Stock >= 90 AND Precio >= 200;

----------------------------------------------------------------

-- 15. LISTAR EL DETALLE DE VENTA PERTENECIENTE A LA VENTA #3 TENIENDO COMO REFERENCIA

SELECT
    VD.IDVentaDetalle AS 'ID.VENTA.DETALLE',
    VD.IDProducto AS 'PRODUCTO',
    P.Producto AS 'DESCRIPCIÓN',
    VD.Cantidad AS 'CANTIDAD'
FROM VENTA_DETALLE AS VD
    JOIN PRODUCTO AS P ON VD.IDProducto = P.Codigo
WHERE VD.IDVenta = 3;

----------------------------------------------------------------

-- 16. OBTENER EL MONTO TOTAL DE VENTA REALIZADO POR CADA VENDEDOR

SELECT
    V.CodigoVenta AS 'NÚMERO DE VENTA',
    CONCAT(E.Apellidos, ', ', E.Nombres) AS 'VENDEDOR',
    SUM(VD.Cantidad * P.Precio) AS 'MONTO TOTAL DE VENTA'
FROM EMPLEADO AS E
    JOIN VENTA AS V ON E.Codigo = V.CodigoEmpleado
    JOIN VENTA_DETALLE AS VD ON V.CodigoVenta = VD.IDVenta
    JOIN PRODUCTO AS P ON VD.IDProducto = P.Codigo
WHERE E.TipoEmpleado = 'V'
GROUP BY V.CodigoVenta;

SELECT * FROM empleado;

----------------------------------------------------------------

-- 17. CANCELAR LAS VENTAS DE CÓDIGO 1 Y 4, ES DECIR, ELIMINAR LÓGICAMENTE

----------------------------------------------------------------

-- 18. OBTENER EL TOTAL DE VENTAS ACTIVAS E INACTIVAS

SELECT
    Estado AS 'ESTADO VENTA',
    COUNT(*) AS 'TOTAL VENTAS'
FROM VENTA
GROUP BY Estado;

----------------------------------------------------------------

-- 19. OBTENER EL LISTADO DE CLIENTES QUE NO HAN PARTICIPADO EN VENTAS REALIZADAS

SELECT
    CONCAT(apellidos, ', ', nombres) AS 'CLIENTE',
    dni AS 'DNI'
FROM CLIENTE
WHERE codigo NOT IN (
        SELECT
            DISTINCT CodigoCliente
        FROM VENTA
    );

----------------------------------------------------------------

-- 20. LISTAR LOS PRODUCTOS QUE NO HAN SIDO INCLUIDOS EN NINGUNA VENTA

SELECT
    Codigo AS 'CÓDIGO',
    Producto AS 'PRODUCTO',
    Marca AS 'MARCA'
FROM PRODUCTO
WHERE Codigo NOT IN (
        SELECT
            DISTINCT IDProducto
        FROM VENTA_DETALLE
    );