--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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

ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
ALTER TABLE ONLY public."cartItems" DROP CONSTRAINT "cartItems_pkey";
ALTER TABLE public.products ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE public.orders ALTER COLUMN "orderId" DROP DEFAULT;
ALTER TABLE public.carts ALTER COLUMN "cartId" DROP DEFAULT;
ALTER TABLE public."cartItems" ALTER COLUMN "cartItemId" DROP DEFAULT;
DROP SEQUENCE public."products_productId_seq";
DROP TABLE public.products;
DROP SEQUENCE public."orders_orderId_seq";
DROP TABLE public.orders;
DROP SEQUENCE public."carts_cartId_seq";
DROP TABLE public.carts;
DROP SEQUENCE public."cartItems_cartItemId_seq";
DROP TABLE public."cartItems";
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cartItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."cartItems" (
    "cartItemId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "productId" integer NOT NULL,
    price integer NOT NULL
);


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."cartItems_cartItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."cartItems_cartItemId_seq" OWNED BY public."cartItems"."cartItemId";


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "cartId" integer NOT NULL,
    name text NOT NULL,
    "creditCard" text NOT NULL,
    "shippingAddress" text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    image text NOT NULL,
    "shortDescription" text NOT NULL,
    "longDescription" text NOT NULL
);


