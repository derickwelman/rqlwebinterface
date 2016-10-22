--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-10-17 07:32:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "Bees";
--
-- TOC entry 2267 (class 1262 OID 32816)
-- Name: Bees; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Bees" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE "Bees" OWNER TO postgres;

\connect "Bees"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 200 (class 1259 OID 33134)
-- Name: abelha; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE abelha (
    idabelha integer NOT NULL,
    nome character varying(50) NOT NULL,
    idade integer NOT NULL,
    mel numeric NOT NULL,
    idtrabalho integer NOT NULL,
    idfavo integer NOT NULL
);


ALTER TABLE abelha OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 33132)
-- Name: abelha_idabelha_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE abelha_idabelha_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE abelha_idabelha_seq OWNER TO postgres;

--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 199
-- Name: abelha_idabelha_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE abelha_idabelha_seq OWNED BY abelha.idabelha;


--
-- TOC entry 207 (class 1259 OID 33348)
-- Name: answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE answer (
    idquestion integer NOT NULL,
    idlogin integer NOT NULL,
    rqlanswer character varying(1000),
    sqlanswer character varying(1000),
    rqltime numeric NOT NULL,
    sqltime numeric NOT NULL,
    rqlerrors integer NOT NULL,
    sqlerrors integer NOT NULL
);


ALTER TABLE answer OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 32919)
-- Name: bee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bee (
    idbee integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    honey numeric NOT NULL,
    idjob integer NOT NULL,
    idcomb integer NOT NULL
);


ALTER TABLE bee OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 32917)
-- Name: bee_idbee_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bee_idbee_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bee_idbee_seq OWNER TO postgres;

--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 187
-- Name: bee_idbee_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bee_idbee_seq OWNED BY bee.idbee;


--
-- TOC entry 194 (class 1259 OID 33099)
-- Name: colmeia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE colmeia (
    idcolmeia integer NOT NULL,
    posicaox integer NOT NULL,
    posicaoy integer NOT NULL,
    mel numeric NOT NULL
);


ALTER TABLE colmeia OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 33097)
-- Name: colmeia_idcolmeia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE colmeia_idcolmeia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE colmeia_idcolmeia_seq OWNER TO postgres;

--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 193
-- Name: colmeia_idcolmeia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE colmeia_idcolmeia_seq OWNED BY colmeia.idcolmeia;


--
-- TOC entry 184 (class 1259 OID 32884)
-- Name: comb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comb (
    idcomb integer NOT NULL,
    idhive integer NOT NULL
);


ALTER TABLE comb OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 32882)
-- Name: comb_idcomb_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comb_idcomb_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comb_idcomb_seq OWNER TO postgres;

--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 183
-- Name: comb_idcomb_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comb_idcomb_seq OWNED BY comb.idcomb;


--
-- TOC entry 208 (class 1259 OID 33359)
-- Name: comparationquestion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comparationquestion (
    idlogin integer NOT NULL,
    questionnumber integer NOT NULL,
    answer integer NOT NULL
);


ALTER TABLE comparationquestion OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 33110)
-- Name: favo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE favo (
    idfavo integer NOT NULL,
    idcolmeia integer NOT NULL
);


ALTER TABLE favo OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 33108)
-- Name: favo_idfavo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE favo_idfavo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE favo_idfavo_seq OWNER TO postgres;

--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 195
-- Name: favo_idfavo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE favo_idfavo_seq OWNED BY favo.idfavo;


--
-- TOC entry 203 (class 1259 OID 33168)
-- Name: flor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE flor (
    idflor integer NOT NULL,
    posicaox integer NOT NULL,
    posicaoy integer NOT NULL
);


ALTER TABLE flor OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 33166)
-- Name: flor_idflor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE flor_idflor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flor_idflor_seq OWNER TO postgres;

--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 202
-- Name: flor_idflor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE flor_idflor_seq OWNED BY flor.idflor;


