--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-27 21:31:36

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
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 224 (class 1259 OID 16778)
-- Name: chats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chats (
    id integer NOT NULL,
    user_id integer,
    message text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.chats OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16777)
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
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 223
-- Name: chats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chats_id_seq OWNED BY public.chats.id;


--
-- TOC entry 228 (class 1259 OID 16819)
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
-- TOC entry 227 (class 1259 OID 16818)
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
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 227
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- TOC entry 226 (class 1259 OID 16794)
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    user_id integer,
    post_id integer,
    chat_id integer,
    message text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16793)
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO postgres;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 225
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


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
-- TOC entry 4974 (class 0 OID 0)
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
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4771 (class 2604 OID 16702)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 4776 (class 2604 OID 16781)
-- Name: chats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats ALTER COLUMN id SET DEFAULT nextval('public.chats_id_seq'::regclass);


--
-- TOC entry 4780 (class 2604 OID 16822)
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- TOC entry 4778 (class 2604 OID 16797)
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- TOC entry 4772 (class 2604 OID 16750)
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 16612)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4956 (class 0 OID 16699)
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
-- TOC entry 4960 (class 0 OID 16778)
-- Dependencies: 224
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chats (id, user_id, message, created_at) FROM stdin;
1	1	A moda ‚ uma forma de liberdade. Liberte-se! 	2025-05-27 15:24:01.76677
2	2	Qual sua pe‡a favorita no guarda-roupa? 	2025-05-27 15:24:01.76677
3	3	Aposte em acess¢rios para transformar qualquer look! 	2025-05-27 15:24:01.76677
4	4	Estilo ‚ a expressÆo da sua personalidade. Seja vocˆ! 	2025-05-27 15:24:01.76677
5	5	Sustentabilidade na moda ‚ o futuro. Vamos juntos! 	2025-05-27 15:24:01.76677
6	6	Look do dia: conforto e estilo sempre! 	2025-05-27 15:24:01.76677
7	7	J  experimentou misturar estampas? Fica incr¡vel! 	2025-05-27 15:24:01.76677
8	8	Invista em pe‡as que valorizam seu corpo e estilo. 	2025-05-27 15:24:01.76677
9	10	O segredo do estilo est  nos detalhes.	2025-05-27 15:24:01.76677
10	11	Como escolher o jeans perfeito? Aposte no conforto!	2025-05-27 15:24:01.76677
11	12	Vocˆ ‚ mais cl ssico ou moderno na moda?	2025-05-27 15:24:01.76677
12	13	Acess¢rios grandes para um look poderoso!	2025-05-27 15:24:01.76677
13	14	Look monocrom tico: simples e elegante.	2025-05-27 15:24:01.76677
14	15	Moda ‚ arte, vista-se como uma obra-prima!	2025-05-27 15:24:01.76677
15	16	Combinar cores pode ser divertido e estiloso!	2025-05-27 15:24:01.76677
16	17	Pe‡as b sicas sÆo essenciais para qualquer guarda-roupa.	2025-05-27 15:24:01.76677
17	18	Roupas confort veis tamb‚m podem ser estilosas!	2025-05-27 15:24:01.76677
18	19	J  pensou em customizar suas roupas?	2025-05-27 15:24:01.76677
19	20	Invista em sapatos que combinam com tudo!	2025-05-27 15:24:01.76677
20	21	A moda ‚ para todos: encontre seu estilo £nico!	2025-05-27 15:24:01.76677
21	22	O que nÆo pode faltar no seu closet? Conta pra gente!	2025-05-27 15:24:01.76677
22	23	Estampas florais sÆo a cara da primavera!	2025-05-27 15:24:01.76677
23	24	Roupas feitas com amor fazem toda a diferen‡a.	2025-05-27 15:24:01.76677
24	25	Aposte em looks que refletem sua autenticidade!	2025-05-27 15:24:01.76677
25	26	Vocˆ prefere roupas neutras ou coloridas?	2025-05-27 15:24:01.76677
26	27	Look comfy para um dia relax, quem curte?	2025-05-27 15:24:01.76677
27	28	Quer dicas para cuidar melhor das suas roupas?	2025-05-27 15:24:01.76677
28	29	Tem alguma pe‡a xod¢ no seu arm rio? Conta!	2025-05-27 15:24:01.76677
29	30	Como escolher a bolsa ideal para o dia a dia?	2025-05-27 15:24:01.76677
30	31	A moda ‚ uma forma de expressÆo sem palavras!	2025-05-27 15:24:01.76677
31	32	Roupas oversize sÆo super estilosas e confort veis!	2025-05-27 15:24:01.76677
32	33	Qual seu acess¢rio favorito para dar um up no look?	2025-05-27 15:24:01.76677
33	34	J  usou roupas de brech¢? Tem charme £nico!	2025-05-27 15:24:01.76677
34	35	Mix de estampas: atrevimento com estilo!	2025-05-27 15:24:01.76677
35	36	Pe‡as sustent veis ajudam o planeta e o estilo!	2025-05-27 15:24:01.76677
36	37	J  fez um look inspirado em uma celebridade? Quem?	2025-05-27 15:24:01.76677
37	38	O que nÆo pode faltar num look de festa?	2025-05-27 15:24:01.76677
38	39	Qual sua cor favorita para se vestir?	2025-05-27 15:24:01.76677
39	40	Moda casual: conforto e estilo na medida certa! 	2025-05-27 15:24:01.76677
40	41	Os detalhes fazem toda a diferen‡a no visual!	2025-05-27 15:24:01.76677
41	42	Vocˆ prefere acess¢rios grandes ou discretos?	2025-05-27 15:24:01.76677
42	43	O que acha de apostar em estampas geom‚tricas?	2025-05-27 15:24:01.76677
43	44	J  experimentou looks monocrom ticos? SÆo incr¡veis!	2025-05-27 15:24:01.76677
44	45	Como escolher o vestido ideal para uma ocasiÆo especial?	2025-05-27 15:24:01.76677
45	46	Roupas justas ou soltas: qual seu estilo?	2025-05-27 15:24:01.76677
46	47	Qual seu look preferido para um passeio no parque?	2025-05-27 15:24:01.76677
47	49	Qual pe‡a vocˆ acha que ‚ um investimento de moda?	2025-05-27 15:24:01.76677
48	50	Look streetwear para quem curte estilo urbano!	2025-05-27 15:24:01.76677
49	51	J  usou chap‚u como acess¢rio? Super estiloso!	2025-05-27 15:24:01.76677
50	52	Moda e conforto podem andar juntos sim!	2025-05-27 15:24:01.76677
51	53	Qual a pe‡a que vocˆ sempre repete no dia a dia?	2025-05-27 15:24:01.76677
52	54	Invista em roupas que fazem vocˆ se sentir confiante!	2025-05-27 15:24:01.76677
53	55	O que acha de pe‡as feitas com tecidos tecnol¢gicos?	2025-05-27 15:24:01.76677
54	56	J  pensou em montar um guarda-roupa c psula?	2025-05-27 15:24:01.76677
55	57	Looks coloridos para dar energia no seu dia!	2025-05-27 15:24:01.76677
56	58	Vocˆ prefere looks mais formais ou despojados?	2025-05-27 15:24:01.76677
57	59	Como combinar sapatos com a roupa? Dica r pida!	2025-05-27 15:24:01.76677
58	60	Roupas de inverno que al‚m de quentinhas sÆo estilosas!	2025-05-27 15:24:01.76677
59	61	Qual seu estilo favorito de jaqueta?	2025-05-27 15:24:01.76677
60	62	Os acess¢rios certos transformam qualquer look!	2025-05-27 15:24:01.76677
61	63	J  experimentou usar roupas com estampa animal?	2025-05-27 15:24:01.76677
62	64	Qual seu look ideal para um encontro?	2025-05-27 15:24:01.76677
63	65	Dica: roupas de cores neutras combinam com tudo!	2025-05-27 15:24:01.76677
64	66	Vocˆ prefere roupas feitas … mÆo ou industrializadas?	2025-05-27 15:24:01.76677
65	67	Como escolher o melhor jeans para seu corpo?	2025-05-27 15:24:01.76677
66	68	Moda sustent vel: pequenas atitudes, grande impacto!	2025-05-27 15:24:01.76677
67	69	J  fez customiza‡Æo DIY nas suas roupas?	2025-05-27 15:24:01.76677
68	70	Qual pe‡a vintage vocˆ gostaria de ter?	2025-05-27 15:24:01.76677
69	71	Look para o verÆo: frescor e estilo na medida!	2025-05-27 15:24:01.76677
70	72	Vocˆ prefere estampas florais ou geom‚tricas?	2025-05-27 15:24:01.76677
71	73	Sapatos confort veis para usar o dia todo!	2025-05-27 15:24:01.76677
72	74	Aposte em acess¢rios que refletem sua personalidade!	2025-05-27 15:24:01.76677
73	75	Qual pe‡a ‚ seu verdadeiro "curinga"?	2025-05-27 15:24:01.76677
74	76	Vocˆ gosta de moda minimalista?	2025-05-27 15:24:01.76677
75	77	Como escolher um bom blazer para ocasiäes formais?	2025-05-27 15:24:01.76677
76	78	Qual ‚ a pe‡a que vocˆ gostaria de reinventar?	2025-05-27 15:24:01.76677
77	79	Dicas para combinar estampas sem errar!	2025-05-27 15:24:01.76677
78	80	Qual sua opiniÆo sobre fast fashion?	2025-05-27 15:24:01.76677
79	81	Vocˆ tem um look favorito para sair com amigos?	2025-05-27 15:24:01.76677
80	82	J  usou alguma pe‡a inspirada em outra cultura?	2025-05-27 15:24:01.76677
81	83	Looks para dias chuvosos com estilo!	2025-05-27 15:24:01.76677
82	84	Vocˆ prefere bolsas grandes ou pequenas?	2025-05-27 15:24:01.76677
83	85	Qual seu acess¢rio indispens vel para o inverno?	2025-05-27 15:24:01.76677
84	87	Roupas feitas por designers independentes tˆm personalidade!	2025-05-27 15:24:01.76677
85	88	Qual seu estilo preferido para o trabalho?	2025-05-27 15:24:01.76677
86	89	Vocˆ gosta de usar chap‚us ou bon‚s?	2025-05-27 15:24:01.76677
87	90	Dica r pida: misture tecidos para um look diferenciado!	2025-05-27 15:24:01.76677
88	91	Como a moda pode ajudar na autoestima?	2025-05-27 15:24:01.76677
89	93	J  experimentou usar roupas com brilho?	2025-05-27 15:24:01.76677
90	94	A moda ‚ uma arte que vocˆ veste todo dia!	2025-05-27 15:24:01.76677
91	95	Qual pe‡a vocˆ nunca deixaria de lado?	2025-05-27 15:24:01.76677
92	96	J  fez alguma troca de roupas com amigas?	2025-05-27 15:24:01.76677
93	97	Como cuidar das suas roupas para durarem mais?	2025-05-27 15:24:01.76677
94	98	Vocˆ prefere looks mais cl ssicos ou alternativos?	2025-05-27 15:24:01.76677
95	99	Qual seu sapato favorito para eventos formais?	2025-05-27 15:24:01.76677
96	100	A moda ‚ sua melhor forma de se expressar! Seja autˆntico(a)!	2025-05-27 15:24:01.76677
\.


