/* 
  EJERCICIO GUÍA - OPERACIONES DE UNIÓN ENTRE TABLAS
  
  TEMAS:
    Realizar consultas usando el comando JOIN para el consumo de datos entre tablas relacionadas.
    Realizar subconsultas para la anidación de datos entre tablas.
 */

-- INNER JOIN --
SELECT * FROM usuario
INNER JOIN rol ON usuario.rol_id = rol.id;

-- LEFT JOIN --
SELECT * FROM usuario
LEFT JOIN rol ON usuario.rol_id = rol.id
WHERE usuario.rol_id IS NOT NULL;

-- RIGHT JOIN --
SELECT * FROM usuario
RIGHT JOIN rol ON usuario.rol_id = rol.id;

-- FULL OUTER JOIN --
SELECT * FROM usuario
FULL OUTER JOIN rol ON usuario.rol_id = rol.id;

-- FULL OUTER JOIN Donde una columna en la tabla “A” o “B” es null --
SELECT * FROM usuario
FULL OUTER JOIN rol ON usuario.rol_id = rol.id
WHERE usuario.rol_id IS NULL;

-- SUBQUERY: Operador WHERE --
SELECT pokedex, nombre FROM pokemones
WHERE pokedex IN (
  SELECT pokedex FROM mis_pokemones
  WHERE huevo = 'true');

-- SUBQUERY: Operador FROM --

SELECT y.nombre, x.pokedex, x.peso FROM (
  SELECT peso, pokedex FROM mis_pokemones
  WHERE peso > 200) 
  AS x INNER JOIN pokemones
  AS y ON x.pokedex = y.pokedex;