--
-- TOC entry 191 (class 1259 OID 32953)
-- Name: flower; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE flower (
    idflower integer NOT NULL,
    positionx integer NOT NULL,
    positiony integer NOT NULL
);


ALTER TABLE flower OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 32951)
-- Name: flower_idflower_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE flower_idflower_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flower_idflower_seq OWNER TO postgres;

--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 190
-- Name: flower_idflower_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE flower_idflower_seq OWNED BY flower.idflower;


--
-- TOC entry 189 (class 1259 OID 32938)
-- Name: hierarchy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE hierarchy (
    idinferior integer NOT NULL,
    idsuperior integer NOT NULL
);


ALTER TABLE hierarchy OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 33153)
-- Name: hierarquia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE hierarquia (
    idinferior integer NOT NULL,
    idsuperior integer NOT NULL
);


ALTER TABLE hierarquia OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 32873)
-- Name: hive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE hive (
    idhive integer NOT NULL,
    positionx integer NOT NULL,
    positiony integer NOT NULL,
    honey numeric NOT NULL
);


ALTER TABLE hive OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 32871)
-- Name: hive_idhive_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hive_idhive_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hive_idhive_seq OWNER TO postgres;

--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 181
-- Name: hive_idhive_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE hive_idhive_seq OWNED BY hive.idhive;


--
-- TOC entry 186 (class 1259 OID 32908)
-- Name: job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE job (
    idjob integer NOT NULL,
    description character varying(50) NOT NULL,
    salary numeric NOT NULL
);


ALTER TABLE job OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 32906)
-- Name: job_idjob_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE job_idjob_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE job_idjob_seq OWNER TO postgres;

--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 185
-- Name: job_idjob_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE job_idjob_seq OWNED BY job.idjob;


--
-- TOC entry 206 (class 1259 OID 33342)
-- Name: login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE login (
    idlogin integer NOT NULL,
    name character varying(50) NOT NULL,
    institution character varying(100) NOT NULL,
    login character varying(50) NOT NULL,
    pass character varying(50) NOT NULL,
    country character varying(50) NOT NULL,
    experience integer NOT NULL
);


ALTER TABLE login OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 33340)
-- Name: login_idlogin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE login_idlogin_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE login_idlogin_seq OWNER TO postgres;

--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 205
-- Name: login_idlogin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE login_idlogin_seq OWNED BY login.idlogin;


--
-- TOC entry 204 (class 1259 OID 33174)
-- Name: polen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE polen (
    idflor integer NOT NULL,
    idabelha integer NOT NULL
);


ALTER TABLE polen OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 32994)
-- Name: pollen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pollen (
    idflower integer NOT NULL,
    idbee integer NOT NULL
);


ALTER TABLE pollen OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 33123)
-- Name: trabalho; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE trabalho (
    idtrabalho integer NOT NULL,
    descricao character varying(50) NOT NULL,
    salario numeric NOT NULL
);


ALTER TABLE trabalho OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 33121)
-- Name: trabalho_idtrabalho_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE trabalho_idtrabalho_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trabalho_idtrabalho_seq OWNER TO postgres;

--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 197
-- Name: trabalho_idtrabalho_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE trabalho_idtrabalho_seq OWNED BY trabalho.idtrabalho;


--
-- TOC entry 2080 (class 2604 OID 33137)
-- Name: idabelha; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abelha ALTER COLUMN idabelha SET DEFAULT nextval('abelha_idabelha_seq'::regclass);


--
-- TOC entry 2075 (class 2604 OID 32922)
-- Name: idbee; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bee ALTER COLUMN idbee SET DEFAULT nextval('bee_idbee_seq'::regclass);


--
-- TOC entry 2077 (class 2604 OID 33102)
-- Name: idcolmeia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY colmeia ALTER COLUMN idcolmeia SET DEFAULT nextval('colmeia_idcolmeia_seq'::regclass);


--
-- TOC entry 2073 (class 2604 OID 32887)
-- Name: idcomb; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comb ALTER COLUMN idcomb SET DEFAULT nextval('comb_idcomb_seq'::regclass);


