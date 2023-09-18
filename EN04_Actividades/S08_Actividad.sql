/*INSERTAR DATOS EN LA BASE DE DATOS*/
USE dbgamarramarket;
SHOW columns FROM CLIENTE;
SELECT DATABASE() AS 'Base de Datos Activa';

/*Agregar datos */
show columns from cliente;

INSERT INTO CLIENTE (id, tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento)
VALUES ("1", "DNI", "77889955", "Alberto", "Solano Pariona", "alberto.pariona@gmail.com", "998456323", str_to_date("10/02/1970", "%d/%m/%Y"));
INSERT INTO CLIENTE (id, tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento, activo) 
VALUES (2, "CNE", "457812330", "Alicia", "García Campos", "alicia.garcia@gmail.com", "998459872", str_to_date("20/03/1980", "%d/%m/%Y"), "1"), 
(3, "DNI", "15487922", "Juana", "Avila Chumpitaz", "juana.avila@gmail.com", "923568741", str_to_date("06/06/1986", "%d/%m/%Y"), "1");

SELECT *  FROM CLIENTE;

/*ACTUALIZAR BASE DE DATOS*/
UPDATE CLIENTE
	SET apellidos = "Méndez Vera",
		email = "alicia.méndez@gmail.com"
		WHERE nombres = "Alicia" AND apellidos = "García Campos";

UPDATE CLIENTE
	SET activo = 0
	WHERE numero_documento = "15487922";
    
/*Eliminar datos de Juana Ávila Chumpitaz*/
DELETE FROM CLIENTE
WHERE nombres = "Juana" AND apellidos = "Avila Chumpitaz";

DELETE FROM CLIENTE;