--
-- TOC entry 4964 (class 0 OID 16819)
-- Dependencies: 228
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, user_id, post_id, text_comment, date_comment) FROM stdin;
226	50	38	Esse look t  digno de tapete vermelho!	2025-05-27 16:02:14.283005
227	51	38	Vocˆ ‚ a defini‡Æo de glamour e sofistica‡Æo	2025-05-27 16:02:14.283005
228	52	39	Look poderoso! Essa produ‡Æo t  de tirar o f“lego	2025-05-27 16:02:14.283005
229	53	39	Muito brilho, muita atitude. Simplesmente perfeita	2025-05-27 16:02:14.283005
230	54	40	A rainha da balada chegou, e chegou linda	2025-05-27 16:02:14.283005
231	55	40	Esse vestido t  digno de tapete vermelho	2025-05-27 16:02:14.283005
232	56	41	Simples, leve e mega estilosa! Amei a vibe	2025-05-27 16:02:14.283005
233	57	41	Look comfy que nÆo perde o charme	2025-05-27 16:02:14.283005
234	58	42	D  vontade de usar esse look todo dia!	2025-05-27 16:02:14.283005
235	59	42	Look do dia aprovado com louvor	2025-05-27 16:02:14.283005
236	60	43	Esse look t  MUITO street, amei demais!	2025-05-27 16:02:14.283005
237	61	43	Estilo urbano que ‚ puro impacto	2025-05-27 16:02:14.283005
238	62	44	Vocˆ ‚ a defini‡Æo de street style	2025-05-27 16:02:14.283005
239	63	44	Combina‡Æo de cores impec vel, t  demais!	2025-05-27 16:02:14.283005
240	64	45	Look street com atitude de sobra	2025-05-27 16:02:14.283005
241	65	45	Pura sofistica‡Æo! Look digno de revista	2025-05-27 16:02:14.283005
242	66	46	O cl ssico nunca sai de moda e vocˆ sabe usar como ningu‚m	2025-05-27 16:02:14.283005
243	67	46	A elegƒncia mora nos detalhes, e vocˆ arrasou!	2025-05-27 16:02:14.283005
244	68	47	Esse look respira classe e estilo	2025-05-27 16:02:14.283005
245	69	47	Visual impec vel e atemporal	2025-05-27 16:02:14.283005
246	50	38	Esse look t  digno de tapete vermelho!	2025-05-27 16:02:48.136455
247	51	38	Vocˆ ‚ a defini‡Æo de glamour e sofistica‡Æo	2025-05-27 16:02:48.136455
248	52	39	Look poderoso! Essa produ‡Æo t  de tirar o f“lego	2025-05-27 16:02:48.136455
249	53	39	Muito brilho, muita atitude. Simplesmente perfeita	2025-05-27 16:02:48.136455
250	54	40	A rainha da balada chegou, e chegou linda	2025-05-27 16:02:48.136455
251	55	40	Esse vestido t  digno de tapete vermelho	2025-05-27 16:02:48.136455
252	56	41	Simples, leve e mega estilosa! Amei a vibe	2025-05-27 16:02:48.136455
253	57	41	Look comfy que nÆo perde o charme	2025-05-27 16:02:48.136455
254	58	42	D  vontade de usar esse look todo dia!	2025-05-27 16:02:48.136455
255	59	42	Look do dia aprovado com louvor	2025-05-27 16:02:48.136455
256	60	43	Esse look t  MUITO street, amei demais!	2025-05-27 16:02:48.136455
257	61	43	Estilo urbano que ‚ puro impacto	2025-05-27 16:02:48.136455
258	62	44	Vocˆ ‚ a defini‡Æo de street style	2025-05-27 16:02:48.136455
259	63	44	Combina‡Æo de cores impec vel, t  demais!	2025-05-27 16:02:48.136455
260	64	45	Look street com atitude de sobra	2025-05-27 16:02:48.136455
261	65	45	Pura sofistica‡Æo! Look digno de revista	2025-05-27 16:02:48.136455
262	66	46	O cl ssico nunca sai de moda e vocˆ sabe usar como ningu‚m	2025-05-27 16:02:48.136455
263	67	46	A elegƒncia mora nos detalhes, e vocˆ arrasou!	2025-05-27 16:02:48.136455
264	68	47	Esse look respira classe e estilo	2025-05-27 16:02:48.136455
265	69	47	Visual impec vel e atemporal	2025-05-27 16:02:48.136455
126	1	1	Roupas de inverno sÆo as melhores!	2025-05-27 15:58:36.192356
127	2	1	Amo o inverno	2025-05-27 15:58:36.192356
128	3	2	Roupas de verÆo sÆo as melhores!	2025-05-27 15:58:36.192356
129	4	2	Amo o verÆo	2025-05-27 15:58:36.192356
130	5	3	Roupas de outono sÆo as melhores!	2025-05-27 15:58:36.192356
131	6	3	Amo o outono	2025-05-27 15:58:36.192356
132	7	4	Roupas de primavera sÆo as melhores!	2025-05-27 15:58:36.192356
133	8	4	Amo a primavera	2025-05-27 15:58:36.192356
134	1	5	Roupas de praia sÆo muito divas	2025-05-27 15:58:36.192356
135	2	6	Simplesmente impec vel! Esse look t  um arraso	2025-05-27 15:58:36.192356
136	3	6	O estilo t  em outro n¡vel! Amei demais	2025-05-27 15:58:36.192356
137	7	7	Vocˆ sempre entrega tudo no visual!	2025-05-27 15:58:36.192356
138	4	7	Chique, moderno e cheio de atitude. Amei!	2025-05-27 15:58:36.192356
139	5	8	Essa combina‡Æo ficou perfeita em vocˆ!	2025-05-27 15:58:36.192356
140	6	8	Arrasou demais! Vocˆ ‚ uma verdadeira fashionista!	2025-05-27 15:58:36.192356
141	7	9	Essa jaqueta ‚ tudo! Onde vocˆ comprou?	2025-05-27 15:58:36.192356
142	1	10	Amei a combina‡Æo de cores! Super estiloso!	2025-05-27 15:58:36.192356
143	2	11	Esse vestido ‚ um sonho! Onde vocˆ encontrou?	2025-05-27 15:58:36.192356
144	3	11	Vocˆ t  linda demais! Amei o look!	2025-05-27 15:58:36.192356
145	4	12	Essa blusa ‚ tudo! Vocˆ arrasa no estilo!	2025-05-27 15:58:36.192356
146	5	12	Amei a estampa! Super fashionista!	2025-05-27 15:58:36.192356
147	6	13	Esse look t  perfeito pra festa! Arrasou!	2025-05-27 15:58:36.192356
148	7	13	Vocˆ sempre entrega tudo no visual!	2025-05-27 15:58:36.192356
149	8	14	Essa combina‡Æo ficou perfeita em vocˆ!	2025-05-27 15:58:36.192356
150	10	15	Essa paleta de cores t  perfeita pro outono	2025-05-27 15:58:36.192356
151	1	15	Look comfy e estiloso ao mesmo tempo	2025-05-27 15:58:36.192356
152	2	16	A bota deu um toque poderoso no visual	2025-05-27 15:58:36.192356
153	3	16	D  aula de estilo todo dia, n‚?	2025-05-27 15:58:36.192356
154	5	18	Metade fashion week, metade sonho	2025-05-27 15:58:36.192356
155	12	18	Qual a inspira‡Æo desse look? Amei demais!	2025-05-27 15:58:36.192356
156	13	19	Me ajuda a montar algo parecido? T“ sem ideias	2025-05-27 15:58:36.192356
157	12	19	Vocˆ acha que esse look combina com tˆnis branco tamb‚m?	2025-05-27 15:58:36.192356
158	13	20	Usaria f cil esse look! Tem link das pe‡as?	2025-05-27 15:58:36.192356
159	14	20	Vocˆ ‚ a defini‡Æo de estilo	2025-05-27 15:58:36.192356
160	15	21	Cada look melhor que o outro, como pode?	2025-05-27 15:58:36.192356
161	2	21	Vocˆ transforma qualquer roupa em tendˆncia	2025-05-27 15:58:36.192356
162	2	22	A energia desse visual t  surreal	2025-05-27 15:58:36.192356
163	3	22	Look de milhäes	2025-05-27 15:58:36.192356
266	50	38	Look poderoso! Essa produ‡Æo t  de tirar o f“lego	2025-05-27 16:02:48.136455
267	51	39	A rainha da balada chegou, e chegou linda	2025-05-27 16:02:48.136455
268	52	39	Muito brilho, muita atitude. Simplesmente perfeita	2025-05-27 16:02:48.136455
269	53	40	Esse vestido t  digno de tapete vermelho	2025-05-27 16:02:48.136455
270	54	40	Simples, leve e mega estilosa! Amei a vibe	2025-05-27 16:02:48.136455
271	55	41	Look comfy que nÆo perde o charme	2025-05-27 16:02:48.136455
272	56	41	D  vontade de usar esse look todo dia!	2025-05-27 16:02:48.136455
273	57	41	Casual sim, sem gra‡a nunca	2025-05-27 16:02:48.136455
274	58	42	Look do dia aprovado com louvor	2025-05-27 16:02:48.136455
275	58	42	Esse look t  MUITO street, amei demais!	2025-05-27 16:02:48.136455
276	59	43	Estilo urbano que ‚ puro impacto	2025-05-27 16:02:48.136455
277	60	43	Vocˆ ‚ a defini‡Æo de street style	2025-05-27 16:02:48.136455
278	61	44	Combina‡Æo de cores impec vel, t  demais!	2025-05-27 16:02:48.136455
279	62	44	Look street com atitude de sobra	2025-05-27 16:02:48.136455
195	23	23	Essa cal‡a ‚ TUDO! Onde encontro uma igual?	2025-05-27 16:01:29.679366
196	12	23	Amei como o blazer deu um ar sofisticado	2025-05-27 16:01:29.679366
197	12	24	O vestido t  a coisa mais linda, super delicado	2025-05-27 16:01:29.679366
198	1	24	Esse conjunto t  super na moda, amei a vibe!	2025-05-27 16:01:29.679366
199	2	25	Tˆnis branco e vestido? Combina‡Æo perfeita!	2025-05-27 16:01:29.679366
200	3	25	Esse look tem a sua cara! Cheio de atitude	2025-05-27 16:01:29.679366
201	25	26	Vocˆ tem um estilo £nico, d  pra ver de longe	2025-05-27 16:01:29.679366
202	26	26	Zero defeitos! Tudo combinando perfeitamente	2025-05-27 16:01:29.679366
203	27	27	D  pra ver que vocˆ entende MUITO de moda	2025-05-27 16:01:29.679366
204	28	27	Inspirador! J  quero copiar esse estilo	2025-05-27 16:01:29.679366
205	29	28	T“ te denunciando por excesso de beleza e estilo	2025-05-27 16:01:29.679366
206	30	28	Me ensina a ser estilosa assim, por favor	2025-05-27 16:01:29.679366
207	31	29	Nem o espelho aguenta tanta beleza	2025-05-27 16:01:29.679366
208	32	29	Vocˆ ‚ o pr¢prio moodboard do Pinterest	2025-05-27 16:01:29.679366
209	33	30	A moda agradece sua existˆncia	2025-05-27 16:01:29.679366
210	34	30	Look incr¡vel! Vocˆ monta sozinha ou tem stylist?	2025-05-27 16:01:29.679366
211	35	31	Qual app vocˆ usa pra editar as fotos? Ficaram lindas!	2025-05-27 16:01:29.679366
212	36	31	Esse look daria super certo numa sessÆo de fotos profissional!	2025-05-27 16:01:29.679366
213	37	32	Daria certo com acess¢rios dourados tamb‚m, n‚?	2025-05-27 16:01:29.679366
214	38	32	Qual a sua maior inspira‡Æo de moda hoje em dia?	2025-05-27 16:01:29.679366
215	39	33	A cara do verÆo! Look leve e cheio de estilo	2025-05-27 16:01:29.679366
216	40	33	Esse biqu¡ni t  tudo! A cor valorizou muito vocˆ	2025-05-27 16:01:29.679366
217	41	34	Praia + estilo = vocˆ arrasando como sempre	2025-05-27 16:01:29.679366
218	42	34	Diva solar! Iluminando o feed com esse look	2025-05-27 16:01:29.679366
219	43	35	Chap‚u, ¢culos, biqu¡ni. entregou tudo!	2025-05-27 16:01:29.679366
220	44	35	Look quentinho e estiloso, a combina‡Æo perfeita	2025-05-27 16:01:29.679366
221	45	36	Frio com personalidade, amei esse casaco demais!	2025-05-27 16:01:29.679366
222	46	36	Essa sobreposi‡Æo ficou INCRÖVEL	2025-05-27 16:01:29.679366
223	47	37	Look inverno digno de passarela!	2025-05-27 16:01:29.679366
224	47	37	Mostrando que no frio a gente tamb‚m lacra	2025-05-27 16:01:29.679366
225	49	38	Pronta pra brilhar a noite toda!	2025-05-27 16:01:29.679366
321	63	45	Pura sofistica‡Æo! Look digno de revista	2025-05-27 16:03:41.459106
322	64	45	O cl ssico nunca sai de moda - e vocˆ sabe usar como ningu‚m	2025-05-27 16:03:41.459106
323	65	46	A elegƒncia mora nos detalhes, e vocˆ arrasou!	2025-05-27 16:03:41.459106
324	66	46	Esse look respira classe e estilo	2025-05-27 16:03:41.459106
325	67	47	Visual impec vel e atemporal	2025-05-27 16:03:41.459106
326	1	47	Que combina‡Æo de cores incr¡vel! Esse look ficou super harm“nico	2025-05-27 16:03:41.459106
327	1	49	Vocˆ tem um talento £nico pra montar visuais estilosos e modernos	2025-05-27 16:03:41.459106
328	2	49	Amei o contraste das pe‡as, deu um ar super autˆntico ao look	2025-05-27 16:03:41.459106
329	2	49	Look super bem pensado, confort vel e cheio de personalidade	2025-05-27 16:03:41.459106
330	3	49	Vocˆ sempre acerta nos detalhes. Esse visual t  impec vel	2025-05-27 16:03:41.459106
331	4	50	Cada pe‡a parece ter sido feita sob medida pra vocˆ, incr¡vel!	2025-05-27 16:03:41.459106
332	5	50	A escolha dos acess¢rios deu um toque final maravilhoso	2025-05-27 16:03:41.459106
333	6	51	D  pra ver que vocˆ entende de moda s¢ pelo bom gosto	2025-05-27 16:03:41.459106
334	7	51	Um dos melhores looks que vi hoje no feed, s‚rio mesmo	2025-05-27 16:03:41.459106
335	8	52	Essa paleta de cores ‚ a cara da esta‡Æo! Amei demais	2025-05-27 16:03:41.459106
336	10	53	Look super vers til, usaria f cil em v rias ocasiäes	2025-05-27 16:03:41.459106
337	11	53	O equil¡brio entre casual e chic ficou perfeito!	2025-05-27 16:03:41.459106
338	12	54	T  parecendo capa de revista de moda! Arrasou demais	2025-05-27 16:03:41.459106
339	13	54	O look t  tÆo bom que nem sei o que elogiar primeiro	2025-05-27 16:03:41.459106
340	14	55	Esse outfit transmite confian‡a e estilo	2025-05-27 16:03:41.459106
341	15	55	A energia desse look t  surreal, me inspirou real	2025-05-27 16:03:41.459106
342	16	56	Look fresh, leve e super atual. Amei a vibe	2025-05-27 16:03:41.459106
343	17	56	Que styling perfeito! Essa composi‡Æo merece destaque	2025-05-27 16:03:41.459106
344	18	57	Vocˆ consegue transformar qualquer look simples em algo incr¡vel	2025-05-27 16:03:41.459106
345	19	57	Seu estilo tem identidade e isso ‚ raro de ver!	2025-05-27 16:03:41.459106
346	20	58	Que bom gosto! Cada detalhe conversa com o outro	2025-05-27 16:03:41.459106
347	21	58	Fashion, ousada e autˆntica. Amei o look inteiro	2025-05-27 16:03:41.459106
348	22	59	Look comfy com pegada fashionista? Vocˆ entrega tudo	2025-05-27 16:03:41.459106
349	23	59	T  lind¡ssima! Esse visual te valorizou demais	2025-05-27 16:03:41.459106
350	24	60	J  favoritei pra usar como referˆncia no pr¢ximo look	2025-05-27 16:03:41.459106
351	25	60	Inspira‡Æo real de moda no feed hoje	2025-05-27 16:03:41.459106
352	26	61	Essa jaqueta ‚ o auge! Onde vocˆ achou essa lindeza?	2025-05-27 16:03:41.459106
353	27	61	Com esse estilo vocˆ comanda qualquer ambiente	2025-05-27 16:03:41.459106
354	28	62	D  aula de elegƒncia e autenticidade em cada post	2025-05-27 16:03:41.459106
355	29	62	Seu visual fala por si: cheio de atitude e bom gosto	2025-05-27 16:03:41.459106
356	30	63	A produ‡Æo t  perfeita! Super profissional e estilosa	2025-05-27 16:03:41.459106
357	31	63	Que vibe maravilhosa! Transmite leveza e seguran‡a	2025-05-27 16:03:41.459106
358	32	64	Roubei essa ideia pro meu pr¢ximo look, t  incr¡vel	2025-05-27 16:03:41.459106
359	33	64	Look digno de fashion week! Vocˆ arrasou demais	2025-05-27 16:03:41.459106
360	34	65	Amo como vocˆ combina pe‡as b sicas com personalidade	2025-05-27 16:03:41.459106
566	35	65	Ta muito fashion, parece saida direto de editorial	2025-05-27 16:07:19.38259
567	36	66	Um visual criativo, moderno e super bem executado	2025-05-27 16:07:19.38259
568	37	66	Cores, textura, corte... tudo no ponto certo!	2025-05-27 16:07:19.38259
569	38	67	Visual bem construido e cheio de presenca!	2025-05-27 16:07:19.38259
570	39	67	Essa composicao ficou muito alem do basico! Voce brilhou	2025-05-27 16:07:19.38259
571	40	68	Look com presenca! Amei o impacto da producao	2025-05-27 16:07:19.38259
572	41	68	Cada post seu e um banho de inspiracao fashion	2025-05-27 16:07:19.38259
573	42	69	Que arraso! Mostrando que moda e expressao	2025-05-27 16:07:19.38259
574	43	69	Look super atual e com uma pegada descolada	2025-05-27 16:07:19.38259
575	44	70	Voce dominou a estetica urbana com muita elegancia	2025-05-27 16:07:19.38259
576	45	70	Ousada na medida certa! Esse look ta incrivel	2025-05-27 16:07:19.38259
577	46	71	Super bem equilibrado, confortavel e fashion	2025-05-27 16:07:19.38259
578	47	71	A silhueta do look ficou linda demais em voce	2025-05-27 16:07:19.38259
579	49	72	Voce realmente sabe como valorizar cada peca	2025-05-27 16:07:19.38259
580	49	72	Simplesmente apaixonado(a) nesse look! Voce tem um estilo unico	2025-05-27 16:07:19.38259
581	50	73	O outfit ficou sofisticado sem perder a essencia urbana	2025-05-27 16:07:19.38259
582	51	73	Consegue ser moderna, elegante e ousada no mesmo look!	2025-05-27 16:07:19.38259
583	52	74	Essa composicao ta tao equilibrada que virou minha nova inspiracao	2025-05-27 16:07:19.38259
584	53	74	Cada peca foi escolhida com tanta precisao, to impressionado(a)	2025-05-27 16:07:19.38259
585	54	75	Voce faz da moda uma arte! Cada post e um quadro	2025-05-27 16:07:19.38259
586	55	75	Visual perfeito da cabeca aos pes!	2025-05-27 16:07:19.38259
587	56	76	Simples, direto e cheio de atitude. Amei o conceito	2025-05-27 16:07:19.38259
588	57	76	Essa producao ta a cara do streetwear chique!	2025-05-27 16:07:19.38259
589	58	77	Nunca decepciona no estilo! Ja virou referencia	2025-05-27 16:07:19.38259
590	59	77	O equilibrio entre ousadia e sofisticacao ta surreal!	2025-05-27 16:07:19.38259
591	60	78	Um mix de tendencias com identidade, amei demais!	2025-05-27 16:07:19.38259
592	61	78	Como consegue sempre inovar e surpreender no visual?	2025-05-27 16:07:19.38259
593	62	78	Ate o cenario combina com o look! Tudo muito bem pensado	2025-05-27 16:07:19.38259
594	63	77	Cada foto sua vira inspiracao pro meu proprio estilo	2025-05-27 16:07:19.38259
595	64	80	Voce mostra que estilo e uma forma de expressao	2025-05-27 16:07:19.38259
596	65	80	O caimento dessa roupa ficou perfeito em voce!	2025-05-27 16:07:19.38259
597	66	81	Que presenca! Voce domina o look e o ambiente	2025-05-27 16:07:19.38259
598	67	81	Super fashionista sem parecer forcado. Isso e talento	2025-05-27 16:07:19.38259
599	68	82	Essa producao me ganhou no primeiro olhar	2025-05-27 16:07:19.38259
600	69	82	Look conceito e execucao perfeita	2025-05-27 16:07:19.38259
601	70	83	Ouse mais! O resultado fica incrivel em voce	2025-05-27 16:07:19.38259
602	71	83	As combinacoes que voce faz sao sempre surpreendentes	2025-05-27 16:07:19.38259
603	72	84	Da vontade de copiar esse look agora mesmo!	2025-05-27 16:07:19.38259
604	73	84	Acessorios incriveis! Deram vida ao visual	2025-05-27 16:07:19.38259
605	74	85	A vibe dessa foto com esse look ficou TUDO	2025-05-27 16:07:19.38259
606	75	85	E sobre ter estilo e saber usar, e voce sabe!	2025-05-27 16:07:19.38259
607	76	84	Visual criativo, moderno e com alma	2025-05-27 16:07:19.38259
608	77	84	Tudo tao bem encaixado, parece editorial de moda	2025-05-27 16:07:19.38259
609	78	87	Voce inspira com cada detalhe desse visual	2025-05-27 16:07:19.38259
610	80	88	Totalmente fashion sem perder o conforto. Isso sim!	2025-05-27 16:07:19.38259
611	81	88	O jogo de cores ficou sensacional! Super original	2025-05-27 16:07:19.38259
612	82	89	Eu so queria metade desse bom gosto kkkkk	2025-05-27 16:07:19.38259
613	83	89	Esse visual tem um que de ousadia elegante	2025-05-27 16:07:19.38259
614	84	90	O look ta tao bom que eu salvei aqui como referencia	2025-05-27 16:07:19.38259
615	85	90	Um arraso do inicio ao fim. Amei a composicao	2025-05-27 16:07:19.38259
616	84	91	Look simples com presenca de sobra!	2025-05-27 16:07:19.38259
617	87	91	Essa e a definicao de estar bem vestida	2025-05-27 16:07:19.38259
618	88	92	As camadas desse look ficaram incriveis. Super estilosa!	2025-05-27 16:07:19.38259
619	89	92	Voce entrega conteudo de moda com alma	2025-05-27 16:07:19.38259
620	90	93	Gosto tanto desse estilo que ja virou meu preferido!	2025-05-27 16:07:19.38259
621	91	93	Essa producao ta gritando confianca! Adorei	2025-05-27 16:07:19.38259
622	91	94	O toque urbano nesse look fez toda a diferenca	2025-05-27 16:07:19.38259
623	93	94	Ta uma visao de tao linda com esse visual	2025-05-27 16:07:19.38259
624	94	95	Essa harmonia entre pecas e acessorios ficou perfeita	2025-05-27 16:07:19.38259
625	95	95	O look e top, mas sua atitude e o que da o brilho final	2025-05-27 16:07:19.38259
626	96	96	Achei tudo muito bem coordenado. Parabens pelo bom gosto!	2025-05-27 16:07:19.38259
627	97	96	Um visual cheio de forca, personalidade e elegancia	2025-05-27 16:07:19.38259
628	98	97	Voce tem o poder de transformar qualquer look basico em algo extraordinario	2025-05-27 16:07:19.38259
629	99	97	Esse look exala autenticidade, nao tem como nao notar!	2025-05-27 16:07:19.38259
630	1	98	A vibe desse visual ta muito Pinterest	2025-05-27 16:07:19.38259
631	2	98	Toda fashionista deveria ver esse post, serio!	2025-05-27 16:07:19.38259
632	3	99	Que harmonia! Estilo e presenca num mesmo clique	2025-05-27 16:07:19.38259
633	4	99	Cada detalhe dessa composicao mostra sua identidade	2025-05-27 16:07:19.38259
\.