--
-- TOC entry 2078 (class 2604 OID 33113)
-- Name: idfavo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY favo ALTER COLUMN idfavo SET DEFAULT nextval('favo_idfavo_seq'::regclass);


--
-- TOC entry 2081 (class 2604 OID 33171)
-- Name: idflor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY flor ALTER COLUMN idflor SET DEFAULT nextval('flor_idflor_seq'::regclass);


--
-- TOC entry 2076 (class 2604 OID 32956)
-- Name: idflower; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY flower ALTER COLUMN idflower SET DEFAULT nextval('flower_idflower_seq'::regclass);


--
-- TOC entry 2072 (class 2604 OID 32876)
-- Name: idhive; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hive ALTER COLUMN idhive SET DEFAULT nextval('hive_idhive_seq'::regclass);


--
-- TOC entry 2074 (class 2604 OID 32911)
-- Name: idjob; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job ALTER COLUMN idjob SET DEFAULT nextval('job_idjob_seq'::regclass);


--
-- TOC entry 2082 (class 2604 OID 33345)
-- Name: idlogin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY login ALTER COLUMN idlogin SET DEFAULT nextval('login_idlogin_seq'::regclass);


--
-- TOC entry 2079 (class 2604 OID 33126)
-- Name: idtrabalho; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trabalho ALTER COLUMN idtrabalho SET DEFAULT nextval('trabalho_idtrabalho_seq'::regclass);


--
-- TOC entry 2254 (class 0 OID 33134)
-- Dependencies: 200
-- Data for Name: abelha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY abelha (idabelha, nome, idade, mel, idtrabalho, idfavo) FROM stdin;
1	Edwina Lowell	45	25.31	1	1
2	Diana Portia	66	0.78	2	1
3	Brandt Jenna	104	9.99	3	1
4	Donna Romy\t	150	6.11	4	2
5	Robby Salina	16	8.75	5	2
6	Amie Kyler\t	111	2.30	6	2
7	Luther Randal	88	4.09	7	3
8	Euphemia Lissa	79	4.05	8	3
9	Karrie Nigel	70	7.59	3	3
10	Lorne Beulah	130	7.46	4	3
11	Tilly Andie	126	5.65	5	4
12	Kegan Jerrod	184	0.24	6	4
13	Amanda Janette	163	18.72	1	5
14	Rowina Emerson	131	5.13	7	5
15	Kaycee Coretta	99	6.05	3	5
16	Kaitlynn Carver	61	6.20	4	5
17	Luke Silas	39	2.98	5	6
18	Phillipa Ros	137	4.03	6	6
19	JoBeth Tim	92	4.27	3	6
20	Ophelia Richmaly	167	32.19	1	7
21	Cavan Emelia	76	7.48	2	7
22	Ripley Goodwin	41	0.98	3	7
23	Walt Tittus	62	1.12	3	8
24	Mitch Denny	148	5.17	4	8
25	Dawn Georgene	129	7.41	4	8
26	Paisley Alisha	80	2.10	5	8
27	Pauletta Pearl	101	1.69	5	8
28	Dorita Eustace	100	3.74	6	9
29	Aldous Mikki	183	7.42	6	9
30	Timotha Marci	57	5.98	7	10
31	Narelle Sherrie	134	3.37	8	10
32	Jarred Claud	123	6.58	3	11
33	Mandi Adeline	158	8.48	3	11
\.


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 199
-- Name: abelha_idabelha_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('abelha_idabelha_seq', 1, false);


--
-- TOC entry 2261 (class 0 OID 33348)
-- Dependencies: 207
-- Data for Name: answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY answer (idquestion, idlogin, rqlanswer, sqlanswer, rqltime, sqltime, rqlerrors, sqlerrors) FROM stdin;
0	2		\N	92	0	0	0
1	2	Abelha;	SELECT * FROM Abelha;	110	654	0	64
2	2	¢ idAbelha, nome, mel (Abelha);	SELECT idAbelha, nome, mel FROM Abelha;	101	198	7	7
3	2	SELECT idAbelha, nome, mel FROM Abelha;	SELECT * FROM Abelha;	4	110	0	5
4	2			4	6	0	0
5	2			4	5	0	0
6	2			5	4	0	0
7	2			3	4	0	0
8	2			4	6	0	0
9	2			4	4	0	0
10	2			15	27	0	0
11	2			6	0	0	0
\.


