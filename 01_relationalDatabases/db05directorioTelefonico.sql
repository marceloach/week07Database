--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-06-27 21:50:32

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
-- TOC entry 210 (class 1259 OID 24602)
-- Name: agenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agenda (
    nick character varying(25) NOT NULL,
    phone_number character varying(8)
);


ALTER TABLE public.agenda OWNER TO postgres;

--
-- TOC entry 3316 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE agenda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.agenda IS 'Ejercicio guiado: Agenda
Posterior a la creación de la primera tabla, definir los componentes de la segunda tabla agenda con los campo numero_telefonico y nick, asignando una clave foránea proveniente de la tabla telephone_directory.';


--
-- TOC entry 209 (class 1259 OID 24597)
-- Name: telephone_directory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.telephone_directory (
    name character varying(25) NOT NULL,
    last_name character varying(25),
    phone_number character varying(8) NOT NULL,
    address character varying(255),
    age integer
);


ALTER TABLE public.telephone_directory OWNER TO postgres;

--
-- TOC entry 3317 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE telephone_directory; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.telephone_directory IS 'Ejercicio guiado: Directotio telefónico
Crear un registro telefónico donde alojaremos el nombre, apellido, número telefónico, dirección y edad de una serie de individuos.';


--
-- TOC entry 3310 (class 0 OID 24602)
-- Dependencies: 210
-- Data for Name: agenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agenda (nick, phone_number) FROM stdin;
Juanito	12345678
Juancho	12345678
\.


--
-- TOC entry 3309 (class 0 OID 24597)
-- Dependencies: 209
-- Data for Name: telephone_directory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.telephone_directory (name, last_name, phone_number, address, age) FROM stdin;
Juan	Perez	12345678	Villa Pajaritos	21
Fabian	Salas	32846352	Playa Ancha	21
Braulio	Fuentes	23781363	Rancagua	19
\.


--
-- TOC entry 3168 (class 2606 OID 24601)
-- Name: telephone_directory UNIQUE; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telephone_directory
    ADD CONSTRAINT "UNIQUE" PRIMARY KEY (phone_number);


--
-- TOC entry 3169 (class 2606 OID 24605)
-- Name: agenda agenda_phone_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenda
    ADD CONSTRAINT agenda_phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.telephone_directory(phone_number);


-- Completed on 2022-06-27 21:50:35

--
-- PostgreSQL database dump complete
--

