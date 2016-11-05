--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-11-05 13:52:44

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

INSERT INTO abelha VALUES (1, 'Edwina Lowell', 45, 25.31, 1, 1);
INSERT INTO abelha VALUES (2, 'Diana Portia', 66, 0.78, 2, 1);
INSERT INTO abelha VALUES (3, 'Brandt Jenna', 104, 9.99, 3, 1);
INSERT INTO abelha VALUES (4, 'Donna Romy	', 150, 6.11, 4, 2);
INSERT INTO abelha VALUES (5, 'Robby Salina', 16, 8.75, 5, 2);
INSERT INTO abelha VALUES (6, 'Amie Kyler	', 111, 2.30, 6, 2);
INSERT INTO abelha VALUES (7, 'Luther Randal', 88, 4.09, 7, 3);
INSERT INTO abelha VALUES (8, 'Euphemia Lissa', 79, 4.05, 8, 3);
INSERT INTO abelha VALUES (9, 'Karrie Nigel', 70, 7.59, 3, 3);
INSERT INTO abelha VALUES (10, 'Lorne Beulah', 130, 7.46, 4, 3);
INSERT INTO abelha VALUES (11, 'Tilly Andie', 126, 5.65, 5, 4);
INSERT INTO abelha VALUES (12, 'Kegan Jerrod', 184, 0.24, 6, 4);
INSERT INTO abelha VALUES (13, 'Amanda Janette', 163, 18.72, 1, 5);
INSERT INTO abelha VALUES (14, 'Rowina Emerson', 131, 5.13, 7, 5);
INSERT INTO abelha VALUES (15, 'Kaycee Coretta', 99, 6.05, 3, 5);
INSERT INTO abelha VALUES (16, 'Kaitlynn Carver', 61, 6.20, 4, 5);
INSERT INTO abelha VALUES (17, 'Luke Silas', 39, 2.98, 5, 6);
INSERT INTO abelha VALUES (18, 'Phillipa Ros', 137, 4.03, 6, 6);
INSERT INTO abelha VALUES (19, 'JoBeth Tim', 92, 4.27, 3, 6);
INSERT INTO abelha VALUES (20, 'Ophelia Richmaly', 167, 32.19, 1, 7);
INSERT INTO abelha VALUES (21, 'Cavan Emelia', 76, 7.48, 2, 7);
INSERT INTO abelha VALUES (22, 'Ripley Goodwin', 41, 0.98, 3, 7);
INSERT INTO abelha VALUES (23, 'Walt Tittus', 62, 1.12, 3, 8);
INSERT INTO abelha VALUES (24, 'Mitch Denny', 148, 5.17, 4, 8);
INSERT INTO abelha VALUES (25, 'Dawn Georgene', 129, 7.41, 4, 8);
INSERT INTO abelha VALUES (26, 'Paisley Alisha', 80, 2.10, 5, 8);
INSERT INTO abelha VALUES (27, 'Pauletta Pearl', 101, 1.69, 5, 8);
INSERT INTO abelha VALUES (28, 'Dorita Eustace', 100, 3.74, 6, 9);
INSERT INTO abelha VALUES (29, 'Aldous Mikki', 183, 7.42, 6, 9);
INSERT INTO abelha VALUES (30, 'Timotha Marci', 57, 5.98, 7, 10);
INSERT INTO abelha VALUES (31, 'Narelle Sherrie', 134, 3.37, 8, 10);
INSERT INTO abelha VALUES (32, 'Jarred Claud', 123, 6.58, 3, 11);
INSERT INTO abelha VALUES (33, 'Mandi Adeline', 158, 8.48, 3, 11);


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