--
-- TOC entry 2242 (class 0 OID 32919)
-- Dependencies: 188
-- Data for Name: bee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bee (idbee, name, age, honey, idjob, idcomb) FROM stdin;
1	Edwina Lowell	45	25.31	1	1
2	Diana Portia	66	0.78	2	1
3	Brandt Jenna	104	9.99	3	1
4	Donna Romy\t	150	6.11	4	2
5	Robby Salina	16	8.75	5	2
6	Amie Kyler\t	111	2.30	6	2
7	Luther Randal	88	4.09	7	3
8	Euphemia Lissa	79	4.05	8	3
9	Karrie Nigel	70	7.59	3	3
10	Lorne Beulah	130	7.46	4	3
11	Tilly Andie	126	5.65	5	4
12	Kegan Jerrod	184	0.24	6	4
13	Amanda Janette	163	18.72	1	5
14	Rowina Emerson	131	5.13	7	5
15	Kaycee Coretta	99	6.05	3	5
16	Kaitlynn Carver	61	6.20	4	5
17	Luke Silas	39	2.98	5	6
18	Phillipa Ros	137	4.03	6	6
19	JoBeth Tim	92	4.27	3	6
20	Ophelia Richmaly	167	32.19	1	7
21	Cavan Emelia	76	7.48	2	7
22	Ripley Goodwin	41	0.98	3	7
23	Walt Tittus	62	1.12	3	8
24	Mitch Denny	148	5.17	4	8
25	Dawn Georgene	129	7.41	4	8
26	Paisley Alisha	80	2.10	5	8
27	Pauletta Pearl	101	1.69	5	8
28	Dorita Eustace	100	3.74	6	9
29	Aldous Mikki	183	7.42	6	9
30	Timotha Marci	57	5.98	7	10
31	Narelle Sherrie	134	3.37	8	10
32	Jarred Claud	123	6.58	3	11
33	Mandi Adeline	158	8.48	3	11
\.


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 187
-- Name: bee_idbee_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bee_idbee_seq', 1, false);


--
-- TOC entry 2248 (class 0 OID 33099)
-- Dependencies: 194
-- Data for Name: colmeia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY colmeia (idcolmeia, posicaox, posicaoy, mel) FROM stdin;
1	14	26	580.56
2	27	18	365.45
3	46	77	779.64
\.


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 193
-- Name: colmeia_idcolmeia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('colmeia_idcolmeia_seq', 1, false);


--
-- TOC entry 2238 (class 0 OID 32884)
-- Dependencies: 184
-- Data for Name: comb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comb (idcomb, idhive) FROM stdin;
1	1
2	1
3	1
4	1
5	2
6	2
7	3
8	3
9	3
10	3
11	3
\.


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 183
-- Name: comb_idcomb_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comb_idcomb_seq', 1, false);


--
-- TOC entry 2262 (class 0 OID 33359)
-- Dependencies: 208
-- Data for Name: comparationquestion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comparationquestion (idlogin, questionnumber, answer) FROM stdin;
2	1	5
2	2	5
2	3	5
2	4	1
2	5	5
2	6	4
\.


--
-- TOC entry 2250 (class 0 OID 33110)
-- Dependencies: 196
-- Data for Name: favo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY favo (idfavo, idcolmeia) FROM stdin;
1	1
2	1
3	1
4	1
5	2
6	2
7	3
8	3
9	3
10	3
11	3
\.


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 195
-- Name: favo_idfavo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('favo_idfavo_seq', 1, false);


