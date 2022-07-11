/*   
  DESAFÍO - BIBLIOTECA
  
  INSTRUCCIONES:
  
  Parte 1 - Creación del modelo conceptual, lógico y físico
    1.1 Realizar el modelo conceptual, considerando las entidades y relaciones entre ellas.
    1.2 Realizar el modelo lógico, considerando todas las entidades y las relaciones entre ellas, los atributos, normalización y creación de tablas intermedias de ser necesario.
    1.3 Realizar el modelo físico, considerando la especificación de tablas y columnas, además de las claves externas.

  Parte 2 - Creando el modelo en la base de datos
    2.1 Crear el modelo en una base de datos llamada biblioteca, considerando las tablas definidas y sus atributos.
    2.2 Se deben insertar los registros en las tablas correspondientes.
    2.3 Realizar las siguientes consultas:
      2.3.1 Mostrar todos los libros que posean menos de 300 páginas.
      2.3.2 Mostrar todos los autores que hayan nacido después del 01-01-1970.
      2.3.3 ¿Cuál es el libro más solicitado?
      2.3.4 Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días.
*/

-- PASO 1.1 --
-- db05des_bibliotecaConceptualModel.png

-- PASO 1.2 --
-- db05des_bibliotecaLogicModel.png

-- PASO 1.3 --
-- db05des_bibliotecaphysicalModel.png

-- PASO 2.1 --

-- CREATE DATABASE db05des_biblioteca
--   WITH
--   OWNER = postgres
--   ENCODING = 'UTF8'
--   LC_COLLATE = 'Spanish_Chile.1252'
--   LC_CTYPE = 'Spanish_Chile.1252'
--   TABLESPACE = pg_default
--   CONNECTION LIMIT = -1;

-- COMMENT ON DATABASE db05des_biblioteca
--   IS 'DESAFÍO - BIBLIOTECA
  
--   En la biblioteca se guardan los siguientes datos para cada préstamo que se realiza: 
--   Los datos del libro (ISBN, título, número de páginas, código del autor, nombre y apellido del autor, fecha de nacimiento y muerte del autor, tipo de autor (principal, coautor)), datos del préstamo (fecha de inicio, y fecha de devolución) y los datos del socio (rut, nombre, apellido, dirección y teléfono).

--   Además, se deben considerar las siguientes restricciones:
--   - Se registra una única dirección y teléfono para cada socio.
--   - El ISBN (International Standard Book Number), es un número de 13 cifras que identifica de una manera única a cada libro o producto de editorial publicado.
--   - Para este ejercicio, asumirá que la biblioteca posee un ejemplar de cada libro.
--   - El número único del autor es un correlativo interno que maneja la biblioteca para identificarlos y facilitar la búsqueda.
--   - Un libro tiene al menos un autor principal, puede tener además registrado un coautor.
--   - Un socio sólo puede pedir un libro a la vez.';

-- CREATE TABLE autores(  
--   codigo INT NOT NULL UNIQUE PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
--   nombre VARCHAR(45) NOT NULL,
--   apellido VARCHAR(45) NOT NULL,
--   fecha_nacimiento INT,
--   fecha_defuncion INT,
--   tipo_autor VARCHAR(45) NOT NULL
-- );

-- CREATE TABLE libros(  
--   isbn BIGINT NOT NULL UNIQUE PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
--   titulo VARCHAR(45) NOT NULL,
--   paginas INT
-- );

-- CREATE TABLE autoria(  
--   libros_isbn BIGINT,
--   autores_codigo INT,
--   FOREIGN KEY (libros_isbn) REFERENCES libros(isbn),
--   FOREIGN KEY (autores_codigo) REFERENCES autores(codigo)
-- );

-- CREATE TABLE socios(  
--   rut BIGINT NOT NULL UNIQUE PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
--   nombre VARCHAR(45) NOT NULL,
--   apellido VARCHAR(45) NOT NULL,
--   direccion VARCHAR(45),
--   ciudad VARCHAR(45),
--   telefono VARCHAR(9)
-- );

-- CREATE TABLE prestamos(  
--   libros_isbn BIGINT,
--   socios_rut BIGINT,
--   fecha_inicio DATE,
--   fecha_devolucion DATE,
--   FOREIGN KEY (libros_isbn) REFERENCES libros(isbn),
--   FOREIGN KEY (socios_rut) REFERENCES socios(rut)
-- );

-- PASO 2.2 --

-- psql -U postgres -d db05des_biblioteca
-- \copy autores FROM 'C:/Users/.../db05des_biblioteca/db05des_tablaAutores.csv' csv header;
-- \copy libros FROM 'C:/Users/.../db05des_biblioteca/db05des_tablaLibros.csv' csv header;
-- \copy autoria FROM 'C:/Users/.../db05des_biblioteca/db05des_tablaAutoria.csv' csv header;
-- \copy socios FROM 'C:/Users/.../04_dbChallenges/db05des_biblioteca/db05des_tablaSocios.csv' csv header;
-- \copy prestamos FROM 'C:/Users/.../db05des_biblioteca/db05des_tablaPrestamos.csv' csv header;

-- PASO 2.3.1 --
SELECT titulo FROM libros WHERE paginas < 300; 

-- PASO 2.3.2 --
SELECT nombre, apellido FROM autores WHERE fecha_nacimiento > 1970;

-- PASO 2.3.3 --
SELECT libros_isbn, COUNT(libros_isbn) AS total FROM prestamos GROUP BY libros_isbn ORDER BY total DESC;
-- SELECT libros_isbn, COUNT(libros_isbn) FROM prestamos GROUP BY libros_isbn HAVING COUNT(*)>1;

-- PASO 2.3.4 --
SELECT socios_rut, (fecha_devolucion - fecha_inicio - 7) * 100 AS penalty_fee FROM prestamos;