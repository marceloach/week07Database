--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-06-28 18:17:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 24632)
-- Name: comentarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentarios (
    id integer NOT NULL,
    fecha_creacion date NOT NULL,
    hora_creacion time without time zone NOT NULL,
    contenido character varying(255) NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.comentarios OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24631)
-- Name: comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.comentarios ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comentarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 24623)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    id integer NOT NULL,
    nombre_usuario character varying(45) NOT NULL,
    fecha_creacion date NOT NULL,
    contenido character varying(255) NOT NULL,
    descripcion text,
    titulo character varying(45)
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24622)
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.post ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3316 (class 0 OID 24632)
-- Dependencies: 212
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentarios (id, fecha_creacion, hora_creacion, contenido, post_id) FROM stdin;
1	2022-06-23	13:23:03	Primer comentario	1
2	2022-06-23	13:43:15	Otro comentario	1
3	2022-06-28	17:43:15	Buen trabajo	7
4	2022-06-28	17:45:15	Excelente	7
5	2022-06-28	17:45:15	Genial	7
6	2022-06-28	17:48:15	Wow	7
7	2022-06-28	17:48:15	PostgreSQL o MySQL	8
8	2022-06-28	17:52:15	SQL en VSCODE	8
9	2022-06-28	17:54:15	Listo	8
10	2022-06-28	17:55:15	Muy bien	8
11	2022-06-28	17:59:15	Terminamos	8
\.


--
-- TOC entry 3314 (class 0 OID 24623)
-- Dependencies: 210
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (id, nombre_usuario, fecha_creacion, contenido, descripcion, titulo) FROM stdin;
1	Diego	2022-06-23	Mi primer post	Mi primera descripción	Título 1
3	Mariela	2022-06-25	Probando pgAdmin	Los anteriores fueron por VSCode	Título 1
4	Marcos	2022-06-26	Probando VSCode y SQL	Insertando valores con SQL en VSCode	Título 1
5	Pedro	2022-06-27	Otro post	Otra descripción	Otro título
6	Pablo	2022-06-28	Otro post	Otra descripción	Otro título
7	Carlos	2022-06-28	Nuevo post	Nueva descripción	Nuevo título
8	Margarita	2022-06-28	El post	La descripción	El título
\.


--
-- TOC entry 3322 (class 0 OID 0)
-- Dependencies: 211
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentarios_id_seq', 11, true);


--
-- TOC entry 3323 (class 0 OID 0)
-- Dependencies: 209
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_seq', 8, true);


--
-- TOC entry 3172 (class 2606 OID 24636)
-- Name: comentarios comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3170 (class 2606 OID 24629)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- TOC entry 3173 (class 2606 OID 24637)
-- Name: comentarios comentarios_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id);


-- Completed on 2022-06-28 18:17:47

--
-- PostgreSQL database dump complete
--