--
-- TOC entry 2257 (class 0 OID 33168)
-- Dependencies: 203
-- Data for Name: flor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY flor (idflor, posicaox, posicaoy) FROM stdin;
1	5	9
2	7	5
3	1	10
4	7	2
5	5	1
6	0	5
7	2	2
8	1	1
9	6	6
10	5	5
11	0	10
\.


--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 202
-- Name: flor_idflor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('flor_idflor_seq', 1, false);


--
-- TOC entry 2245 (class 0 OID 32953)
-- Dependencies: 191
-- Data for Name: flower; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY flower (idflower, positionx, positiony) FROM stdin;
1	5	9
2	7	5
3	1	10
4	7	2
5	5	1
6	0	5
7	2	2
8	1	1
9	6	6
10	5	5
11	0	10
\.


--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 190
-- Name: flower_idflower_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('flower_idflower_seq', 1, false);


--
-- TOC entry 2243 (class 0 OID 32938)
-- Dependencies: 189
-- Data for Name: hierarchy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hierarchy (idinferior, idsuperior) FROM stdin;
2	1
3	8
4	8
5	8
6	7
7	2
8	6
2	1
3	8
4	8
5	8
6	7
7	2
8	6
2	1
3	8
4	8
5	8
6	7
7	2
8	6
2	1
3	8
4	8
5	8
6	7
7	2
8	6
\.


--
-- TOC entry 2255 (class 0 OID 33153)
-- Dependencies: 201
-- Data for Name: hierarquia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hierarquia (idinferior, idsuperior) FROM stdin;
2	1
3	8
4	8
5	8
6	7
7	2
8	6
\.


--
-- TOC entry 2236 (class 0 OID 32873)
-- Dependencies: 182
-- Data for Name: hive; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hive (idhive, positionx, positiony, honey) FROM stdin;
1	14	26	580.56
2	27	18	365.45
3	46	77	779.64
\.


--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 181
-- Name: hive_idhive_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hive_idhive_seq', 1, false);


--
-- TOC entry 2240 (class 0 OID 32908)
-- Dependencies: 186
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job (idjob, description, salary) FROM stdin;
1	Queen	50.0
2	Guard	10.0
3	Collector	5.0
4	Worker	3.0
5	Transporter	2.0
6	Honey Maker	7.0
7	Manager	8.0
8	Supervisor	5.0
\.


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 185
-- Name: job_idjob_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('job_idjob_seq', 1, false);


--
-- TOC entry 2260 (class 0 OID 33342)
-- Dependencies: 206
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY login (idlogin, name, institution, login, pass, country, experience) FROM stdin;
2	Dérick Welman	IFSP	derickwelman	derick123	Brazil	0
3	Lucas Venezian Povoa	IFSP	lucasvenez	lucas123	Brazil	999
4	Riany Oliveira	IFSP	rianyoliveira	ri123	Brazil	4
\.


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 205
-- Name: login_idlogin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('login_idlogin_seq', 4, true);


--
-- TOC entry 2258 (class 0 OID 33174)
-- Dependencies: 204
-- Data for Name: polen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY polen (idflor, idabelha) FROM stdin;
1	33
2	33
3	33
4	33
5	33
6	33
7	33
8	33
9	33
10	33
11	33
1	15
1	23
2	19
2	22
2	23
2	3
2	15
3	23
3	19
3	3
3	15
4	15
4	32
4	3
4	23
4	9
5	15
5	32
5	9
6	23
6	15
6	3
6	32
6	9
7	22
7	15
7	32
8	9
8	3
8	19
8	22
9	15
9	3
9	19
10	3
10	15
11	3
11	19
11	22
\.


