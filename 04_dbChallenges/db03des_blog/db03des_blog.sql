--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-06-30 17:55:37

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
-- TOC entry 210 (class 1259 OID 24738)
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24737)
-- Name: rol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.rol ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 24743)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    rut integer,
    nombre character varying(45),
    telefono character varying(9),
    mail character varying(45),
    genero character(1),
    fecha_nacimiento date,
    rol_id integer
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 3311 (class 0 OID 24738)
-- Dependencies: 210
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rol (id, nombre, descripcion) FROM stdin;
1	Administrador	Control total
2	Marketing	Editar y crear anuncios
3	Editor	Editar artículos
4	Subscriptor	Leer artículos
\.


--
-- TOC entry 3312 (class 0 OID 24743)
-- Dependencies: 211
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id) FROM stdin;
19	Juan\nSoto	9999999	juan.soto@gmail.com	M	2020-06-24	1
27	Jorge\nPerez	8888888	jorge.perez@hotmail.com	M	2021-03-12	4
35	Sara\nMorales	7777777	sara.morales@gmail.com	F	2022-06-30	\N
\.


--
-- TOC entry 3318 (class 0 OID 0)
-- Dependencies: 209
-- Name: rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rol_id_seq', 4, true);


--
-- TOC entry 3169 (class 2606 OID 24742)
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id);


--
-- TOC entry 3170 (class 2606 OID 24746)
-- Name: usuario usuario_rol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.rol(id);


-- Completed on 2022-06-30 17:55:38

--
-- PostgreSQL database dump complete
--