--
-- TOC entry 4962 (class 0 OID 16794)
-- Dependencies: 226
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, user_id, post_id, chat_id, message, created_at) FROM stdin;
144	61	33	\N	Parab‚ns! Vocˆ recebeu uma nova curtida.	2025-05-27 15:45:01.842942
145	62	34	\N	Tem novidade no seu post. Algu‚m interagiu!	2025-05-27 15:45:01.842942
146	63	34	\N	Novo coment rio na sua postagem!	2025-05-27 15:45:01.842942
147	64	35	\N	Curtiram seu post! V  conferir!	2025-05-27 15:45:01.842942
148	65	35	\N	Vocˆ foi mencionado em um coment rio.	2025-05-27 15:45:01.842942
149	66	36	\N	Chegou um novo coment rio para vocˆ.	2025-05-27 15:45:01.842942
150	67	37	\N	Seu post recebeu uma nova intera‡Æo.	2025-05-27 15:45:01.842942
151	68	38	\N	Vocˆ foi mencionado em uma conversa.	2025-05-27 15:45:01.842942
152	69	39	\N	Nova curtida recebida. Continue postando!	2025-05-27 15:45:01.842942
153	70	40	\N	Vocˆ foi marcado em uma nova publica‡Æo.	2025-05-27 15:45:01.842942
154	71	41	\N	Mais uma curtida no seu post. As pessoas estÆo adorando!	2025-05-27 15:45:01.842942
155	72	42	\N	Seu coment rio foi respondido!	2025-05-27 15:45:01.842942
156	73	43	\N	Novo coment rio detectado. Confira agora.	2025-05-27 15:45:01.842942
157	74	44	\N	Algu‚m comentou no seu post! Confira agora.	2025-05-27 15:45:01.842942
158	75	45	\N	Alerta de intera‡Æo: seu post recebeu uma curtida.	2025-05-27 15:45:01.842942
159	76	45	\N	Tem uma nova curtida esperando por vocˆ!	2025-05-27 15:45:01.842942
160	77	46	\N	Vocˆ recebeu uma nova curtida agora mesmo.	2025-05-27 15:45:01.842942
161	78	47	\N	Notifica‡Æo: novo coment rio recebido.	2025-05-27 15:45:01.842942
162	79	49	\N	Curtida recebida! Algu‚m gostou da sua postagem.	2025-05-27 15:45:01.842942
163	80	49	\N	Seu conte£do chamou aten‡Æo! Novo coment rio.	2025-05-27 15:45:01.842942
164	81	50	\N	Vocˆ ganhou uma curtida extra! Veja quem foi.	2025-05-27 15:45:01.842942
165	82	51	\N	Curtiram seu post! V  conferir!	2025-05-27 15:45:01.842942
166	83	52	\N	Chegou um novo coment rio para vocˆ.	2025-05-27 15:45:01.842942
167	84	53	\N	Novo coment rio na sua postagem!	2025-05-27 15:45:01.842942
168	85	54	\N	Vocˆ foi mencionado em um coment rio.	2025-05-27 15:45:01.842942
169	87	56	\N	Parab‚ns! Vocˆ recebeu uma nova curtida.	2025-05-27 15:45:01.842942
170	88	57	\N	Nova curtida recebida. Continue postando!	2025-05-27 15:45:01.842942
171	89	58	\N	Seu post recebeu uma nova intera‡Æo.	2025-05-27 15:45:01.842942
172	90	59	\N	Vocˆ foi marcado em uma nova publica‡Æo.	2025-05-27 15:45:01.842942
30	1	1	1	Vocˆ foi marcado em uma nova publica‡Æo.	2025-05-27 15:43:41.065912
31	2	1	2	Algu‚m comentou no seu post! Confira agora.	2025-05-27 15:43:41.065912
32	3	2	3	Chegou um novo coment rio para vocˆ.	2025-05-27 15:43:41.065912
33	4	2	4	Um novo coment rio surgiu na sua timeline.	2025-05-27 15:43:41.065912
34	5	3	5	Um usu rio curtiu sua £ltima postagem.	2025-05-27 15:43:41.065912
35	6	3	6	Vocˆ foi mencionado em uma conversa.	2025-05-27 15:43:41.065912
36	7	3	7	Notifica‡Æo: novo coment rio recebido.	2025-05-27 15:43:41.065912
37	8	4	8	O seu conte£do est  ganhando aten‡Æo! Veja quem interagiu.	2025-05-27 15:43:41.065912
38	10	5	10	Seu conte£do chamou aten‡Æo! Novo coment rio.	2025-05-27 15:43:41.065912
39	11	6	11	Vocˆ foi marcado em uma nova publica‡Æo.	2025-05-27 15:43:41.065912
40	12	6	12	Mais uma curtida no seu post. As pessoas estÆo adorando!	2025-05-27 15:43:41.065912
41	13	7	13	Seu coment rio foi respondido!	2025-05-27 15:43:41.065912
42	14	7	14	Curtiram seu post! V  conferir!	2025-05-27 15:43:41.065912
43	15	8	15	Curtiram seu post! V  conferir!	2025-05-27 15:43:41.065912
44	16	8	16	Vocˆ foi marcado em uma nova publica‡Æo.	2025-05-27 15:43:41.065912
45	18	10	18	Tem novidade no seu post. Algu‚m interagiu!	2025-05-27 15:43:41.065912
46	19	10	19	Mais uma curtida no seu post. As pessoas estÆo adorando!	2025-05-27 15:43:41.065912
47	20	10	20	Vocˆ foi marcado em uma nova publica‡Æo.	2025-05-27 15:43:41.065912
48	21	11	21	Vocˆ recebeu uma nova curtida agora mesmo.	2025-05-27 15:43:41.065912
49	22	11	22	Nova intera‡Æo no seu conte£do! Veja quem comentou.	2025-05-27 15:43:41.065912
50	23	12	23	Nova curtida recebida. Continue postando!	2025-05-27 15:43:41.065912
51	24	12	24	Parab‚ns! Vocˆ recebeu uma nova curtida.	2025-05-27 15:43:41.065912
52	25	13	25	Nova intera‡Æo no seu conte£do! Veja quem comentou.	2025-05-27 15:43:41.065912
53	26	13	26	Um usu rio curtiu sua £ltima postagem.	2025-05-27 15:43:41.065912
54	27	14	27	Curtida recebida! Algu‚m gostou da sua postagem.	2025-05-27 15:43:41.065912
55	28	14	28	Notifica‡Æo: novo coment rio recebido.	2025-05-27 15:43:41.065912
56	29	14	29	Chegou um novo coment rio para vocˆ.	2025-05-27 15:43:41.065912
57	30	14	30	Vocˆ foi mencionado em um coment rio.	2025-05-27 15:43:41.065912
87	31	15	\N	Vocˆ ganhou uma curtida extra! Veja quem foi.	2025-05-27 15:44:29.333035
88	32	15	\N	Algu‚m comentou no seu post! Confira agora.	2025-05-27 15:44:29.333035
89	33	16	\N	Novo coment rio detectado. Confira agora.	2025-05-27 15:44:29.333035
90	34	16	\N	Notifica‡Æo: novo coment rio recebido.	2025-05-27 15:44:29.333035
91	37	18	\N	Vocˆ foi mencionado em uma conversa.	2025-05-27 15:44:29.333035
92	38	18	\N	Curtiram seu post! V  conferir!	2025-05-27 15:44:29.333035
93	39	18	\N	Parab‚ns! Vocˆ recebeu uma nova curtida.	2025-05-27 15:44:29.333035
94	40	19	\N	Chegou um novo coment rio para vocˆ.	2025-05-27 15:44:29.333035
95	41	19	\N	Um novo coment rio surgiu na sua timeline.	2025-05-27 15:44:29.333035
96	42	19	\N	Seu post recebeu uma nova intera‡Æo.	2025-05-27 15:44:29.333035
97	43	20	\N	Curtida recebida! Algu‚m gostou da sua postagem.	2025-05-27 15:44:29.333035
98	44	20	\N	Vocˆ foi marcado em uma nova publica‡Æo.	2025-05-27 15:44:29.333035
99	45	21	\N	Alerta de intera‡Æo: seu post recebeu uma curtida.	2025-05-27 15:44:29.333035
100	46	21	\N	Novo coment rio na sua postagem!	2025-05-27 15:44:29.333035
101	47	22	\N	Algu‚m comentou no seu post! Confira agora.	2025-05-27 15:44:29.333035
102	49	23	\N	Mais uma curtida no seu post. As pessoas estÆo adorando!	2025-05-27 15:44:29.333035
103	50	24	\N	Nova curtida recebida. Continue postando!	2025-05-27 15:44:29.333035
104	51	24	\N	Seu conte£do chamou aten‡Æo! Novo coment rio.	2025-05-27 15:44:29.333035
105	52	25	\N	O seu conte£do est  ganhando aten‡Æo! Veja quem interagiu.	2025-05-27 15:44:29.333035
106	53	26	\N	Seu post recebeu uma nova intera‡Æo.	2025-05-27 15:44:29.333035
107	54	27	\N	Vocˆ foi marcado em uma nova publica‡Æo.	2025-05-27 15:44:29.333035
108	55	27	\N	Notifica‡Æo: novo coment rio recebido.	2025-05-27 15:44:29.333035
109	56	28	\N	Vocˆ ganhou uma curtida extra! Veja quem foi.	2025-05-27 15:44:29.333035
110	57	29	\N	Algu‚m comentou no seu post! Confira agora.	2025-05-27 15:44:29.333035
111	58	30	\N	Vocˆ foi mencionado em uma conversa.	2025-05-27 15:44:29.333035
112	59	31	\N	Curtiram seu post! V  conferir!	2025-05-27 15:44:29.333035
113	60	32	\N	Parab‚ns! Vocˆ recebeu uma nova curtida.	2025-05-27 15:44:29.333035
260	91	59	\N	O seu conte£do est  ganhando aten‡Æo! Veja quem interagiu.	2025-05-27 15:46:06.428425
261	93	61	\N	Algu‚m comentou no seu post! Confira agora.	2025-05-27 15:46:06.428425
262	94	6	\N	Vocˆ foi mencionado em um coment rio.	2025-05-27 15:46:06.428425
263	95	62	\N	Notifica‡Æo: novo coment rio recebido.	2025-05-27 15:46:06.428425
264	96	63	\N	Vocˆ ganhou uma curtida extra! Veja quem foi.	2025-05-27 15:46:06.428425
265	97	64	\N	Seu coment rio foi respondido!	2025-05-27 15:46:06.428425
266	98	65	\N	Novo coment rio detectado. Confira agora.	2025-05-27 15:46:06.428425
267	99	66	\N	Curtida recebida! Algu‚m gostou da sua postagem.	2025-05-27 15:46:06.428425
268	100	67	\N	Parab‚ns! Vocˆ recebeu uma nova curtida.	2025-05-27 15:46:06.428425
269	1	68	\N	Chegou um novo coment rio para vocˆ.	2025-05-27 15:46:06.428425
270	2	69	\N	Tem novidade no seu post. Algu‚m interagiu!	2025-05-27 15:46:06.428425
271	3	70	\N	Alerta de intera‡Æo: seu post recebeu uma curtida.	2025-05-27 15:46:06.428425
272	4	71	\N	Seu conte£do chamou aten‡Æo! Novo coment rio.	2025-05-27 15:46:06.428425
273	5	72	\N	Vocˆ foi marcado em uma nova publica‡Æo.	2025-05-27 15:46:06.428425
274	6	73	\N	Mais uma curtida no seu post. As pessoas estÆo adorando!	2025-05-27 15:46:06.428425
275	7	74	\N	Nova curtida recebida. Continue postando!	2025-05-27 15:46:06.428425
276	8	75	\N	Vocˆ recebeu uma nova curtida agora mesmo.	2025-05-27 15:46:06.428425
277	11	77	\N	Seu post recebeu uma nova intera‡Æo.	2025-05-27 15:46:06.428425
278	11	78	\N	Tem uma nova curtida esperando por vocˆ!	2025-05-27 15:46:06.428425
279	13	80	\N	Seu coment rio foi respondido!	2025-05-27 15:46:06.428425
280	14	81	\N	O seu conte£do est  ganhando aten‡Æo! Veja quem interagiu.	2025-05-27 15:46:06.428425
281	15	82	\N	Vocˆ foi mencionado em uma conversa.	2025-05-27 15:46:06.428425
282	16	83	\N	Tem novidade no seu post. Algu‚m interagiu!	2025-05-27 15:46:06.428425
283	17	84	\N	Novo coment rio na sua postagem!	2025-05-27 15:46:06.428425
284	18	85	\N	Curtida recebida! Algu‚m gostou da sua postagem.	2025-05-27 15:46:06.428425
285	19	86	\N	Algu‚m comentou no seu post! Confira agora.	2025-05-27 15:46:06.428425
286	20	87	\N	Curtiram seu post! V  conferir!	2025-05-27 15:46:06.428425
\.


