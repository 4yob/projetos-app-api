--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-22 06:09:21

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
32	Lucas Fernandes	lucasf_91	lucas.fernandes@email.com	São Paulo, SP	741f1d360b777aaf1ad499a533c01004	0	0	2025-05-18 13:34:41.980035
33	Rafael Oliveira	rafa_oliveira	rafael.oliveira@email.com	Rio de Janeiro, RJ	6d76a4b9750997ff28ee3bb3a06b4c64	0	0	2025-05-18 13:35:48.438961
34	Bruno Costa	brunocosta	bruno.costa@email.com	Belo Horizonte, MG	39fc4061993983ccae1afb6cf7e0d4b1	10	15	2025-05-18 13:36:47.09536
35	Felipe Martins	felipemart	felipe.martins@email.com	Curitiba, PR	79a72a618cf461fe94c99709ada86143	80	150	2025-05-18 13:39:01.381768
36	André Souza	andresouza	andre.souza@email.com	Salvador, BA	8594011508f31a247cdd5686b5bb2b0d	80	150	2025-05-18 13:39:38.467755
37	Thiago Almeida	thi.almeida	thiago.almeida@email.com	Porto Alegre, RS	c47d08f93b4237d907e6a4b331d1a17c	95	105	2025-05-18 13:42:17.673865
38	Diego Rocha	diego_rocha	diego.rocha@email.com	Recife, PE	cb2240a475371a4c41c5d84b78b71ab3	658	105	2025-05-18 13:43:14.125014
39	Matheus Lima	matlim_2024	matheus.lima@email.com	Fortaleza, CE	289e049d89d4cdc63c8f30a17caeb4e3	1654	365	2025-05-18 13:44:17.78495
40	Gustavo Ramos	gustavoramos	gustavo.ramos@email.com	Brasília, DF	11c7e9ab82861c8ca3f26b25d6f6fd94	3654	365	2025-05-18 13:45:11.945017
41	Henrique Duarte	h.duarte	henrique.duarte@email.com	Goiânia, GO	5d4d3217cb2a8892867f19cbd51c40d8	0	0	2025-05-18 13:46:04.976728
42	Pedro Henrique Silva	pedrosilva	pedro.silva@email.com	Campinas, SP	f64e3b55b5111c08f0ded2d5cdca09e5	325	125	2025-05-18 17:51:41.214523
43	Igor Mendes	igormendes	igor.mendes@email.com	João Pessoa, PB	6df87669cb1d1a3cc5e89137f9a6f67f	325	125	2025-05-18 17:59:41.204035
44	Eduardo Cardoso	edu.cardoso	eduardo.cardoso@email.com	Vitória, ES	07c7e7125aa91ac30701031f5a15fb01	368	110	2025-05-18 18:02:18.422936
45	Leandro Vasconcelos	leandro_v	leandro.vasconcelos@email.com	Florianópolis, SC	eae4986ea870fea439a404e548f1b6d6	0	0	2025-05-18 18:03:30.653691
46	Daniel Barbosa	daniel.brb	daniel.barbosa@email.com	Maceió, AL	678d98ee6b772eecd96c3cdfcde54de2	0	0	2025-05-18 18:06:52.337196
47	Caio Teixeira	caiotx	caio.teixeira@email.com	Manaus, AM	21d298874cc7f807e96b30d08cc6a78a	8760	569	2025-05-18 21:06:59.220293
49	Vinícius Ferreira	vini.ferreira	vinicius.ferreira@email.com	São Luís, MA	b3a56368614b724d921debd6bc83ef5a	987	569	2025-05-18 21:14:48.676795
50	Renata Moura	renata.moura	renata.moura@email.com	Sorocaba, SP	2c906966e4326b24c6464a147579ffdb	220	89	2025-05-18 21:17:22.6157
51	Carolina Pires	carolpires	carolina.pires@email.com	São Bernardo do Campo, SP	bde8d72dd84a66cfb200595499832c5d	220	89	2025-05-18 21:18:43.189877
52	Jéssica Tavares	jess.tavares	jessica.tavares@email.com	Petrópolis, RJ	71f9fd9dec18f0a7093455c7c685a242	2200	890	2025-05-18 21:19:45.490203
53	Michele Araújo	mich_araujo	michele.araujo@email.com	Blumenau, SC	75ca4ca8db91c0a2f931685effa6c4f4	220	90	2025-05-18 21:20:50.106361
54	Lúcia Camargo	lucia.camargo	lucia.camargo@email.com	Cuiabá, MT	82854b17704a37533585e27613932a56	2270	950	2025-05-18 21:22:06.785697
55	Amanda Ribeiro	amandarib	amanda.ribeiro@email.com	Feira de Santana, BA	9a19e4f6028ffe558cfe57ee503c06f2	0	0	2025-05-18 21:22:58.375297
56	Paula Fernandes	paulaf	paula.fernandes@email.com	Franca, SP	99ea9052e86856f66bd567b4ed82dae9	0	0	2025-05-18 21:24:07.11054
57	Tânia Castro	taniacastro	tania.castro@email.com	Maringá, PR	6e192442a1c7553309429f62cf214e24	0	0	2025-05-18 21:25:11.620696
58	Elisa Monteiro	elisa_m	elisa.monteiro@email.com	Joinville, SC	8904275f62fcd314a7fdd53300efaf05	136	120	2025-05-18 21:26:37.249336
59	Roberta Lima	robertalima	roberta.lima@email.com	Anápolis, GO	92dd54ee39ab1284ae6838c830f2cf4f	789	120	2025-05-18 21:27:42.814936
60	Cristina Leal	crisleal	cristina.leal@email.com	Ribeirão Preto, SP	e3c7a11e1dc2c87d837a061472812597	269	56	2025-05-18 21:31:03.554743
61	Fabiana Rocha	fabirocha	fabiana.rocha@email.com	Natal, RN	c2774d7658f714773f08d1ad6854393f	150	50	2025-05-18 21:32:33.318036
62	Tatiane Meireles	tati_meireles	tatiane.meireles@email.com	Porto Velho, RO	b79b4117545e8ed63a7e67427b79a0ab	1050	500	2025-05-18 21:33:37.775957
63	Adriana Nogueira	adrianan	adriana.nogueira@email.com	São Vicente, SP	53ab06db5f8a5cef80261ee2a330cb6a	1050	500	2025-05-18 21:36:21.619792
64	Vanessa Luz	vanessaluz	vanessa.luz@email.com	Montes Claros, MG	06390cf53a44c27c56313c9a6527b242	1050	500	2025-05-18 21:37:03.429665
65	Rafaela Pimentel	rafapimentel	rafaela.pimentel@email.com	Criciúma, SC	08425062028fdd2a0303ad2a17bfdae8	0	0	2025-05-18 21:37:51.049052
66	Sílvia Andrade	silviandrade	silvia.andrade@email.com	Juiz de Fora, MG	f03cb82890610afc8264c7821126e284	0	0	2025-05-18 21:47:12.662023
67	Elaine Moreira	elaine.mr	elaine.moreira@email.com	Barueri, SP	0040db5cf5ef115ed4bf7cedfa247b1d	852	147	2025-05-18 21:48:07.43104
68	Monique Farias	moniquef	monique.farias@email.com	Itajaí, SC	992683a29ec581ad72f1414a83d2e17c	963	369	2025-05-18 21:51:41.815711
69	Clarissa Almeida	clarissaal	clarissa.almeida@email.com	Bauru, SP	dff63b2a799b4156183682c76fa267ac	2548	459	2025-05-18 21:53:14.891784
70	Alexandre Brito	alexbrito	alexandre.brito@email.com	São José do Rio Preto, SP	150c5c5eefe96e9f5b61d78e99dbdd74	2548	459	2025-05-18 21:55:37.045515
71	Rodrigo Tavares	rodtavares	rodrigo.tavares@email.com	Belém, PA	26aad2e83fde6fa4173d6571e8840d2d	862	368	2025-05-18 21:57:35.271369
72	Murilo Pereira	murilop_	murilo.pereira@email.com	Uberaba, MG	fa9e701b56e7704615484aaed659dc7b	8796	654	2025-05-18 21:58:40.710847
73	Sérgio Lima	sergiol	sergio.lima@email.com	João Pessoa, PB	58eba33d49362a909d7478bade0326b6	0	12	2025-05-18 21:59:38.183352
74	William Soares	willsoares	william.soares@email.com	Fortaleza, CE	678e10fd59601b923034a07811ec2d9f	789	123	2025-05-18 22:00:31.932777
75	Alan Costa	alancosta	alan.costa@email.com	São Carlos, SP	aa26e2e79d74ffa346d635454287d2a4	864	468	2025-05-18 22:08:13.524815
76	Vitor Mendonça	vitormendonca	vitor.mendonca@email.com	Palmas, TO	8a1af4bc92247d4e1dd7be896e3cfe48	864	468	2025-05-18 22:08:55.410732
77	Jorge Amaral	jorgeamaral	jorge.amaral@email.com	Arapiraca, AL	d61fd2387ef441a780979074a25b7e1f	0	0	2025-05-18 22:09:31.40928
78	Nathan Lopes	nathanlopes	nathan.lopes@email.com	Boa Vista, RR	64e59ca0812157b337631bc6b01a4f22	0	0	2025-05-18 22:10:14.30996
79	Marcelo Cunha	marcelocunha	marcelo.cunha@email.com	Rio Branco, AC	e551f77f433c9d9d893ccb7753a1bebe	0	0	2025-05-18 22:10:56.495565
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

SELECT pg_catalog.setval('public.users_id_seq', 79, true);


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


-- Completed on 2025-05-22 06:09:21

--
-- PostgreSQL database dump complete
--

