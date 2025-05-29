--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-27 13:45:21

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
-- TOC entry 220 (class 1259 OID 16699)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16698)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 222 (class 1259 OID 16747)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    user_id integer,
    categorie_id integer,
    content text NOT NULL,
    photo text,
    likes integer DEFAULT 0,
    comments integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16746)
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
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 221
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
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4756 (class 2604 OID 16702)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 16750)
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 16612)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4923 (class 0 OID 16699)
-- Dependencies: 220
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
1	Dress
2	Hat
3	Shoes
4	Make Up
5	Accessory
\.


--
-- TOC entry 4925 (class 0 OID 16747)
-- Dependencies: 222
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, user_id, categorie_id, content, photo, likes, comments, created_at) FROM stdin;
1	1	1	Pose pronta, look impecável!	369abc93da241432f5f4eb479071fb04	0	0	2025-05-27 09:01:23.24722
3	2	5	Cada detalhe fala por mim!	aa83f34a008568381cc20a79719ec020	0	0	2025-05-27 09:10:21.309902
2	1	1	Não é só roupa, é minha vibe!	53d680e8df5b4daa65d435e8209c4ec5	0	0	2025-05-27 09:08:42.360246
4	2	1	O look certo muda tudo!\n	053f282a2ec93cc8c2b2333512d4e320	0	0	2025-05-27 09:10:53.174994
5	3	1	Roupa bonita, pose confiante!\n\n	3275a52b096a049a4f7fdfc6f6305d2a	0	0	2025-05-27 09:12:10.969576
6	3	1	Estilo é o que eu sou, moda é o que eu uso!\n\n\n	02161ad554cf26ca16f0e8f78a83eac8	0	0	2025-05-27 09:14:16.678691
7	3	1	Expressando minha essência em tecidos!\n\n	f17b2b18662b3ed010ae468e0bbd60e4	0	0	2025-05-27 09:14:54.056198
8	4	1	Não sigo tendências, crio momentos!	f65f138ee3b209f73f3edb868672a0b7	0	0	2025-05-27 09:15:34.25704
9	5	1	Pose + look = sucesso!	431494c5aaeb2e49a8ae5453bd881e7c	0	0	2025-05-27 09:15:51.166995
10	5	1	A moda me veste, mas sou eu que brilho!	fdfc45204ed139bcdbd8104090c2bf4d	0	0	2025-05-27 09:16:05.873321
11	6	1	Deixa que eu mostro como se faz!	4ee8b7a6fd559a50e984764a04d0d006	0	0	2025-05-27 09:16:34.179336
12	6	1	Virando a passarela da vida!	221ce06ece79a2399b81ef7ee2f8a707	0	0	2025-05-27 09:16:49.300852
13	7	1	O espelho aprovou!!	39284eedbce934b6b690552654be0116	0	0	2025-05-27 09:18:35.923476
14	7	1	O look tá on, e eu também!\n	21f51b9410687344493d9db1493996ce	0	0	2025-05-27 09:19:07.504707
15	8	1	Close certo, ângulo perfeito!	8ffb5d34b186810932fcaf0a3650ec90	0	0	2025-05-27 09:21:13.474463
16	8	1	Passando com estilo, licença!!	b12efecead2c3582161a7bf1437bdfc7	0	0	2025-05-27 09:21:38.453965
18	10	1	Elegância em cada passo!\n	e18c0471a747f0c958bc65639df42380	0	0	2025-05-27 09:22:38.449654
19	10	1	Me visto como me sinto: incrível!	e6914538876187e997995800812f3d74	0	0	2025-05-27 09:23:16.47273
20	10	1	É sobre se amar em cada pose!	79dbc7c66ef478ab02abdca5b06614fe	0	0	2025-05-27 09:23:40.753732
21	11	1	Porque o estilo vem de dentro!	e7bb202dd62f6d34a9192d39349250da	0	0	2025-05-27 09:23:58.427167
22	11	1	Um clique, mil atitudes!	b2c49e4630f12206bed32047d732b4fb	0	0	2025-05-27 09:24:49.031562
23	12	3	Pose ensaiada? Jamais. Naturalmente linda!	f8e619e05d7efb15d2eaa41541a8c1a8	0	0	2025-05-27 09:26:31.644495
24	12	5	Uma pose vale mais que mil palavras!	00e9f878c36e4c659ff5d21d1e0637bf	0	0	2025-05-27 09:27:33.384663
25	13	1	Capturando o melhor do meu mood!\n	7d57a2516cd42f9789aef6879c7a8302	0	0	2025-05-27 09:28:24.636102
26	13	1	Essa roupa pediu essa pose!!	3b2a260daace78582813df4a5027bd4c	0	0	2025-05-27 09:28:50.91949
27	14	1	Pose de quem sabe o que quer!	f9fbe3ee45e77a240aafe38589ec4373	0	0	2025-05-27 09:29:37.651905
28	14	5	Minha vibe em cada clique!	2ec0c77f549d482d1e258bdafc44ddf0	0	0	2025-05-27 09:30:00.252852
29	14	5	Pose de quem tá vivendo o melhor look do dia!	b8de83d4855df0e40cc5b5364c8eb3fd	0	0	2025-05-27 09:30:21.345485
30	14	3	Não é só uma foto, é um momento de moda!	75cc3a553349d57439676f696c4199fb	0	0	2025-05-27 09:30:50.020133
31	15	1	Look comfy com um toque de charme!	5047ada1077b5878eaff15dd5cd6044e	0	0	2025-05-27 09:31:50.838557
32	15	1	Roupa nova, energia renovada!	7d9108c37f6e2f4f5fcbd0de7683b7ff	0	0	2025-05-27 09:32:11.852379
33	16	1	Estilo é meu sobrenome!	3e6effc8fbfad3012bafc741dbe7371e	0	0	2025-05-27 09:44:45.886789
34	16	1	Nascido pra ser diferente!	66251a44cc35147c2219ebaae0dd3b6a	0	0	2025-05-27 09:45:07.20862
35	17	1	Menos fala, mais presença!	2655602665ba7f12cea692d4f6f6156c	0	0	2025-05-27 09:45:41.661314
36	17	1	Nem sempre é sobre roupa, às vezes é sobre atitude!	f2721be869b27330fd8963757c70dbe7	0	0	2025-05-27 09:45:55.718595
37	18	1	Roupa boa? Sim. Mas a pose que faz o look!	9a963899ec9dbac468ca6e719a223238	0	0	2025-05-27 09:46:14.875815
38	18	1	Simples, direto e estiloso!	3236645c2de40bff9007db50569d78f4	0	0	2025-05-27 09:46:59.326916
39	18	1	Ser confiante nunca sai de moda!	c751b5f11198c30d0bd97f5524eb899b	0	0	2025-05-27 09:48:05.28991
40	19	1	Apenas sendo minha melhor versão!	7fba71053560d627d036c02da679babb	0	0	2025-05-27 09:48:18.577061
41	19	3	Pose feita, missão cumprida!	a0aca2f2045f23ffff552de78d419bc4	0	0	2025-05-27 09:48:37.088959
42	19	3	O básico bem feito impressiona!	d8b6e1f8adbefa1232244665de63e7ae	0	0	2025-05-27 09:49:10.106909
43	20	2	Look de respeito!	e3bc2226374119ced8ac49204e03681a	0	0	2025-05-27 09:49:40.80696
44	20	2	Hoje o espelho sorriu!	d04662d106a67013621f8f625955d0f8	0	0	2025-05-27 09:49:58.49919
45	21	5	Quando o look conversa com o mood!	bd407a1bcf46dbfbbac66c5254dbb6ba	0	0	2025-05-27 09:50:19.965033
46	21	1	Roupa alinhada, mente tranquila!	e1838e1c8710ef48acc8dab26d7f8e3a	0	0	2025-05-27 09:50:37.326661
47	22	1	Combinação perfeita: estilo + atitude!	b31c47e35c54d166cb9b4da499ca31d3	0	0	2025-05-27 09:51:00.232424
48	23	3	Entre um look e outro, sigo vencendo!	713c4348b519e792d5f2911a198949b2	0	0	2025-05-27 09:51:22.887398
49	23	1	Look feito, agora só falta o rolê!	fb4b663fb127e5d522bd7ec21fa4699a	0	0	2025-05-27 09:51:43.096047
50	24	1	Pronto pro dia, pro clique e pro elogio!	70ad96d5ac8033036b562b5e0d4ca57e	0	0	2025-05-27 09:52:02.956439
51	24	3	Não é sobre vestir, é sobre representar!	7c93471b4377ab86d5ebcaea0674aed6	0	0	2025-05-27 09:52:48.125314
52	25	3	Look comfy com um toque de charme!	557563a4d13f4ec4b9b0fa0d30c5741d	0	0	2025-05-27 09:54:23.122499
53	26	3	Roupa nova, energia renovada!	51e1d651374fb223f8a5c4f464f84921	0	0	2025-05-27 09:54:58.439891
54	27	2	Mood do dia: fashionista!	5d2c268c467c21bd7d7497aa81cdfefe	0	0	2025-05-27 09:55:25.222196
55	27	2	Esse look tem história!	9fe4ce5f68f4dd9de93acba87b5c3381	0	0	2025-05-27 09:55:45.26063
56	28	2	Quando o look fala mais alto que as palavras!	7598212c096d9177ee50ed3bef502f7e	0	0	2025-05-27 09:55:58.004221
57	29	2	Look básico? Só se for básico e poderoso!	c0ab33506ca9d3281a0dfcf149dabafb	0	0	2025-05-27 09:56:15.665684
58	30	1	Look do dia com aquele toque especial!	e62f1bb0e7967b3885be7bb438b93fd0	0	0	2025-05-27 09:56:41.244855
59	31	1	Casual, mas com presença!	f8c9209ab77f00eee74dc7a88ded0ff1	0	0	2025-05-27 09:57:12.426071
60	32	1	Nem o Wi-Fi segura esse estilo!	c14e02f25afb9aecb5e1d229ca8a237f	0	0	2025-05-27 10:23:53.955966
61	33	1	O look tá pronto, agora falta o rolê!	87d27dfe7ee07cc1f706434b0bc72150	0	0	2025-05-27 10:24:19.51136
62	34	1	A beleza é natural, o estilo é treinado!	86a2f7f0d304cc0fd7ba0c97ed4b80b5	0	0	2025-05-27 10:24:33.913232
63	34	1	Me visto pra impressionar… até o espelho!	d3096c9e23ce6daac4f30bc79d999e6e	0	0	2025-05-27 10:24:44.664043
64	35	1	Estilo tão afiado que corta o tédio!	fae68d2f44b857c3f423b9964cb7850a	0	0	2025-05-27 10:24:55.236749
65	35	1	Isso aqui nem é filtro, é talento mesmo!	1ba63613e0608ac2848e7a946ef8219f	0	0	2025-05-27 10:25:10.098956
66	36	1	Tão estiloso que até a câmera pediu bis!	9328a739a7e513e1148c34f309ffe706	0	0	2025-05-27 10:25:29.108578
172	78	1	Postura de rei, fala de homem!	a6da29b8998f9ecb8a11f9ef8faf1a82	0	0	2025-05-27 11:45:22.486983
171	77	1	Quando você se conhece, nada te abala!	7d1a56956311da6ed0a7d98af4221a17	0	0	2025-05-27 11:45:04.323074
170	76	1	Sou mais do que pareço e menos do que esperam!	3d8cb5e02683e9d2cfe19cc7bd6471f2	0	0	2025-05-27 11:44:45.744841
169	74	1	O básico bem feito vale mais que exagero!	c60887d71d8cce7c7d3d7f587849f929	0	0	2025-05-27 11:44:20.752401
168	73	1	Quem tem presença não precisa se explicar!	a2af59ca8a1f8e01a1752581f3a50ecc	0	0	2025-05-27 11:44:05.146489
145	54	1	Sorriso no rosto, pose no talento!	d7d06572876c2938d393dda7341cc952	0	0	2025-05-27 11:33:35.635401
144	53	1	A beleza é só o começo!\n	240d8e1ee5c0babd46f46711301ffa9d	0	0	2025-05-27 11:33:18.547707
143	52	1	A beleza é só o começo!	e02ca4e08a2d9f3f97f9fa1ac463faa0	0	0	2025-05-27 11:33:08.627331
142	51	1	Pose feita, autoestima ativada!\n	53bced77e57091124ff1481ffa532421	0	0	2025-05-27 11:32:50.020377
141	50	1	Pose feita, autoestima ativada!	b2136e362769fbe89d539d5fa2d8f3a9	0	0	2025-05-27 11:32:37.842186
138	104	3	Pose feita, autoestima ativada!	fe1c23e8128d63113bffee4ee3217f53	0	0	2025-05-27 11:31:15.188429
137	103	3	Só mais uma foto e prometo parar (mentira)!	f2a26213fefd7207f8085fc6b40a10bd	0	0	2025-05-27 11:30:56.731482
136	102	3	Clicou, postou, brilhou!	5e86f495b35669124b8f0632db07ee9a	0	0	2025-05-27 11:30:40.426693
135	101	1	Linda, leve e livre!	43b67ff2ac299f81ca3dffe43ecca627	0	0	2025-05-27 11:30:18.969834
134	100	1	Ser mulher é um ato de coragem diário!	981c292d2d7fb7700caef1bd5f5a08ef	0	0	2025-05-27 11:29:54.52729
133	99	1	Meu brilho é de dentro pra fora!	f2af977c69426685a8cf06832fbb61fe	0	0	2025-05-27 11:29:36.467243
132	98	1	Delicada, mas não frágil!	b98203ea573ac5028532ad3536e32da1	0	0	2025-05-27 11:29:20.577411
131	97	1	Poderosa sem pedir permissão!	c8fdb2ccf7300f8d0adcbb30071093f0	0	0	2025-05-27 11:29:00.524285
130	96	5	Espelho, espelho meu… eu já sei quem venceu!	389ddfc37b1e747afaa93d4da21e6797	0	0	2025-05-27 11:28:42.682187
129	95	5	Confiança: meu melhor look!	504d6ba55b5bb66fb657b98199643928	0	0	2025-05-27 11:28:23.122968
128	94	5	Não me visto pra agradar, me visto pra arrasar!\n	0243ab34a2ede3cf7f531c920868935e	0	0	2025-05-27 11:28:05.863598
127	93	1	Nem sempre fofa, mas sempre incrível!	4af05bbe31c5423ad83daddb3c6a16f8	0	0	2025-05-27 11:27:39.11625
125	91	1	Dona de tudo que sou!	9cd71c71a1700b999f0a799dd5f9084c	0	0	2025-05-27 11:27:08.74044
124	90	1	O espelho confirmou: tá aprovado!\n	0b02ec72d65cc5a4c0a78a3b0f630037	0	0	2025-05-27 11:25:59.146013
123	89	2	Visual alinhado, mente também!	8c058a79ce412af24491a4e77e990f15	0	0	2025-05-27 11:25:04.257794
122	89	1	Terno e alma alinhados!	5b7322c036784018d978e5cdffc1a9b9	0	0	2025-05-27 11:24:21.796279
121	88	1	Porque todo homem estiloso sabe: menos é mais!	a5ba79843d2f60ccd6543ce7a8e89d14	0	0	2025-05-27 11:06:43.937239
120	87	1	Look escolhido, agora só falta o rolê!	1f95a290f36dcb83ff2a35d91158b0fd	0	0	2025-05-27 11:06:02.341823
167	72	1	Elegância é não precisar chamar atenção!	6cdc017122a4ddc19d1c338ad428d4f8	0	0	2025-05-27 11:43:48.758208
166	71	1	Não sou perfeito, mas sou completo!\n	37068dda5f19e4a48d6cda2d4ea45827	0	0	2025-05-27 11:43:29.999955
165	70	1	A mente blindada e o estilo no ponto!	5e175ef51f8ea6ac5616666f9c98a0d6	0	0	2025-05-27 11:43:06.109856
164	71	1	Energia boa é meu look preferido!	73507f08b3fcefb099db5a0e8d4fdbbd	0	0	2025-05-27 11:41:46.443284
163	70	1	Sorriso solto, alma leve!	e3772a6e044781a15e379deefa1cfe56	0	0	2025-05-27 11:41:32.48764
162	69	1	O look tá pronto, só falta o mundo ver!	bf033a02378e19a9839bb409086f90b3	0	0	2025-05-27 11:40:56.062724
161	69	1	Inspiração do dia: eu mesma no espelho!	eece7cc6037ed1728f37307abccb5938	0	0	2025-05-27 11:39:52.968974
160	68	1	Inspiração do dia: eu mesma no espelho!	47300c7a0216c488583401757c316228	0	0	2025-05-27 11:39:36.797308
159	67	1	De salto ou de tênis, o brilho é o mesmo!	302dd4ec8bdb17955e79d2983e7b181d	0	0	2025-05-27 11:39:05.923472
158	66	1	Porque cada peça tem uma história!	00512f5ada9e82cafc45bac6d7f7dcb1	0	0	2025-05-27 11:38:45.3642
157	65	3	Quem disse que conforto e estilo não andam juntos?	8dec83cc85f939b03041ff41b92d8c22	0	0	2025-05-27 11:37:56.270196
156	64	3	O look é casual, mas o charme é sério!	5fcdeac235aca7e7001b743873f777f7	0	0	2025-05-27 11:37:31.753875
155	63	1	Estilo? Meu sobrenome!	cca886aadcfa66bcaf73a4c4c8047066	0	0	2025-05-27 11:37:12.143463
154	62	1	Roupa boa é aquela que combina com a alma!	6326622f2a12d8fca6785691820ce831	0	0	2025-05-27 11:36:50.906309
152	61	1	Me visto como me sinto: incrível!	9137b9054d51e02050e6e4089f2b28fc	0	0	2025-05-27 11:35:52.583076
151	60	1	Look do dia, vibe do ano!	3e91abee98a2c5e1c6e13d7cf3262675	0	0	2025-05-27 11:35:33.380322
150	59	1	Cada pose, um capítulo da minha história!	b7cafeb6242c54afd09c9761f8b1c6d8	0	0	2025-05-27 11:35:06.994612
149	58	1	Registrando meu momento preferido: eu!	3052b2c5e8a49b7d73dfc21df68a3ebb	0	0	2025-05-27 11:34:49.737676
148	57	1	Me cliquei e me curti!	e2c435285d198310d513fb04c816cc42	0	0	2025-05-27 11:34:35.645261
147	56	1	Essa luz toda sou eu mesma!	aedbcf4fe7fce0a517b4465bcff44913	0	0	2025-05-27 11:34:10.19622
146	55	1	Tem algo melhor que se sentir linda? Não!	96879ff6698cfbf151ec646e72279e0d	0	0	2025-05-27 11:33:53.230602
118	85	3	Um bom outfit transforma o dia!	02f11f7d21fc33ab93d006c31e47ed1b	0	0	2025-05-27 11:03:28.253008
117	84	3	Se vestir bem é respeitar o próprio estilo!	c77ccbb9de6dfee52c35c7551c6b96b9	0	0	2025-05-27 11:03:03.948483
116	83	3	O look pode ser básico, mas a essência é única!	af9ca1f1564ffa6b9ee233aaa439c53e	0	0	2025-05-27 11:02:32.891357
115	82	3	Loo clean, mente focada!	3ae3f559f6bb1cfb06cb926f0fe67cf5	0	0	2025-05-27 11:01:54.344953
114	81	3	Roupa boa levanta o look. Atitude levanta tudo!	157555641387e34be8149aaf3c1671ba	0	0	2025-05-27 11:01:34.816155
113	80	2	O segredo? Confiança e boa postura!\n	5aa3010d75514a220b7fd2cb5c44efe9	0	0	2025-05-27 11:01:16.84366
112	79	2	Elegância é o silêncio de quem sabe!	c9d0cc337de4448ec8a7350d7ad56642	0	0	2025-05-27 11:00:39.533216
111	78	2	Nem sempre é sobre aparência, às vezes é só presença!	e17cdf7e5cfb367100525b874cad04a9	0	0	2025-05-27 11:00:16.352446
110	77	2	Onde eu chego, a vibe muda!	956d142f0e42559d38741e5defa8f194	0	0	2025-05-27 10:59:58.091488
109	76	5	Onde eu chego, a vibe muda!	da6bd5e957bf4a146fd0a8c56500a12c	0	0	2025-05-27 10:59:45.327045
108	75	1	Atitude fala mais alto que palavras!	b3172b8c3de9bf3ec5f80e0663876b07	0	0	2025-05-27 10:59:27.957103
107	74	1	Estilo é ser autêntico em qualquer ocasião!	9be252aa66d9f3b776677001696397c9	0	0	2025-05-27 10:59:06.466021
106	73	1	Cabeça erguida, foco no meu caminho!	a25d54ae6a29af9de2a8023ea74972ae	0	0	2025-05-27 10:58:50.577544
105	72	1	Postura de quem sabe o que quer!	d2b255ad78ce6f54b69230724de4e9a2	0	0	2025-05-27 10:58:29.907324
104	71	1	Não sou perfeito, mas o estilo tá em dia!	cfe9ffba0af0201e73d1566035ac2237	0	0	2025-05-27 10:58:13.80193
103	70	2	A confiança veste melhor que qualquer roupa!	754e505d19e3e01b20e9360b0f645659	0	0	2025-05-27 10:57:52.703362
102	69	2	Quem sabe posa, quem não sabe copia!	8b0e37996109fd0349bcbfe72660f6e9	0	0	2025-05-27 10:53:59.818436
101	68	2	Posei porque quis, brilhei porque sou!	e76aba839e418d3836c5f5ac8cfe6789	0	0	2025-05-27 10:53:35.59679
100	67	2	Quando a luz bate e o brilho acontece!	44054d28fef6009513b882e360dfc9b2	0	0	2025-05-27 10:52:14.688589
99	66	2	Essa pose foi patrocinada pela confiança!	bc15e532114eb1b5b5faa8bf973eb912	0	0	2025-05-27 10:51:54.838787
98	65	5	Apenas sendo eu, com um toque de pose!	29688bdd231276c2d60ffd3b1a29d3a8	0	0	2025-05-27 10:51:32.976137
97	64	1	A câmera ama, mas eu amo mais!	00d37845ad2850dcbd64d9b7242e1239	0	0	2025-05-27 10:51:10.462329
96	63	1	Pose de quem se ama sem moderação!	87e5e19ca4bc930c4842a6bde1a75ea8	0	0	2025-05-27 10:50:39.32532
95	62	1	Nem toda estrela está no céu!	c2076c02d2df5c2aa14f84d979107396	0	0	2025-05-27 10:50:18.018558
94	6	1	Nem toda estrela está no céu!	46b7ecfe2ae7f1f769551be13a3c832a	0	0	2025-05-27 10:50:06.507529
93	61	1	A beleza começa no olhar que a gente tem de si!	715ae376721c5be2bf6e095c6bb18244	0	0	2025-05-27 10:49:50.640573
92	60	3	Pose feita, autoestima ativada!	b7a37101044ada666b0062d839f2e5a2	0	0	2025-05-27 10:46:57.152388
91	59	5	Ela não se encaixa, ela se destaca!\n	ba83369cf28983e19feb004214f9d13d	0	0	2025-05-27 10:45:11.465352
90	58	2	Não sou tendência, sou atemporal!\n	8d88e2e1b774f0487d9c370820359e2e	0	0	2025-05-27 10:44:45.528674
89	57	1	Um brilho que nem filtro consegue esconder!	7108c4af154746b956eea1a8756c523a	0	0	2025-05-27 10:44:26.020795
88	56	2	Estilo é saber ser você em qualquer lugar!	b3677b327599f3f852077d33cad9d3e4	0	0	2025-05-27 10:44:05.399219
87	55	5	Ser simples é meu luxo favorito!	7cc308d24c0512585540b9a960a94f19	0	0	2025-05-27 10:43:44.14873
86	54	5	Poderosa sem fazer esforço!	3d167167baf17bacd8eebc43bb84685e	0	0	2025-05-27 10:43:24.447969
85	53	2	O look é só um reflexo da minha vibe!	d27c2143892f7b4f98d8943cfe207509	0	0	2025-05-27 10:42:35.109221
84	52	2	Confiança é o melhor acessório que eu visto!	9e442df775782987a7902b71c1bc2e12	0	0	2025-05-27 10:42:02.033762
83	51	1	Bonita por fora e ainda mais forte por dentro!	545d9e95abfa85426983ea53e600a27a	0	0	2025-05-27 10:41:34.76925
82	50	1	Dona de mim, do meu look e do meu momento!	a979b191004b914212835760a6d17d7d	0	0	2025-05-27 10:41:13.601434
81	49	1	Estilo é reflexo de quem eu sou!	29897f728adb27059044e1542385d6b8	0	0	2025-05-27 10:31:18.166866
80	49	1	Eu, por mim mesmo. E tá tudo certo!	3cf6c665830448b126fae0928ed5a026	0	0	2025-05-27 10:30:49.994816
78	47	1	No foco, na fé e na estética!\n	4762454bf6dd60c988d2efd4c7f680f4	0	0	2025-05-27 10:30:13.549164
77	46	1	Se é pra marcar, que seja com presença!	ccc4e9c7ba744e880424a57d3cb48d50	0	0	2025-05-27 10:29:47.520114
76	45	1	Se é pra marcar, que seja com presença!	e5b2553167cf6a23c4490b3bdf3d1bbb	0	0	2025-05-27 10:29:14.941492
75	45	1	Porque o melhor look é o de quem tem propósito!	4459114caef03a3c49a92129bcc34df0	0	0	2025-05-27 10:28:57.433911
74	44	1	Vista-se de quem você quer ser!	3b8bff8bf9bc819f86fa2e46d5fad151	0	0	2025-05-27 10:28:38.062905
73	43	1	Quem se conhece, se destaca!	740d1059a8c257839989cb75441f3acd	0	0	2025-05-27 10:28:20.196712
72	42	1	Sou mais do que aparento!	b22765aa583653df06a591a2bae86d54	0	0	2025-05-27 10:28:02.438984
71	41	1	Evoluindo em silêncio, aparecendo no estilo!	5249bbc39bdfcf747eae1701f83ffff0	0	0	2025-05-27 10:27:43.060108
70	40	1	Fotogenia ativada!	95ee8b693dea0ed8d1b91ed836d788bc	0	0	2025-05-27 10:27:17.064098
69	39	1	Close certo no modo aleatório!	89f35a8dd5e519c252eaeaf866896e64	0	0	2025-05-27 10:26:39.592625
68	38	1	Look inspirado em: ninguém, criei na hora!	66a50df0c73e3a68c9f8f2bc9559d54c	0	0	2025-05-27 10:26:26.30495
67	37	1	Treinei essa pose o dia todo!	ccdfbf9ffb82d9404b6fbe1d8243b726	0	0	2025-05-27 10:26:11.057609
\.


