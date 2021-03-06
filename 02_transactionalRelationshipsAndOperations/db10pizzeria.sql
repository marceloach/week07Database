--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: pizzas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizzas (
    id integer NOT NULL,
    stock integer,
    costo integer,
    nombre character varying(45),
    CONSTRAINT pizzas_stock_check CHECK ((stock >= 0))
);


ALTER TABLE public.pizzas OWNER TO postgres;

--
-- Name: pizzas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pizzas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pizzas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas (
    cliente character varying(45),
    fecha date,
    monto integer,
    pizza integer
);


ALTER TABLE public.ventas OWNER TO postgres;

--
-- Data for Name: pizzas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizzas (id, stock, costo, nombre) FROM stdin;
1	0	5000	Pepperoni
2	3	6000	Carne queso
\.


--
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas (cliente, fecha, monto, pizza) FROM stdin;
\.


--
-- Name: pizzas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizzas_id_seq', 2, true);


--
-- Name: pizzas pizzas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas
    ADD CONSTRAINT pizzas_pkey PRIMARY KEY (id);


--
-- Name: ventas ventas_pizza_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pizza_fkey FOREIGN KEY (pizza) REFERENCES public.pizzas(id);


--
-- PostgreSQL database dump complete
--

