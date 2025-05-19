--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-17 16:15:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 224 (class 1259 OID 16660)
-- Name: chats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chats (
    id integer NOT NULL,
    user_id integer,
    message text NOT NULL,
    photo text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.chats OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16659)
-- Name: chats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chats_id_seq OWNER TO postgres;

--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 223
-- Name: chats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chats_id_seq OWNED BY public.chats.id;


--
-- TOC entry 222 (class 1259 OID 16642)
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    user_id integer,
    post_id integer,
    text_comment character varying(350),
    date_comment timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16641)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO postgres;

--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 221
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- TOC entry 220 (class 1259 OID 16625)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    user_id integer,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    categoria character varying(50) NOT NULL,
    photo text,
    likes integer DEFAULT 0,
    comments integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16624)
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO postgres;

--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 219
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- TOC entry 218 (class 1259 OID 16609)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    location character varying(100),
    photo text,
    following integer DEFAULT 0,
    followers integer DEFAULT 0,
    created_user timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16608)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4767 (class 2604 OID 16663)
-- Name: chats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats ALTER COLUMN id SET DEFAULT nextval('public.chats_id_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 16645)
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- TOC entry 4761 (class 2604 OID 16628)
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 16612)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4937 (class 0 OID 16660)
-- Dependencies: 224
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chats (id, user_id, message, photo, created_at) FROM stdin;
\.


--
-- TOC entry 4935 (class 0 OID 16642)
-- Dependencies: 222
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, user_id, post_id, text_comment, date_comment) FROM stdin;
\.


--
-- TOC entry 4933 (class 0 OID 16625)
-- Dependencies: 220
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, user_id, title, content, categoria, photo, likes, comments, created_at) FROM stdin;
\.