--
-- TOC entry 2246 (class 0 OID 32994)
-- Dependencies: 192
-- Data for Name: pollen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pollen (idflower, idbee) FROM stdin;
1	33
2	33
3	33
4	33
5	33
6	33
7	33
8	33
9	33
10	33
11	33
1	15
1	23
2	19
2	22
2	23
2	3
2	15
3	23
3	19
3	3
3	15
4	15
4	32
4	3
4	23
4	9
5	15
5	32
5	9
6	23
6	15
6	3
6	32
6	9
7	22
7	15
7	32
8	9
8	3
8	19
8	22
9	15
9	3
9	19
10	3
10	15
11	3
11	19
11	22
1	33
2	33
3	33
4	33
5	33
6	33
7	33
8	33
9	33
10	33
11	33
1	15
1	23
2	19
2	22
2	23
2	3
2	15
3	23
3	19
3	3
3	15
4	15
4	32
4	3
4	23
4	9
5	15
5	32
5	9
6	23
6	15
6	3
6	32
6	9
7	22
7	15
7	32
8	9
8	3
8	19
8	22
9	15
9	3
9	19
10	3
10	15
11	3
11	19
11	22
1	33
2	33
3	33
4	33
5	33
6	33
7	33
8	33
9	33
10	33
11	33
1	15
1	23
2	19
2	22
2	23
2	3
2	15
3	23
3	19
3	3
3	15
4	15
4	32
4	3
4	23
4	9
5	15
5	32
5	9
6	23
6	15
6	3
6	32
6	9
7	22
7	15
7	32
8	9
8	3
8	19
8	22
9	15
9	3
9	19
10	3
10	15
11	3
11	19
11	22
1	33
2	33
3	33
4	33
5	33
6	33
7	33
8	33
9	33
10	33
11	33
1	15
1	23
2	19
2	22
2	23
2	3
2	15
3	23
3	19
3	3
3	15
4	15
4	32
4	3
4	23
4	9
5	15
5	32
5	9
6	23
6	15
6	3
6	32
6	9
7	22
7	15
7	32
8	9
8	3
8	19
8	22
9	15
9	3
9	19
10	3
10	15
11	3
11	19
11	22
\.


--
-- TOC entry 2252 (class 0 OID 33123)
-- Dependencies: 198
-- Data for Name: trabalho; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY trabalho (idtrabalho, descricao, salario) FROM stdin;
1	Rainha	50.0
2	Guarda	10.0
3	Coletor	5.0
4	Operário	3.0
5	Transportador	2.0
6	Fazedor de mel	7.0
7	Gerente	8.0
8	Supervisor	5.0
\.


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 197
-- Name: trabalho_idtrabalho_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('trabalho_idtrabalho_seq', 1, false);


--
-- TOC entry 2100 (class 2606 OID 33142)
-- Name: abelha_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abelha
    ADD CONSTRAINT abelha_pkey PRIMARY KEY (idabelha);


--
-- TOC entry 2090 (class 2606 OID 32927)
-- Name: bee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bee
    ADD CONSTRAINT bee_pkey PRIMARY KEY (idbee);


--
-- TOC entry 2094 (class 2606 OID 33107)
-- Name: colmeia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY colmeia
    ADD CONSTRAINT colmeia_pkey PRIMARY KEY (idcolmeia);


--
-- TOC entry 2086 (class 2606 OID 32889)
-- Name: comb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comb
    ADD CONSTRAINT comb_pkey PRIMARY KEY (idcomb);


--
-- TOC entry 2096 (class 2606 OID 33115)
-- Name: favo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY favo
    ADD CONSTRAINT favo_pkey PRIMARY KEY (idfavo);


--
-- TOC entry 2102 (class 2606 OID 33173)
-- Name: flor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY flor
    ADD CONSTRAINT flor_pkey PRIMARY KEY (idflor);


--
-- TOC entry 2092 (class 2606 OID 32958)
-- Name: flower_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY flower
    ADD CONSTRAINT flower_pkey PRIMARY KEY (idflower);


--
-- TOC entry 2084 (class 2606 OID 32881)
-- Name: hive_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hive
    ADD CONSTRAINT hive_pkey PRIMARY KEY (idhive);


--
-- TOC entry 2088 (class 2606 OID 32916)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (idjob);


