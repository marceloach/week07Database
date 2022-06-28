-- PARTE 1 --

-- 1. Crear una base de datos con nombre “Posts”. (1 Punto)

CREATE DATABASE db01des_posts
  WITH
  OWNER = postgres
  ENCODING = 'UTF8'
  LC_COLLATE = 'Spanish_Chile.1252'
  LC_CTYPE = 'Spanish_Chile.1252'
  TABLESPACE = pg_default
  CONNECTION LIMIT = -1;

COMMENT ON DATABASE db01des_posts
  IS 'DESAFÍO - OPERACIONES EN UNA TABLA
    La academia está trabajando en mejorar su plataforma de estudio y planea crear un espacio que sirva como una red social entre estudiantes y docentes, por lo que necesita almacenar en una base de datos los post y comentarios que se generen:
    Parte 1 - Creación, inserciones, modificaciones y eliminaciones en la tabla “Posts”.
    Parte 2 - Creación e inserciones en la tabla “comentarios”.';

-- 2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación, contenido y descripción. (1 Punto)

CREATE TABLE post(  
  id INT NOT NULL UNIQUE PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  nombre_usuario VARCHAR(45) NOT NULL,
  fecha_creacion DATE NOT NULL,
  contenido VARCHAR(255) NOT NULL,
  descripcion TEXT
);

-- 3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos". (0.6 Puntos)

INSERT INTO post(
	nombre_usuario, fecha_creacion, contenido, descripcion)
	VALUES ('Diego', '2022-06-23', 'Mi primer post', 'Mi primera descripción');

INSERT INTO post(
	nombre_usuario, fecha_creacion, contenido, descripcion)
	VALUES ('Fabiola', '2022-06-24', 'PostgresSQL o MySQL', 'Comparación base de datos');

INSERT INTO post(
	nombre_usuario, fecha_creacion, contenido, descripcion)
	VALUES ('Mariela', '2022-06-25', 'Probando pgAdmin', 'Los anteriores fueron por VSCode');

INSERT INTO post(
	nombre_usuario, fecha_creacion, contenido, descripcion)
	VALUES ('Marcos', '2022-06-26', 'Probando VSCode y SQL', 'Insertando valores con SQL en VSCode');

-- 4. Modificar la tabla post, agregando la columna título. (1 Punto)

ALTER TABLE IF EXISTS post
  ADD COLUMN titulo VARCHAR(45);

-- 5. Agregar título a las publicaciones ya ingresadas. (1 Punto)

UPDATE post
    SET titulo = 'Título 1'
    WHERE id = 1;

UPDATE post
    SET titulo = 'Título 1'
    WHERE id = 2;

UPDATE post
    SET titulo = 'Título 1'
    WHERE id = 3;

UPDATE post
    SET titulo = 'Título 1'
    WHERE id = 4;
    
-- 6. Insertar 2 post para el usuario "Pedro". (0.4 Puntos)

INSERT INTO post(
	nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
	VALUES ('Pedro', '2022-06-27', 'Otro post', 'Otra descripción', 'Otro título');

INSERT INTO post(
	nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
	VALUES ('Pablo', '2022-06-28', 'Otro post', 'Otra descripción', 'Otro título');
  
-- 7. Eliminar el post de Carlos. (1 Punto)

DELETE FROM post
  WHERE nombre_usuario = 'Fabiola';

-- 8. Ingresar un nuevo post para el usuario "Carlos". (0.6 Puntos)

INSERT INTO post(
	nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
	VALUES ('Carlos', '2022-06-28', 'Nuevo post', 'Nueva descripción', 'Nuevo título');

-- PARTE 2 --

-- 1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora decreación y contenido, que se relacione con la tabla posts. (1 Punto)

CREATE TABLE comentarios(  
  id INT NOT NULL UNIQUE PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  fecha_creacion DATE NOT NULL,
  hora_creacion TIME NOT NULL,
  contenido VARCHAR(255) NOT NULL,
  post_id INT NOT NULL,
  FOREIGN KEY (post_id) REFERENCES post(id)
);

-- 2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos". (0.4 Puntos)
INSERT INTO comentarios(
	fecha_creacion, hora_creacion, contenido, post_id)
	VALUES ('2022-06-23', '13:23:03', 'Primer comentario', '1');

INSERT INTO comentarios(
	fecha_creacion, hora_creacion, contenido, post_id)
	VALUES ('2022-06-23', '13:43:15', 'Otro comentario', '1');

INSERT INTO comentarios(
	fecha_creacion, hora_creacion, contenido, post_id)
	VALUES ('2022-06-28', '17:43:15', 'Buen trabajo', '7');

INSERT INTO comentarios(
	fecha_creacion, hora_creacion, contenido, post_id)
	VALUES ('2022-06-28', '17:45:15', 'Excelente', '7');

INSERT INTO comentarios(
	fecha_creacion, hora_creacion, contenido, post_id)
	VALUES ('2022-06-28', '17:45:15', 'Genial', '7');

INSERT INTO comentarios(
	fecha_creacion, hora_creacion, contenido, post_id)
	VALUES ('2022-06-28', '17:48:15', 'Wow', '7');

-- 3. Crear un nuevo post para "Margarita". (1 Punto)

INSERT INTO post(
	nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
	VALUES ('Margarita', '2022-06-28', 'El post', 'La descripción', 'El título');

-- 4. Ingresar 5 comentarios para el post de Margarita. (1 Punto)

INSERT INTO comentarios(
	fecha_creacion, hora_creacion, contenido, post_id)
	VALUES ('2022-06-28', '17:50:15', 'PostgreSQL o MySQL', '8');

INSERT INTO comentarios(
	fecha_creacion, hora_creacion, contenido, post_id)
	VALUES ('2022-06-28', '17:52:15', 'SQL en VSCODE', '8');

INSERT INTO comentarios(
	fecha_creacion, hora_creacion, contenido, post_id)
	VALUES ('2022-06-28', '17:54:15', 'Listo', '8');

INSERT INTO comentarios(
	fecha_creacion, hora_creacion, contenido, post_id)
	VALUES ('2022-06-28', '17:55:15', 'Muy bien', '8');

INSERT INTO comentarios(
	fecha_creacion, hora_creacion, contenido, post_id)
	VALUES ('2022-06-28', '17:59:15', 'Terminamos', '8');