--
-- PostgreSQL database dump
--

-- Dumped from database version 11.0
-- Dumped by pg_dump version 11.1

-- Started on 2019-03-23 21:51:07 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 209 (class 1259 OID 17340)
-- Name: adresse; Type: TABLE; Schema: public; Owner: amber
--

CREATE TABLE public.adresse (
    id integer NOT NULL,
    client_id integer NOT NULL,
    numero_adresse integer NOT NULL,
    rue character varying(255) NOT NULL,
    ville character varying(255) NOT NULL,
    code_postal integer NOT NULL,
    etage integer,
    digicode integer,
    info_additionnelles character varying(255)
);


ALTER TABLE public.adresse OWNER TO amber;

--
-- TOC entry 208 (class 1259 OID 17338)
-- Name: adresse_adresseid_seq; Type: SEQUENCE; Schema: public; Owner: amber
--

CREATE SEQUENCE public.adresse_adresseid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adresse_adresseid_seq OWNER TO amber;

--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 208
-- Name: adresse_adresseid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amber
--

ALTER SEQUENCE public.adresse_adresseid_seq OWNED BY public.adresse.id;


--
-- TOC entry 197 (class 1259 OID 17282)
-- Name: categorie_plat; Type: TABLE; Schema: public; Owner: amber
--

CREATE TABLE public.categorie_plat (
    id integer NOT NULL,
    nom character varying(255) NOT NULL
);


ALTER TABLE public.categorie_plat OWNER TO amber;

--
-- TOC entry 196 (class 1259 OID 17280)
-- Name: categorie_plat_id_seq; Type: SEQUENCE; Schema: public; Owner: amber
--

CREATE SEQUENCE public.categorie_plat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorie_plat_id_seq OWNER TO amber;

--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 196
-- Name: categorie_plat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amber
--

ALTER SEQUENCE public.categorie_plat_id_seq OWNED BY public.categorie_plat.id;


--
-- TOC entry 207 (class 1259 OID 17328)
-- Name: client; Type: TABLE; Schema: public; Owner: amber
--

CREATE TABLE public.client (
    id integer NOT NULL,
    nom character varying(255) NOT NULL,
    prenom character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    mot_de_passe character varying(50) NOT NULL,
    telephone character varying(20) NOT NULL
);


ALTER TABLE public.client OWNER TO amber;

--
-- TOC entry 206 (class 1259 OID 17326)
-- Name: client_clientid_seq; Type: SEQUENCE; Schema: public; Owner: amber
--

CREATE SEQUENCE public.client_clientid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_clientid_seq OWNER TO amber;

--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 206
-- Name: client_clientid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amber
--

ALTER SEQUENCE public.client_clientid_seq OWNED BY public.client.id;


--
-- TOC entry 211 (class 1259 OID 17351)
-- Name: commande; Type: TABLE; Schema: public; Owner: amber
--

CREATE TABLE public.commande (
    id integer NOT NULL,
    client_id integer NOT NULL,
    livreur_id integer,
    statut_paiement_id integer NOT NULL,
    statut_commande_id integer NOT NULL,
    "prixHT" numeric NOT NULL,
    date timestamp without time zone NOT NULL,
    heure_livraison_estimee timestamp without time zone,
    "tauxTVA" numeric
);


ALTER TABLE public.commande OWNER TO amber;

--
-- TOC entry 210 (class 1259 OID 17349)
-- Name: commande_id_seq; Type: SEQUENCE; Schema: public; Owner: amber
--

CREATE SEQUENCE public.commande_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commande_id_seq OWNER TO amber;

--
-- TOC entry 3272 (class 0 OID 0)
-- Dependencies: 210
-- Name: commande_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amber
--

ALTER SEQUENCE public.commande_id_seq OWNED BY public.commande.id;


--
-- TOC entry 212 (class 1259 OID 17357)
-- Name: contenu_commande; Type: TABLE; Schema: public; Owner: amber
--

CREATE TABLE public.contenu_commande (
    commande_id integer NOT NULL,
    plat_id integer NOT NULL,
    quantite integer NOT NULL
);


ALTER TABLE public.contenu_commande OWNER TO amber;

--
-- TOC entry 204 (class 1259 OID 17312)
-- Name: livreur; Type: TABLE; Schema: public; Owner: amber
--

