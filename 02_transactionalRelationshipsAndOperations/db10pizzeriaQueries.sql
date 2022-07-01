/* 
  EJERCICIO GUÍA - TRANSACCIONES (PIZZERIA)
  
  INSTRUCCIONES:
  01. Crear una base de datos llamada “pizzeria”.
  02. Conectarse a la base de datos pizzeria.
  03. Crear 2 tablas llamadas “ventas” y “pizzas” con la siguiente estructura.
  04. Agregar 1 registro a la tabla “pizzas” seteando como stock inicial 0.
  05. Realizar una transacción que registre una nueva pizza con un stock positivo mayor a 1.
  06. Realizar una transacción que registre una venta con la pizza con stock 0 e intentar actualizar su stock restándole 1.
  07. Realizar una transacción que intente registrar 1 venta por cada pizza, guardando un SAVEPOINT luego de la primera venta y volviendo a este punto si surge un error.
  08. Exportar la base de datos “pizzeria” como un archivo pizzeria.sql.
  09. Eliminar la base de datos “pizzeria”.
  10. Importar el archivo pizzeria.sql.
*/

-- PASO 01 --

CREATE DATABASE db10pizzeria
  WITH
  OWNER = postgres
  ENCODING = 'UTF8'
  LC_COLLATE = 'Spanish_Chile.1252'
  LC_CTYPE = 'Spanish_Chile.1252'
  TABLESPACE = pg_default
  CONNECTION LIMIT = -1;

COMMENT ON DATABASE db10pizzeria
  IS 'EJERCICIO GUÍA - TRANSACCIONES (PIZZERIA)
  La pizzeria nacional Hot Cheese, ofrece en su sitio web para el servicio de pizzas a domicilio y apesar de estar funcionando bien los primeros meses ha bajado su clientela por incomodidades en sus usuarios, que realizan pagos electrónicos en la aplicación y posteriormente reciben un correo de disculpas por la empresa diciendo que la pizza que compró ya no está disponible. El dueño de la pizzería ha tomado cartas sobre el asunto y ha solicitado contratar a un programador de bases de datos, para que cree una nueva base de datos aplicando las restricciones para evitar que siga sucediendo esta situación.';

-- PASO 2 --
CREATE TABLE pizzas(  
  id INT NOT NULL UNIQUE PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  stock INT CHECK (stock >= 0),
  costo INT,
  nombre VARCHAR(45)
);

CREATE TABLE ventas(  
    cliente VARCHAR(45),
    fecha DATE,
    monto INT,
    pizza INT,
    FOREIGN KEY (pizza) REFERENCES pizzas(id)
);

-- PASO 4 --
INSERT INTO pizzas(stock, costo, nombre) 
VALUES(0, 5000, 'Pepperoni');

-- PASO 5 --
BEGIN;
INSERT INTO pizzas(stock, costo, nombre) 
VALUES(3, 6000, 'Carne queso');
COMMIT;

-- PASO 6 --
BEGIN;
INSERT INTO ventas(cliente, fecha, monto, pizza)
VALUES('Miguel Ulloa', '2022-06-28', 10000, 1);
UPDATE pizzas SET stock = stock - 1
WHERE id = 1;
COMMIT;

-- PASO 7 --
BEGIN;
INSERT INTO ventas(cliente, fecha, monto, pizza)
VALUES('Juan Perez', '2022-06-29', 12000, 2);
UPDATE pizzas SET stock = stock - 2
WHERE id = 2;
SAVEPOINT checkpoint;
INSERT INTO ventas(cliente, fecha, monto, pizza)
VALUES('Pedro Lopez', '2022-06-29', 10000, 1);
UPDATE pizzas SET stock = stock - 1
WHERE id = 1;
ROLLBACK TO checkpoint;

SELECT * FROM pizzas;
SELECT * FROM ventas;