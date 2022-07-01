/*   
  DESAFÍO - CREANDO Y ANALIZANDO NUESTRO PROPIO BLOG
  
  INSTRUCCIONES:
  1. Crear base de datos llamada blog.
  2. Crear las tablas indicadas de acuerdo al modelo de datos.
  3. Insertar los siguientes registros.
  4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5.
  5. Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el usuario con email usuario06@hotmail.com.
  6. Listar los usuarios que no han publicado ningún post.
  7. Listar todos los post con sus comentarios (incluyendo aquellos que no poseen comentarios).
  8. Listar todos los usuarios que hayan publicado un post en Junio.
*/

-- PASO 1 --
CREATE DATABASE db03des_blog
  WITH
  OWNER = postgres
  ENCODING = 'UTF8'
  LC_COLLATE = 'Spanish_Chile.1252'
  LC_CTYPE = 'Spanish_Chile.1252'
  TABLESPACE = pg_default
  CONNECTION LIMIT = -1;

COMMENT ON DATABASE db03des_blog
  IS 'DESAFÍO - CREANDO Y ANALIZANDO NUESTRO PROPIO BLOG
    La empresa Stanislavski Spa funciona como una contratista de actores para teatro, películas de cine y series de televisión, está por sacar su sitio web con las últimas noticias y el sistema para postulaciones de talentos emergentes, en paralelo a esto ha solicitado a un especialista en bases de datos de preferencia Full Stack Developer para la construcción del modelo de datos propuesto por su departamento de informática. Este modelo atiende la iniciativa de incluir un blog básico en la página web que registre, usuarios por su correo electrónico puedan hacer posts y comentarios a los posts publicados.';

-- PASO 2 --
CREATE TABLE usuarios(  
  id INT NOT NULL UNIQUE PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE posts(  
  id INT NOT NULL UNIQUE PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  usuario_id INT NOT NULL,
  titulo VARCHAR(45),
  fecha DATE,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE comentarios(  
  id INT NOT NULL UNIQUE PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  post_id INT NOT NULL,
  usuario_id INT NOT NULL,
  texto TEXT,
  fecha DATE,
  FOREIGN KEY (post_id) REFERENCES posts(id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- PASO 4 --
SELECT email, posts.id, posts.titulo FROM usuarios
INNER JOIN posts ON usuarios.id = posts.usuario_id
WHERE usuarios.id = 5;

-- PASO 5 --
SELECT email, comentarios.id, comentarios.texto FROM usuarios
INNER JOIN comentarios ON usuarios.id = comentarios.usuario_id
WHERE usuarios.email <> 'usuario06@hotmail.com';

-- PASO 6 --
SELECT usuarios.id FROM usuarios
INNER JOIN posts ON usuarios.id = posts.usuario_id
WHERE usuarios.id = posts.usuario_id
GROUP BY usuarios.id
ORDER BY usuarios.id ASC;

-- PASO 7 --
SELECT posts.id, posts.titulo, comentarios.texto FROM posts
FULL OUTER JOIN comentarios ON posts.id = comentarios.post_id
ORDER BY posts.id ASC;

-- PASO 8 --
SELECT usuarios.id, posts.fecha FROM usuarios
INNER JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.fecha BETWEEN '2020-06-01' AND '2020-06-30'
ORDER BY usuarios.id ASC;

-- SELECT * FROM usuarios;
-- SELECT * FROM posts;
-- SELECT * FROM comentarios;