CREATE TABLE public.livreur (
    id integer NOT NULL,
    statut_livreur_id integer NOT NULL,
    nom character varying(255) NOT NULL,
    prenom character varying(255) NOT NULL,
    telephone character varying(20) NOT NULL,
    longitude numeric,
    latitude numeric
);


ALTER TABLE public.livreur OWNER TO amber;

--
-- TOC entry 203 (class 1259 OID 17310)
-- Name: livreur_id_seq; Type: SEQUENCE; Schema: public; Owner: amber
--

CREATE SEQUENCE public.livreur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.livreur_id_seq OWNER TO amber;

--
-- TOC entry 3273 (class 0 OID 0)
-- Dependencies: 203
-- Name: livreur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amber
--

ALTER SEQUENCE public.livreur_id_seq OWNED BY public.livreur.id;


--
-- TOC entry 199 (class 1259 OID 17290)
-- Name: plat; Type: TABLE; Schema: public; Owner: amber
--

CREATE TABLE public.plat (
    id integer NOT NULL,
    categorie_plat_id integer NOT NULL,
    nom character varying(255) NOT NULL,
    description character varying(255),
    prix numeric NOT NULL,
    date date,
    quantite integer,
    plat_du_jour boolean NOT NULL
);


ALTER TABLE public.plat OWNER TO amber;

--
-- TOC entry 198 (class 1259 OID 17288)
-- Name: plat_id_seq; Type: SEQUENCE; Schema: public; Owner: amber
--

CREATE SEQUENCE public.plat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plat_id_seq OWNER TO amber;

--
-- TOC entry 3274 (class 0 OID 0)
-- Dependencies: 198
-- Name: plat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amber
--

ALTER SEQUENCE public.plat_id_seq OWNED BY public.plat.id;


--
-- TOC entry 205 (class 1259 OID 17321)
-- Name: sac_livreur; Type: TABLE; Schema: public; Owner: amber
--

CREATE TABLE public.sac_livreur (
    livreur_id integer NOT NULL,
    plat_id integer NOT NULL,
    quantite integer NOT NULL
);


ALTER TABLE public.sac_livreur OWNER TO amber;

--
-- TOC entry 202 (class 1259 OID 17303)
-- Name: statut; Type: TABLE; Schema: public; Owner: amber
--

CREATE TABLE public.statut (
    id integer NOT NULL,
    statut character varying(255) NOT NULL
);


ALTER TABLE public.statut OWNER TO amber;

--
-- TOC entry 200 (class 1259 OID 17299)
-- Name: statut_id_seq; Type: SEQUENCE; Schema: public; Owner: amber
--

CREATE SEQUENCE public.statut_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statut_id_seq OWNER TO amber;

--
-- TOC entry 3275 (class 0 OID 0)
-- Dependencies: 200
-- Name: statut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amber
--

ALTER SEQUENCE public.statut_id_seq OWNED BY public.statut.id;


--
-- TOC entry 201 (class 1259 OID 17301)
-- Name: statut_statut_seq; Type: SEQUENCE; Schema: public; Owner: amber
--

CREATE SEQUENCE public.statut_statut_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statut_statut_seq OWNER TO amber;

--
-- TOC entry 3276 (class 0 OID 0)
-- Dependencies: 201
-- Name: statut_statut_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amber
--

ALTER SEQUENCE public.statut_statut_seq OWNED BY public.statut.statut;


--
-- TOC entry 3094 (class 2604 OID 17343)
-- Name: adresse id; Type: DEFAULT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.adresse ALTER COLUMN id SET DEFAULT nextval('public.adresse_adresseid_seq'::regclass);


--
-- TOC entry 3088 (class 2604 OID 17285)
-- Name: categorie_plat id; Type: DEFAULT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.categorie_plat ALTER COLUMN id SET DEFAULT nextval('public.categorie_plat_id_seq'::regclass);


--
-- TOC entry 3093 (class 2604 OID 17331)
-- Name: client id; Type: DEFAULT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_clientid_seq'::regclass);


--
-- TOC entry 3095 (class 2604 OID 17354)
-- Name: commande id; Type: DEFAULT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.commande ALTER COLUMN id SET DEFAULT nextval('public.commande_id_seq'::regclass);


