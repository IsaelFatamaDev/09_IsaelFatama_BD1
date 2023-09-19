USE dbgamarramarket;
SELECT DATABASE() AS '05_Actividad_BD1';

-- Actualizacion de data en tabla --
ALTER TABLE CLIENTE
MODIFY COLUMN id INT AUTO_INCREMENT,
MODIFY COLUMN activo BOOL DEFAULT 1;
-- Actualizar la tabla PRENDA
ALTER TABLE PRENDA
MODIFY COLUMN id INT AUTO_INCREMENT,
MODIFY COLUMN activo BOOL DEFAULT 1;
-- Actualizar la tabla VENDEDOR
ALTER TABLE VENDEDOR
MODIFY COLUMN id INT AUTO_INCREMENT,
MODIFY COLUMN activo BOOL DEFAULT 1;
-- Actualizar la tabla VENTA
ALTER TABLE VENTA
MODIFY COLUMN id INT AUTO_INCREMENT,
MODIFY COLUMN activo BOOL DEFAULT 1;
ALTER TABLE VENTA_DETALLE
MODIFY COLUMN ID INT AUTO_INCREMENT;


-- Datos en la tabla CLIENTE --
INSERT INTO CLIENTE 
	(tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento)
VALUES
    ("DNI", "77889955", "Alberto", "Solano Pariona", "alberto.pariona@gmail.com", "998456323", str_to_date("10/02/1970", "%d/%m/%Y")),
    ("DNI", "45781233", "Alicia", "García Campos", "", "", str_to_date("20/03/1980", "%d/%m/%Y")),
    ("CNE", "315487922", "Juana", "Avila Chumpitaz", "juana.avila@gmail.com", "923568741", str_to_date("06/06/1986", "%d/%m/%Y")),
    ("CNE", "122116633", "Ana", "Enriquez Flores", "ana.enriquez@empresa.com", "", str_to_date("10/02/1970", "%d/%m/%Y")),
    ("CNE", "088741589", "Claudia", "Perales Ortiz", "claudia.perales@yahoo.com", "997845263", str_to_date("25/07/1981", "%d/%m/%Y")),
    ("DNI", "45122587", "Mario", "Barrios Martinez", "mario.barrios@outlook.com", "986525871", str_to_date("10/10/1987", "%d/%m/%Y")),
    ("CNE", "175258564", "Brunela", "Tarazona Guerra", "brunela.tarazona@gmail.com", "995236741", str_to_date("06/06/1990", "%d/%m/%Y")),
    ("DNI", "47142536", "Alejandro", "Jimenes Huapaya", "", "941525365", str_to_date("01/06/1989", "%d/%m/%Y")),
    ("DNI", "15352585", "Claudia", "Marquez Litano", "claudia.marquez@gmail.com", "985814723", str_to_date("01/10/1991", "%d/%m/%Y")),
    ("CNE", "465772587", "Mario", "Rodriguez Mayo", "mario.rodriguez@outlook.com", "912662587", str_to_date("10/11/1987", "%d/%m/%Y")),
    ("CNE", "837952514", "Luisa", "Guerra Ibarra", "luisa.guerra@yahoo.com", "974422136", str_to_date("21/12/1988", "%d/%m/%Y")),
    ("DNI", "74142585", "Pedro Alberto", "Candela Valenzuela", "pedro.candela@gmail.com", "94148525", str_to_date("30/06/1995", "%d/%m/%Y")),
    ("DNI", "53298147", "Angel Manuel", "Rojas Avila", "angel.rojas@outlook.com", "", str_to_date("02/03/1975", "%d/%m/%Y")),
    ("DNI", "11453265", "Hilario Fabiano", "Avila Huapaya", "", "985514326", str_to_date("02/05/2000", "%d/%m/%Y")),
    ("CNE", "757472186", "Octavio", "Marquez Osorio", "octavio.marquez@yahoo.es", "966223141", str_to_date("22/09/2000", "%d/%m/%Y")),
    ("CNE", "558693219", "Manolo", "Vasquez Saravia", "manolo.vasquez@outlook.es", "966223141", str_to_date("22/09/2000", "%d/%m/%Y")),
    ("DNI", "41552567", "Genoveva Pilar", "Ortiz Quispe", "genoveva.ortiz@outlook.es", "92564137", str_to_date("12/04/2003", "%d/%m/%Y")),
    ("DNI", "49985471", "Oscar César", "Quiroz Zavala", "", "988223145", str_to_date("12/10/2004", "%d/%m/%Y")),
    ("DNI", "44992217", "Verónica", "Romero Vargas", "veronica.romero@yahoo.com", "", str_to_date("25/08/2002", "%d/%m/%Y")),
    ("DNI", "00253641", "Eliseo", "Prada Ortiz", "elseo.prada@yahoo.com", "", str_to_date("15/09/2004", "%d/%m/%Y"));
SELECT * FROM CLIENTE;

/*DATOS DE TABLA VENDEDOR*/
INSERT INTO VENDEDOR
	(tipo_documento, numero_documento, nombres, apellidos, salario, celular, email)
VALUES
	("DNI", "85471236", "Enrique", "Pérez Manco", "1500.00", "96521873", "enrique.perez@outlook.com"),
    ("DNI", "47259136", "Sofía", "Ávila Solis", "1350.00", "", ""),
    ("DNI", "61542280", "Marcela", "Napaico Cama", "1600.00", "965874357", "marcela.napaico@gmail.com"),
    ("CNE", "742536140", "Carmelo", "Rodríguez Chauca", "1550.00", "", "carmelo.rodriguez@yahoo.com");

SELECT * FROM VENDEDOR;

