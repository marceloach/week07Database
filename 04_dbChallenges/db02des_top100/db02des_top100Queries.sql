/*   
  DESAFÍO - TOP 100
  
  INSTRUCCIONES:
  1. Crear una base de datos llamada top100. (1 Punto)
  2. Cargar ambos archivos a su tabla correspondiente. (1 Punto)
  3. Obtener el ID de la película “Titanic”. (1 Punto)
  4. Listar a todos los actores que aparecen en la película "Titanic". (1 Puntos)
  5. Consultar en cuántas películas del top 100 participa Harrison Ford. (2 Puntos)
  6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente. (1 punto)
  7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”. (1 punto)
  8. Consultar cual es la longitud más grande entre todos los títulos de las películas. (2 punto)
 */

-- PASO 1 --

CREATE DATABASE db02des_top100
  WITH
  OWNER = postgres
  ENCODING = 'UTF8'
  LC_COLLATE = 'Spanish_Chile.1252'
  LC_CTYPE = 'Spanish_Chile.1252'
  TABLESPACE = pg_default
  CONNECTION LIMIT = -1;

COMMENT ON DATABASE db02des_top100
  IS 'DESAFÍO - TOP 100
    Se requiere crear un sitio web dedicado al mundo cinematográfico donde los usuarios puedan buscar detalles del top 100 de películas más populares. El plus más importante de este sitio web debe ser la variedad de filtros que ofrece para una búsqueda más efectiva. Para este desafío necesitarás crear 2 tablas llamadas películas y reparto, sus datos los consigues en los ficheros de extensión csv ubicados en el Apoyo Desafío.';

-- PASO 2 --

CREATE TABLE peliculas(  
    id INT NOT NULL UNIQUE PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    pelicula VARCHAR(255),
    periodo_estreno INT,
    director VARCHAR(45)
);

CREATE TABLE reparto(  
    pelicula_id INT,
    actor VARCHAR(100),
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(id)
);

-- PASO 3 --

SELECT id FROM peliculas WHERE pelicula = 'Titanic';

-- PASO 4 --

SELECT actor FROM reparto WHERE pelicula_id = 2;

-- PASO 5 --

SELECT COUNT(pelicula_id) AS total FROM reparto
WHERE actor = 'Harrison Ford';

-- PASO 6 --

SELECT pelicula FROM peliculas WHERE periodo_estreno BETWEEN 1990 AND 1999
ORDER BY pelicula ASC;

-- PASO 7 --

SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas;
-- ORDER BY longitud_titulo ASC;

-- PASO 8 --

SELECT MAX(LENGTH(pelicula)) AS longitud_titulo FROM peliculas;