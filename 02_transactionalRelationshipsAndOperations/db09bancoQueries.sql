/* 
  EJERCICIO GUÍA - TRANSACCIONES
  
  TEMAS:
    Identificar qué son las transacciones y qué utilidad nos genera al momento de gestionar una base de datos.
    Integrar las transacciones en sentencias SQL para la realización por lote de consultas.
    Cargar una base de datos utilizando dump.
*/

CREATE DATABASE db09banco
  WITH
  OWNER = postgres
  ENCODING = 'UTF8'
  LC_COLLATE = 'Spanish_Chile.1252'
  LC_CTYPE = 'Spanish_Chile.1252'
  TABLESPACE = pg_default
  CONNECTION LIMIT = -1;

COMMENT ON DATABASE db09banco
  IS 'EJERCICIO GUÍA - TRANSACCIONES';

CREATE TABLE cuentas(  
  numero_cuenta INT NOT NULL UNIQUE PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  balance DECIMAL CHECK (balance >= 0.00)
  -- CHECK valida la condición que el monto sea mayor o igual a cero.
);

-- COMMIT --
BEGIN TRANSACTION;
UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 1;
UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 2;
COMMIT;

--  ROLLBACK --
BEGIN TRANSACTION;
UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 2;
UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 1;
ROLLBACK;

-- SAVEPOINT --
BEGIN TRANSACTION;
INSERT INTO cuentas(balance) VALUES (5000);
SAVEPOINT nueva_cuenta;

UPDATE cuentas SET balance = balance + 3000 WHERE numero_cuenta = 3;
UPDATE cuentas SET balance = balance - 3000 WHERE numero_cuenta = 2;
-- Justo acá deberás recibir un error
ROLLBACK TO nueva_cuenta;
COMMIT;

-- AUTOCOMMIT --
-- Viene por defecto
INSERT INTO cuentas(balance) VALUES (1000);


SELECT * FROM cuentas;