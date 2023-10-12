CREATE DATABASE JCM;
USE JCM;
	-- Tabla: PERSONA
CREATE TABLE PERSONA (
    id INT NOT NULL auto_increment,
    nombres VARCHAR(60) NULL COMMENT 'Este campo almacena el nombre de la persona que envía el formulario.',
    apellidos VARCHAR(80) NULL COMMENT 'Este campo almacena el apellido de la persona que envía el formulario.',
    email VARCHAR(80) NULL COMMENT 'La dirección de correo electrónico del contacto',
    telefono CHAR(9) NULL COMMENT 'En este campo irá el número telefónico de la persona que envia el formulario.',
    CONSTRAINT PERSONA_pk PRIMARY KEY (id)
)  COMMENT 'Tabla de datos de las personas que envien el formulario';

CREATE TABLE MENSAJE (
		id int  NOT NULL auto_increment,
		asunto varchar(100)  NULL COMMENT 'Asunto por el cual la persona a enviado el formulario',
		mensaje varchar(250)  NULL COMMENT 'Mensaje que presenta la persona interesada.',
		fecha datetime  NOT NULL COMMENT 'Hora y fecha de envio.',
		persona_id int  NOT NULL,
		CONSTRAINT MENSAJE_pk PRIMARY KEY (id)
	) COMMENT 'Iran los datos del mensaje que envia la persona.';

ALTER TABLE MENSAJE ADD CONSTRAINT MENSAJE_PERSONA FOREIGN KEY MENSAJE_PERSONA (persona_id)
		REFERENCES PERSONA (id);
      
-- Inserción de registros en la tabla PERSONA
INSERT INTO PERSONA (nombres, apellidos, email, telefono) VALUES
    ('Jose', 'Godoy Cuzcano', 'josecuzcano@gmail.com', '997414526'),
    ('María', 'Gómez', 'maria@example.com', '987654321'),
    ('John', 'Smith', 'john.smith@gmail.com', '996437821'),
    ('Juan', 'Perez Gonzales', 'juanperez12@gmail.com', '945912394'),
    ('Luis', 'Mendoza', 'luis.mendoza@gmail.com', '991234567'),
    ('Silvia', 'Ortiz', 'silvia.ortiz@gmail.com', '911223344'),
    ('Javier', 'Lopez', 'javier.lopez@gmail.com', '978563412'),
    ('Ana', 'Garcia', 'ana.garcia@gmail.com', '963214578'),
    ('Lourdes', 'Mendoza', 'lourdes.mendoza@gmail.com', '978899456'),
    ('Fernanda', 'Paredes', 'fernanda.paredes@gmail.com', '977665544');
    
-- Inserción de registros en la tabla MENSAJE
INSERT INTO MENSAJE (asunto, mensaje, fecha, persona_id) VALUES
    ('Solicitud de admisión', 'Estoy interesado en inscribir a mi hijo en su colegio. ¿Cuáles son los requisitos?', NOW(), 1),
    ('Horario de clases', 'Quisiera saber cuál es el horario de clases para el próximo semestre.', NOW(), 2),
    ('Reunión de padres', '¿Cuándo será la próxima reunión de padres y maestros?', NOW(), 3),
    ('Consulta sobre matrícula', '¿Cuál es el proceso de matrícula para estudiantes nuevos?', NOW(), 4),
    ('Actividades extracurriculares', '¿Ofrecen actividades extracurriculares para los estudiantes?', NOW(), 5);

-- Actualización de registros en la tabla PERSONA
UPDATE PERSONA SET telefono = '945960978' WHERE id = 1;
UPDATE PERSONA SET email = 'juan.perez@gmail.com' WHERE id = 4;

-- Consulta (listar) registros en la tabla MENSAJE
SELECT * FROM MENSAJE WHERE persona_id = 1;
SELECT asunto, fecha FROM MENSAJE WHERE fecha > '2023-10-01';

-- Eliminación de registros en la tabla MENSAJE
DELETE FROM MENSAJE WHERE id = 1;
DELETE FROM MENSAJE WHERE fecha < '2023-10-12';

SET SQL_SAFE_UPDATES = 0;
