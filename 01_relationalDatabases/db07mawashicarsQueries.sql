/*   
  EJERCICIO GUÍA - MAWASHI CARS SPA
  
  INSTRUCCIONES:
    01. Creación de la base de datos.
    02. Conexión con la base de datos.
    03. Crear las tablas Autos y ventas enlazadas por claves primaria-foranea.
    04. Importar el archivo autos.csv en la tabla Autos.
    05. Verificar la carga exitosa de la data en la tabla Autos.
    06. Hacer una consulta con Alias.
    07. Realizar 2 inserciones a la tabla Ventas.
    08. Realizar una consulta con la función SUM.
    09. Agregar una columna a una tabla.
    10. Agregar un registro a la tabla Autos
    11. Hacer una actualización de información a una tabla.
    12. Agrupar columnas en una tabla.
    13. Ejecutar una consulta con ORDER BY.
    14. Agregar dos índices a dos columnas.
    15. Eliminar un índice a una columna.
 */

-- PASO 01 --

CREATE DATABASE db07mawashicars
  WITH
  OWNER = postgres
  ENCODING = 'UTF8'
  LC_COLLATE = 'Spanish_Chile.1252'
  LC_CTYPE = 'Spanish_Chile.1252'
  TABLESPACE = pg_default
  CONNECTION LIMIT = -1;

COMMENT ON DATABASE db07mawashicars
  IS 'EJERCICIO GUÍA - MAWASHI CARS SPA
    La empresa japonesa Mawashi Cars Spa hará una reinauguración muy pronto y ha decidido dejar de registrar todos los movimientos en excel y empezar a usar el software que compró el año pasado pero nunca estrenó, sin embargo, cuando lo intentó utilizar se llevó la sorpresa de que la aplicación necesita conectarse a una base de datos. La empresa se contactó con un desarrollador para esto y le envió un archivo en formato csv que exportaron de excel con unos pocos registros de autos para que proceda con la creación de la base de datos y pueda hacer las pruebas que necesite.';

-- PASO 03 --

CREATE TABLE autos(  
  id INT NOT NULL UNIQUE PRIMARY KEY GENERATED ALWAYS AS IDENTITY (INCREMENT 1 START 5 MINVALUE 1 MAXVALUE 2147483647 CACHE 1),
  marca VARCHAR(25),
  modelo VARCHAR(25),
  año VARCHAR(25),
  color VARCHAR(25)
);

CREATE TABLE ventas(  
    fecha DATE,
    id_auto INT,
    cliente VARCHAR(25),
    referencia INT,
    cantidad FLOAT,
    FOREIGN KEY (id_auto) REFERENCES autos(id)
);

-- PASO 05 --

SELECT * FROM autos;

-- PASO 06 --

SELECT a.marca AS mar, a.modelo AS mod, a.color AS c
FROM Autos AS a;

-- PASO 07 --

INSERT INTO ventas(
  fecha, id_auto, cliente, referencia, cantidad)
  VALUES ('2019-02-20', 2, 'Alexander Cell' , 54322, 2000000);

INSERT INTO ventas(
  fecha, id_auto, cliente, referencia, cantidad)
  VALUES ('2009-03-14', 3, 'Katherine Smith' , 12325, 1500000);

-- PASO 08 --

SELECT SUM(cantidad) AS Total FROM ventas;

-- PASO 09 --

ALTER TABLE autos ADD precio FLOAT;

-- PASO 10 --

INSERT INTO autos(
  marca, modelo, año, color, precio)
  VALUES ('ferrari', 'Sport' , '2002', 'Blanco', 50000000);

-- PASO 11 --

UPDATE Autos SET precio=15000000 WHERE id=1;
UPDATE Autos SET precio=15000000 WHERE id=2;
UPDATE Autos SET precio=2000000 WHERE id=3;
UPDATE Autos SET precio=15000000 WHERE id=4;
UPDATE Autos SET precio=15000000 WHERE id=5;

-- PASO 12 --

SELECT precio, COUNT(*)
FROM autos GROUP BY precio;

-- PASO 13 --

SELECT * FROM autos
ORDER BY precio ASC;

-- PASO 14 --

CREATE INDEX index_id_auto on ventas(id_auto);
CREATE INDEX index_id on autos(id);

-- PASO 15 --

drop index index_id;