--
-- TOC entry 4958 (class 0 OID 16747)
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
182	97	4	Atitude na frente da câmera, leveza na alma. 	f4cfa0ccdcbb71e7ca7c8c5e954e1a43	0	0	2025-05-27 14:23:20.637935
180	96	4	Não sou modelo, mas poderia ser. 	0ebe9a56b5bf4a986a4ad5e562b8725a	0	0	2025-05-27 14:22:25.412831
178	94	4	Mood do dia: estilosa sem esforço. 	d449b9429a0b35c088c2970faacf6ef6	0	0	2025-05-27 14:21:43.147509
174	91	1	Look escolhido com carinho e um toque de ousadia.	8fda1e59b31e5930c8ef1c05e33ed1f9	0	0	2025-05-27 14:14:10.552284
184	99	1	Um pouco de moda, um pouco de personalidade. 	8a453a6ac99661d086d72426cd356a24	0	0	2025-05-27 14:27:51.646883
186	1	1	Classe, elegância e confiança. 	3c56db38a84e9fe6c660738760fde226	0	0	2025-05-27 14:28:55.321087
188	1	1	Roupa confortável, pose afiada.	9bcc447dd0945d733cc4373da592b3f9	0	0	2025-05-27 14:29:25.210688
190	3	1	Quem disse que básico não brilha?	b9709bcd79912d46d38ec1172576f5de	0	0	2025-05-27 14:30:25.536296
192	4	1	Vista-se para ser lembrada, não para ser notada.	5cf53ad8f927e6fc111420375d615d63	0	0	2025-05-27 14:31:22.082401
194	5	1	O look tá pronto, e a autoestima também. 	fb289bad6a4261d98c4f08839d3677c7	0	0	2025-05-27 14:31:59.511891
196	8	1	Posei, postei.	112fc1d0c7b7e50cda577dc2a5a1bb7e	0	0	2025-05-27 14:33:10.370688
198	10	1	Roupa fala. Ouça.	07fdf0bbddb0e38148a920e94b8fa9cc	0	0	2025-05-27 14:33:40.256462
200	12	1	Só joguei o look e deixei acontecer. 	9726673994e9769872a1171dd635e11a	0	0	2025-05-27 14:34:20.664795
202	14	1	Um look, mil vibes.	9047f76c9abb85c101a9fe21de759a85	0	0	2025-05-27 14:35:09.084364
204	15	1	Roupa boa, alma leve.	ede37200ba15aeb0a0d0c641eb174f04	0	0	2025-05-27 14:36:24.662741
206	15	1	Flor no vestido, brilho no olhar. 	c98ec3e515eed3a49252b968dd34c587	0	0	2025-05-27 14:37:22.746153
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
208	17	1	Um look delicado para um dia leve. 	d4e02f3e4a7aff808ccd580e42aeb779	0	0	2025-05-27 14:38:02.427442
210	19	1	Acendi o feed com esse outfit.	ffac3b88c3c2874f9387eb87a5ad5e87	0	0	2025-05-27 14:38:53.89579
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
181	96	4	Posei porque mereço.	da7c27275b2d9d4bbaa8f6617978fec0	0	0	2025-05-27 14:22:43.611466
179	95	4	Só parei pra tirar essa foto mesmo. 	9bddceeba158dff5add7d782a4987b15	0	0	2025-05-27 14:22:04.007405
177	93	4	Simples, mas com atitude. 	38cdf4edcccb9008ec1e7b2adcb2dc04	0	0	2025-05-27 14:21:23.233383
175	91	1	Look escolhido com carinho e um toque de ousadia.	cc446f5ed341ed2e3496efc2a4e30f89	0	0	2025-05-27 14:19:06.374322
173	79	1	Estilo de rua, alma livre. 	24d0ac8391b2d32217b06c57fd3adb58	0	0	2025-05-27 14:12:51.967092
183	98	4	O look fala antes mesmo de eu dizer "oi".	773f58ef6c83abbcdcba387c8d5c07de	0	0	2025-05-27 14:27:22.325705
185	100	1	Vestida para impressionar... mesmo que só eu veja.	1ce71bfececf8c66cf13e18890d0d905	0	0	2025-05-27 14:28:22.57571
187	1	1	Do casual ao chic, tudo com estilo.	a9fcd264f3b4a424e5f10f0b0d02e8fb	0	0	2025-05-27 14:29:10.743534
189	1	1	Combinação perfeita: tênis, atitude e uma boa pose.	3b9a8e1251f10fc241b3f81abdbeff27	0	0	2025-05-27 14:29:48.526393
191	3	1	Descomplicada e cheia de estilo.	f40d2bccd6a14384cb3c9d3d9d0480bb	0	0	2025-05-27 14:30:43.586826
193	4	1	Não sigo tendências, eu crio.	e93b2bd0010cdf62c9d52b956583e91b	0	0	2025-05-27 14:31:42.390467
195	7	1	Look feito, close tirado. 	a567a2d0798145c232d8acff58e079bd	0	0	2025-05-27 14:32:52.994645
199	11	1	Mood: linda e leve. 	da50701a51b001211f861e3976f0efcc	0	0	2025-05-27 14:33:59.459675
201	13	1	Soft por fora, poderosa por dentro.	70cbabafc91270acae24f160fa4d16e1	0	0	2025-05-27 14:34:49.647151
203	15	1	Em paz com meu reflexo. 	5c266cb9783827a7257ba961c5019664	0	0	2025-05-27 14:35:35.146643
205	15	1	Estética: 100%. Vibe: elevadíssima.	63971bdadf7a267a1675a5308d6fb0af	0	0	2025-05-27 14:36:45.078035
207	16	1	Me vesti de doçura com toque de charme.	7e403f3080f33ddf32ddd05e1702abb4	0	0	2025-05-27 14:37:44.757521
209	18	1	Quando o look é fofo, o dia até melhora.	9478fe4d3d6a9d88f2eda459221a9d13	0	0	2025-05-27 14:38:26.787687
211	20	1	Não sei ser discreta quando o look tá gritando perfeição.	5421a9a1fb17750a04ea26846a4d95f4	0	0	2025-05-27 14:39:17.761965
\.