/*DATOS DE TABLA PRENDA*/
INSERT INTO PRENDA
	(descripcion, marca, cantidad, talla, precio)
VALUES
	("Pantalon Jeans","Levis", 60, 28, 65.80),
	("Camisa manga corta","Adams", 75, 16, 55.00),
	("Polo sport","Australia", 100, 16, 40.00),
	("Camisa manga larga","Newport", 150, 16, 42.50),
	("Pijama para caballero","Adams", 180, 28, 79.50),
	("Corbata","Maxwell", 85, 16, 14.50),
	("Pijama para dama","Adams", 170, 24, 55.50),
	("Pantalon Jeans","Australia", 200, 28, 68.50),
	("Camisa Sport","John Holden", 85, 16, 88.50),
	("Short Jeans","Pepe Jeans", 185, 28, 77.20);
SELECT * FROM PRENDA;

/*DATOS DE TABLA VENTA*/
INSERT INTO VENTA
	(fecha_hora, cliente_id, vendedor_id)
VALUES
	(now(), 4, 1),
	(now(), 6, 3),
	(now(), 10, 1),
	(now(), 18, 4);
SELECT * FROM VENTA;

/*DATOS DE TABLA VENTA-DETALLE*/
INSERT INTO VENTA_DETALLE
	(venta_id, prenda_id, cantidad)
VALUES
	(1, 6, 3),
	(1, 3, 5),
	(1, 2, 7),
	(2, 2, 3),
	(3, 7, 4),
	(3, 10, 6),
	(3, 2, 6),
	(3, 5, 7),
	(4, 2, 4),
	(4, 5, 3);
SELECT * FROM VENTA_DETALLE;

/* Actualizar el número de celular de Mario Mayo por el número 922881101 */
UPDATE CLIENTE
SET celular = '922881101' WHERE id = 10;

/* El cliente con DNI 53298147 ya cuenta con número de celular es: 977226604*/
UPDATE CLIENTE
set celular = 977226604 
WHERE numero_documento = "53298147";

/*Eliminar lógicamente los clientes cuyo DNI son: 11453265, 74142585 y 49985471*/
UPDATE CLIENTE
SET activo = 0
WHERE numero_documento IN ("11453265", "74142585", "49985471");

/*Los clientes cuyos DNI son: 87952514, 55869321, 74142585 han perdido su celuLar por lo tanto tienen que estar en blanco*/
UPDATE CLIENTE
SET celular = " "
WHERE numero_documento IN ("87952514", "55869321", "74142585");

/*El cliente Oscar César Quiroz Zavala será reactivado y debemos actualizar su nuevo correo: oscar.quiroz@yahoo.es */
UPDATE CLIENTE
SET activo = 1,
	email = "oscar.quiroz@yahoo.es"
    WHERE nombres = "Oscar César" AND apellidos = "Quiroz Zavala";

/*Agregar los datos de los siguientes clientes y vendedor */
INSERT INTO CLIENTE
	(tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento)
VALUES
	("DNI", "88225463", "Gustavo Tadeo", "Quispe Solorzano", "gustavo.quispe@gmail.com", "", str_to_date("13/10/2001", "%d/%m/%Y")),
    ("DNI", "15753595", "Daniela", "Solis Vargas", "daniela.soliz@outlook.com", "", str_to_date("09/11/1993", "%d/%m/%Y")),
    ("DNI", "76314895", "Mitón Gregorio", "Vásquez Iturrizaga", "milton.gregorio@yahoo.com", "974815233", str_to_date("22/06/2004", "%d/%m/%Y")),
    ("DNI", "84725001", "Verónica", "Ancajima Araujo", "veronica.ancajima@yahoo.com", "", str_to_date("07/11/1980", "%d/%m/%Y")),
    ("DNI", "11228514", "Felicita", "Marroquin Candela", "felicita.marroquin@outlook.com", "966001472", str_to_date("06/06/2006", "%d/%m/%Y")),
    ("DNI", "51436952", "Luhana", "Ortiz Rodriguez", "luhana.ortiz@outlook.com", "960405017", str_to_date("13/10/1980", "%d/%m/%Y"));
    
SELECT * FROM CLIENTE;
/*Actualiza el precio del polo sport de marca Australia a 45.00*/
UPDATE PRENDA
set precio = 45.00
where descripcion = "Polo sport" AND marca = "Australia";
SELECT *FROM PRENDA;

/*Cambiar el nombre de la prenda Corbata por Corbata Michi Elegante*/
UPDATE PRENDA
set descripcion = "Corbata Michi Elegante"
WHERE descripcion = "Corbata";
SELECT * FROM PRENDA;

/*Eliminar físicamente las prendas: Camisa manga corta y Camisa Sport*/
DELETE FROM Prenda
WHERE descripcion IN ('Camisa manga corta', 'Camisa Sport');

/*Eliminar físicamente a la vendedora Marcela Napaico Cama*/
DELETE FROM Vendedor
WHERE nombres = "Marcela" AND apellidos = "Napaico Cama";

/*Elimina físicamente los clientes cuyos documentos son 47142536 y 77889955*/
DELETE FROM Cliente
WHERE numero_documento IN ('47142536', '77889955');

/*Elimina todos los clientes nacidos en el año 1980*/
DELETE FROM CLIENTE
WHERE EXTRACT(YEAR FROM fecha_nacimiento) = 1980;

/* SEGUNDA MANERA
DELETE FROM Cliente
WHERE numero_documento IN (
    SELECT numero_documento
    FROM Cliente
    WHERE YEAR(fecha_nacimiento) = 1980
); */

SELECT * FROM CLIENTE;
