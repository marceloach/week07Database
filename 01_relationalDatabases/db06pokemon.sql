--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-06-29 00:17:54

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
-- TOC entry 211 (class 1259 OID 24649)
-- Name: mis_pokemones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mis_pokemones (
    pokedex integer,
    fecha_captura date,
    lugar character varying(20),
    huevo boolean,
    peso double precision,
    estatura double precision
);


ALTER TABLE public.mis_pokemones OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24644)
-- Name: pokemones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemones (
    pokedex integer NOT NULL,
    nombre character varying(10) NOT NULL,
    tipo1 character varying(10) NOT NULL,
    tipo2 character varying(10)
);


ALTER TABLE public.pokemones OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24643)
-- Name: pokemones_pokedex_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pokemones ALTER COLUMN pokedex ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pokemones_pokedex_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3312 (class 0 OID 24649)
-- Dependencies: 211
-- Data for Name: mis_pokemones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mis_pokemones (pokedex, fecha_captura, lugar, huevo, peso, estatura) FROM stdin;
1	2019-01-31	Independencia	f	20.9	0.5
1	2019-01-30	EstaciÃ³n Central	f	28.3	0.8
2	2019-02-01	Independencia	f	52.7	1.3
3	2019-03-01	Independencia	f	105.8	2
3	2019-01-29	Macul	f	100.5	2.1
4	2019-02-01	Independencia	f	22.9	0.6
4	2019-01-27	Independencia	f	31.7	0.7
5	2019-02-03	La Reina	f	60.1	1.2
5	2019-02-03	Pedro Aguirre Cerda	f	80.9	1.5
6	2019-01-27	Independencia	f	120.9	1.8
6	2019-02-08	Independencia	f	130.1	2
7	2019-02-08	Independencia	f	30.8	0.5
7	2019-01-26	Independencia	t	35.7	0.6
8	2019-02-16	Cerrillos	f	40.9	1.1
9	2019-02-16	Independencia	f	151	1.6
9	2019-01-26	Independencia	f	180.9	1.8
10	2019-02-13	Cerro Navia	f	10.1	0.5
10	2019-01-26	Independencia	f	7.1	0.2
11	2019-02-13	Santiago	t	25.9	0.7
11	2019-03-01	Santiago	f	25.1	0.5
12	2019-03-04	Recoleta	f	27.8	1.1
13	2019-01-26	Santiago	f	5.1	0.3
13	2019-03-04	La Granja	t	8.2	0.5
16	2019-03-04	Santiago	f	13.1	0.3
16	2019-01-01	Santiago	t	13.9	0.4
16	2019-03-08	EstaciÃ³n Central	f	13.2	0.3
19	2019-01-24	Santiago	f	10.8	0.4
19	2019-03-08	EstaciÃ³n Central	f	9.3	0.3
19	2019-03-08	Santiago	f	11.6	0.5
19	2019-01-24	Independencia	t	15.7	0.8
19	2019-03-14	EstaciÃ³n Central	f	6.6	0.3
20	2019-03-14	Independencia	f	45.8	0.7
21	2019-03-16	Recoleta	f	4	0.5
21	2019-03-17	Providencia	f	10.9	0.9
22	2019-03-18	Independencia	f	61.7	1.2
23	2019-02-21	Independencia	t	34.9	2
26	2019-02-21	Las Condes	f	41.9	0.8
27	2019-02-21	Independencia	f	22.9	0.6
28	2019-01-19	EstaciÃ³n Central	f	53.5	1
29	2019-02-21	EstaciÃ³n Central	f	7.1	0.5
30	2019-03-20	Providencia	f	25.9	0.9
31	2019-01-19	Independencia	f	99.8	1.8
33	2019-03-20	Santiago	t	23	0.9
33	2019-03-21	Independencia	f	22.1	0.8
34	2019-03-23	Las Condes	f	112.9	1.7
34	2019-06-21	Las Condes	f	150.1	1.9
34	2019-01-11	Independencia	f	88.1	1.5
34	2019-06-15	Santiago	f	70.9	1.4
34	2019-06-18	Independencia	f	130.1	1.8
35	2019-05-31	Santiago	f	8	0.6
35	2019-01-12	EstaciÃ³n Central	f	9.5	0.6
36	2019-04-30	EstaciÃ³n Central	f	80.1	1.7
36	2019-06-18	El Bosque	f	45.8	1.3
37	2019-03-29	El Bosque	f	11.9	0.7
38	2019-01-11	San Bernardo	f	35.8	1.8
40	2019-02-28	San Bernardo	f	15.4	1.2
41	2019-06-16	Maipu	f	8.9	0.9
41	2019-06-16	Maipu	f	5.1	0.4
41	2019-01-28	Las Condes	f	8.6	0.7
41	2019-07-27	Las Condes	f	4.9	0.5
41	2019-01-01	Independencia	f	9.1	0.9
41	2019-06-26	PeÃ±alolÃ©n	f	15.8	1.1
41	2019-02-22	Independencia	f	4.8	0.4
41	2019-02-22	Santiago	f	7.6	0.5
41	2019-05-25	Santiago	f	6.3	0.6
44	2019-01-09	Santiago	f	23.8	0.8
45	2019-04-24	Santiago	f	20.8	1.3
48	2019-06-14	EstaciÃ³n Central	f	33.9	1
48	2019-03-23	EstaciÃ³n Central	f	29.7	0.9
48	2019-02-22	EstaciÃ³n Central	t	40.1	1.3
49	2019-02-23	Macul	f	14.2	1.5
49	2019-06-14	Macul	f	11.9	1.1
50	2019-01-25	La Granja	f	0.9	0.3
51	2019-06-05	Macul	f	33.9	0.7
52	2019-06-05	Macul	f	4.5	0.6
52	2019-07-03	Santiago	f	7.5	0.9
52	2019-06-02	Independencia	f	3.1	0.3
53	2019-01-09	EstaciÃ³n Central	f	28.9	0.9
53	2019-05-05	EstaciÃ³n Central	f	27	1
55	2019-04-04	EstaciÃ³n Central	f	80.1	1.8
56	2019-02-24	Independencia	f	25	0.6
57	2019-06-21	La Reina	f	40.1	0.8
58	2019-03-23	Independencia	f	26.7	0.9
58	2019-01-06	Las Condes	t	23.5	0.8
58	2019-02-23	Las Condes	f	25	0.7
60	2019-06-01	Las Condes	f	12.7	0.6
60	2019-06-23	La Florida	f	11.6	0.5
61	2019-01-11	El Bosque	f	29.9	1.2
62	2019-02-28	El Bosque	t	55.3	1.4
63	2019-07-19	Huechuraba	f	13.4	0.7
63	2019-06-01	Huechuraba	f	10.1	0.6
66	2019-06-23	Huechuraba	f	20	0.9
66	2019-06-28	Independencia	f	24.1	1
68	2019-05-15	El Bosque	f	113.1	1.2
68	2019-01-06	Independencia	f	120.5	1.4
68	2019-04-19	Independencia	f	115.7	1.2
68	2019-01-19	Santiago	f	130.4	1.6
70	2019-05-02	Santiago	t	7.1	1.1
71	2019-06-25	Santiago	f	20.4	1.9
71	2019-01-10	San Bernardo	f	14.9	1.6
72	2019-05-31	EstaciÃ³n Central	f	40.1	0.8
72	2019-06-25	San Bernardo	f	32.8	0.6
72	2019-06-01	Santiago	f	45.3	0.9
72	2019-03-21	Santiago	f	42.5	0.9
73	2019-06-01	Independencia	f	60.9	1.8
76	2019-06-01	Independencia	f	305.8	1.4
76	2019-06-25	Maipu	f	320.1	1.6
77	2019-03-16	Maipu	f	40.1	1.1
78	2019-04-30	Santiago	f	124.6	1.7
78	2019-03-14	Independencia	f	140.7	1.9
78	2019-03-07	Las Condes	f	131.4	1.8
79	2019-04-29	Las Condes	f	37.1	1.2
79	2019-02-13	EstaciÃ³n Central	f	40.8	1.3
80	2019-05-29	Lo Barnechea	f	90.1	1.7
80	2019-05-29	El Bosque	f	98.5	1.9
81	2019-02-21	Lo Barnechea	f	5.9	0.4
81	2019-03-22	El Bosque	f	7.1	0.6
81	2019-03-22	Independencia	f	4.9	0.3
84	2019-03-22	Independencia	f	40.9	1.4
84	2019-07-11	El Bosque	f	35.1	1.3
85	2019-04-28	San Miguel	f	85.8	1.8
85	2019-07-18	Macul	f	99.9	2
86	2019-05-26	Independencia	f	89.1	1.2
87	2019-07-25	Macul	f	140.1	1.8
88	2019-04-28	EstaciÃ³n Central	f	31.9	0.9
89	2019-07-28	San Bernardo	f	40.5	1.3
90	2019-05-23	Huechuraba	f	6.1	0.3
90	2019-07-30	Macul	f	7.9	0.4
90	2019-05-23	EstaciÃ³n Central	f	18.7	1
92	2019-07-31	Santiago	f	0.1	1.3
92	2019-06-28	Santiago	f	0.2	1.4
92	2019-07-11	Quilicura	f	0.1	1.3
93	2019-05-21	Santiago	t	0.1	1.6
94	2019-07-12	Santiago	f	38.9	1.7
95	2019-06-29	Santiago	f	240.8	8.9
96	2019-07-26	EstaciÃ³n Central	f	45.9	1.3
97	2019-03-22	EstaciÃ³n Central	f	80.4	1.7
97	2019-03-22	La Cisterna	f	75.5	1.6
97	2019-07-26	EstaciÃ³n Central	f	71.9	1.4
99	2019-04-26	EstaciÃ³n Central	f	98.5	2.1
99	2019-04-26	Independencia	t	101.1	2.2
100	2019-07-24	Santiago	f	9.1	0.6
100	2019-06-30	Maipu	f	9.5	0.6
101	2019-04-26	Maipu	f	60.1	1
101	2019-07-22	PeÃ±alolÃ©n	f	66.9	1.2
102	2019-05-18	Macul	f	1.9	0.2
103	2019-07-21	Macul	f	125.9	2.1
103	2019-07-19	Macul	f	120.8	2
103	2019-04-22	Independencia	f	117.6	1.9
105	2019-04-22	Santiago	f	44.9	0.9
105	2019-06-30	EstaciÃ³n Central	f	41.7	0.8
105	2019-07-19	EstaciÃ³n Central	f	50.8	1.1
105	2019-03-27	EstaciÃ³n Central	t	45.1	1
109	2019-03-27	El Bosque	f	2.1	1.2
111	2019-07-17	El Bosque	f	102.6	0.9
112	2019-05-17	Lo Barnechea	f	130.9	2
112	2019-06-30	Lo Barnechea	f	145.7	2.1
113	2019-04-20	Independencia	f	38.8	1
114	2019-04-19	Santiago	f	29.8	0.9
114	2019-07-17	San Bernardo	f	35	1.1
116	2019-05-14	San Bernardo	f	8.9	0.5
117	2019-07-12	Providencia	f	40.2	1.8
119	2019-07-12	Providencia	f	45.8	1.5
119	2019-03-29	Providencia	f	41.7	1.2
121	2019-07-09	Recoleta	f	87.9	1.1
121	2019-03-29	Providencia	f	79.8	1
121	2019-07-09	Providencia	f	80.1	1
121	2019-03-31	Vitacura	f	82.5	1.2
123	2019-03-31	Providencia	f	55.8	1.5
123	2019-04-16	Providencia	f	52	1.4
123	2019-07-06	Vitacura	f	53.3	1.2
123	2019-07-06	Quinta Normal	f	51.9	1.5
125	2019-01-04	Vitacura	f	45.1	1.5
125	2019-07-21	Vitacura	f	40.2	1.3
126	2019-04-16	Vitacura	f	50.1	1.3
127	2019-05-12	Vitacura	f	62.6	1.7
127	2019-01-04	Santiago	f	66.8	1.8
127	2019-05-12	Santiago	f	56.7	1.2
127	2019-04-16	Quinta Normal	f	52.8	1.1
131	2019-04-13	Santiago	f	252.8	2.8
134	2019-04-10	Santiago	f	24.7	1
135	2019-05-09	Independencia	f	22.9	1.1
136	2019-04-10	Santiago	f	24.4	1
137	2019-01-03	Macul	f	36.5	0.9
138	2019-03-31	Santiago	f	7.5	0.4
138	2019-03-31	Independencia	f	8.9	0.5
138	2019-05-09	Macul	f	15.5	1.1
139	2019-04-10	Maipu	f	57.3	1.5
140	2019-01-03	San Bernardo	f	15.5	0.6
143	2019-05-04	Maipu	f	460.1	2.3
144	2019-07-13	Independencia	f	55.4	1.7
145	2019-04-06	Santiago	f	52.6	1.6
146	2019-04-06	EstaciÃ³n Central	f	60	2
147	2019-05-04	EstaciÃ³n Central	f	4.5	2
147	2019-07-03	EstaciÃ³n Central	f	3.1	1.8
148	2019-05-01	Providencia	f	18.6	4.1
149	2019-07-01	El Bosque	f	288.9	2.9
149	2019-04-01	Conchali	f	279.5	2.4
149	2019-04-01	PeÃ±alolÃ©n	f	290.1	3
\.


