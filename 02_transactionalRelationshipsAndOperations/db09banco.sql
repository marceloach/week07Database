--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-06-30 17:54:41

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
-- TOC entry 210 (class 1259 OID 32870)
-- Name: cuentas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuentas (
    numero_cuenta integer NOT NULL,
    balance numeric,
    CONSTRAINT cuentas_balance_check CHECK ((balance >= 0.00))
);


ALTER TABLE public.cuentas OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 32869)
-- Name: cuentas_numero_cuenta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cuentas ALTER COLUMN numero_cuenta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cuentas_numero_cuenta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3307 (class 0 OID 32870)
-- Dependencies: 210
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuentas (numero_cuenta, balance) FROM stdin;
1	0
2	2000
\.


--
-- TOC entry 3313 (class 0 OID 0)
-- Dependencies: 209
-- Name: cuentas_numero_cuenta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuentas_numero_cuenta_seq', 2, true);


--
-- TOC entry 3166 (class 2606 OID 32877)
-- Name: cuentas cuentas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_pkey PRIMARY KEY (numero_cuenta);


-- Completed on 2022-06-30 17:54:42

--
-- PostgreSQL database dump complete
--

