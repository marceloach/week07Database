--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-07-06 13:16:41

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
-- TOC entry 209 (class 1259 OID 33037)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    email character varying(40) NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 33040)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 210
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- TOC entry 211 (class 1259 OID 33041)
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compra (
    id integer NOT NULL,
    cliente_id integer NOT NULL,
    fecha date
);


ALTER TABLE public.compra OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 33044)
-- Name: compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compra_id_seq OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 212
-- Name: compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compra_id_seq OWNED BY public.compra.id;


--
-- TOC entry 213 (class 1259 OID 33045)
-- Name: detalle_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_compra (
    id integer NOT NULL,
    producto_id integer NOT NULL,
    compra_id integer NOT NULL,
    cantidad integer
);


ALTER TABLE public.detalle_compra OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 33048)
-- Name: detalle_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_compra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_compra_id_seq OWNER TO postgres;

--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 214
-- Name: detalle_compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_compra_id_seq OWNED BY public.detalle_compra.id;


--
-- TOC entry 215 (class 1259 OID 33049)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id integer NOT NULL,
    descripcion character varying(500) NOT NULL,
    stock integer,
    precio integer,
    CONSTRAINT stock_valido CHECK ((stock >= 0))
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 33055)
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_id_seq OWNER TO postgres;

--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 216
-- Name: producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;


--
-- TOC entry 3179 (class 2604 OID 33056)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 3180 (class 2604 OID 33057)
-- Name: compra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra ALTER COLUMN id SET DEFAULT nextval('public.compra_id_seq'::regclass);


--
-- TOC entry 3181 (class 2604 OID 33058)
-- Name: detalle_compra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_compra ALTER COLUMN id SET DEFAULT nextval('public.detalle_compra_id_seq'::regclass);


--
-- TOC entry 3182 (class 2604 OID 33059)
-- Name: producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);


--
-- TOC entry 3336 (class 0 OID 33037)
-- Dependencies: 209
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id, nombre, email) FROM stdin;
2	usuario02	usuario02@yahoo.com
3	usuario03	usuario03@hotmail.com
4	usuario04	usuario04@hotmail.com
5	usuario05	usuario05@yahoo.com
6	usuario06	usuario06@hotmail.com
7	usuario07	usuario07@yahoo.com
8	usuario08	usuario08@yahoo.com
9	usuario09	usuario09@hotmail.com
10	usuario010	usuario010@hotmail.com
1	usuario01	usuario01@gmail.com
\.


--
-- TOC entry 3338 (class 0 OID 33041)
-- Dependencies: 211
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compra (id, cliente_id, fecha) FROM stdin;
1	4	2020-02-12
2	5	2020-03-14
3	10	2020-02-07
4	9	2020-04-25
5	7	2020-04-03
6	2	2020-03-23
7	9	2020-03-11
8	3	2020-04-21
9	2	2020-02-24
10	10	2020-04-18
11	3	2020-04-22
12	8	2020-03-22
13	10	2020-02-20
14	9	2020-02-07
15	3	2020-04-25
16	4	2020-03-20
17	9	2020-02-22
18	8	2020-02-17
19	10	2020-03-14
20	9	2020-03-07
21	6	2020-04-28
22	5	2020-02-06
23	10	2020-01-31
24	3	2020-02-15
25	9	2020-03-12
26	1	2020-01-31
27	10	2020-04-08
28	3	2020-03-20
29	9	2020-03-16
30	5	2020-04-09
31	1	2020-03-29
32	2	2020-03-29
39	1	2022-07-06
40	2	2022-07-06
\.


--
-- TOC entry 3340 (class 0 OID 33045)
-- Dependencies: 213
-- Data for Name: detalle_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_compra (id, producto_id, compra_id, cantidad) FROM stdin;
1	2	2	9
2	7	6	5
3	16	23	1
4	10	13	4
5	7	8	2
6	2	14	6
7	19	8	7
8	7	19	5
9	17	3	5
10	2	3	5
11	16	27	8
12	16	10	8
13	13	14	8
14	3	30	4
15	13	15	2
16	20	21	5
17	15	21	2
18	15	16	3
19	16	19	9
20	1	6	10
21	17	1	7
22	18	1	9
23	20	4	8
24	16	4	9
25	14	5	6
26	17	7	2
27	17	9	6
28	18	11	4
29	20	12	7
30	3	17	5
31	2	18	10
32	20	20	1
33	10	22	10
34	18	24	2
35	3	25	10
36	3	26	4
37	3	28	2
38	11	29	7
39	9	31	5
40	1	32	3
41	2	32	3
42	8	32	3
61	9	39	5
62	1	40	3
63	2	40	3
64	8	40	3
\.


--
-- TOC entry 3342 (class 0 OID 33049)
-- Dependencies: 215
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (id, descripcion, stock, precio) FROM stdin;
3	producto3	9	9449
4	producto4	8	194
5	producto5	10	3764
6	producto6	6	8655
7	producto7	4	2875
10	producto10	1	3001
11	producto11	9	7993
12	producto12	3	8504
13	producto13	10	2415
14	producto14	5	3824
15	producto15	10	7358
16	producto16	7	3631
17	producto17	3	4467
18	producto18	2	9383
19	producto19	6	1140
20	producto20	4	102
8	producto8	0	8923
9	producto9	3	4219
1	producto1	3	9107
2	producto2	2	1760
\.


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 210
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 13, true);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 212
-- Name: compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compra_id_seq', 40, true);


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 214
-- Name: detalle_compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_compra_id_seq', 64, true);


--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 216
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_id_seq', 20, true);


--
-- TOC entry 3185 (class 2606 OID 33061)
-- Name: cliente cliente_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_email_key UNIQUE (email);


--
-- TOC entry 3187 (class 2606 OID 33063)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 3189 (class 2606 OID 33065)
-- Name: compra compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id);


--
-- TOC entry 3191 (class 2606 OID 33067)
-- Name: detalle_compra detalle_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_compra
    ADD CONSTRAINT detalle_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 33069)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 33070)
-- Name: compra compra_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);


--
-- TOC entry 3195 (class 2606 OID 33075)
-- Name: detalle_compra detalle_compra_compra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_compra
    ADD CONSTRAINT detalle_compra_compra_id_fkey FOREIGN KEY (compra_id) REFERENCES public.compra(id);


--
-- TOC entry 3196 (class 2606 OID 33080)
-- Name: detalle_compra detalle_compra_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_compra
    ADD CONSTRAINT detalle_compra_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(id);


-- Completed on 2022-07-06 13:16:43

--
-- PostgreSQL database dump complete
--

