/* 
  EJERCICIO GUÍA - POKEMONES
  
  TEMAS:
    Implementar alias en consultas SQL para un manejo personalizado de los campos y las tablas involucradas.
    Reconocer las funciones básicas que se pueden usar en consultas para obtener datos calculados.
    Realizar consultas con funciones a las tablas de la base de datos.
    Crear índices en las tablas para agilizar las consultas.
 */

-- SECCIÓN: Consultando tablas --

-- SELECT * FROM pokemones;
-- SELECT nombre FROM pokemones WHERE tipo1 = 'fuego';
-- SELECT pokedex, nombre, tipo1 FROM pokemones where pokedex > 90;
-- SELECT pokedex, nombre, tipo1 FROM pokemones where pokedex <= 90;
-- SELECT pokedex, nombre, tipo1 FROM pokemones WHERE tipo1 <> 'fuego';
-- SELECT * FROM pokemones WHERE pokedex BETWEEN 40 AND 50;
-- SELECT * FROM pokemones WHERE nombre LIKE 'C%';
-- SELECT * FROM pokemones WHERE tipo2 in ('hada');
-- SELECT * FROM pokemones WHERE tipo2 in ('volador', 'agua');
-- SELECT * FROM pokemones LIMIT 20;

-- SECCIÓN: Alias --

-- SELECT pkm.nombre AS n, pkm.pokedex AS pkd
-- FROM pokemones AS pkm;

--  SECCIÓN: Funciones en consultas --

-- Para nuestro ejemplo si queremos mostrar la columna nombre y el largo del nombre de los primeros 10 pokemones, podemos hacer la siguiente consulta:
-- SELECT nombre, LENGTH(nombre) AS longitud_nombre FROM pokemones LIMIT 10;

-- Si, para el ejercicio anterior, quisiéramos saber cuánto suma el largo de los nombres de los primeros 10 pokemones, haríamos lo siguiente:
-- SELECT SUM(LENGTH(nombre)) AS suma_nombres FROM pokemones WHERE pokedex <= 10;

-- Ahora, si queremos saber cuantos pokemones son de tipo agua, podemos usar la función COUNT y aplicar lo siguiente:
-- SELECT COUNT(pokedex) AS total FROM pokemones
-- WHERE tipo1 = 'agua' OR tipo2 = 'agua';

-- SECCIÓN: Agrupación con GROUP BY --

-- SELECT tipo1 FROM pokemones;
-- SELECT tipo1 FROM pokemones GROUP BY tipo1;
-- SELECT tipo1, COUNT(*) FROM pokemones GROUP BY tipo1;

-- SECCIÓN: Ordenamiento --

-- SELECT * FROM pokemones ORDER BY nombre DESC;

-- SECCIÓN: Crear índices --

-- CREATE INDEX index_pokemon_nombre ON pokemones(nombre);

-- Si queremos saber qué columnas de nuestras tablas tienen índice, podemos usar el siguiente comando:
-- SELECT * FROM pg_indexes WHERE tablename = 'pokemones';

-- SECCIÓN: Eliminar índices --

-- DROP INDEX index_pokemon_nombre;