--
-- TOC entry 4921 (class 0 OID 16609)
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
80	Lucas Martins	lucas.martins	lucas.martins@email.com	São Paulo, SP	685a8e45daf05691933476c94708517e	0	0	2025-05-24 09:46:45.89223
81	Bruno Ferreira	brunof	bruno.ferreira@email.com	Belo Horizonte, MG	1f55a7a68f24d839c9353df37db496f7	0	0	2025-05-24 09:47:52.001067
82	Carlos Henrique	c.henrique	carlos.h@email.com	Rio de Janeiro, RJ	f53769b083fc915f9b0ad2d0fca77a02	0	0	2025-05-24 09:48:38.342448
83	André Lima	andrelima	andre.lima@email.com	Curitiba, PR	ba8220c2f10bd8de1aef0d4287965a41	2396	235	2025-05-24 09:49:37.709466
84	Thiago Souza	thiagosz	thiago.souza@email.com	Porto Alegre, RS	1109dbc22e679e68444614e650a994f4	3396	235	2025-05-24 09:51:24.301405
85	Felipe Rocha	feliperocha	felipe.rocha@email.com	Recife, PE	0062c1b68b0b8dfa4bcdc2c4049d021a	0	0	2025-05-24 09:52:22.363901
87	Rafael Oliveira	rafael.oli	rafael.oli@email.com	Fortaleza, CE	e75989ec7730f3d0f597285e9fddae2e	150	10	2025-05-24 09:53:39.290612
88	Diego Santos	diegos	diego.santos@email.com	Salvador, BA	92950737ae68c8fd91ef50e52a34f855	1500	100	2025-05-24 09:54:39.845421
89	João Pedro	joaopedro	joao.pedro@email.com	Brasília, DF	05544de9c1f3f193e95b24c049bf939f	1500	100	2025-05-24 09:55:19.799572
90	Matheus Almeida	matheus.a	matheus.almeida@email.com	Manaus, AM	22519702c7773cfcb2a9208de181b80d	0	0	2025-05-24 09:56:38.054408
91	Ana Beatriz	anabea	ana.beatriz@email.com	São Paulo, SP	e7109711464ea5f244da08b0fc426e6e	0	0	2025-05-24 10:05:24.855722
93	Mariana Costa	maricosta	mari.costa@email.com	Rio de Janeiro, RJ	103a1cb896c5a57e0a54612584326bcf	0	0	2025-05-24 10:06:37.128218
94	Larissa Gomes	larigomes	larissa.gomes@email.com	Salvador, BA	479922016bcba4168fa2a65a8a83f5a7	0	0	2025-05-24 10:07:20.297013
95	Camila Rocha	camirocha	camila.rocha@email.com	Curitiba, PR	34d0a06d2dc6fcc5767e6aa776c13076	0	0	2025-05-24 10:07:58.900015
96	Isabela Fernandes	isabela.f	isabela.fernandes@email.com	Belo Horizonte, MG	3eb58bb0292a9ab641404638ec8c3510	0	0	2025-05-24 10:08:39.58178
97	Juliana Alves	ju.alves	juliana.alves@email.com	Recife, PE	e0163caf06ee36a6e9935d2173b67f9c	0	0	2025-05-24 10:20:01.800281
98	Patrícia Lima	patlima	patricia.lima@email.com	Porto Alegre, RS	9bd8b24201136435474a28817982ff69	0	0	2025-05-24 10:20:45.319956
99	Bruna Martins	brunam	bruna.martins@email.com	Fortaleza, CE	4e5aee48828fffcf974d7524f451c8da	0	0	2025-05-24 10:21:27.041837
100	Gabriela Souza	gabysouza	gabriela.souza@email.com	Manaus, AM	823d58c31859735aae1813b24eb80dcf	0	0	2025-05-24 10:26:09.889506
101	Renata Oliveira	renata.oli	renata.oliveira@email.com	Brasília, DF	d4bc358fa7da9587b0a8e8277467047e	0	0	2025-05-24 10:27:49.399078
102	Thaís Menezes	thaism	thais.menezes@email.com	Natal, RN	d00df354e675ee06f6583399fc2185df	0	0	2025-05-24 10:33:03.760368
103	Érica Cardoso	ericac	erica.cardoso@email.com	Florianópolis, SC	e04454e25fde8fa5d9e515177c9d4199	0	0	2025-05-24 10:33:45.787042
104	Vinícius Andrade	vin.andrade	vinicius.andrade@email.com	Aracaju, SE	9f7f5d693c0bf256a682a83d48689c4e	0	0	2025-05-24 10:34:37.766144
\.


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 221
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 172, true);


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 104, true);


--
-- TOC entry 4768 (class 2606 OID 16706)
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- TOC entry 4770 (class 2606 OID 16704)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4772 (class 2606 OID 16757)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 4762 (class 2606 OID 16623)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4764 (class 2606 OID 16619)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4766 (class 2606 OID 16621)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4773 (class 2606 OID 16763)
-- Name: posts posts_categorie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_categorie_id_fkey FOREIGN KEY (categorie_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- TOC entry 4774 (class 2606 OID 16758)
-- Name: posts posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2025-05-27 13:45:21

--
-- PostgreSQL database dump complete
--