INSERT INTO answer VALUES (0, 6, '', NULL, 2, 0, 0, 0);
INSERT INTO answer VALUES (1, 6, 'Abelha;', 'SELECT* FROM Abelha;', 7, 8, 0, 0);
INSERT INTO answer VALUES (2, 22, '¢idAbelha,nome,mel(Abelha);', 'Select idAbelha, nome, mel from Abelha;', 21, 56, 0, 0);
INSERT INTO answer VALUES (0, 13, '', NULL, 161, 0, 0, 0);
INSERT INTO answer VALUES (3, 12, '£salario > 10(Trabalho);', '', 544, 9, 16, 1);
INSERT INTO answer VALUES (1, 16, '', '', 1400, 3, 6, 0);
INSERT INTO answer VALUES (2, 23, '¢ idAbelha, nome, mel (Abelha);', 'select idAbelha,nome,mel from Abelha;', 41, 99, 0, 0);
INSERT INTO answer VALUES (3, 22, '£salario>10(Trabalho);', 'Select * from Trabalho where salario > 10;', 63, 16, 1, 0);
INSERT INTO answer VALUES (3, 19, '£ salario > 10 (Trabalho);', 'SELECT * FROM Trabalho WHERE salario > 10;', 123, 29, 0, 0);
INSERT INTO answer VALUES (0, 23, '', NULL, 52, 0, 0, 0);
INSERT INTO answer VALUES (1, 8, 'Abelha;', 'SELECT DISTINCT * FROM Abelha;', 105, 26, 0, 0);
INSERT INTO answer VALUES (1, 10, 'Abelha;', 'SELECT DISTINCT * FROM Abelha;', 158, 33, 0, 0);
INSERT INTO answer VALUES (1, 24, 'Abelha;', 'SELECT DISTINCT * FROM Abelha;', 146, 28, 0, 0);
INSERT INTO answer VALUES (0, 21, '', NULL, 108, 0, 0, 0);
INSERT INTO answer VALUES (1, 22, 'Abelha;', 'Select * from Abelha;', 240, 15, 3, 0);
INSERT INTO answer VALUES (0, 20, '', NULL, 201, 0, 0, 0);
INSERT INTO answer VALUES (2, 2, '', 'SELECT * FROM Abelha;', 0, 0, 0, 0);
INSERT INTO answer VALUES (3, 2, '', '', 0, 0, 0, 0);
INSERT INTO answer VALUES (1, 25, 'Abelha;', 'SELECT DISTINCT * FROM Abelha;', 138, 40, 0, 0);
INSERT INTO answer VALUES (4, 2, '', '', 1, 0, 0, 0);
INSERT INTO answer VALUES (5, 2, '', '', 0, 0, 0, 0);
INSERT INTO answer VALUES (6, 2, '', '', 0, 0, 0, 0);
INSERT INTO answer VALUES (7, 2, '', '', 0, 0, 0, 0);
INSERT INTO answer VALUES (1, 19, 'Abelha;', 'SELECT * FROM Abelha;', 169, 22, 0, 0);
INSERT INTO answer VALUES (8, 2, '', '', 0, 0, 0, 0);
INSERT INTO answer VALUES (9, 2, '', '', 0, 0, 0, 0);
INSERT INTO answer VALUES (1, 23, 'Colmeia;', 'select * from Abelha;
', 80, 33, 2, 2);
INSERT INTO answer VALUES (10, 2, '', '', 59, 0, 2, 0);
INSERT INTO answer VALUES (11, 2, 'Polen / (¢ idAbelha (Abelha));', '', 0, 0, 0, 0);
INSERT INTO answer VALUES (0, 2, '', NULL, 16, 0, 0, 0);
INSERT INTO answer VALUES (1, 2, 'Abelha;', 'Abelha;', 6873, 7, 2, 0);
INSERT INTO answer VALUES (1, 7, 'Abelha;', NULL, 4, 0, 0, 0);
INSERT INTO answer VALUES (0, 7, '', NULL, 4, 0, 0, 0);
INSERT INTO answer VALUES (0, 16, '', NULL, 91, 0, 0, 0);
INSERT INTO answer VALUES (1, 9, 'Abelha;', 'SELECT DISTINCT * FROM Abelha;', 144, 29, 0, 0);
INSERT INTO answer VALUES (0, 10, '', NULL, 21, 0, 0, 0);
INSERT INTO answer VALUES (0, 24, '', NULL, 22, 0, 0, 0);
INSERT INTO answer VALUES (0, 18, '', NULL, 147, 0, 1, 0);
INSERT INTO answer VALUES (0, 19, '', NULL, 30, 0, 0, 0);
INSERT INTO answer VALUES (0, 25, '', NULL, 18, 0, 0, 0);
INSERT INTO answer VALUES (0, 14, '', NULL, 20, 0, 0, 0);
INSERT INTO answer VALUES (0, 8, '', NULL, 54, 0, 1, 0);
INSERT INTO answer VALUES (0, 22, '', NULL, 31, 0, 0, 0);
INSERT INTO answer VALUES (2, 8, '¢ idAbelha, nome, mel (Abelha);', '', 108, 17, 34, 0);
INSERT INTO answer VALUES (1, 14, 'Abelha;', 'SELECT DISTINCT * FROM Abelha;', 239, 36, 0, 0);
INSERT INTO answer VALUES (3, 25, '£ salario > 10 (Trabalho);', 'SELECT DISTINCT * FROM Trabalho WHERE salario > 10;', 191, 18, 0, 0);
INSERT INTO answer VALUES (0, 17, '', NULL, 29, 0, 0, 0);
INSERT INTO answer VALUES (2, 24, '¢idAbelha, nome, mel (Abelha);', 'SELECT DISTINCT idAbelha, nome, mel FROM Abelha;', 32, 113, 0, 0);
INSERT INTO answer VALUES (0, 11, '', NULL, 49, 0, 4, 0);
INSERT INTO answer VALUES (2, 20, '¢idAbelha, nome, mel (Abelha);', 'SELECT DISTINCT idAbelha, nome, mel FROM Abelha;', 43, 213, 0, 0);
INSERT INTO answer VALUES (2, 9, '¢ idAbelha, nome, mel (Abelha);', 'SELECT DISTINCT idAbelha, nome, mel FROM Abelha;', 31, 84, 0, 0);
INSERT INTO answer VALUES (1, 21, 'Abelha;', 'SELECT DISTINCT idAbelha, nome, idade,  mel, idTrabalho, idFavo FROM Abelha;', 251, 94, 0, 0);
INSERT INTO answer VALUES (2, 25, '¢ idAbelha, nome, mel (Abelha);', 'SELECT DISTINCT idAbelha, nome, mel FROM Abelha;', 13, 233, 0, 0);
INSERT INTO answer VALUES (1, 20, 'Abelha;', 'SELECT DISTINCT * FROM Abelha;', 97, 55, 0, 0);
INSERT INTO answer VALUES (3, 24, '£ salario > 10 (Trabalho);', 'SELECT DISTINCT * FROM Trabalho WHERE salario > 10;', 63, 45, 0, 0);
INSERT INTO answer VALUES (3, 10, '£ salario > 10 (Trabalho);', 'SELECT DISTINCT * FROM Trabalho WHERE Trabalho.salario > 10', 222, 33, 2, 0);
INSERT INTO answer VALUES (3, 8, '£ salario > 10 (Trabalho);', 'SELECT DISTINCT * FROM Trabalho WHERE salario > 10;', 201, 51, 2, 0);
INSERT INTO answer VALUES (2, 12, '¢idAbelha, nome, mel(Abelha);', 'Select idAbelha, nome, mel from Abelha;', 46, 48, 0, 0);
INSERT INTO answer VALUES (0, 15, '', NULL, 3, 0, 0, 0);
INSERT INTO answer VALUES (2, 19, '¢ idAbelha, nome, mel (Abelha);', 'SELECT idAbelha, nome, mel FROM Abelha;', 60, 90, 0, 0);
INSERT INTO answer VALUES (4, 22, '§posicaoY longetude, posicaoX latitude(Colmeia);', 'Select idColmeia, posicaoX as latitude, posicaoY as longetude, mel from Colmeia;', 121, 144, 3, 2);
INSERT INTO answer VALUES (1, 18, 'Abelha;', 'SELECT DISTINCT * FROM Abelha;', 257, 12, 0, 0);
INSERT INTO answer VALUES (2, 10, '¢ idAbelha, nome, mel (Abelha);', '', 83, 21, 1, 0);
INSERT INTO answer VALUES (2, 18, '¢ idAbelha, nome, mel (Abelha);', 'SELECT DISTINCT idAbelha, nome, mel FROM Abelha AS temporaryRelation2;', 23, 206, 0, 0);
INSERT INTO answer VALUES (3, 23, '£ salario >10 (Trabalho);', 'select * from Trabalho where salario >10;', 239, 27, 1, 0);
INSERT INTO answer VALUES (2, 14, '¢ idAbelha, nome, mel (Abelha);', 'SELECT DISTINCT idAbelha, nome, mel FROM Abelha AS temporaryRelation2;', 7, 197, 0, 0);
INSERT INTO answer VALUES (1, 15, '¢ idAbelha, nome, idade, mel, idTrabalho, idFavo (Abelha [] (Colmeia [] Favo));', '', 2010, 219, 4, 2);
INSERT INTO answer VALUES (1, 12, '¢idAbelha, idColmeia(Abelha [idAbelha = idColmeia] Colmeia);', 'Select Distinct * from Abelha;', 896, 134, 13, 0);
INSERT INTO answer VALUES (0, 12, '£salario > 10(Trabalho);', NULL, 1051, 0, 35, 0);
INSERT INTO answer VALUES (3, 20, '£ salario > 10 (Trabalho);', 'SELECT DISTINCT * FROM Trabalho WHERE salario > 10;', 327, 97, 1, 0);
INSERT INTO answer VALUES (4, 24, '§posicaoX latitude, posicaoY longetude(¢ idColmeia,  mel, posicaoX ,posicaoY  (Colmeia));', 'SELECT DISTINCT idColmeia, posicaoX AS latitude, posicaoY AS longetude, mel FROM Colmeia;', 652, 179, 5, 1);
INSERT INTO answer VALUES (0, 26, '', NULL, 164, 0, 0, 0);
INSERT INTO answer VALUES (3, 14, '£ salario > 10.0 (Trabalho);', 'SELECT DISTINCT * FROM Trabalho AS temporaryRelation2 WHERE salario > 10.0;', 246, 22, 0, 0);
INSERT INTO answer VALUES (3, 18, '£ salario > 10 (Trabalho);', 'SELECT DISTINCT * FROM Trabalho AS temporaryRelation2 WHERE salario > 10;', 270, 13, 1, 0);
INSERT INTO answer VALUES (3, 9, '£ salario> 10 (Trabalho);', 'SELECT DISTINCT * FROM Trabalho AS temporaryRelation2 WHERE salario > 10;', 83, 75, 0, 19);
INSERT INTO answer VALUES (2, 21, '¢ idAbelha, nome, mel (Abelha);', 'SELECT DISTINCT idAbelha, nome, mel FROM Abelha;', 41, 342, 0, 1);
INSERT INTO answer VALUES (0, 9, '', NULL, 167, 0, 0, 0);
INSERT INTO answer VALUES (4, 19, '§  posicaoX latitude, posicaoY longitude (Colmeia);', 'SELECT idColmeia, posicaoX AS latitude, posicaoY AS longitude, mel FROM Colmeia;', 78, 209, 1, 2);
INSERT INTO answer VALUES (4, 8, '§ idColmeia idColmeia, posicaoX latitude , posicaoY longetude, mel mel (Colmeia);', 'SELECT DISTINCT idColmeia,  posicaoX AS latitude, posicaoY AS longetude, mel FROM  Colmeia;', 332, 218, 9, 1);
INSERT INTO answer VALUES (5, 22, 'Abelha[](£descricao="Transportador"(Trabalho));', 'Select * from Abelha natural join Trabalho where descricao = "Transportador";', 124, 31, 0, 0);
INSERT INTO answer VALUES (5, 18, '£ idTrabalho = 5 (Abelha [] Trabalho);', 'SELECT DISTINCT * FROM (SELECT DISTINCT * FROM Abelha AS temporaryRelation3 NATURAL JOIN Trabalho) AS temporaryRelation2 WHERE idTrabalho = 5;', 394, 7, 1, 0);
INSERT INTO answer VALUES (5, 25, '£ descricao = "Transportador" (Abelha [] Trabalho);', 'SELECT DISTINCT * FROM Abelha 
NATURAL JOIN Trabalho
 WHERE descricao = "Transportador";', 451, 54, 1, 0);
INSERT INTO answer VALUES (3, 26, '¢  idTrabalho, Salario > 10 (Trabalho);', 'SELECT idTrabalho, Descricao
FROM Trabalho
WHERE Salario > 10;', 688, 80, 12, 1);
INSERT INTO answer VALUES (5, 21, '£ descricao = "Transportador" (Trabalho [] Abelha) ;', 'SELECT DISTINCT * FROM Trabalho  NATURAL JOIN Abelha WHERE descricao = "Transportador";', 1123, 116, 8, 1);
INSERT INTO answer VALUES (3, 21, '£ salario > 10 (Trabalho);', 'SELECT DISTINCT * FROM Trabalho WHERE salario > 10;', 241, 35, 0, 0);
INSERT INTO answer VALUES (1, 26, 'SELECT DISTINCT * 
FROM abelha;
', 'Abelha;', 663, 97, 0, 4);
INSERT INTO answer VALUES (4, 10, '§ posicaoX latitude, posicaoY longetude (Colmeia);', 'SELECT DISTINCT idColmeia, posicaoX AS latitude, posicaoY AS longetude, mel FROM Colmeia;', 76, 372, 0, 17);
INSERT INTO answer VALUES (4, 18, '§ posicaoX latitude, posicaoY longetude (Colmeia);', 'SELECT DISTINCT posicaoX AS latitude, posicaoY AS longetude, idColmeia, mel FROM Colmeia AS temporaryRelation2;', 6, 454, 0, 0);
INSERT INTO answer VALUES (4, 25, '§ posicaoX latitude , posicaoY longetude (Colmeia);', 'SELECT DISTINCT posicaoX AS latitude, posicaoY AS longetude, idColmeia, mel FROM Colmeia;', 9, 477, 0, 0);
INSERT INTO answer VALUES (6, 22, '(¢posicaoX,posicaoY(Colmeia)) v (¢posicaoX,posicaoY(Flor));', 'Select posicaoX, posicaoY from Colmeia UNION Select posicaoX, posicaoY from Flor;', 104, 272, 2, 1);
INSERT INTO answer VALUES (5, 9, '£ idTrabalho= "5" (Abelha [] Trabalho);', 'SELECT DISTINCT * FROM (SELECT DISTINCT * FROM Abelha AS temporaryRelation4 NATURAL JOIN Trabalho) AS temporaryRelation3 WHERE idTrabalho = "5";', 381, 21, 1, 0);
INSERT INTO answer VALUES (6, 9, '(¢ posicaoX,posicaoY (Colmeia)) v (¢ posicaoX,posicaoY (Flor));', 'SELECT DISTINCT * FROM (SELECT DISTINCT posicaoX, posicaoY FROM Colmeia AS temporaryRelation3) AS temporaryRelation2 UNION SELECT DISTINCT * FROM (SELECT DISTINCT posicaoX, posicaoY FROM Flor AS temporaryRelation5) AS temporaryRelation5;', 10, 474, 0, 2);
INSERT INTO answer VALUES (5, 19, 'Abelha [] (£ descricao = "Transportador"(Trabalho));', 'SELECT * FROM (Abelha INNER JOIN (SELECT * FROM Trabalho WHERE descricao = ''Transportador'') AS Transportadores ON Abelha.idTrabalho = Transportadores.idTrabalho);', 419, 191, 7, 4);
INSERT INTO answer VALUES (2, 26, '¢ idAbelha, nome, mel (Abelha);', 'SELECT idAbelha, nome, mel
FROM Abelha;
', 118, 283, 1, 1);
INSERT INTO answer VALUES (7, 22, '((Colmeia[]Favo)[]Abelha) / ((Trabalho[]Abelha)[]Favo);', '', 581, 9, 13, 0);
INSERT INTO answer VALUES (1, 11, 'Colmeia/Abelha;', 'SELECT DISTINCT  idAbelha FROM Abelha  WHERE(
 SELECT COUNT(DISTINCT  idColmeia)
FROM Colmeia) =
 (SELECT count(*)
FROM Colmeia AS c
WHERE c.idColmeia = Abelha.idAbelha);', 740, 569, 2, 2);
INSERT INTO answer VALUES (5, 24, '£ descricao = "Transportador" (Trabalho[]Abelha);', 'SELECT DISTINCT * FROM Abelha NATURAL JOIN Trabalho WHERE descricao = "Transportador";', 911, 110, 20, 0);
INSERT INTO answer VALUES (4, 21, '§ posicaoX latitude, posicaoY longetude (Colmeia);', 'SELECT DISTINCT idColmeia, posicaoX  AS latitude, posicaoY AS longetude, mel FROM Colmeia;', 226, 293, 1, 0);
INSERT INTO answer VALUES (5, 14, '£ descricao = "Transportador" (Abelha[]Trabalho);', 'SELECT DISTINCT * FROM (SELECT DISTINCT * FROM Abelha AS temporaryRelation3 NATURAL JOIN Trabalho) AS temporaryRelation2 WHERE descricao = "Transportador";', 415, 12, 0, 0);
INSERT INTO answer VALUES (6, 19, '', 'SELECT c.posicaoX AS XCOLMEIA, c.posicaoY AS YCOLMEIA, f.posicaoX XFLOR, f.posicaoY YFLOR FROM Colmeia AS c, Flor AS f;', 135, 158, 0, 2);
INSERT INTO answer VALUES (4, 23, '§ posicaoX x, posicaoY y(Colmeia);', 'select posicaoX as latitude, posicaoY as longetude from Colmeia; ', 175, 235, 9, 1);
INSERT INTO answer VALUES (6, 23, '', 'select Flor.posicaoX,Flor.posicaoY,Colmeia.posicaoX,Colmeia.posicaoY from Flor natural join Colmeia; ', 95, 285, 0, 1);
INSERT INTO answer VALUES (4, 14, '§ posicaoX latitude, posicaoY longetude (Colmeia);', 'SELECT DISTINCT posicaoX AS latitude, posicaoY AS longetude, idColmeia, mel FROM Colmeia AS temporaryRelation2;', 40, 413, 0, 1);
INSERT INTO answer VALUES (4, 20, '§ posicaoX latitude, posicaoY longetude(Colmeia);', 'SELECT DISTINCT posicaoX AS latitude, posicaoY AS longetude, idColmeia, mel FROM Colmeia AS temporaryRelation2;', 9, 795, 0, 5);
INSERT INTO answer VALUES (5, 23, '£ descricao = " Transportador" (Trabalho);', 'select * from abelha inner join trabalho where descricao = ''transportador'';', 152, 98, 2, 5);
INSERT INTO answer VALUES (2, 16, '¢ idAbelha, nome, mel (Abelha);', '', 106, 1081, 0, 10);
INSERT INTO answer VALUES (8, 22, '(¢idAbelha(Abelha)) ^ (¢idAbelha(§idColmeia idAbelha(Colmeia)));', 'Select idColmeia as idAbelha from Colmeia INTERSECT Select idAbelha as idAbelha from Abelha ;', 137, 276, 4, 3);
INSERT INTO answer VALUES (5, 13, '£ descricao = "Transportador" (Trabalho [] Abelha);', 'SELECT * FROM Abelha NATURAL JOIN Trabalho WHERE descricao = "Transportador";', 206, 116, 0, 1);
INSERT INTO answer VALUES (7, 19, 'Colmeia x Trabalho;', 'SELECT * FROM Colmeia, Trabalho;', 57, 17, 0, 0);
INSERT INTO answer VALUES (6, 18, '(¢ posicaoX, posicaoY (Colmeia)) v (¢ posicaoX, posicaoY (Flor));', 'SELECT DISTINCT * FROM (SELECT DISTINCT posicaoX, posicaoY FROM Colmeia AS temporaryRelation3) AS temporaryRelation2 UNION SELECT DISTINCT * FROM (SELECT DISTINCT posicaoX, posicaoY FROM Flor AS temporaryRelation5) AS temporaryRelation5;', 62, 614, 0, 0);
INSERT INTO answer VALUES (7, 9, 'Colmeia x Trabalho;', 'SELECT DISTINCT * FROM Colmeia AStrabalhocolmeia CROSS JOIN Trabalho;', 101, 32, 0, 0);
INSERT INTO answer VALUES (5, 8, '£ descricao = "Transportador" (Abelha[]Trabalho);', 'SELECT DISTINCT * FROM (SELECT DISTINCT * FROM Trabalho AS temporaryRelation3 NATURAL JOIN Abelha) AS temporaryRelation2 WHERE descricao = "Transportador";', 1191, 73, 25, 0);
INSERT INTO answer VALUES (7, 23, 'Colmeia[idColmeia = idColmeia] Favo [idFavo = idFavo] Abelha [idTrabalho = idTrabalho] Trabalho;', 'select * from Colmeia natural join trabalho;', 569, 248, 5, 0);
INSERT INTO answer VALUES (2, 11, '¢idAbelha,nome,mel(Abelha);', 'SELECT DISTINCT idAbelha, nome, mel FROM Abelha AS temporaryRelation2;', 245, 176, 0, 3);
INSERT INTO answer VALUES (1, 13, 'Abelha [] ((¢ idAbelha, idColmeia (Abelha [] Favo)) / (¢ idColmeia (Colmeia)));', 'SELECT DISTINCT idAbelha, idColmeia FROM Abelha NATURAL JOIN Favo;', 2078, 241, 5, 2);
INSERT INTO answer VALUES (8, 19, '£ idAbelha (Abelha[idAbelha = idColmeia]Colmeia);', 'SELECT idAbelha FROM (Abelha INNER JOIN Colmeia ON Abelha.idAbelha = Colmeia.idColmeia);', 280, 229, 1, 0);
INSERT INTO answer VALUES (4, 11, '§ posicaoX latitude, posicaoY longetude(Colmeia);', 'SELECT DISTINCT posicaoX AS latitude, posicaoY AS longetude, idColmeia, mel FROM Colmeia AS temporaryRelation2;', 48, 535, 0, 0);
INSERT INTO answer VALUES (6, 25, '¢ posicaoX, posicaoY (Flor [] (Polen [] (Abelha [] (Colmeia [] Favo))));', 'SELECT DISTINCT posicaoX, posicaoY FROM (SELECT DISTINCT * FROM Flor AS temporaryRelation3 NATURAL JOIN (SELECT DISTINCT * FROM Polen AS temporaryRelation5 NATURAL JOIN (SELECT DISTINCT * FROM Abelha AS temporaryRelation7 NATURAL JOIN (SELECT DISTINCT * FROM Colmeia AS temporaryRelation9 NATURAL JOIN Favo) AS temporaryRelation10) AS temporaryRelation10) AS temporaryRelation10) AS temporaryRelation2;', 7, 652, 1, 1);
INSERT INTO answer VALUES (7, 18, 'Colmeia x Trabalho;', 'SELECT DISTINCT * FROM Colmeia AS temporaryRelation2 CROSS JOIN Trabalho;', 16, 5, 0, 0);
INSERT INTO answer VALUES (5, 26, '¢ Descricao ="Transportador" (Trabalho);', 'SELECT *
FROM Trabalho
WHERE Descricao = "Transportador";', 263, 76, 8, 1);
INSERT INTO answer VALUES (8, 18, '', 'Abelha [] Colmeia;', 1, 687, 0, 1);
INSERT INTO answer VALUES (5, 10, '£ descricao = "Transportador"(Abelha[]Trabalho);', 'SELECT DISTINCT * FROM (SELECT DISTINCT * FROM Abelha AS temporaryRelation3 NATURAL JOIN Trabalho) AS temporaryRelation2 WHERE descricao = "Transportador";', 1313, 303, 23, 5);
INSERT INTO answer VALUES (6, 14, '(¢ posicaoX, posicaoY (Colmeia)) v (¢posicaoX, posicaoY(Flor));', 'SELECT DISTINCT * FROM (SELECT DISTINCT posicaoX, posicaoY FROM Colmeia AS temporaryRelation3) AS temporaryRelation2 UNION SELECT DISTINCT * FROM (SELECT DISTINCT posicaoX, posicaoY FROM Flor AS temporaryRelation5) AS temporaryRelation5;', 10, 704, 0, 0);
INSERT INTO answer VALUES (2, 13, '¢ idAbelha, nome, mel (Abelha);', 'SELECT DISTINCT idAbelha, nome, mel FROM Abelha;', 13, 159, 0, 0);
INSERT INTO answer VALUES (9, 23, '(¢ idColmeia(Colmeia )) - (¢ idAbelha(Abelha));', 'SELECT idColmeia FROM Colmeia DIFFERENCE SELECT idAbelha FROM Abelha;', 164, 101, 1, 0);
INSERT INTO answer VALUES (3, 16, '£ salario>10(Trabalho);', 'select * from trabalho where salario >10;', 392, 33, 5, 0);
INSERT INTO answer VALUES (7, 14, 'Colmeia x Trabalho;', 'SELECT DISTINCT * FROM Colmeia AS temporaryRelation2 CROSS JOIN Trabalho;', 25, 12, 0, 0);
INSERT INTO answer VALUES (6, 24, '(¢ posicaoX, posicaoY (Flor)) v (¢ posicaoX, posicaoY (Colmeia));', 'SELECT DISTINCT posicaoX, posicaoY FROM Colmeia UNION SELECT DISTINCT posicaoX, posicaoY FROM Flor;', 261, 794, 4, 1);
INSERT INTO answer VALUES (7, 25, 'Trabalho [idTrabalho = idTrabalho] (Abelha [] (Colmeia [idColmeia = idColmeia] Favo));', 'SELECT DISTINCT * FROM Trabalho AS temporaryRelation2 INNER JOIN (SELECT DISTINCT * FROM Abelha AS temporaryRelation4 NATURAL JOIN (SELECT DISTINCT * FROM Colmeia AS temporaryRelation6 INNER JOIN Favo ON idColmeia = idColmeia) AS temporaryRelation7) AS temporaryRelation7 ON idTrabalho = idTrabalho;', 470, 11, 1, 1);
INSERT INTO answer VALUES (9, 19, '(£ idColmeia(Colmeia)) - (£ idAbelha(Abelha));', '', 116, 21, 4, 0);
INSERT INTO answer VALUES (3, 15, '£ salario > 10 (Trabalho);', 'select * from Trabalho where salario > 10;', 93, 16, 0, 0);
INSERT INTO answer VALUES (8, 23, '£ idAbelha (Abelha [idAbelha = idcolmeia] Colmeia);', 'select idabelha from abelha inner join colmeia  on abelha.idabelha = colmeia.idcolmeia;', 100, 166, 2, 0);
INSERT INTO answer VALUES (3, 11, '£  salario > 10.0(¢ descricao,salario(Trabalho));', 'SELECT DISTINCT * FROM (SELECT DISTINCT descricao, salario FROM Trabalho AS temporaryRelation3) AS temporaryRelation2 WHERE salario > 10.0;', 746, 190, 2, 2);
INSERT INTO answer VALUES (2, 15, '¢ idAbelha, nome, mel (Abelha);', 'select idAbelha, nome, mel from Abelha;', 25, 66, 0, 0);
INSERT INTO answer VALUES (10, 19, '', 'SELECT idAbelha FROM (Abelha INNER JOIN Polen ON Abelha.idAbelha = Ploen.idAbelha)', 3, 236, 0, 0);
INSERT INTO answer VALUES (4, 26, '
¢ idColmeia, posicaox, posicaoy, mel(Colmeia);', 'SELECT idColmeia, posicaox, posicaoy, mel
FROM Colmeia;', 154, 214, 4, 1);
INSERT INTO answer VALUES (3, 13, '£ salario > 10 (Trabalho);', 'SELECT * FROM Trabalho WHERE salario > 10;', 160, 27, 0, 0);
INSERT INTO answer VALUES (11, 19, '<<Hierarquia>>;', NULL, 58, 0, 0, 0);
INSERT INTO answer VALUES (4, 15, '§ posicaoX  latitude, posicaoY longetude (Colmeia);', 'select idColmeia, posicaoX as latitude, posicaoY as longetude, mel from Colmeia;', 100, 230, 0, 2);
INSERT INTO answer VALUES (5, 20, '£ descricao  ="Transportador"(Trabalho[] Abelha);', 'SELECT DISTINCT * FROM (SELECT DISTINCT * FROM Trabalho AS temporaryRelation3 NATURAL JOIN Abelha) AS temporaryRelation2 WHERE descricao = "Transportador";', 1343, 44, 1, 0);
INSERT INTO answer VALUES (6, 8, '(¢posicaoX, posicaoY (Colmeia)) v (¢posicaoX, posicaoY (Flor));', 'SELECT DISTINCT posicaoX, posicaoY FROM Flor UNION SELECT DISTINCT posicaoX, posicaoY FROM Colmeia;', 90, 599, 2, 4);
INSERT INTO answer VALUES (9, 9, '(¢ idColmeia(Colmeia)) - (¢ idAbelha(Abelha));', 'SELECT DISTINCT * FROM (SELECT DISTINCT idColmeia FROM Colmeia AS temporaryRelation3) AS temporaryRelation2 EXCEPT SELECT DISTINCT * FROM (SELECT DISTINCT idAbelha FROM Abelha AS temporaryRelation5) AS temporaryRelation5;', 204, 9, 1, 0);
INSERT INTO answer VALUES (8, 25, '', '', 2, 368, 0, 0);
INSERT INTO answer VALUES (4, 13, '§ posicaoX latitude, posicaoY longetude (Colmeia);', 'SELECT DISTINCT idcolmeia, posicaox AS latitude, posicaoy AS longetude, mel FROM Colmeia;', 112, 208, 0, 2);
INSERT INTO answer VALUES (9, 18, '(¢ idColmeia (Colmeia)) - (¢ idAbelha (Abelha));', 'SELECT DISTINCT * FROM (SELECT DISTINCT idColmeia FROM Colmeia AS temporaryRelation3) AS temporaryRelation2 EXCEPT SELECT DISTINCT * FROM (SELECT DISTINCT idAbelha FROM Abelha AS temporaryRelation5) AS temporaryRelation5;', 117, 7, 0, 0);
INSERT INTO answer VALUES (10, 23, '', '', 28, 21, 0, 0);
INSERT INTO answer VALUES (7, 8, 'Colmeia x Trabalho;', 'SELECT DISTINCT * FROM Trabalho CROSS JOIN Colmeia;', 458, 57, 3, 0);
INSERT INTO answer VALUES (8, 14, '', '', 4, 903, 0, 0);
INSERT INTO answer VALUES (8, 9, 'Abelha [idAbelha = idColmeia] Colmeia;', 'SELECT DISTINCT * FROM Abelha AS abcol NATURAL JOIN Colmeia;', 17, 541, 2, 2);
INSERT INTO answer VALUES (9, 22, '(¢idColmeia(Colmeia)) - ((¢idAbelha(Abelha)) ^ (¢idColmeia(Colmeia)));', 'Select idColmeia  FROM Colmeia EXCEPT Select idAbelha as idColmeia from Abelha;', 521, 848, 5, 3);
INSERT INTO answer VALUES (6, 21, '(¢ posicaoX, posicaoY(Colmeia)) v (¢ posicaoX, posicaoY(Flor));', 'SELECT DISTINCT posicaoX, posicaoY FROM Colmeia UNION SELECT DISTINCT posicaoX, posicaoY FROM Flor;', 108, 724, 2, 4);
INSERT INTO answer VALUES (4, 16, '', '', 10, 461, 0, 1);
INSERT INTO answer VALUES (5, 15, '£ descricao = "Transportador" (Abelha [] Trabalho);', 'select * from Abelha natural join Trabalho where descricao = "Transportador";', 126, 173, 0, 1);
INSERT INTO answer VALUES (6, 26, 'Colmeia x Flor;', 'SELECT  * FROM  Flor UNION SELECT * FROM Colmeia;', 86, 560, 2, 5);
INSERT INTO answer VALUES (6, 10, '(¢ posicaoX, posicaoY (Colmeia)) v (¢ posicaoX, posicaoY (Flor));', 'SELECT DISTINCT posicaoX, posicaoY FROM Colmeia UNION SELECT DISTINCT posicaoX , posicaoY  FROM Flor;', 201, 596, 1, 7);
INSERT INTO answer VALUES (7, 24, 'Colmeia x Trabalho;', 'SELECT DISTINCT * FROM Colmeia CROSS JOIN Trabalho;', 52, 37, 0, 0);
INSERT INTO answer VALUES (9, 14, '(¢ idColmeia (Colmeia))  - (¢ idAbelha (Abelha));', 'SELECT DISTINCT * FROM (SELECT DISTINCT idColmeia FROM Colmeia AS temporaryRelation3) AS temporaryRelation2 EXCEPT SELECT DISTINCT * FROM (SELECT DISTINCT idAbelha FROM Abelha AS temporaryRelation5) AS temporaryRelation5;', 124, 16, 0, 0);
INSERT INTO answer VALUES (8, 12, '', '', 1, 1, 0, 0);
INSERT INTO answer VALUES (9, 12, '', '', 1, 1, 0, 0);
INSERT INTO answer VALUES (10, 12, '', '', 1, 1, 0, 0);
INSERT INTO answer VALUES (5, 16, '£ descricao="Transportador"(Abelha [] Trabalho);', 'select * from Abelha Natural Join Trabalho where descricao = "Transportador";', 539, 170, 7, 1);
INSERT INTO answer VALUES (11, 9, '<<Hierarquia>>;', 'SELECT DISTINCT * FROM (SELECT DISTINCT * FROM Hierarquia UNION SELECT temporaryRelation1_1.idInferior, temporaryRelation1_2.idSuperior FROM Hierarquia AS temporaryRelation1_1 INNER JOIN Hierarquia AS temporaryRelation1_2 ON temporaryRelation1_1.idSuperior = temporaryRelation1_2.idInferior WHERE temporaryRelation1_2.idSuperior IS NOT NULL) AS temporaryRelation1;', 51, 7, 0, 0);
INSERT INTO answer VALUES (11, 12, '', NULL, 2, 0, 0, 0);
INSERT INTO answer VALUES (10, 14, 'Polen / (¢ idAbelha (Abelha));', 'SELECT DISTINCT * FROM (SELECT DISTINCT idAbelha FROM Polen AS temporaryRelation1_div1 WHERE ( SELECT COUNT(DISTINCT idFlor) FROM Polen) = ( SELECT COUNT(DISTINCT temporaryRelation1_div2.idFlor) FROM Polen AS temporaryRelation1_div2 WHERE temporaryRelation1_div1.idAbelha = temporaryRelation1_div2.idAbelha)) AS temporaryRelation1;', 13, 874, 0, 0);
INSERT INTO answer VALUES (10, 25, 'Polen / (¢ idAbelha (Abelha));', 'SELECT DISTINCT * FROM (SELECT DISTINCT idAbelha FROM Polen AS temporaryRelation1_div1 WHERE ( SELECT COUNT(DISTINCT idFlor) FROM Polen) = ( SELECT COUNT(DISTINCT temporaryRelation1_div2.idFlor) FROM Polen AS temporaryRelation1_div2 WHERE temporaryRelation1_div1.idAbelha = temporaryRelation1_div2.idAbelha)) AS temporaryRelation1;', 7, 556, 0, 0);
INSERT INTO answer VALUES (7, 10, 'Colmeia x Trabalho;', 'SELECT DISTINCT * FROM Colmeia AS temporaryRelation2 CROSS JOIN Trabalho;', 141, 14, 1, 0);
INSERT INTO answer VALUES (10, 18, 'Polen / (¢ idAbelha (Abelha));', 'SELECT DISTINCT * FROM (SELECT DISTINCT idAbelha FROM Polen AS temporaryRelation1_div1 WHERE ( SELECT COUNT(DISTINCT idFlor) FROM Polen) = ( SELECT COUNT(DISTINCT temporaryRelation1_div2.idFlor) FROM Polen AS temporaryRelation1_div2 WHERE temporaryRelation1_div1.idAbelha = temporaryRelation1_div2.idAbelha)) AS temporaryRelation1;', 5, 1163, 0, 0);
INSERT INTO answer VALUES (11, 23, '<<Hierarquia>>;', 'SELECT DISTINCT * FROM Hierarquia
UNION
SELECT ordem1.idInferior, ordem2.idSuperior FROM Hierarquia AS ordem1
INNER JOIN
Hierarquia AS ordem2 ON ordem1.idSuperior= ordem2.idInferior WHERE ordem2.idSuperior != "";', 64, 265, 0, 1);
INSERT INTO answer VALUES (8, 26, '', '', 1, 42, 0, 0);
INSERT INTO answer VALUES (8, 24, '(¢ idAbelha(Abelha)) ^ (¢ idColmeia(Colmeia));', 'SELECT DISTINCT idAbelha FROM Abelha INNER JOIN Colmeia ON Abelha.idAbelha = Colmeia.idColmeia;', 851, 576, 15, 7);
INSERT INTO answer VALUES (9, 26, '', '', 17, 2, 0, 0);
INSERT INTO answer VALUES (6, 13, '(¢ posicaoX, posicaoY (Colmeia)) v (¢ posicaoX, posicaoY (Flor));', 'SELECT posicaoX, posicaoY FROM Colmeia UNION
SELECT posicaoX, posicaoY FROM Flor;', 101, 85, 0, 0);
INSERT INTO answer VALUES (6, 15, '(¢ posicaoX, posicaoY (Flor)) v (¢ posicaoX, posicaoY (Colmeia));', 'select posicaoX, posicaoY from Colmeia union
select  posicaoX, posicaoY from Flor;', 105, 116, 1, 0);
INSERT INTO answer VALUES (10, 26, '', '', 1, 90, 0, 0);
INSERT INTO answer VALUES (10, 9, 'Abelha / Polen;', 'SELECT DISTINCT idAbelha
FROM Abelha
WHERE (
SELECT COUNT(DISTINCT idAbelha)
FROM Abelha) = 
(SELECT count(*)
FROM Polen AS a
WHERE a.idAbelha = Abelha.idAbelha);', 20, 838, 1, 2);
INSERT INTO answer VALUES (7, 21, 'Colmeia x Trabalho;', 'SELECT DISTINCT * FROM Colmeia CROSS JOIN Trabalho;', 340, 38, 2, 0);
INSERT INTO answer VALUES (7, 26, 'Colmeia x Trabalho;', 'SELECT DISTINCT  * FROM Colmeia CROSS JOIN Trabalho;', 116, 70, 1, 0);
INSERT INTO answer VALUES (4, 12, '', '', 1, 1, 0, 0);
INSERT INTO answer VALUES (6, 20, '', '', 2, 887, 0, 0);
INSERT INTO answer VALUES (9, 25, '¢ idColmeia (Abelha / (Colmeia[] (Favo [] Abelha)));', '', 312, 289, 1, 0);
INSERT INTO answer VALUES (11, 26, '', NULL, 70, 0, 0, 0);
INSERT INTO answer VALUES (5, 12, '', '', 1, 2, 0, 0);
INSERT INTO answer VALUES (6, 12, '', '', 1, 1, 0, 0);
INSERT INTO answer VALUES (7, 12, '', '', 1, 2, 0, 0);
INSERT INTO answer VALUES (8, 13, '(¢ idAbelha (Abelha)) ^ (¢ idColmeia (Colmeia));', 'SELECT idAbelha FROM Abelha WHERE idAbelha IN (SELECT idColmeia FROM Colmeia);', 102, 399, 0, 1);
INSERT INTO answer VALUES (6, 16, '', '', 3, 211, 0, 0);
INSERT INTO answer VALUES (11, 18, '<<Hierarquia>>;', 'SELECT DISTINCT * FROM (SELECT DISTINCT * FROM Hierarquia UNION SELECT temporaryRelation1_1.idInferior, temporaryRelation1_2.idSuperior FROM Hierarquia AS temporaryRelation1_1 INNER JOIN Hierarquia AS temporaryRelation1_2 ON temporaryRelation1_1.idSuperior = temporaryRelation1_2.idInferior WHERE temporaryRelation1_2.idSuperior IS NOT NULL) AS temporaryRelation1;', 21, 8, 0, 0);
INSERT INTO answer VALUES (8, 10, '(¢ idAbelha (Abelha)) ^ (¢ idColmeia (Colmeia));', 'SELECT idAbelha FROM Abelha INNER JOIN Colmeia ON Abelha.idAbelha = Colmeia.idColmeia;', 1273, 152, 23, 0);
INSERT INTO answer VALUES (1, 17, '', 'SELECT * FROM Answer;', 4, 54, 0, 11);
INSERT INTO answer VALUES (7, 13, 'Trabalho x Colmeia;', 'SELECT DISTINCT * FROM Trabalho CROSS JOIN Colmeia;', 350, 21, 0, 0);
INSERT INTO answer VALUES (7, 15, 'Trabalho x Colmeia;', 'select * from Colmeia cross join Trabalho;', 355, 18, 0, 0);
INSERT INTO answer VALUES (5, 11, '£ descricao = "Transportador"(Abelha[]Trabalho);', 'SELECT DISTINCT * FROM (SELECT DISTINCT * FROM Abelha AS temporaryRelation3 NATURAL JOIN Trabalho) AS temporaryRelation2 WHERE descricao = "Transportador";', 427, 339, 1, 1);
INSERT INTO answer VALUES (11, 14, '<<Hierarquia>>;', 'SELECT DISTINCT * FROM (SELECT DISTINCT * FROM Hierarquia UNION SELECT temporaryRelation1_1.idInferior, temporaryRelation1_2.idSuperior FROM Hierarquia AS temporaryRelation1_1 INNER JOIN Hierarquia AS temporaryRelation1_2 ON temporaryRelation1_1.idSuperior = temporaryRelation1_2.idInferior WHERE temporaryRelation1_2.idSuperior IS NOT NULL) AS temporaryRelation1;', 84, 8, 0, 0);
INSERT INTO answer VALUES (7, 20, '(Colmeia[]Abelha)[]Trabalho;', '', 594, 1, 1, 0);
INSERT INTO answer VALUES (8, 21, '(¢ idAbelha (Abelha)) ^ (¢ idColmeia(Colmeia));', 'SELECT DISTINCT idAbelha FROM Abelha INNER JOIN Colmeia ON Abelha.idAbelha = Colmeia.idColmeia;', 380, 321, 3, 1);
INSERT INTO answer VALUES (7, 16, '', '', 272, 2, 5, 0);
INSERT INTO answer VALUES (11, 25, '<<Hierarquia>>;', 'SELECT DISTINCT * FROM (SELECT DISTINCT * FROM Hierarquia UNION SELECT temporaryRelation1_1.idInferior, temporaryRelation1_2.idSuperior FROM Hierarquia AS temporaryRelation1_1 INNER JOIN Hierarquia AS temporaryRelation1_2 ON temporaryRelation1_1.idSuperior = temporaryRelation1_2.idInferior WHERE temporaryRelation1_2.idSuperior IS NOT NULL) AS temporaryRelation1;', 136, 17, 1, 0);
INSERT INTO answer VALUES (11, 20, '', NULL, 31, 0, 0, 0);
INSERT INTO answer VALUES (11, 16, '', NULL, 37, 0, 0, 0);
INSERT INTO answer VALUES (8, 15, '(¢ idAbelha (Abelha)) ^ (¢ idColmeia (Colmeia));', 'select idAbelha from Abelha where idAbelha IN (select idColmeia from Colmeia);
', 107, 390, 1, 2);
INSERT INTO answer VALUES (10, 13, '', '', 1, 119, 0, 0);
INSERT INTO answer VALUES (4, 9, '(¢ idColmeia,mel(Colmeia)) x (§ posicaoX latitude,posicaoY lengetude (Colmeia));', 'SELECT DISTINCT idColmeia, Posicaox as latitude, Posicaoy as longetude, mel from Colmeia ;', 528, 558, 13, 5);
INSERT INTO answer VALUES (9, 24, '(¢ idColmeia(Colmeia)) - (¢ idAbelha(Abelha));', 'SELECT DISTINCT idColmeia FROM Colmeia DIFFERENCE SELECT DISTINCT idAbelha FROM Abelha;', 203, 127, 4, 0);
INSERT INTO answer VALUES (11, 13, '', NULL, 3, 0, 0, 0);
INSERT INTO answer VALUES (8, 8, '(¢ idAbelha (Abelha)) ^ (¢ idColmeia (Colmeia)); ', 'SELECT DISTINCT idAbelha FROM Abelha INNER JOIN Colmeia ON Abelha.idAbelha = Colmeia.idColmeia;', 1010, 387, 47, 3);
INSERT INTO answer VALUES (10, 24, '', '', 1, 4, 0, 0);
INSERT INTO answer VALUES (11, 24, '', NULL, 1, 0, 0, 0);
INSERT INTO answer VALUES (11, 22, '<<Hierarquia>>;', 'SELECT DISTINCT * FROM Hierarquia UNION ((SELECT Hierarquia1.idInferior, Hierarquia2.idSuperior FROM Hierarquia) AS Hierarquia1) INNER JOIN idHierarquia AS Hierarquia2 ON Hierarquia1.idSuperior = Hierarquia2.idInferior;', 65, 306, 2, 8);
INSERT INTO answer VALUES (6, 11, '', '', 2, 42, 0, 0);
INSERT INTO answer VALUES (7, 11, '', '', 1, 1, 0, 0);
INSERT INTO answer VALUES (8, 11, '', '', 1, 1, 0, 0);
INSERT INTO answer VALUES (9, 21, '(¢ idColmeia (Colmeia)) - (¢ idAbelha (Abelha));', '(SELECT DISTINCT idAbelha FROM Abelha INNER JOIN Colmeia ON Abelha.idAbelha = Colmeia.idColmeia) DIFFERENCE SELECT DISTINCT idColmeia FROM Colmeia;', 176, 172, 2, 0);
INSERT INTO answer VALUES (9, 15, '(¢ idColmeia (Colmeia)) - (¢ idAbelha(Abelha));', 'select idColmeia from Colmeia where idColmeia NOT IN (select idAbelha from Abelha);', 64, 35, 0, 0);
INSERT INTO answer VALUES (9, 11, '', '', 1, 10, 0, 0);
INSERT INTO answer VALUES (10, 11, '', '', 1, 1, 0, 0);
INSERT INTO answer VALUES (9, 13, '(¢ idColmeia (Colmeia)) - (¢ idAbelha (Abelha));', 'SELECT idColmeia FROM Colmeia WHERE idColmeia NOT IN (SELECT idAbelha FROM Abelha);', 69, 43, 0, 0);
INSERT INTO answer VALUES (11, 11, '', NULL, 3, 0, 0, 0);
INSERT INTO answer VALUES (10, 22, 'Polen / (¢idAbelha(Abelha));', 'SELECT DISTINCT * FROM (SELECT DISTINCT idAbelha FROM Polen AS temporaryRelation1_div1 WHERE ( SELECT COUNT(DISTINCT idFlor) FROM Polen) = ( SELECT COUNT(DISTINCT temporaryRelation1_div2.idFlor) FROM Polen AS temporaryRelation1_div2 WHERE temporaryRelation1_div1.idAbelha = temporaryRelation1_div2.idAbelha)) AS temporaryRelation1;  -- E TRAPACIEI MESMO!!', 60, 934, 0, 6);
INSERT INTO answer VALUES (10, 10, '', '', 2, 129, 0, 0);
INSERT INTO answer VALUES (8, 16, '', '', 2, 79, 0, 0);
INSERT INTO answer VALUES (8, 20, '', '', 1, 2, 0, 0);
INSERT INTO answer VALUES (9, 16, '', '', 2, 2, 0, 0);
INSERT INTO answer VALUES (9, 20, '', '', 1, 1, 0, 0);
INSERT INTO answer VALUES (10, 16, '', '', 3, 2, 0, 0);
INSERT INTO answer VALUES (10, 20, '', '', 1, 1, 0, 0);
INSERT INTO answer VALUES (11, 10, '', NULL, 1, 0, 0, 0);
INSERT INTO answer VALUES (10, 21, '', '', 2, 8, 0, 0);
INSERT INTO answer VALUES (11, 21, '', NULL, 3, 0, 0, 0);
INSERT INTO answer VALUES (9, 10, '(¢ idColmeia (Colmeia)) - (¢ idAbelha (Abelha));', 'SELECT DISTINCT * FROM (SELECT DISTINCT idColmeia FROM Colmeia AS temporaryRelation3) AS temporaryRelation2 EXCEPT SELECT DISTINCT * FROM (SELECT DISTINCT idAbelha FROM Abelha AS temporaryRelation5) AS temporaryRelation5;', 79, 3, 0, 0);
INSERT INTO answer VALUES (10, 15, '', 'Polen / (¢ idFlor(Flor));', 5, 616, 0, 4);
INSERT INTO answer VALUES (11, 15, '', NULL, 2, 0, 0, 0);
INSERT INTO answer VALUES (9, 8, '(¢ idColmeia (Colmeia)) - (¢ idAbelha (Abelha));', 'SELECT DISTINCT idAbelha FROM Abelha DIFERENCE SELECT idColmeia FROM Colmeia;', 158, 73, 5, 0);
INSERT INTO answer VALUES (10, 8, '', '', 2, 2, 0, 0);
INSERT INTO answer VALUES (11, 8, '', NULL, 2, 0, 0, 0);


--
-- TOC entry 2242 (class 0 OID 32919)
-- Dependencies: 188
-- Data for Name: bee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO bee VALUES (1, 'Edwina Lowell', 45, 25.31, 1, 1);
INSERT INTO bee VALUES (2, 'Diana Portia', 66, 0.78, 2, 1);
INSERT INTO bee VALUES (3, 'Brandt Jenna', 104, 9.99, 3, 1);
INSERT INTO bee VALUES (4, 'Donna Romy	', 150, 6.11, 4, 2);
INSERT INTO bee VALUES (5, 'Robby Salina', 16, 8.75, 5, 2);
INSERT INTO bee VALUES (6, 'Amie Kyler	', 111, 2.30, 6, 2);
INSERT INTO bee VALUES (7, 'Luther Randal', 88, 4.09, 7, 3);
INSERT INTO bee VALUES (8, 'Euphemia Lissa', 79, 4.05, 8, 3);
INSERT INTO bee VALUES (9, 'Karrie Nigel', 70, 7.59, 3, 3);
INSERT INTO bee VALUES (10, 'Lorne Beulah', 130, 7.46, 4, 3);
INSERT INTO bee VALUES (11, 'Tilly Andie', 126, 5.65, 5, 4);
INSERT INTO bee VALUES (12, 'Kegan Jerrod', 184, 0.24, 6, 4);
INSERT INTO bee VALUES (13, 'Amanda Janette', 163, 18.72, 1, 5);
INSERT INTO bee VALUES (14, 'Rowina Emerson', 131, 5.13, 7, 5);
INSERT INTO bee VALUES (15, 'Kaycee Coretta', 99, 6.05, 3, 5);
INSERT INTO bee VALUES (16, 'Kaitlynn Carver', 61, 6.20, 4, 5);
INSERT INTO bee VALUES (17, 'Luke Silas', 39, 2.98, 5, 6);
INSERT INTO bee VALUES (18, 'Phillipa Ros', 137, 4.03, 6, 6);
INSERT INTO bee VALUES (19, 'JoBeth Tim', 92, 4.27, 3, 6);
INSERT INTO bee VALUES (20, 'Ophelia Richmaly', 167, 32.19, 1, 7);
INSERT INTO bee VALUES (21, 'Cavan Emelia', 76, 7.48, 2, 7);
INSERT INTO bee VALUES (22, 'Ripley Goodwin', 41, 0.98, 3, 7);
INSERT INTO bee VALUES (23, 'Walt Tittus', 62, 1.12, 3, 8);
INSERT INTO bee VALUES (24, 'Mitch Denny', 148, 5.17, 4, 8);
INSERT INTO bee VALUES (25, 'Dawn Georgene', 129, 7.41, 4, 8);
INSERT INTO bee VALUES (26, 'Paisley Alisha', 80, 2.10, 5, 8);
INSERT INTO bee VALUES (27, 'Pauletta Pearl', 101, 1.69, 5, 8);
INSERT INTO bee VALUES (28, 'Dorita Eustace', 100, 3.74, 6, 9);
INSERT INTO bee VALUES (29, 'Aldous Mikki', 183, 7.42, 6, 9);
INSERT INTO bee VALUES (30, 'Timotha Marci', 57, 5.98, 7, 10);
INSERT INTO bee VALUES (31, 'Narelle Sherrie', 134, 3.37, 8, 10);
INSERT INTO bee VALUES (32, 'Jarred Claud', 123, 6.58, 3, 11);
INSERT INTO bee VALUES (33, 'Mandi Adeline', 158, 8.48, 3, 11);


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

INSERT INTO colmeia VALUES (1, 14, 26, 580.56);
INSERT INTO colmeia VALUES (2, 27, 18, 365.45);
INSERT INTO colmeia VALUES (3, 46, 77, 779.64);


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

INSERT INTO comb VALUES (1, 1);
INSERT INTO comb VALUES (2, 1);
INSERT INTO comb VALUES (3, 1);
INSERT INTO comb VALUES (4, 1);
INSERT INTO comb VALUES (5, 2);
INSERT INTO comb VALUES (6, 2);
INSERT INTO comb VALUES (7, 3);
INSERT INTO comb VALUES (8, 3);
INSERT INTO comb VALUES (9, 3);
INSERT INTO comb VALUES (10, 3);
INSERT INTO comb VALUES (11, 3);


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

INSERT INTO comparationquestion VALUES (2, 1, 1);
INSERT INTO comparationquestion VALUES (2, 2, 3);
INSERT INTO comparationquestion VALUES (2, 3, 5);
INSERT INTO comparationquestion VALUES (2, 4, 5);
INSERT INTO comparationquestion VALUES (2, 5, 5);
INSERT INTO comparationquestion VALUES (2, 6, 1);
INSERT INTO comparationquestion VALUES (2, 7, 5);
INSERT INTO comparationquestion VALUES (2, 8, 1);
INSERT INTO comparationquestion VALUES (2, 9, 5);
INSERT INTO comparationquestion VALUES (19, 1, 5);
INSERT INTO comparationquestion VALUES (19, 2, 3);
INSERT INTO comparationquestion VALUES (19, 3, 4);
INSERT INTO comparationquestion VALUES (19, 4, 5);
INSERT INTO comparationquestion VALUES (19, 5, 2);
INSERT INTO comparationquestion VALUES (19, 6, 4);
INSERT INTO comparationquestion VALUES (19, 7, 2);
INSERT INTO comparationquestion VALUES (19, 8, 5);
INSERT INTO comparationquestion VALUES (19, 9, 5);
INSERT INTO comparationquestion VALUES (23, 1, 3);
INSERT INTO comparationquestion VALUES (23, 2, 2);
INSERT INTO comparationquestion VALUES (23, 3, 4);
INSERT INTO comparationquestion VALUES (23, 4, 4);
INSERT INTO comparationquestion VALUES (23, 5, 3);
INSERT INTO comparationquestion VALUES (23, 6, 3);
INSERT INTO comparationquestion VALUES (23, 7, 3);
INSERT INTO comparationquestion VALUES (23, 8, 4);
INSERT INTO comparationquestion VALUES (23, 9, 4);
INSERT INTO comparationquestion VALUES (9, 1, 5);
INSERT INTO comparationquestion VALUES (9, 2, 2);
INSERT INTO comparationquestion VALUES (9, 3, 5);
INSERT INTO comparationquestion VALUES (9, 4, 5);
INSERT INTO comparationquestion VALUES (9, 5, 1);
INSERT INTO comparationquestion VALUES (9, 6, 5);
INSERT INTO comparationquestion VALUES (9, 7, 1);
INSERT INTO comparationquestion VALUES (9, 8, 5);
INSERT INTO comparationquestion VALUES (9, 9, 5);
INSERT INTO comparationquestion VALUES (12, 1, 2);
INSERT INTO comparationquestion VALUES (12, 2, 4);
INSERT INTO comparationquestion VALUES (12, 3, 2);
INSERT INTO comparationquestion VALUES (12, 4, 5);
INSERT INTO comparationquestion VALUES (12, 5, 3);
INSERT INTO comparationquestion VALUES (12, 6, 1);
INSERT INTO comparationquestion VALUES (12, 7, 1);
INSERT INTO comparationquestion VALUES (12, 8, 3);
INSERT INTO comparationquestion VALUES (12, 9, 3);
INSERT INTO comparationquestion VALUES (26, 1, 3);
INSERT INTO comparationquestion VALUES (26, 2, 3);
INSERT INTO comparationquestion VALUES (26, 3, 3);
INSERT INTO comparationquestion VALUES (26, 4, 3);
INSERT INTO comparationquestion VALUES (26, 5, 3);
INSERT INTO comparationquestion VALUES (26, 6, 3);
INSERT INTO comparationquestion VALUES (26, 7, 3);
INSERT INTO comparationquestion VALUES (26, 8, 3);
INSERT INTO comparationquestion VALUES (26, 9, 3);
INSERT INTO comparationquestion VALUES (18, 1, 4);
INSERT INTO comparationquestion VALUES (18, 2, 2);
INSERT INTO comparationquestion VALUES (18, 3, 5);
INSERT INTO comparationquestion VALUES (18, 4, 5);
INSERT INTO comparationquestion VALUES (18, 5, 4);
INSERT INTO comparationquestion VALUES (18, 6, 5);
INSERT INTO comparationquestion VALUES (18, 7, 2);
INSERT INTO comparationquestion VALUES (18, 8, 5);
INSERT INTO comparationquestion VALUES (18, 9, 5);
INSERT INTO comparationquestion VALUES (14, 1, 4);
INSERT INTO comparationquestion VALUES (14, 2, 5);
INSERT INTO comparationquestion VALUES (14, 3, 5);
INSERT INTO comparationquestion VALUES (14, 4, 3);
INSERT INTO comparationquestion VALUES (14, 5, 3);
INSERT INTO comparationquestion VALUES (14, 6, 4);
INSERT INTO comparationquestion VALUES (14, 7, 3);
INSERT INTO comparationquestion VALUES (14, 8, 4);
INSERT INTO comparationquestion VALUES (14, 9, 4);
INSERT INTO comparationquestion VALUES (25, 1, 3);
INSERT INTO comparationquestion VALUES (25, 2, 2);
INSERT INTO comparationquestion VALUES (25, 3, 4);
INSERT INTO comparationquestion VALUES (25, 4, 5);
INSERT INTO comparationquestion VALUES (25, 5, 2);
INSERT INTO comparationquestion VALUES (25, 6, 3);
INSERT INTO comparationquestion VALUES (25, 7, 2);
INSERT INTO comparationquestion VALUES (25, 8, 4);
INSERT INTO comparationquestion VALUES (25, 9, 4);
INSERT INTO comparationquestion VALUES (11, 1, 5);
INSERT INTO comparationquestion VALUES (11, 2, 1);
INSERT INTO comparationquestion VALUES (11, 3, 3);
INSERT INTO comparationquestion VALUES (11, 4, 4);
INSERT INTO comparationquestion VALUES (11, 5, 2);
INSERT INTO comparationquestion VALUES (11, 6, 4);
INSERT INTO comparationquestion VALUES (11, 7, 3);
INSERT INTO comparationquestion VALUES (11, 8, 5);
INSERT INTO comparationquestion VALUES (11, 9, 5);
INSERT INTO comparationquestion VALUES (20, 1, 4);
INSERT INTO comparationquestion VALUES (20, 2, 3);
INSERT INTO comparationquestion VALUES (20, 3, 5);
INSERT INTO comparationquestion VALUES (20, 4, 5);
INSERT INTO comparationquestion VALUES (20, 5, 5);
INSERT INTO comparationquestion VALUES (20, 6, 5);
INSERT INTO comparationquestion VALUES (20, 7, 3);
INSERT INTO comparationquestion VALUES (20, 8, 5);
INSERT INTO comparationquestion VALUES (20, 9, 5);
INSERT INTO comparationquestion VALUES (13, 1, 3);
INSERT INTO comparationquestion VALUES (13, 2, 2);
INSERT INTO comparationquestion VALUES (13, 3, 4);
INSERT INTO comparationquestion VALUES (13, 4, 5);
INSERT INTO comparationquestion VALUES (13, 5, 3);
INSERT INTO comparationquestion VALUES (13, 6, 5);
INSERT INTO comparationquestion VALUES (13, 7, 1);
INSERT INTO comparationquestion VALUES (13, 8, 5);
INSERT INTO comparationquestion VALUES (13, 9, 5);
INSERT INTO comparationquestion VALUES (16, 1, 4);
INSERT INTO comparationquestion VALUES (16, 2, 1);
INSERT INTO comparationquestion VALUES (16, 3, 3);
INSERT INTO comparationquestion VALUES (16, 4, 4);
INSERT INTO comparationquestion VALUES (16, 5, 3);
INSERT INTO comparationquestion VALUES (16, 6, 5);
INSERT INTO comparationquestion VALUES (16, 7, 1);
INSERT INTO comparationquestion VALUES (16, 8, 4);
INSERT INTO comparationquestion VALUES (16, 9, 5);
INSERT INTO comparationquestion VALUES (22, 1, 5);
INSERT INTO comparationquestion VALUES (22, 2, 2);
INSERT INTO comparationquestion VALUES (22, 3, 5);
INSERT INTO comparationquestion VALUES (22, 4, 5);
INSERT INTO comparationquestion VALUES (22, 5, 4);
INSERT INTO comparationquestion VALUES (22, 6, 5);
INSERT INTO comparationquestion VALUES (22, 7, 2);
INSERT INTO comparationquestion VALUES (22, 8, 5);
INSERT INTO comparationquestion VALUES (22, 9, 5);
INSERT INTO comparationquestion VALUES (24, 1, 4);
INSERT INTO comparationquestion VALUES (24, 2, 2);
INSERT INTO comparationquestion VALUES (24, 3, 4);
INSERT INTO comparationquestion VALUES (24, 4, 5);
INSERT INTO comparationquestion VALUES (24, 5, 5);
INSERT INTO comparationquestion VALUES (24, 6, 3);
INSERT INTO comparationquestion VALUES (24, 7, 2);
INSERT INTO comparationquestion VALUES (24, 8, 5);
INSERT INTO comparationquestion VALUES (24, 9, 4);
INSERT INTO comparationquestion VALUES (15, 1, 5);
INSERT INTO comparationquestion VALUES (15, 2, 2);
INSERT INTO comparationquestion VALUES (15, 3, 5);
INSERT INTO comparationquestion VALUES (15, 4, 5);
INSERT INTO comparationquestion VALUES (15, 5, 3);
INSERT INTO comparationquestion VALUES (15, 6, 4);
INSERT INTO comparationquestion VALUES (15, 7, 1);
INSERT INTO comparationquestion VALUES (15, 8, 4);
INSERT INTO comparationquestion VALUES (15, 9, 4);
INSERT INTO comparationquestion VALUES (21, 1, 4);
INSERT INTO comparationquestion VALUES (21, 2, 2);
INSERT INTO comparationquestion VALUES (21, 3, 5);
INSERT INTO comparationquestion VALUES (21, 4, 5);
INSERT INTO comparationquestion VALUES (21, 5, 2);
INSERT INTO comparationquestion VALUES (21, 6, 5);
INSERT INTO comparationquestion VALUES (21, 7, 2);
INSERT INTO comparationquestion VALUES (21, 8, 5);
INSERT INTO comparationquestion VALUES (21, 9, 5);
INSERT INTO comparationquestion VALUES (8, 1, 4);
INSERT INTO comparationquestion VALUES (8, 2, 3);
INSERT INTO comparationquestion VALUES (8, 3, 4);
INSERT INTO comparationquestion VALUES (8, 4, 4);
INSERT INTO comparationquestion VALUES (8, 5, 2);
INSERT INTO comparationquestion VALUES (8, 6, 5);
INSERT INTO comparationquestion VALUES (8, 7, 1);
INSERT INTO comparationquestion VALUES (8, 8, 4);
INSERT INTO comparationquestion VALUES (8, 9, 4);
INSERT INTO comparationquestion VALUES (10, 1, 5);
INSERT INTO comparationquestion VALUES (10, 2, 2);
INSERT INTO comparationquestion VALUES (10, 3, 4);
INSERT INTO comparationquestion VALUES (10, 4, 5);
INSERT INTO comparationquestion VALUES (10, 5, 4);
INSERT INTO comparationquestion VALUES (10, 6, 5);
INSERT INTO comparationquestion VALUES (10, 7, 1);
INSERT INTO comparationquestion VALUES (10, 8, 3);
INSERT INTO comparationquestion VALUES (10, 9, 5);


--
-- TOC entry 2250 (class 0 OID 33110)
-- Dependencies: 196
-- Data for Name: favo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO favo VALUES (1, 1);
INSERT INTO favo VALUES (2, 1);
INSERT INTO favo VALUES (3, 1);
INSERT INTO favo VALUES (4, 1);
INSERT INTO favo VALUES (5, 2);
INSERT INTO favo VALUES (6, 2);
INSERT INTO favo VALUES (7, 3);
INSERT INTO favo VALUES (8, 3);
INSERT INTO favo VALUES (9, 3);
INSERT INTO favo VALUES (10, 3);
INSERT INTO favo VALUES (11, 3);


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

INSERT INTO flor VALUES (1, 5, 9);
INSERT INTO flor VALUES (2, 7, 5);
INSERT INTO flor VALUES (3, 1, 10);
INSERT INTO flor VALUES (4, 7, 2);
INSERT INTO flor VALUES (5, 5, 1);
INSERT INTO flor VALUES (6, 0, 5);
INSERT INTO flor VALUES (7, 2, 2);
INSERT INTO flor VALUES (8, 1, 1);
INSERT INTO flor VALUES (9, 6, 6);
INSERT INTO flor VALUES (10, 5, 5);
INSERT INTO flor VALUES (11, 0, 10);


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

INSERT INTO flower VALUES (1, 5, 9);
INSERT INTO flower VALUES (2, 7, 5);
INSERT INTO flower VALUES (3, 1, 10);
INSERT INTO flower VALUES (4, 7, 2);
INSERT INTO flower VALUES (5, 5, 1);
INSERT INTO flower VALUES (6, 0, 5);
INSERT INTO flower VALUES (7, 2, 2);
INSERT INTO flower VALUES (8, 1, 1);
INSERT INTO flower VALUES (9, 6, 6);
INSERT INTO flower VALUES (10, 5, 5);
INSERT INTO flower VALUES (11, 0, 10);


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

INSERT INTO hierarchy VALUES (2, 1);
INSERT INTO hierarchy VALUES (3, 8);
INSERT INTO hierarchy VALUES (4, 8);
INSERT INTO hierarchy VALUES (5, 8);
INSERT INTO hierarchy VALUES (6, 7);
INSERT INTO hierarchy VALUES (7, 2);
INSERT INTO hierarchy VALUES (8, 6);
INSERT INTO hierarchy VALUES (2, 1);
INSERT INTO hierarchy VALUES (3, 8);
INSERT INTO hierarchy VALUES (4, 8);
INSERT INTO hierarchy VALUES (5, 8);
INSERT INTO hierarchy VALUES (6, 7);
INSERT INTO hierarchy VALUES (7, 2);
INSERT INTO hierarchy VALUES (8, 6);
INSERT INTO hierarchy VALUES (2, 1);
INSERT INTO hierarchy VALUES (3, 8);
INSERT INTO hierarchy VALUES (4, 8);
INSERT INTO hierarchy VALUES (5, 8);
INSERT INTO hierarchy VALUES (6, 7);
INSERT INTO hierarchy VALUES (7, 2);
INSERT INTO hierarchy VALUES (8, 6);
INSERT INTO hierarchy VALUES (2, 1);
INSERT INTO hierarchy VALUES (3, 8);
INSERT INTO hierarchy VALUES (4, 8);
INSERT INTO hierarchy VALUES (5, 8);
INSERT INTO hierarchy VALUES (6, 7);
INSERT INTO hierarchy VALUES (7, 2);
INSERT INTO hierarchy VALUES (8, 6);


--
-- TOC entry 2255 (class 0 OID 33153)
-- Dependencies: 201
-- Data for Name: hierarquia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO hierarquia VALUES (2, 1);
INSERT INTO hierarquia VALUES (3, 8);
INSERT INTO hierarquia VALUES (4, 8);
INSERT INTO hierarquia VALUES (5, 8);
INSERT INTO hierarquia VALUES (6, 7);
INSERT INTO hierarquia VALUES (7, 2);
INSERT INTO hierarquia VALUES (8, 6);


--
-- TOC entry 2236 (class 0 OID 32873)
-- Dependencies: 182
-- Data for Name: hive; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO hive VALUES (1, 14, 26, 580.56);
INSERT INTO hive VALUES (2, 27, 18, 365.45);
INSERT INTO hive VALUES (3, 46, 77, 779.64);


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

INSERT INTO job VALUES (1, 'Queen', 50.0);
INSERT INTO job VALUES (2, 'Guard', 10.0);
INSERT INTO job VALUES (3, 'Collector', 5.0);
INSERT INTO job VALUES (4, 'Worker', 3.0);
INSERT INTO job VALUES (5, 'Transporter', 2.0);
INSERT INTO job VALUES (6, 'Honey Maker', 7.0);
INSERT INTO job VALUES (7, 'Manager', 8.0);
INSERT INTO job VALUES (8, 'Supervisor', 5.0);


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

INSERT INTO login VALUES (2, 'Dérick Welman', 'IFSP', 'derickwelman', 'derick123', 'Brazil', 0);
INSERT INTO login VALUES (3, 'Lucas Venezian Povoa', 'IFSP', 'lucasvenez', 'lucas123', 'Brazil', 999);
INSERT INTO login VALUES (4, 'Riany Oliveira', 'IFSP', 'rianyoliveira', 'ri123', 'Brazil', 4);
INSERT INTO login VALUES (5, 'guest', 'IFSP', 'guest', 'guest123', 'Brasil', 1);
INSERT INTO login VALUES (6, 'teste', 'teste', 'usuario', 'usuario123', 'teste', 0);
INSERT INTO login VALUES (7, 'cadastro', 'cadastro', 'cadastro', 'cadastro', 'cadastro', 3);
INSERT INTO login VALUES (8, 'dhiego', 'ifsp', 'dhiegobalthazar', 'ganon1987', 'brasil', 12);
INSERT INTO login VALUES (9, 'Gilberto', 'IFSP', 'Gilberto', 'deathmail', 'Brasil', 6);
INSERT INTO login VALUES (10, 'Nikolas', 'IFSP', 'nikolas', 'nikolas', 'Brasil', 0);
INSERT INTO login VALUES (11, 'Karol Jozef Wojtyla Alves Almeida', 'IFSP Caraguatatuba', 'karoljozef', 'walterjose', 'Brasil', 6);
INSERT INTO login VALUES (12, 'Lucas Edson Leonel Lira', 'IFSP - CAR', 'lucasleonel21', 'Leonel21!', 'Brasil', 36);
INSERT INTO login VALUES (13, 'Yasmin Sayad Yoshizumi', 'IFSP Câmpus Caraguatatuba', 'minska', 'calibre12', 'Brasil', 9);
INSERT INTO login VALUES (14, 'Bruno', 'IFSP', 'rangelbruno', '13ligado', 'Brasil', 120);
INSERT INTO login VALUES (15, 'Hugo Salles Cuba', 'IFSP Câmpus Caraguatatuba', 'a1502794', 'cubacubacuba', 'Brasil', 0);
INSERT INTO login VALUES (16, 'Jhones Henrique da Silva', 'IFSP', 'jhones', 'chubidangas', 'Brasil', 12);
INSERT INTO login VALUES (17, 'lucas', 'ifsp', 'lvp', '12345', 'brasil', 120);
INSERT INTO login VALUES (18, 'Rogério Alves', 'IFSP Caragua', 'a1300318', 'sergipe9', 'Brasil', 12);
INSERT INTO login VALUES (19, 'Uriel Cairê Balan Calvi', 'Instituto Federal de Educação, Ciência e Tecnologia do Estado de São Paulo - campus Caraguatuba', 'urielcaire', 'A1303287', 'Brasil', 12);
INSERT INTO login VALUES (20, 'Felipe Ribeiro', 'IFSP', 'felipeR', '659f66', 'Brasil', 0);
INSERT INTO login VALUES (21, 'Bardon Boone', 'IFSP', 'Bardon', 'bbrh2016', 'Brasil', 6);
INSERT INTO login VALUES (22, 'Vitor Silvério de Souza', 'IFSP Campus Caraguatatuba', 'Pliavi', 'T3h7a9T2aGYa', 'Brasil', 24);
INSERT INTO login VALUES (23, 'Felipe Minato', 'if caragua', 'felipeminato', 'feliperql', 'Brazil', 12);
INSERT INTO login VALUES (24, 'Tiago Lima Villalobos', 'IFSP', 'tiagolima', 'heavy666', 'Brasil', 32);
INSERT INTO login VALUES (25, 'caio de freitas', 'IFSP - Caraguatatuba', 'caio', 'caio123', 'Brasil', 64);
INSERT INTO login VALUES (26, 'fulvio', 'IFSP', 'flv.zarrella', 'fugere03', 'Brazil', 3);


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 205
-- Name: login_idlogin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('login_idlogin_seq', 26, true);


--
-- TOC entry 2258 (class 0 OID 33174)
-- Dependencies: 204
-- Data for Name: polen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO polen VALUES (1, 33);
INSERT INTO polen VALUES (2, 33);
INSERT INTO polen VALUES (3, 33);
INSERT INTO polen VALUES (4, 33);
INSERT INTO polen VALUES (5, 33);
INSERT INTO polen VALUES (6, 33);
INSERT INTO polen VALUES (7, 33);
INSERT INTO polen VALUES (8, 33);
INSERT INTO polen VALUES (9, 33);
INSERT INTO polen VALUES (10, 33);
INSERT INTO polen VALUES (11, 33);
INSERT INTO polen VALUES (1, 15);
INSERT INTO polen VALUES (1, 23);
INSERT INTO polen VALUES (2, 19);
INSERT INTO polen VALUES (2, 22);
INSERT INTO polen VALUES (2, 23);
INSERT INTO polen VALUES (2, 3);
INSERT INTO polen VALUES (2, 15);
INSERT INTO polen VALUES (3, 23);
INSERT INTO polen VALUES (3, 19);
INSERT INTO polen VALUES (3, 3);
INSERT INTO polen VALUES (3, 15);
INSERT INTO polen VALUES (4, 15);
INSERT INTO polen VALUES (4, 32);
INSERT INTO polen VALUES (4, 3);
INSERT INTO polen VALUES (4, 23);
INSERT INTO polen VALUES (4, 9);
INSERT INTO polen VALUES (5, 15);
INSERT INTO polen VALUES (5, 32);
INSERT INTO polen VALUES (5, 9);
INSERT INTO polen VALUES (6, 23);
INSERT INTO polen VALUES (6, 15);
INSERT INTO polen VALUES (6, 3);
INSERT INTO polen VALUES (6, 32);
INSERT INTO polen VALUES (6, 9);
INSERT INTO polen VALUES (7, 22);
INSERT INTO polen VALUES (7, 15);
INSERT INTO polen VALUES (7, 32);
INSERT INTO polen VALUES (8, 9);
INSERT INTO polen VALUES (8, 3);
INSERT INTO polen VALUES (8, 19);
INSERT INTO polen VALUES (8, 22);
INSERT INTO polen VALUES (9, 15);
INSERT INTO polen VALUES (9, 3);
INSERT INTO polen VALUES (9, 19);
INSERT INTO polen VALUES (10, 3);
INSERT INTO polen VALUES (10, 15);
INSERT INTO polen VALUES (11, 3);
INSERT INTO polen VALUES (11, 19);
INSERT INTO polen VALUES (11, 22);


--
-- TOC entry 2246 (class 0 OID 32994)
-- Dependencies: 192
-- Data for Name: pollen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pollen VALUES (1, 33);
INSERT INTO pollen VALUES (2, 33);
INSERT INTO pollen VALUES (3, 33);
INSERT INTO pollen VALUES (4, 33);
INSERT INTO pollen VALUES (5, 33);
INSERT INTO pollen VALUES (6, 33);
INSERT INTO pollen VALUES (7, 33);
INSERT INTO pollen VALUES (8, 33);
INSERT INTO pollen VALUES (9, 33);
INSERT INTO pollen VALUES (10, 33);
INSERT INTO pollen VALUES (11, 33);
INSERT INTO pollen VALUES (1, 15);
INSERT INTO pollen VALUES (1, 23);
INSERT INTO pollen VALUES (2, 19);
INSERT INTO pollen VALUES (2, 22);
INSERT INTO pollen VALUES (2, 23);
INSERT INTO pollen VALUES (2, 3);
INSERT INTO pollen VALUES (2, 15);
INSERT INTO pollen VALUES (3, 23);
INSERT INTO pollen VALUES (3, 19);
INSERT INTO pollen VALUES (3, 3);
INSERT INTO pollen VALUES (3, 15);
INSERT INTO pollen VALUES (4, 15);
INSERT INTO pollen VALUES (4, 32);
INSERT INTO pollen VALUES (4, 3);
INSERT INTO pollen VALUES (4, 23);
INSERT INTO pollen VALUES (4, 9);
INSERT INTO pollen VALUES (5, 15);
INSERT INTO pollen VALUES (5, 32);
INSERT INTO pollen VALUES (5, 9);
INSERT INTO pollen VALUES (6, 23);
INSERT INTO pollen VALUES (6, 15);
INSERT INTO pollen VALUES (6, 3);
INSERT INTO pollen VALUES (6, 32);
INSERT INTO pollen VALUES (6, 9);
INSERT INTO pollen VALUES (7, 22);
INSERT INTO pollen VALUES (7, 15);
INSERT INTO pollen VALUES (7, 32);
INSERT INTO pollen VALUES (8, 9);
INSERT INTO pollen VALUES (8, 3);
INSERT INTO pollen VALUES (8, 19);
INSERT INTO pollen VALUES (8, 22);
INSERT INTO pollen VALUES (9, 15);
INSERT INTO pollen VALUES (9, 3);
INSERT INTO pollen VALUES (9, 19);
INSERT INTO pollen VALUES (10, 3);
INSERT INTO pollen VALUES (10, 15);
INSERT INTO pollen VALUES (11, 3);
INSERT INTO pollen VALUES (11, 19);
INSERT INTO pollen VALUES (11, 22);
INSERT INTO pollen VALUES (1, 33);
INSERT INTO pollen VALUES (2, 33);
INSERT INTO pollen VALUES (3, 33);
INSERT INTO pollen VALUES (4, 33);
INSERT INTO pollen VALUES (5, 33);
INSERT INTO pollen VALUES (6, 33);
INSERT INTO pollen VALUES (7, 33);
INSERT INTO pollen VALUES (8, 33);
INSERT INTO pollen VALUES (9, 33);
INSERT INTO pollen VALUES (10, 33);
INSERT INTO pollen VALUES (11, 33);
INSERT INTO pollen VALUES (1, 15);
INSERT INTO pollen VALUES (1, 23);
INSERT INTO pollen VALUES (2, 19);
INSERT INTO pollen VALUES (2, 22);
INSERT INTO pollen VALUES (2, 23);
INSERT INTO pollen VALUES (2, 3);
INSERT INTO pollen VALUES (2, 15);
INSERT INTO pollen VALUES (3, 23);
INSERT INTO pollen VALUES (3, 19);
INSERT INTO pollen VALUES (3, 3);
INSERT INTO pollen VALUES (3, 15);
INSERT INTO pollen VALUES (4, 15);
INSERT INTO pollen VALUES (4, 32);
INSERT INTO pollen VALUES (4, 3);
INSERT INTO pollen VALUES (4, 23);
INSERT INTO pollen VALUES (4, 9);
INSERT INTO pollen VALUES (5, 15);
INSERT INTO pollen VALUES (5, 32);
INSERT INTO pollen VALUES (5, 9);
INSERT INTO pollen VALUES (6, 23);
INSERT INTO pollen VALUES (6, 15);
INSERT INTO pollen VALUES (6, 3);
INSERT INTO pollen VALUES (6, 32);
INSERT INTO pollen VALUES (6, 9);
INSERT INTO pollen VALUES (7, 22);
INSERT INTO pollen VALUES (7, 15);
INSERT INTO pollen VALUES (7, 32);
INSERT INTO pollen VALUES (8, 9);
INSERT INTO pollen VALUES (8, 3);
INSERT INTO pollen VALUES (8, 19);
INSERT INTO pollen VALUES (8, 22);
INSERT INTO pollen VALUES (9, 15);
INSERT INTO pollen VALUES (9, 3);
INSERT INTO pollen VALUES (9, 19);
INSERT INTO pollen VALUES (10, 3);
INSERT INTO pollen VALUES (10, 15);
INSERT INTO pollen VALUES (11, 3);
INSERT INTO pollen VALUES (11, 19);
INSERT INTO pollen VALUES (11, 22);
INSERT INTO pollen VALUES (1, 33);
INSERT INTO pollen VALUES (2, 33);
INSERT INTO pollen VALUES (3, 33);
INSERT INTO pollen VALUES (4, 33);
INSERT INTO pollen VALUES (5, 33);
INSERT INTO pollen VALUES (6, 33);
INSERT INTO pollen VALUES (7, 33);
INSERT INTO pollen VALUES (8, 33);
INSERT INTO pollen VALUES (9, 33);
INSERT INTO pollen VALUES (10, 33);
INSERT INTO pollen VALUES (11, 33);
INSERT INTO pollen VALUES (1, 15);
INSERT INTO pollen VALUES (1, 23);
INSERT INTO pollen VALUES (2, 19);
INSERT INTO pollen VALUES (2, 22);
INSERT INTO pollen VALUES (2, 23);
INSERT INTO pollen VALUES (2, 3);
INSERT INTO pollen VALUES (2, 15);
INSERT INTO pollen VALUES (3, 23);
INSERT INTO pollen VALUES (3, 19);
INSERT INTO pollen VALUES (3, 3);
INSERT INTO pollen VALUES (3, 15);
INSERT INTO pollen VALUES (4, 15);
INSERT INTO pollen VALUES (4, 32);
INSERT INTO pollen VALUES (4, 3);
INSERT INTO pollen VALUES (4, 23);
INSERT INTO pollen VALUES (4, 9);
INSERT INTO pollen VALUES (5, 15);
INSERT INTO pollen VALUES (5, 32);
INSERT INTO pollen VALUES (5, 9);
INSERT INTO pollen VALUES (6, 23);
INSERT INTO pollen VALUES (6, 15);
INSERT INTO pollen VALUES (6, 3);
INSERT INTO pollen VALUES (6, 32);
INSERT INTO pollen VALUES (6, 9);
INSERT INTO pollen VALUES (7, 22);
INSERT INTO pollen VALUES (7, 15);
INSERT INTO pollen VALUES (7, 32);
INSERT INTO pollen VALUES (8, 9);
INSERT INTO pollen VALUES (8, 3);
INSERT INTO pollen VALUES (8, 19);
INSERT INTO pollen VALUES (8, 22);
INSERT INTO pollen VALUES (9, 15);
INSERT INTO pollen VALUES (9, 3);
INSERT INTO pollen VALUES (9, 19);
INSERT INTO pollen VALUES (10, 3);
INSERT INTO pollen VALUES (10, 15);
INSERT INTO pollen VALUES (11, 3);
INSERT INTO pollen VALUES (11, 19);
INSERT INTO pollen VALUES (11, 22);
INSERT INTO pollen VALUES (1, 33);
INSERT INTO pollen VALUES (2, 33);
INSERT INTO pollen VALUES (3, 33);
INSERT INTO pollen VALUES (4, 33);
INSERT INTO pollen VALUES (5, 33);
INSERT INTO pollen VALUES (6, 33);
INSERT INTO pollen VALUES (7, 33);
INSERT INTO pollen VALUES (8, 33);
INSERT INTO pollen VALUES (9, 33);
INSERT INTO pollen VALUES (10, 33);
INSERT INTO pollen VALUES (11, 33);
INSERT INTO pollen VALUES (1, 15);
INSERT INTO pollen VALUES (1, 23);
INSERT INTO pollen VALUES (2, 19);
INSERT INTO pollen VALUES (2, 22);
INSERT INTO pollen VALUES (2, 23);
INSERT INTO pollen VALUES (2, 3);
INSERT INTO pollen VALUES (2, 15);
INSERT INTO pollen VALUES (3, 23);
INSERT INTO pollen VALUES (3, 19);
INSERT INTO pollen VALUES (3, 3);
INSERT INTO pollen VALUES (3, 15);
INSERT INTO pollen VALUES (4, 15);
INSERT INTO pollen VALUES (4, 32);
INSERT INTO pollen VALUES (4, 3);
INSERT INTO pollen VALUES (4, 23);
INSERT INTO pollen VALUES (4, 9);
INSERT INTO pollen VALUES (5, 15);
INSERT INTO pollen VALUES (5, 32);
INSERT INTO pollen VALUES (5, 9);
INSERT INTO pollen VALUES (6, 23);
INSERT INTO pollen VALUES (6, 15);
INSERT INTO pollen VALUES (6, 3);
INSERT INTO pollen VALUES (6, 32);
INSERT INTO pollen VALUES (6, 9);
INSERT INTO pollen VALUES (7, 22);
INSERT INTO pollen VALUES (7, 15);
INSERT INTO pollen VALUES (7, 32);
INSERT INTO pollen VALUES (8, 9);
INSERT INTO pollen VALUES (8, 3);
INSERT INTO pollen VALUES (8, 19);
INSERT INTO pollen VALUES (8, 22);
INSERT INTO pollen VALUES (9, 15);
INSERT INTO pollen VALUES (9, 3);
INSERT INTO pollen VALUES (9, 19);
INSERT INTO pollen VALUES (10, 3);
INSERT INTO pollen VALUES (10, 15);
INSERT INTO pollen VALUES (11, 3);
INSERT INTO pollen VALUES (11, 19);
INSERT INTO pollen VALUES (11, 22);


--
-- TOC entry 2252 (class 0 OID 33123)
-- Dependencies: 198
-- Data for Name: trabalho; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO trabalho VALUES (1, 'Rainha', 50.0);
INSERT INTO trabalho VALUES (2, 'Guarda', 10.0);
INSERT INTO trabalho VALUES (3, 'Coletor', 5.0);
INSERT INTO trabalho VALUES (4, 'Operário', 3.0);
INSERT INTO trabalho VALUES (5, 'Transportador', 2.0);
INSERT INTO trabalho VALUES (6, 'Fazedor de mel', 7.0);
INSERT INTO trabalho VALUES (7, 'Gerente', 8.0);
INSERT INTO trabalho VALUES (8, 'Supervisor', 5.0);


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


-- Completed on 2016-11-05 13:52:46

--
-- PostgreSQL database dump complete
--