--
-- TOC entry 3092 (class 2604 OID 17315)
-- Name: livreur id; Type: DEFAULT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.livreur ALTER COLUMN id SET DEFAULT nextval('public.livreur_id_seq'::regclass);


--
-- TOC entry 3089 (class 2604 OID 17293)
-- Name: plat id; Type: DEFAULT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.plat ALTER COLUMN id SET DEFAULT nextval('public.plat_id_seq'::regclass);


--
-- TOC entry 3090 (class 2604 OID 17306)
-- Name: statut id; Type: DEFAULT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.statut ALTER COLUMN id SET DEFAULT nextval('public.statut_id_seq'::regclass);


--
-- TOC entry 3091 (class 2604 OID 17307)
-- Name: statut statut; Type: DEFAULT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.statut ALTER COLUMN statut SET DEFAULT nextval('public.statut_statut_seq'::regclass);


--
-- TOC entry 3260 (class 0 OID 17340)
-- Dependencies: 209
-- Data for Name: adresse; Type: TABLE DATA; Schema: public; Owner: amber
--

INSERT INTO public.adresse VALUES (1, 1, 7, 'Cité Paradis', 'Paris', 75010, 1, NULL, NULL);
INSERT INTO public.adresse VALUES (2, 2, 11, 'Charles de Gaulle', 'Paris', 75110, 3, NULL, NULL);
INSERT INTO public.adresse VALUES (3, 3, 165, 'Chaptal', 'Paris', 75009, 6, NULL, NULL);


--
-- TOC entry 3248 (class 0 OID 17282)
-- Dependencies: 197
-- Data for Name: categorie_plat; Type: TABLE DATA; Schema: public; Owner: amber
--

INSERT INTO public.categorie_plat VALUES (1, 'plat');
INSERT INTO public.categorie_plat VALUES (2, 'dessert');


--
-- TOC entry 3258 (class 0 OID 17328)
-- Dependencies: 207
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: amber
--

INSERT INTO public.client VALUES (1, 'Chiron', 'Wei', 'wei.chiron@gmail.com', '8CB2237D0679CA88DB6464EAC60DA96345513964', '0612121212');
INSERT INTO public.client VALUES (2, 'Dupont', 'Jacque', 'dupontjacque@gmail.com', '348162101FC6F7E624681B7400B085EEAC6DF7BD', '0623232323');
INSERT INTO public.client VALUES (3, 'Loire', 'Sandrine', 'Loiresandrine@gmail.com', '19865795547116AE27F09115E72C74D2C517D0B2', '0698989898');


--
-- TOC entry 3262 (class 0 OID 17351)
-- Dependencies: 211
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: amber
--

INSERT INTO public.commande VALUES (1, 1, 2, 4, 6, 30, '2019-03-12 17:30:00', NULL, 0.10);
INSERT INTO public.commande VALUES (2, 2, 1, 4, 7, 40, '2019-03-13 18:30:00', NULL, 0.10);
INSERT INTO public.commande VALUES (3, 3, 1, 5, 8, 37, '2019-03-14 19:30:00', NULL, 0.10);


--
-- TOC entry 3263 (class 0 OID 17357)
-- Dependencies: 212
-- Data for Name: contenu_commande; Type: TABLE DATA; Schema: public; Owner: amber
--

INSERT INTO public.contenu_commande VALUES (1, 2, 1);
INSERT INTO public.contenu_commande VALUES (1, 3, 1);


--
-- TOC entry 3255 (class 0 OID 17312)
-- Dependencies: 204
-- Data for Name: livreur; Type: TABLE DATA; Schema: public; Owner: amber
--

INSERT INTO public.livreur VALUES (1, 1, 'Chiron', 'Brownie', '0659123456', NULL, NULL);
INSERT INTO public.livreur VALUES (2, 2, 'Zhang', 'Limbo', '0660878787', NULL, NULL);


--
-- TOC entry 3250 (class 0 OID 17290)
-- Dependencies: 199
-- Data for Name: plat; Type: TABLE DATA; Schema: public; Owner: amber
--