--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: cartItems cartItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems" ALTER COLUMN "cartItemId" SET DEFAULT nextval('public."cartItems_cartItemId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: cartItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."cartItems" ("cartItemId", "cartId", "productId", price) FROM stdin;
2	72	1	2595
3	73	1	2595
4	79	2	2595
5	80	3	2900
6	81	5	9900
7	82	5	9900
8	83	5	9900
9	84	5	9900
10	85	5	9900
11	86	5	9900
12	87	5	9900
13	88	5	9900
14	89	5	9900
15	90	5	9900
16	91	5	9900
17	92	5	9900
18	93	5	9900
19	94	5	9900
21	96	5	9900
22	97	5	9900
23	98	5	9900
24	99	1	2999
25	100	1	2999
26	101	1	2999
27	102	5	9900
28	103	4	999
29	104	4	999
30	105	4	999
31	106	4	999
32	107	4	999
33	108	4	999
34	109	4	999
35	110	4	999
36	111	5	9900
37	112	5	9900
38	113	1	2999
39	114	1	2999
40	115	1	2999
41	116	1	2999
42	117	1	2999
43	118	1	2999
44	119	1	2999
45	120	1	2999
47	122	1	2999
48	123	2	2595
49	124	3	2900
50	124	1	2999
51	124	2	2595
52	124	2	2595
53	124	1	2999
54	124	1	2999
55	124	1	2999
56	124	6	830
57	125	6	830
58	125	6	830
61	126	1	2999
62	126	1	2999
63	126	1	2999
64	126	1	2999
65	126	2	2595
66	126	3	2900
67	126	6	830
68	126	1	2999
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
1	2020-03-12 19:50:38.871248+00
2	2020-03-12 19:54:21.711766+00
3	2020-03-12 19:55:05.974715+00
4	2020-03-12 20:12:04.193002+00
5	2020-03-12 20:12:29.952058+00
6	2020-03-12 20:17:38.509309+00
7	2020-03-12 20:21:55.381251+00
8	2020-03-12 21:38:04.887133+00
9	2020-03-12 22:07:41.519953+00
10	2020-03-12 23:18:34.39701+00
11	2020-03-12 23:18:57.493115+00
12	2020-03-12 23:18:57.505415+00
13	2020-03-12 23:31:10.61234+00
14	2020-03-12 23:38:46.264149+00
15	2020-03-12 23:39:17.397755+00
16	2020-03-12 23:40:31.405511+00
17	2020-03-12 23:43:06.783824+00
18	2020-03-12 23:43:36.316798+00
19	2020-03-12 23:45:28.847219+00
20	2020-03-12 23:47:37.076185+00
21	2020-03-12 23:48:03.650212+00
22	2020-03-12 23:49:01.854289+00
23	2020-03-12 23:49:33.093861+00
24	2020-03-12 23:50:36.309225+00
25	2020-03-12 23:51:01.800071+00
26	2020-03-12 23:51:50.97486+00
27	2020-03-12 23:53:23.236863+00
28	2020-03-12 23:54:03.318013+00
29	2020-03-12 23:54:20.237612+00
30	2020-03-12 23:54:33.065822+00
31	2020-03-12 23:54:40.62776+00
32	2020-03-12 23:55:18.56679+00
33	2020-03-12 23:55:47.806948+00
34	2020-03-12 23:56:01.189356+00
35	2020-03-12 23:57:02.429179+00
36	2020-03-13 00:01:07.831742+00
37	2020-03-13 00:05:43.428644+00
38	2020-03-13 00:06:28.922132+00
39	2020-03-13 00:06:58.581383+00
40	2020-03-13 00:08:49.512393+00
41	2020-03-13 00:09:13.577617+00
42	2020-03-13 00:09:38.481609+00
43	2020-03-13 00:10:36.115262+00
44	2020-03-13 00:50:28.757051+00
45	2020-03-13 00:51:20.458049+00
46	2020-03-13 00:52:32.641943+00
47	2020-03-13 00:54:50.950346+00
48	2020-03-13 00:55:57.667089+00
49	2020-03-13 00:56:58.269527+00
50	2020-03-13 01:02:07.475366+00
51	2020-03-13 01:03:49.886707+00
52	2020-03-13 01:04:45.178302+00
53	2020-03-13 01:05:11.943888+00
54	2020-03-13 01:06:22.219692+00
55	2020-03-13 01:15:19.237286+00
56	2020-03-13 01:17:57.157626+00
57	2020-03-13 01:20:39.392653+00
58	2020-03-13 01:21:00.215891+00
59	2020-03-13 01:21:26.848164+00
60	2020-03-13 01:22:06.474096+00
61	2020-03-13 01:22:19.26752+00
62	2020-03-13 17:08:36.633419+00
63	2020-03-13 17:09:43.677861+00
64	2020-03-13 17:10:34.249357+00
65	2020-03-13 17:18:39.820006+00
66	2020-03-13 17:19:19.929076+00
67	2020-03-13 17:21:56.644208+00
68	2020-03-13 17:22:22.48175+00
69	2020-03-13 17:22:45.066968+00
70	2020-03-13 17:27:16.360873+00
71	2020-03-13 17:37:53.723033+00
72	2020-03-13 17:39:01.854277+00
73	2020-03-13 17:40:12.989494+00
74	2020-03-13 17:41:25.486704+00
75	2020-03-13 17:45:40.861642+00
76	2020-03-13 17:47:05.481556+00
77	2020-03-13 17:47:55.131402+00
78	2020-03-13 17:49:59.347824+00
79	2020-03-13 17:50:30.933667+00
80	2020-03-13 17:51:36.122975+00
81	2020-03-13 17:52:40.052543+00
82	2020-03-13 17:55:06.322379+00
83	2020-03-13 17:55:31.498593+00
84	2020-03-13 17:59:49.067509+00
85	2020-03-13 18:00:17.565157+00
86	2020-03-13 18:01:08.50154+00
87	2020-03-13 18:01:36.118143+00
88	2020-03-13 18:22:17.565774+00
89	2020-03-13 18:32:44.78092+00
90	2020-03-13 18:59:40.747985+00
91	2020-03-13 19:05:26.767536+00
92	2020-03-13 19:09:23.939054+00
93	2020-03-13 20:12:28.505117+00
94	2020-03-13 20:13:00.287997+00
95	2020-03-13 20:15:20.223214+00
96	2020-03-13 20:23:23.702796+00
97	2020-03-13 21:43:56.763432+00
98	2020-03-13 23:50:45.281554+00
99	2020-03-13 23:56:02.42238+00
100	2020-03-13 23:56:29.473475+00
101	2020-03-14 00:01:05.837794+00
102	2020-03-14 00:06:34.792533+00
103	2020-03-14 00:07:01.892311+00
104	2020-03-14 18:38:40.260182+00
105	2020-03-14 18:52:58.717139+00
106	2020-03-14 18:53:15.428463+00
107	2020-03-14 19:13:19.174183+00
108	2020-03-14 19:13:52.344082+00
109	2020-03-14 19:19:27.992228+00
110	2020-03-14 19:27:08.461216+00
111	2020-03-14 19:35:15.347363+00
112	2020-03-14 19:59:27.499049+00
113	2020-03-14 20:15:47.962194+00
114	2020-03-14 20:16:06.205316+00
115	2020-03-14 20:16:35.323651+00
116	2020-03-14 20:18:15.752264+00
117	2020-03-14 20:19:08.840256+00
118	2020-03-14 20:47:48.054296+00
119	2020-03-14 20:48:09.157726+00
120	2020-03-14 21:08:26.248451+00
121	2020-03-14 22:07:21.566438+00
122	2020-03-14 22:10:10.002337+00
123	2020-03-14 22:25:21.497306+00
124	2020-03-14 22:25:29.889978+00
125	2020-04-10 23:40:04.92935+00
126	2020-04-13 02:22:24.929799+00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", name, "creditCard", "shippingAddress", "createdAt") FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription", "longDescription") FROM stdin;
1	Shake Weight	2999	/images/shake-weight.jpg	Dynamic Inertia technology ignites muscles in arms, shoulders, and chest.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
2	ShamWow	2595	/images/shamwow.jpg	It's like a chamois, towel, and sponge, all in one! Soaks up to 10x it's weight in any liquid!	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
3	Snuggie	2900	/images/snuggie.jpg	Super-Soft Fleece with pockets! One Size fits all Adults! Keeps you Warm & Your Hands-Free!	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
4	Wax Vac	999	/images/wax-vac.jpg	Gentle way to remove ear wax. Safe and hygienic. Reduces the risk of painful infections.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
5	Ostrich Pillow	9900	/images/ostrich-pillow.jpg	Create your own snugly space in the world and feel-good anywhere with the ultimate cocoon pillow.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
6	Tater Mitts	830	/images/tater-mitts.jpg	8 Seconds is all you need with Tater Mitts. Quickly and easily prepare all your favorite potato dishes with Tater Mitts.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 68, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 126, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 1, false);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, false);


--
-- Name: cartItems cartItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems"
    ADD CONSTRAINT "cartItems_pkey" PRIMARY KEY ("cartItemId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