--
-- TOC entry 2104 (class 2606 OID 33347)
-- Name: login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY login
    ADD CONSTRAINT login_pkey PRIMARY KEY (idlogin);


--
-- TOC entry 2098 (class 2606 OID 33131)
-- Name: trabalho_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trabalho
    ADD CONSTRAINT trabalho_pkey PRIMARY KEY (idtrabalho);


--
-- TOC entry 2114 (class 2606 OID 33148)
-- Name: abelha_idfavo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abelha
    ADD CONSTRAINT abelha_idfavo_fkey FOREIGN KEY (idfavo) REFERENCES favo(idfavo);


--
-- TOC entry 2113 (class 2606 OID 33143)
-- Name: abelha_idtrabalho_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abelha
    ADD CONSTRAINT abelha_idtrabalho_fkey FOREIGN KEY (idtrabalho) REFERENCES trabalho(idtrabalho);


--
-- TOC entry 2119 (class 2606 OID 33354)
-- Name: answer_idlogin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY answer
    ADD CONSTRAINT answer_idlogin_fkey FOREIGN KEY (idlogin) REFERENCES login(idlogin);


--
-- TOC entry 2107 (class 2606 OID 32933)
-- Name: bee_idcomb_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bee
    ADD CONSTRAINT bee_idcomb_fkey FOREIGN KEY (idcomb) REFERENCES comb(idcomb);


--
-- TOC entry 2106 (class 2606 OID 32928)
-- Name: bee_idjob_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bee
    ADD CONSTRAINT bee_idjob_fkey FOREIGN KEY (idjob) REFERENCES job(idjob);


--
-- TOC entry 2120 (class 2606 OID 33362)
-- Name: comparationquestion_idlogin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comparationquestion
    ADD CONSTRAINT comparationquestion_idlogin_fkey FOREIGN KEY (idlogin) REFERENCES login(idlogin);


--
-- TOC entry 2112 (class 2606 OID 33116)
-- Name: favo_idcolmeia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY favo
    ADD CONSTRAINT favo_idcolmeia_fkey FOREIGN KEY (idcolmeia) REFERENCES colmeia(idcolmeia);


--
-- TOC entry 2105 (class 2606 OID 32890)
-- Name: fk_comb_idhive; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comb
    ADD CONSTRAINT fk_comb_idhive FOREIGN KEY (idhive) REFERENCES hive(idhive);


--
-- TOC entry 2108 (class 2606 OID 32941)
-- Name: hierarchy_idinferior_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hierarchy
    ADD CONSTRAINT hierarchy_idinferior_fkey FOREIGN KEY (idinferior) REFERENCES job(idjob);


--
-- TOC entry 2109 (class 2606 OID 32946)
-- Name: hierarchy_idsuperior_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hierarchy
    ADD CONSTRAINT hierarchy_idsuperior_fkey FOREIGN KEY (idsuperior) REFERENCES job(idjob);


--
-- TOC entry 2115 (class 2606 OID 33156)
-- Name: hierarquia_idinferior_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hierarquia
    ADD CONSTRAINT hierarquia_idinferior_fkey FOREIGN KEY (idinferior) REFERENCES trabalho(idtrabalho);


--
-- TOC entry 2116 (class 2606 OID 33161)
-- Name: hierarquia_idsuperior_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hierarquia
    ADD CONSTRAINT hierarquia_idsuperior_fkey FOREIGN KEY (idsuperior) REFERENCES trabalho(idtrabalho);


--
-- TOC entry 2118 (class 2606 OID 33182)
-- Name: polen_idabelha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY polen
    ADD CONSTRAINT polen_idabelha_fkey FOREIGN KEY (idabelha) REFERENCES abelha(idabelha);


--
-- TOC entry 2117 (class 2606 OID 33177)
-- Name: polen_idflor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY polen
    ADD CONSTRAINT polen_idflor_fkey FOREIGN KEY (idflor) REFERENCES flor(idflor);


