
CREATE SEQUENCE public.categorie_plat_id_seq;

CREATE TABLE public.categorie_plat (
                id INTEGER NOT NULL DEFAULT nextval('public.categorie_plat_id_seq'),
                nom VARCHAR(255) NOT NULL,
                CONSTRAINT categorie_plat_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.categorie_plat_id_seq OWNED BY public.categorie_plat.id;

CREATE SEQUENCE public.plat_id_seq;

CREATE TABLE public.plat (
                id INTEGER NOT NULL DEFAULT nextval('public.plat_id_seq'),
                categorie_plat_id INTEGER NOT NULL,
                nom VARCHAR(255) NOT NULL,
                description VARCHAR(255),
                prix NUMERIC NOT NULL,
                date DATE,
                quantite INTEGER,
                plat_du_jour BOOLEAN NOT NULL,
                CONSTRAINT plat_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.plat_id_seq OWNED BY public.plat.id;

CREATE SEQUENCE public.statut_id_seq;

CREATE SEQUENCE public.statut_statut_seq;

CREATE TABLE public.statut (
                id INTEGER NOT NULL DEFAULT nextval('public.statut_id_seq'),
                statut VARCHAR(255) NOT NULL DEFAULT nextval('public.statut_statut_seq'),
                CONSTRAINT statut_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.statut_id_seq OWNED BY public.statut.id;

ALTER SEQUENCE public.statut_statut_seq OWNED BY public.statut.statut;

CREATE SEQUENCE public.livreur_id_seq;

CREATE TABLE public.livreur (
                id INTEGER NOT NULL DEFAULT nextval('public.livreur_id_seq'),
                statut_livreur_id INTEGER NOT NULL,
                nom VARCHAR(255) NOT NULL,
                prenom VARCHAR(255) NOT NULL,
                telephone VARCHAR(20) NOT NULL,
                longitude NUMERIC,
                latitude NUMERIC,
                CONSTRAINT livreur_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.livreur_id_seq OWNED BY public.livreur.id;

CREATE TABLE public.sac_livreur (
                livreur_id INTEGER NOT NULL,
                plat_id INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT sac_livreur_pk PRIMARY KEY (livreur_id, plat_id)
);


CREATE SEQUENCE public.client_clientid_seq;

CREATE TABLE public.client (
                id INTEGER NOT NULL DEFAULT nextval('public.client_clientid_seq'),
                nom VARCHAR(255) NOT NULL,
                prenom VARCHAR(255) NOT NULL,
                email VARCHAR(255) NOT NULL,
                mot_de_passe VARCHAR(50) NOT NULL,
                telephone VARCHAR(20) NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.client_clientid_seq OWNED BY public.client.id;

CREATE UNIQUE INDEX client_idx
 ON public.client
 ( email );

CREATE SEQUENCE public.adresse_adresseid_seq;

CREATE TABLE public.adresse (
                id INTEGER NOT NULL DEFAULT nextval('public.adresse_adresseid_seq'),
                client_id INTEGER NOT NULL,
                numero_adresse INTEGER NOT NULL,
                rue VARCHAR(255) NOT NULL,
                ville VARCHAR(255) NOT NULL,
                code_postal INTEGER NOT NULL,
                etage INTEGER,
                digicode INTEGER,
                info_additionnelles VARCHAR(255),
                CONSTRAINT adresse_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.adresse_adresseid_seq OWNED BY public.adresse.id;

CREATE SEQUENCE public.commande_id_seq;

CREATE TABLE public.commande (
                id INTEGER NOT NULL DEFAULT nextval('public.commande_id_seq'),
                client_id INTEGER NOT NULL,
                livreur_id INTEGER,
                statut_paiement_id INTEGER NOT NULL,
                statut_commande_id INTEGER NOT NULL,
                prixHT NUMERIC NOT NULL,
                tauxTVA NUMERIC NOT NULL,
                date TIMESTAMP NOT NULL,
                heure_livraison_estimee TIMESTAMP,
                CONSTRAINT commande_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.commande_id_seq OWNED BY public.commande.id;

CREATE TABLE public.contenu_commande (
                commande_id INTEGER NOT NULL,
                plat_id INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT contenu_commande_pk PRIMARY KEY (commande_id, plat_id)
);


ALTER TABLE public.plat ADD CONSTRAINT categorie_plat_plat_fk
FOREIGN KEY (categorie_plat_id)
REFERENCES public.categorie_plat (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.sac_livreur ADD CONSTRAINT plat_sac_livreur_fk
FOREIGN KEY (plat_id)
REFERENCES public.plat (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.contenu_commande ADD CONSTRAINT plat_contenu_commande_fk
FOREIGN KEY (plat_id)
REFERENCES public.plat (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livreur ADD CONSTRAINT statut_livreur_fk
FOREIGN KEY (statut_livreur_id)
REFERENCES public.statut (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT statut_commande_fk
FOREIGN KEY (statut_paiement_id)
REFERENCES public.statut (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT statut_commande_fk1
FOREIGN KEY (statut_commande_id)
REFERENCES public.statut (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.sac_livreur ADD CONSTRAINT livreur_sac_livreur_fk
FOREIGN KEY (livreur_id)
REFERENCES public.livreur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT livreur_commande_fk
FOREIGN KEY (livreur_id)
REFERENCES public.livreur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (client_id)
REFERENCES public.client (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.adresse ADD CONSTRAINT client_adresse_fk
FOREIGN KEY (client_id)
REFERENCES public.client (id)
ON DELETE CASCADE
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.contenu_commande ADD CONSTRAINT commande_contenu_commande_fk
FOREIGN KEY (commande_id)
REFERENCES public.commande (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