INSERT INTO public.plat VALUES (1, 1, 'Parmentier de canard', 'La cuisse de canard confite est effilochée puis cuite avec des échalotes dans un fond de veau. Une purée de pomme de terre maison et un mesclun de salade terminent la préparation.', 19, '2019-03-12', 80, true);
INSERT INTO public.plat VALUES (2, 1, 'Filet de boeuf à la plancha, sauce Béarnaise
', 'Le filet de boeuf cuit à la plancha accompagné de pommes de terre grenaille rissolées.', 22, '2019-03-12', 80, true);
INSERT INTO public.plat VALUES (4, 2, 'Cheesecake', NULL, 4, '2019-03-12', 50, true);
INSERT INTO public.plat VALUES (3, 2, 'Muffin au chocolat', NULL, 4, '2019-03-12', 50, false);


--
-- TOC entry 3256 (class 0 OID 17321)
-- Dependencies: 205
-- Data for Name: sac_livreur; Type: TABLE DATA; Schema: public; Owner: amber
--

INSERT INTO public.sac_livreur VALUES (2, 1, 5);
INSERT INTO public.sac_livreur VALUES (2, 2, 5);
INSERT INTO public.sac_livreur VALUES (2, 3, 5);
INSERT INTO public.sac_livreur VALUES (2, 4, 5);
INSERT INTO public.sac_livreur VALUES (1, 1, 10);
INSERT INTO public.sac_livreur VALUES (1, 3, 10);


--
-- TOC entry 3253 (class 0 OID 17303)
-- Dependencies: 202
-- Data for Name: statut; Type: TABLE DATA; Schema: public; Owner: amber
--

INSERT INTO public.statut VALUES (1, 'livreur disponible');
INSERT INTO public.statut VALUES (2, 'livreur indisponible');
INSERT INTO public.statut VALUES (3, 'en attente de paiement');
INSERT INTO public.statut VALUES (4, 'paiement validé');
INSERT INTO public.statut VALUES (5, 'paiement refusé');
INSERT INTO public.statut VALUES (6, 'commande en cours');
INSERT INTO public.statut VALUES (7, 'commande validée');
INSERT INTO public.statut VALUES (8, 'commande annulée');


--
-- TOC entry 3277 (class 0 OID 0)
-- Dependencies: 208
-- Name: adresse_adresseid_seq; Type: SEQUENCE SET; Schema: public; Owner: amber
--

SELECT pg_catalog.setval('public.adresse_adresseid_seq', 3, true);


--
-- TOC entry 3278 (class 0 OID 0)
-- Dependencies: 196
-- Name: categorie_plat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amber
--

SELECT pg_catalog.setval('public.categorie_plat_id_seq', 2, true);


--
-- TOC entry 3279 (class 0 OID 0)
-- Dependencies: 206
-- Name: client_clientid_seq; Type: SEQUENCE SET; Schema: public; Owner: amber
--

SELECT pg_catalog.setval('public.client_clientid_seq', 3, true);


--
-- TOC entry 3280 (class 0 OID 0)
-- Dependencies: 210
-- Name: commande_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amber
--

SELECT pg_catalog.setval('public.commande_id_seq', 2, true);


--
-- TOC entry 3281 (class 0 OID 0)
-- Dependencies: 203
-- Name: livreur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amber
--

SELECT pg_catalog.setval('public.livreur_id_seq', 2, true);


--
-- TOC entry 3282 (class 0 OID 0)
-- Dependencies: 198
-- Name: plat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amber
--

SELECT pg_catalog.setval('public.plat_id_seq', 5, true);


--
-- TOC entry 3283 (class 0 OID 0)
-- Dependencies: 200
-- Name: statut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amber
--

SELECT pg_catalog.setval('public.statut_id_seq', 8, true);


--
-- TOC entry 3284 (class 0 OID 0)
-- Dependencies: 201
-- Name: statut_statut_seq; Type: SEQUENCE SET; Schema: public; Owner: amber
--

SELECT pg_catalog.setval('public.statut_statut_seq', 1, false);


--
-- TOC entry 3110 (class 2606 OID 17348)
-- Name: adresse adresse_pk; Type: CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_pk PRIMARY KEY (id);


--
-- TOC entry 3097 (class 2606 OID 17287)
-- Name: categorie_plat categorie_plat_pk; Type: CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.categorie_plat
    ADD CONSTRAINT categorie_plat_pk PRIMARY KEY (id);


--
-- TOC entry 3108 (class 2606 OID 17336)
-- Name: client client_pk; Type: CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pk PRIMARY KEY (id);


--
-- TOC entry 3112 (class 2606 OID 17356)
-- Name: commande commande_pk; Type: CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pk PRIMARY KEY (id);


--
-- TOC entry 3114 (class 2606 OID 17361)
-- Name: contenu_commande contenu_commande_pk; Type: CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.contenu_commande
    ADD CONSTRAINT contenu_commande_pk PRIMARY KEY (commande_id, plat_id);


--
-- TOC entry 3103 (class 2606 OID 17320)
-- Name: livreur livreur_pk; Type: CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.livreur
    ADD CONSTRAINT livreur_pk PRIMARY KEY (id);


--
-- TOC entry 3099 (class 2606 OID 17298)
-- Name: plat plat_pk; Type: CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.plat
    ADD CONSTRAINT plat_pk PRIMARY KEY (id);


--
-- TOC entry 3105 (class 2606 OID 17325)
-- Name: sac_livreur sac_livreur_pk; Type: CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.sac_livreur
    ADD CONSTRAINT sac_livreur_pk PRIMARY KEY (livreur_id, plat_id);


--
-- TOC entry 3101 (class 2606 OID 17309)
-- Name: statut statut_pk; Type: CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.statut
    ADD CONSTRAINT statut_pk PRIMARY KEY (id);


--
-- TOC entry 3106 (class 1259 OID 17337)
-- Name: client_idx; Type: INDEX; Schema: public; Owner: amber
--

CREATE UNIQUE INDEX client_idx ON public.client USING btree (email);


--
-- TOC entry 3115 (class 2606 OID 17362)
-- Name: plat categorie_plat_plat_fk; Type: FK CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.plat
    ADD CONSTRAINT categorie_plat_plat_fk FOREIGN KEY (categorie_plat_id) REFERENCES public.categorie_plat(id);


--
-- TOC entry 3119 (class 2606 OID 17407)
-- Name: adresse client_adresse_fk; Type: FK CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT client_adresse_fk FOREIGN KEY (client_id) REFERENCES public.client(id) ON DELETE CASCADE;


--
-- TOC entry 3123 (class 2606 OID 17402)
-- Name: commande client_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT client_commande_fk FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3125 (class 2606 OID 17412)
-- Name: contenu_commande commande_contenu_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.contenu_commande
    ADD CONSTRAINT commande_contenu_commande_fk FOREIGN KEY (commande_id) REFERENCES public.commande(id);


--
-- TOC entry 3122 (class 2606 OID 17397)
-- Name: commande livreur_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT livreur_commande_fk FOREIGN KEY (livreur_id) REFERENCES public.livreur(id);


--
-- TOC entry 3118 (class 2606 OID 17392)
-- Name: sac_livreur livreur_sac_livreur_fk; Type: FK CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.sac_livreur
    ADD CONSTRAINT livreur_sac_livreur_fk FOREIGN KEY (livreur_id) REFERENCES public.livreur(id);


--
-- TOC entry 3124 (class 2606 OID 17372)
-- Name: contenu_commande plat_contenu_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.contenu_commande
    ADD CONSTRAINT plat_contenu_commande_fk FOREIGN KEY (plat_id) REFERENCES public.plat(id);


--
-- TOC entry 3117 (class 2606 OID 17367)
-- Name: sac_livreur plat_sac_livreur_fk; Type: FK CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.sac_livreur
    ADD CONSTRAINT plat_sac_livreur_fk FOREIGN KEY (plat_id) REFERENCES public.plat(id);


--
-- TOC entry 3120 (class 2606 OID 17382)
-- Name: commande statut_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT statut_commande_fk FOREIGN KEY (statut_paiement_id) REFERENCES public.statut(id);


--
-- TOC entry 3121 (class 2606 OID 17387)
-- Name: commande statut_commande_fk1; Type: FK CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT statut_commande_fk1 FOREIGN KEY (statut_commande_id) REFERENCES public.statut(id);


--
-- TOC entry 3116 (class 2606 OID 17377)
-- Name: livreur statut_livreur_fk; Type: FK CONSTRAINT; Schema: public; Owner: amber
--

ALTER TABLE ONLY public.livreur
    ADD CONSTRAINT statut_livreur_fk FOREIGN KEY (statut_livreur_id) REFERENCES public.statut(id);


-- Completed on 2019-03-23 21:51:07 CET

--
-- PostgreSQL database dump complete
--