--
-- TOC entry 2111 (class 2606 OID 33002)
-- Name: pollen_idbee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pollen
    ADD CONSTRAINT pollen_idbee_fkey FOREIGN KEY (idbee) REFERENCES bee(idbee);


--
-- TOC entry 2110 (class 2606 OID 32997)
-- Name: pollen_idflower_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pollen
    ADD CONSTRAINT pollen_idflower_fkey FOREIGN KEY (idflower) REFERENCES flower(idflower);


--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 200
-- Name: abelha; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE abelha FROM PUBLIC;
REVOKE ALL ON TABLE abelha FROM postgres;
GRANT ALL ON TABLE abelha TO postgres;
GRANT SELECT ON TABLE abelha TO guest;


--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 188
-- Name: bee; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE bee FROM PUBLIC;
REVOKE ALL ON TABLE bee FROM postgres;
GRANT ALL ON TABLE bee TO postgres;
GRANT SELECT ON TABLE bee TO guest;


--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 194
-- Name: colmeia; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE colmeia FROM PUBLIC;
REVOKE ALL ON TABLE colmeia FROM postgres;
GRANT ALL ON TABLE colmeia TO postgres;
GRANT SELECT ON TABLE colmeia TO guest;


--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 184
-- Name: comb; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE comb FROM PUBLIC;
REVOKE ALL ON TABLE comb FROM postgres;
GRANT ALL ON TABLE comb TO postgres;
GRANT SELECT ON TABLE comb TO guest;


--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 196
-- Name: favo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE favo FROM PUBLIC;
REVOKE ALL ON TABLE favo FROM postgres;
GRANT ALL ON TABLE favo TO postgres;
GRANT SELECT ON TABLE favo TO guest;


--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 203
-- Name: flor; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE flor FROM PUBLIC;
REVOKE ALL ON TABLE flor FROM postgres;
GRANT ALL ON TABLE flor TO postgres;
GRANT SELECT ON TABLE flor TO guest;


--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 191
-- Name: flower; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE flower FROM PUBLIC;
REVOKE ALL ON TABLE flower FROM postgres;
GRANT ALL ON TABLE flower TO postgres;
GRANT SELECT ON TABLE flower TO guest;


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 189
-- Name: hierarchy; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE hierarchy FROM PUBLIC;
REVOKE ALL ON TABLE hierarchy FROM postgres;
GRANT ALL ON TABLE hierarchy TO postgres;
GRANT SELECT ON TABLE hierarchy TO guest;


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 201
-- Name: hierarquia; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE hierarquia FROM PUBLIC;
REVOKE ALL ON TABLE hierarquia FROM postgres;
GRANT ALL ON TABLE hierarquia TO postgres;
GRANT SELECT ON TABLE hierarquia TO guest;


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 182
-- Name: hive; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE hive FROM PUBLIC;
REVOKE ALL ON TABLE hive FROM postgres;
GRANT ALL ON TABLE hive TO postgres;
GRANT SELECT ON TABLE hive TO guest;


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 186
-- Name: job; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE job FROM PUBLIC;
REVOKE ALL ON TABLE job FROM postgres;
GRANT ALL ON TABLE job TO postgres;
GRANT SELECT ON TABLE job TO guest;


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 204
-- Name: polen; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE polen FROM PUBLIC;
REVOKE ALL ON TABLE polen FROM postgres;
GRANT ALL ON TABLE polen TO postgres;
GRANT SELECT ON TABLE polen TO guest;


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 192
-- Name: pollen; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pollen FROM PUBLIC;
REVOKE ALL ON TABLE pollen FROM postgres;
GRANT ALL ON TABLE pollen TO postgres;
GRANT SELECT ON TABLE pollen TO guest;


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 198
-- Name: trabalho; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE trabalho FROM PUBLIC;
REVOKE ALL ON TABLE trabalho FROM postgres;
GRANT ALL ON TABLE trabalho TO postgres;
GRANT SELECT ON TABLE trabalho TO guest;


-- Completed on 2016-10-17 07:32:41

--
-- PostgreSQL database dump complete
--