--
-- TOC entry 3311 (class 0 OID 24644)
-- Dependencies: 210
-- Data for Name: pokemones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokemones (pokedex, nombre, tipo1, tipo2) FROM stdin;
1	Bulbasaur	planta	veneno
2	Ivysaur	planta	veneno
3	Venusaur	planta	veneno
4	Charmander	fuego	\N
5	Charmeleon	fuego	\N
6	Charizard	fuego	volador
7	Squirtle	agua	\N
8	Wartortle	agua	\N
9	Blastoise	agua	\N
10	Caterpie	bicho	\N
11	Metapod	bicho	\N
12	Butterfree	bicho	volador
13	Weedle	bicho	veneno
14	Kakuna	bicho	veneno
15	Beedrill	bicho	veneno
16	Pidgey	normal	volador
17	Pidgeotto	normal	volador
18	Pidgeot	normal	volador
19	Rattata	normal	\N
20	Raticate	normal	\N
21	Spearow	normal	volador
22	Fearow	normal	volador
23	Ekans	veneno	\N
24	Arbok	veneno	\N
25	Pikachu	electrico	\N
26	Raichu	electrico	\N
27	Sandshrew	tierra	\N
28	Sandslash	tierra	\N
29	Nidoran	veneno	\N
30	Nidorina	veneno	\N
31	Nidoqueen	veneno	tierra
32	Nidoran	veneno	\N
33	Nidorino	veneno	\N
34	Nidoking	veneno	tierra
35	Clefairy	hada	\N
36	Clefable	hada	\N
37	Vulpix	fuego	\N
38	Ninetales	fuego	\N
39	Jigglypuff	normal	hada
40	Wigglytuff	normal	hada
41	Zubat	veneno	volador
42	Golbat	veneno	volador
43	Oddish	planta	veneno
44	Gloom	planta	veneno
45	Vileplume	planta	veneno
46	Paras	bicho	planta
47	Parasect	bicho	planta
48	Venonat	bicho	veneno
49	Venomoth	bicho	veneno
50	Diglett	tierra	\N
51	Dugtrio	tierra	\N
52	Meowth	normal	\N
53	Persian	normal	\N
54	Psyduck	agua	\N
55	Golduck	agua	\N
56	Mankey	lucha	\N
57	Primeape	lucha	\N
58	Growlithe	fuego	\N
59	Arcanine	fuego	\N
60	Poliwag	agua	\N
61	Poliwhirl	agua	\N
62	Poliwrath	agua	lucha
63	Abra	psiquico	\N
64	Kadabra	psiquico	\N
65	Alakazam	psiquico	\N
66	Machop	lucha	\N
67	Machoke	lucha	\N
68	Machamp	lucha	\N
69	Bellsprout	planta	veneno
70	Weepinbell	planta	veneno
71	Victreebel	planta	veneno
72	Tentacool	agua	veneno
73	Tentacruel	agua	veneno
74	Geodude	roca	tierra
75	Graveler	roca	tierra
76	Golem	roca	tierra
77	Ponyta	fuego	\N
78	Rapidash	fuego	\N
79	Slowpoke	agua	psiquico
80	Slowbro	agua	psiquico
81	Magnemite	electrico	acero
82	Magneton	electrico	acero
83	Farfetchd	normal	volador
84	Doduo	normal	volador
85	Dodrio	normal	volador
86	Seel	agua	\N
87	Dewgong	agua	hielo
88	Grimer	veneno	\N
89	Muk	veneno	\N
90	Shellder	agua	\N
91	Cloyster	agua	hielo
92	Gastly	fantasma	veneno
93	Haunter	fantasma	veneno
94	Gengar	fantasma	veneno
95	Onix	roca	tierra
96	Drowzee	psiquico	\N
97	Hypno	psiquico	\N
98	Krabby	agua	\N
99	Kingler	agua	\N
100	Voltorb	electrico	\N
101	Electrode	electrico	\N
102	Exeggcute	planta	psiquico
103	Exeggutor	planta	psiquico
104	Cubone	tierra	\N
105	Marowak	tierra	\N
106	Hitmonlee	lucha	\N
107	Hitmonchan	lucha	\N
108	Lickitung	normal	\N
109	Koffing	veneno	\N
110	Weezing	veneno	\N
111	Rhyhorn	tierra	roca
112	Rhydon	tierra	roca
113	Chansey	normal	\N
114	Tangela	planta	\N
115	Kangaskhan	normal	\N
116	Horsea	agua	\N
117	Seadra	agua	\N
118	Goldeen	agua	\N
119	Seaking	agua	\N
120	Staryu	agua	\N
121	Starmie	agua	psiquico
122	Mr. Mime	psiquico	hada
123	Scyther	bicho	volador
124	Jynx	hielo	psiquico
125	Electabuzz	electrico	\N
126	Magmar	fuego	\N
127	Pinsir	bicho	\N
128	Tauros	normal	\N
129	Magikarp	agua	\N
130	Gyarados	agua	volador
131	Lapras	agua	hielo
132	Ditto	normal	\N
133	Eevee	normal	\N
134	Vaporeon	agua	\N
135	Jolteon	electrico	\N
136	Flareon	fuego	\N
137	Porygon	normal	\N
138	Omanyte	roca	agua
139	Omastar	roca	agua
140	Kabuto	roca	agua
141	Kabutops	roca	agua
142	Aerodactyl	roca	volador
143	Snorlax	normal	\N
144	Articuno	hielo	volador
145	Zapdos	electrico	volador
146	Moltres	fuego	volador
147	Dratini	dragon	\N
148	Dragonair	dragon	\N
149	Dragonite	dragon	volador
150	Mewtwo	psiquico	\N
151	Mew	psiquico	\N
\.


--
-- TOC entry 3318 (class 0 OID 0)
-- Dependencies: 209
-- Name: pokemones_pokedex_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pokemones_pokedex_seq', 1, false);


--
-- TOC entry 3169 (class 2606 OID 24648)
-- Name: pokemones pokemones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemones
    ADD CONSTRAINT pokemones_pkey PRIMARY KEY (pokedex);


--
-- TOC entry 3170 (class 2606 OID 24652)
-- Name: mis_pokemones mis_pokemones_pokedex_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mis_pokemones
    ADD CONSTRAINT mis_pokemones_pokedex_fkey FOREIGN KEY (pokedex) REFERENCES public.pokemones(pokedex);


-- Completed on 2022-06-29 00:17:55

--
-- PostgreSQL database dump complete
--

