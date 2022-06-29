--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-06-29 11:35:42

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
-- TOC entry 210 (class 1259 OID 24674)
-- Name: autos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autos (
    id integer NOT NULL,
    marca character varying(25),
    modelo character varying(25),
    "año" character varying(25),
    color character varying(25),
    precio double precision
);


ALTER TABLE public.autos OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24673)
-- Name: autos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.autos ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.autos_id_seq
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 24679)
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas (
    fecha date,
    id_auto integer,
    cliente character varying(25),
    referencia integer,
    cantidad double precision
);


ALTER TABLE public.ventas OWNER TO postgres;

--
-- TOC entry 3312 (class 0 OID 24674)
-- Dependencies: 210
-- Data for Name: autos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autos (id, marca, modelo, "año", color, precio) FROM stdin;
1	Toyota	Corolla Araya	1991	Blanco	15000000
2	Mazda	Mazda3	2003	Azul	15000000
3	Chevrolet	Spark	1998	Verde Oscuro	2000000
4	Chery	Orinoco	2014	Negro	15000000
5	ferrari	Sport	2002	Blanco	15000000
\.


--
-- TOC entry 3313 (class 0 OID 24679)
-- Dependencies: 211
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas (fecha, id_auto, cliente, referencia, cantidad) FROM stdin;
2019-02-20	2	Alexander Cell	54322	2000000
2009-03-14	3	Katherine Smith	12325	1500000
\.


--
-- TOC entry 3319 (class 0 OID 0)
-- Dependencies: 209
-- Name: autos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autos_id_seq', 5, true);


--
-- TOC entry 3169 (class 2606 OID 24678)
-- Name: autos autos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autos
    ADD CONSTRAINT autos_pkey PRIMARY KEY (id);


--
-- TOC entry 3170 (class 1259 OID 24688)
-- Name: index_id_auto; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_id_auto ON public.ventas USING btree (id_auto);


--
-- TOC entry 3171 (class 2606 OID 24682)
-- Name: ventas ventas_id_auto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_id_auto_fkey FOREIGN KEY (id_auto) REFERENCES public.autos(id);


-- Completed on 2022-06-29 11:35:44

--
-- PostgreSQL database dump complete
--