--
-- TOC entry 4931 (class 0 OID 16609)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, username, email, location, photo, following, followers, created_user) FROM stdin;
1	Ana Paula Ribeiro	ana_ribeiro	ana.ribeiro@email.com	São Paulo, SP	5a9acfba60476f1c457b7d4fa3113abe	0	0	2025-05-17 15:05:35.202854
2	Camila Torres	cami_torres	camila.torres@email.com	Rio de Janeiro, RJ	615ec9c54b7d6ca0a1a53afba11d5203	0	0	2025-05-17 15:06:38.266105
3	Mariana Costa	mari.costa	mariana.costa@email.com	Belo Horizonte, MG	0724b39d11abfc6e6ccfbfb729dffb48	0	0	2025-05-17 15:07:48.269186
4	Larissa Almeida	larialmeida	larissa.almeida@email.com	Salvador, BA	6f82d9bf10e3ff40a3ab99cd87000f2a	0	0	2025-05-17 15:08:27.783027
5	Beatriz Farias	biafarias	beatriz.farias@email.com	Curitiba, PR	27c357d7cee7f7aee68c08767873b7b7	0	0	2025-05-17 15:09:09.669408
6	Juliana Martins	ju_martins	juliana.martins@email.com	Porto Alegre, RS	417f8e002d2a99d4a77578669d96fb17	0	0	2025-05-17 15:09:52.02504
7	Fernanda Rocha	fernandinha_ro	fernanda.rocha@email.com	Recife, PE	4a3d8126c445348ff461e060c8d75419	0	0	2025-05-17 15:10:29.317599
8	Patrícia Mendes	patmendes	patricia.mendes@email.com	Fortaleza, CE	5c1dd504c6806999af7f2c8be4d11989	0	0	2025-05-17 15:11:09.434334
10	Isabela Nogueira	isabelan	isabela.nogueira@email.com	Brasília, DF	396a62861c3fa9498ceb66c4163bffa2	0	0	2025-05-17 15:12:47.775948
11	Rafaela Silveira	rafasilveira	rafaela.silveira@email.com	Manaus, AM	40d7fbf590ff08149ca2bb219884f4b6	0	0	2025-05-17 15:14:22.557448
12	Gabriela Lima	gabi.lima	gabriela.lima@email.com	Campinas, SP	6b812164bea2a397560a8baa078921d3	0	0	2025-05-17 15:15:31.346167
13	Talita Barbosa	talitinha_b	talita.barbosa@email.com	Natal, RN	ad0d54a203fcfe00fada38b7c6778d18	0	0	2025-05-17 15:16:17.69042
14	Luana Ferreira	luaferreira	luana.ferreira@email.com	João Pessoa, PB	91a16717a265a61ef83c9164c529601c	100	150	2025-05-17 15:18:12.475285
15	Simone Andrade\t	simonea\t	simone.andrade@email.com	São Luís, MA	7cb979f780332239b07d7edf42d85b7c	1000	1500	2025-05-17 15:18:50.694363
16	Daniela Cardoso	danicardoso	daniela.cardoso@email.com	Teresina, PI	7f8d6b81ef1a4a8453f3109800d2e071	1590	1500	2025-05-17 15:19:45.28809
17	Aline Monteiro	ali_monteiro	aline.monteiro@email.com	Vitória, ES	992cb27aa5514d4c6a50ddadf84f24d3	600	400	2025-05-17 15:20:43.818198
18	Clara Menezes	clara.menezes	clara.menezes@email.com	Florianópolis, SC	9dd841a221a9bfa327d1eb90df6d8da6	803	444	2025-05-17 15:21:36.630751
19	Viviane Lopes	vivi_lopes	viviane.lopes@email.com	Goiânia, GO	bf12413e32a063f15ca34e60abe41ebc	803	444	2025-05-17 15:23:17.711264
20	Nicole Bernardes	nbernardes	nicole.bernardes@email.com	Aracaju, SE	3507628ef7f1373bbdb5fd1528b25fc1	12000	800	2025-05-17 15:26:34.206941
21	Tainá Souza	tainasouza	taina.souza@email.com	Campo Grande, MS	b82bb38c9b5a2f2b8e0835b76b2cf0e5	0	5	2025-05-17 15:32:05.647662
22	Priscila Duarte	priduart	priscila.duarte@email.com	Belém, PA	22838789d54f04e222612878d2097f36	0	5	2025-05-17 15:59:50.382949
23	Natália Rezende	nati_rezende	natalia.rezende@email.com	Maceió, AL	9baf2b7a1c07121dc3cf4e25e053689f	862	500	2025-05-17 16:00:40.046628
24	Helena Vasconcelos	helenavasc	helena.vasconcelos@email.com	Palmas, TO	aefdb4392033aef1f00ba4306fec160b	862	500	2025-05-17 16:01:24.390462
25	Amanda Queiroz	amandaqz	amanda.queiroz@email.com	Macapá, AP	a23f0ef3661f59703029b63734d0621f	2	0	2025-05-17 16:02:11.20532
26	Sabrina Pacheco	sabripacheco	sabrina.pacheco@email.com	Macapá, AP	45021d9c6156c2eaff8fa2cbcd3ba3d3	2874	200	2025-05-17 16:02:57.543441
27	Joana Teixeira	joanateixeira	joana.teixeira@email.com	Rio Branco, AC	fdd4aaaf19ced4eb51c95050b9981fdb	6000	565	2025-05-17 16:04:03.454599
28	Bianca Sales	biancasales	bianca.sales@email.com	São José dos Campos, SP	3d56f089a801cc425b8e53b41656fd75	6000	565	2025-05-17 16:04:56.2718
29	Carla Montez	carlamtz	carla.montez@email.com	Uberlândia, MG	724ff7011e8bbaf431bc842d35d1d3f3	5800	896	2025-05-17 16:06:25.510578
30	Débora Antunes	deb_antunes	debora.antunes@email.com	Londrina, PR	ed56ca26087801729c909d3eaeb681d6	5800	896	2025-05-17 16:07:04.833366
31	Melissa Barros	melissab	melissa.barros@email.com	Niterói, RJ	66f9e76d12626bc269313717deb36055	5800	896	2025-05-17 16:08:03.595184
\.


--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 223
-- Name: chats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chats_id_seq', 1, false);


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 221
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 219
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 31, true);


--
-- TOC entry 4780 (class 2606 OID 16668)
-- Name: chats chats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_pkey PRIMARY KEY (id);


--
-- TOC entry 4778 (class 2606 OID 16648)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 4776 (class 2606 OID 16635)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 4770 (class 2606 OID 16623)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4772 (class 2606 OID 16619)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4774 (class 2606 OID 16621)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4784 (class 2606 OID 16669)
-- Name: chats chats_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4782 (class 2606 OID 16654)
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4783 (class 2606 OID 16649)
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4781 (class 2606 OID 16636)
-- Name: posts posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2025-05-17 16:15:27

--
-- PostgreSQL database dump complete
--

