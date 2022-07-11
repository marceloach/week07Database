/*   
  DESAFÍO - ENTENDIENDO CÓMO SE COMPORTAN NUESTROS CLIENTES
  
  INSTRUCCIONES:
  1. Cargar el respaldo de la base de datos unidad2.sql. (2 Puntos)
  2. El cliente usuario01 ha realizado la siguiente compra:
    - producto: producto9.
    - cantidad: 5.
    - fecha: fecha del sistema.
  Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento y luego consulta la tabla producto para validar si fue efectivamente descontado en el stock. (3 Puntos)
  3. El cliente usuario02 ha realizado la siguiente compra:
    - producto: producto1, producto 2, producto 8.
    - cantidad: 3 de cada producto.
    - fecha: fecha del sistema.
  Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento y luego consulta la tabla producto para validar que si alguno de ellos se queda sin stock, no se realice la compra. (3 Puntos)
  4. Realizar las siguientes consultas (2 Puntos):
    a. Deshabilitar el AUTOCOMMIT .
    b. Insertar un nuevo cliente.
    c. Confirmar que fue agregado en la tabla cliente.
    d. Realizar un ROLLBACK.
    e. Confirmar que se restauró la información, sin considerar la inserción del punto b.
    f. Habilitar de nuevo el AUTOCOMMIT.
*/

-- PASO 01 --
-- CREATE DATABASE db04des_unidad2
--   WITH
--   OWNER = postgres
--   ENCODING = 'UTF8'
--   LC_COLLATE = 'Spanish_Chile.1252'
--   LC_CTYPE = 'Spanish_Chile.1252'
--   TABLESPACE = pg_default
--   CONNECTION LIMIT = -1;

-- COMMENT ON DATABASE db04des_unidad2
--   IS 'DESAFÍO - ENTENDIENDO CÓMO SE COMPORTAN NUESTROS CLIENTES
--   Bill Jobs es un recién egresado de la carrera de Ingeniería de Software y está postulando en una empresa internacional para el cargo de Administrador de base de datos. Luego de unos pocos días recibió una llamada de la empresa a la que postuló y le solicitaron que realice algunas pruebas a una base de datos que se le envió por correo electrónico para proceder con la selección del cargo.';

-- psql.exe -U postgres -d db04des_unidad2 -f C:\Users...\unidad2.sql

-- PASO 2 --
BEGIN TRANSACTION;
INSERT INTO compra(cliente_id, fecha)
VALUES (1, NOW());
INSERT INTO detalle_compra(producto_id, compra_id, cantidad)
VALUES (9, (SELECT MAX(compra.id) FROM compra), 5);
UPDATE producto SET stock = stock - 5
WHERE id = 9;
COMMIT;

-- PARTE 03 --
BEGIN TRANSACTION;
INSERT INTO compra(cliente_id, fecha)
VALUES (2, NOW());
INSERT INTO detalle_compra(producto_id, compra_id, cantidad)
VALUES (1, (SELECT MAX(compra.id) FROM compra), 3);
INSERT INTO detalle_compra(producto_id, compra_id, cantidad)
VALUES (2, (SELECT MAX(compra.id) FROM compra), 3);
INSERT INTO detalle_compra(producto_id, compra_id, cantidad)
VALUES (8, (SELECT MAX(compra.id) FROM compra), 3);
SAVEPOINT checkpoint;
UPDATE producto SET stock = stock - 3
WHERE id = 1;
SAVEPOINT checkpoint;
UPDATE producto SET stock = stock - 3
WHERE id = 2;
SAVEPOINT checkpoint;
UPDATE producto SET stock = stock - 3
WHERE id = 8;
ROLLBACK TO checkpoint;
COMMIT;

-- PARTE 04 --
-- \set AUTOCOMMIT off (realizado en consola)
BEGIN TRANSACTION;
INSERT INTO cliente(nombre, email)
VALUES ('usuario11', 'usuario11@gmail.com');
SELECT * FROM cliente;
ROLLBACK;
SELECT * FROM cliente;
-- \set AUTOCOMMIT on (realizado en consola)