--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-07-11 16:44:18

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
-- TOC entry 210 (class 1259 OID 33131)
-- Name: autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autores (
    codigo integer NOT NULL,
    nombre character varying(45) NOT NULL,
    apellido character varying(45) NOT NULL,
    fecha_nacimiento integer,
    fecha_defuncion integer,
    tipo_autor character varying(45) NOT NULL
);


ALTER TABLE public.autores OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 33130)
-- Name: autores_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.autores ALTER COLUMN codigo ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.autores_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 213 (class 1259 OID 33200)
-- Name: autoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autoria (
    libros_isbn bigint,
    autores_codigo integer
);


ALTER TABLE public.autoria OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 33182)
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    isbn bigint NOT NULL,
    titulo character varying(45) NOT NULL,
    paginas integer
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 33181)
-- Name: libros_isbn_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.libros ALTER COLUMN isbn ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.libros_isbn_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 33219)
-- Name: prestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamos (
    libros_isbn bigint,
    socios_rut bigint,
    fecha_inicio date,
    fecha_devolucion date
);


ALTER TABLE public.prestamos OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 33214)
-- Name: socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socios (
    rut bigint NOT NULL,
    nombre character varying(45) NOT NULL,
    apellido character varying(45) NOT NULL,
    direccion character varying(45),
    ciudad character varying(45),
    telefono character varying(9)
);


ALTER TABLE public.socios OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 33213)
-- Name: socios_rut_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.socios ALTER COLUMN rut ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.socios_rut_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3332 (class 0 OID 33131)
-- Dependencies: 210
-- Data for Name: autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autores (codigo, nombre, apellido, fecha_nacimiento, fecha_defuncion, tipo_autor) FROM stdin;
2	SERGIO	MARDONES	1950	2012	PRINCIPAL
3	JOSE	SALGADO	1968	2020	PRINCIPAL
4	ANA	SALGADO	1972	\N	COAUTOR
5	MARTIN	PORTA	1976	\N	PRINCIPAL
1	ANDRES	ULLOA	1982	\N	PRINCIPAL
\.


--
-- TOC entry 3335 (class 0 OID 33200)
-- Dependencies: 213
-- Data for Name: autoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autoria (libros_isbn, autores_codigo) FROM stdin;
1111111111111	3
1111111111111	4
2222222222222	1
3333333333333	2
4444444444444	5
\.


--
-- TOC entry 3334 (class 0 OID 33182)
-- Dependencies: 212
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros (isbn, titulo, paginas) FROM stdin;
1111111111111	CUENTOS DE TERROR	344
2222222222222	POESIAS CONTEMPO RANEAS	167
3333333333333	HISTORIA DE ASIA	511
4444444444444	MANUAL DE MECANICA	298
\.


--
-- TOC entry 3338 (class 0 OID 33219)
-- Dependencies: 216
-- Data for Name: prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prestamos (libros_isbn, socios_rut, fecha_inicio, fecha_devolucion) FROM stdin;
1111111111111	11111111	2020-01-20	2020-01-27
2222222222222	55555555	2020-01-20	2020-01-30
3333333333333	33333333	2020-01-22	2020-01-30
4444444444444	44444444	2020-01-23	2020-01-30
1111111111111	22222222	2020-01-27	2020-02-04
4444444444444	11111111	2020-01-31	2020-02-12
2222222222222	33333333	2020-01-31	2020-02-12
\.


--
-- TOC entry 3337 (class 0 OID 33214)
-- Dependencies: 215
-- Data for Name: socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socios (rut, nombre, apellido, direccion, ciudad, telefono) FROM stdin;
11111111	JUAN	SOTO	AVENIDA 1	SANTIAGO	911111111
22222222	ANA	PEREZ	PASAJE 2	SANTIAGO	922222222
33333333	SANDRA	AGUILAR	AVENIDA 2	SANTIAGO	933333333
44444444	ESTEBAN	JEREZ	AVENIDA 3	SANTIAGO	944444444
55555555	SILVANA	MUNOZ	PASAJE 3	SANTIAGO	955555555
\.


--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 209
-- Name: autores_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autores_codigo_seq', 1, false);


--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 211
-- Name: libros_isbn_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_isbn_seq', 1, false);


--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 214
-- Name: socios_rut_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socios_rut_seq', 1, false);


--
-- TOC entry 3183 (class 2606 OID 33135)
-- Name: autores autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3185 (class 2606 OID 33186)
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (isbn);


--
-- TOC entry 3187 (class 2606 OID 33218)
-- Name: socios socios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_pkey PRIMARY KEY (rut);


--
-- TOC entry 3189 (class 2606 OID 33208)
-- Name: autoria autoria_autores_codigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autoria
    ADD CONSTRAINT autoria_autores_codigo_fkey FOREIGN KEY (autores_codigo) REFERENCES public.autores(codigo);


--
-- TOC entry 3188 (class 2606 OID 33203)
-- Name: autoria autoria_libros_isbn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autoria
    ADD CONSTRAINT autoria_libros_isbn_fkey FOREIGN KEY (libros_isbn) REFERENCES public.libros(isbn);


--
-- TOC entry 3190 (class 2606 OID 33222)
-- Name: prestamos prestamos_libros_isbn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_libros_isbn_fkey FOREIGN KEY (libros_isbn) REFERENCES public.libros(isbn);


--
-- TOC entry 3191 (class 2606 OID 33227)
-- Name: prestamos prestamos_socios_rut_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_socios_rut_fkey FOREIGN KEY (socios_rut) REFERENCES public.socios(rut);


-- Completed on 2022-07-11 16:44:20

--
-- PostgreSQL database dump complete
--