--
-- TOC entry 4954 (class 0 OID 16609)
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
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 223
-- Name: chats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chats_id_seq', 96, true);


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 227
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 633, true);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 225
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 286, true);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 221
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 211, true);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 104, true);


--
-- TOC entry 4789 (class 2606 OID 16706)
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- TOC entry 4791 (class 2606 OID 16704)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4795 (class 2606 OID 16786)
-- Name: chats chats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_pkey PRIMARY KEY (id);


--
-- TOC entry 4799 (class 2606 OID 16825)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 4797 (class 2606 OID 16802)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 4793 (class 2606 OID 16757)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 4783 (class 2606 OID 16623)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4785 (class 2606 OID 16619)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4787 (class 2606 OID 16621)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4802 (class 2606 OID 16787)
-- Name: chats chats_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4806 (class 2606 OID 16831)
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4807 (class 2606 OID 16826)
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4803 (class 2606 OID 16813)
-- Name: notifications notifications_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id) ON DELETE CASCADE;


--
-- TOC entry 4804 (class 2606 OID 16808)
-- Name: notifications notifications_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4805 (class 2606 OID 16803)
-- Name: notifications notifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4800 (class 2606 OID 16763)
-- Name: posts posts_categorie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_categorie_id_fkey FOREIGN KEY (categorie_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- TOC entry 4801 (class 2606 OID 16758)
-- Name: posts posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2025-05-27 21:31:36

--
-- PostgreSQL database dump complete
--

