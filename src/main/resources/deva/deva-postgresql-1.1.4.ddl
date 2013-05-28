--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.0
-- Dumped by pg_dump version 9.2.0
-- Started on 2013-04-23 11:06:20 CEST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 208 (class 1259 OID 30006)
-- Name: deva_angemeldeter_benutzer; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_angemeldeter_benutzer (
    id bigint NOT NULL,
    version bigint,
    datum timestamp without time zone NOT NULL,
    remotehost character varying(100) NOT NULL,
    session_id character varying(100) NOT NULL,
    benutzer bigint NOT NULL,
    benutzer_liste bigint
);


ALTER TABLE public.deva_angemeldeter_benutzer OWNER TO meyle;

--
-- TOC entry 207 (class 1259 OID 30004)
-- Name: deva_angemeldeter_benutzer_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_angemeldeter_benutzer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_angemeldeter_benutzer_id_seq OWNER TO meyle;

--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 207
-- Name: deva_angemeldeter_benutzer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_angemeldeter_benutzer_id_seq OWNED BY deva_angemeldeter_benutzer.id;


--
-- TOC entry 210 (class 1259 OID 30014)
-- Name: deva_artikel; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel (
    id bigint NOT NULL,
    version bigint,
    ampel_status character varying(255) NOT NULL,
    artikelprozess_status character varying(255) NOT NULL,
    beim_lieferanten_vorhanden character(1),
    einbauseite_aussen character(1),
    einbauseite_hinten character(1),
    einbauseite_hinterachse character(1),
    einbauseite_innen character(1),
    einbauseite_links character(1),
    einbauseite_oben character(1),
    einbauseite_rechts character(1),
    einbauseite_unten character(1),
    einbauseite_vorderachse character(1),
    einbauseite_vorne character(1),
    klassifikation character varying(255) NOT NULL,
    orig_lieferantennummer character varying(50),
    raw_lieferantennummer character varying(255),
    orig_meylenummer character varying(255) NOT NULL,
    raw_meylenummer character varying(255) NOT NULL,
    orig_oenummer character varying(50) NOT NULL,
    raw_oenummer character varying(255) NOT NULL,
    angelegt_von bigint NOT NULL,
    artikelbild bigint,
    artikelprozess bigint,
    artikelbezeichnung bigint NOT NULL,
    kunde bigint,
    lieferant bigint,
    paarbeziehung bigint
);


ALTER TABLE public.deva_artikel OWNER TO meyle;

--
-- TOC entry 212 (class 1259 OID 30025)
-- Name: deva_artikel_bestandteil; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_bestandteil (
    id bigint NOT NULL,
    version bigint,
    anzahl bigint NOT NULL,
    hinweis character varying(100) NOT NULL,
    artikel bigint NOT NULL,
    artikel_bestandteil bigint NOT NULL,
    CONSTRAINT deva_artikel_bestandteil_anzahl_check CHECK ((anzahl >= 1))
);


ALTER TABLE public.deva_artikel_bestandteil OWNER TO meyle;

--
-- TOC entry 211 (class 1259 OID 30023)
-- Name: deva_artikel_bestandteil_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_artikel_bestandteil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_artikel_bestandteil_id_seq OWNER TO meyle;

--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 211
-- Name: deva_artikel_bestandteil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_bestandteil_id_seq OWNED BY deva_artikel_bestandteil.id;


--
-- TOC entry 213 (class 1259 OID 30032)
-- Name: deva_artikel_dokumente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_dokumente (
    artikel_id bigint NOT NULL,
    dokument_id bigint NOT NULL
);


ALTER TABLE public.deva_artikel_dokumente OWNER TO meyle;

--
-- TOC entry 214 (class 1259 OID 30037)
-- Name: deva_artikel_fahrzeuge; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_fahrzeuge (
    artikel_id bigint NOT NULL,
    fahrzeug_id bigint NOT NULL,
    sort_order integer NOT NULL
);


ALTER TABLE public.deva_artikel_fahrzeuge OWNER TO meyle;

--
-- TOC entry 209 (class 1259 OID 30012)
-- Name: deva_artikel_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_artikel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_artikel_id_seq OWNER TO meyle;

--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 209
-- Name: deva_artikel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_id_seq OWNED BY deva_artikel.id;


--
-- TOC entry 216 (class 1259 OID 30044)
-- Name: deva_artikel_kommentar; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_kommentar (
    id bigint NOT NULL,
    version bigint,
    datum timestamp without time zone NOT NULL,
    text character varying(1024) NOT NULL,
    benutzer bigint NOT NULL,
    artikel_id bigint
);


ALTER TABLE public.deva_artikel_kommentar OWNER TO meyle;

--
-- TOC entry 215 (class 1259 OID 30042)
-- Name: deva_artikel_kommentar_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_artikel_kommentar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_artikel_kommentar_id_seq OWNER TO meyle;

--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 215
-- Name: deva_artikel_kommentar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_kommentar_id_seq OWNED BY deva_artikel_kommentar.id;


--
-- TOC entry 218 (class 1259 OID 30055)
-- Name: deva_artikel_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_komponente (
    id bigint NOT NULL,
    version bigint,
    anzahl bigint NOT NULL,
    hinweis character varying(100) NOT NULL,
    artikel bigint NOT NULL,
    komponente bigint NOT NULL,
    CONSTRAINT deva_artikel_komponente_anzahl_check CHECK ((anzahl >= 1))
);


ALTER TABLE public.deva_artikel_komponente OWNER TO meyle;

--
-- TOC entry 217 (class 1259 OID 30053)
-- Name: deva_artikel_komponente_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_artikel_komponente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_artikel_komponente_id_seq OWNER TO meyle;

--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 217
-- Name: deva_artikel_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_komponente_id_seq OWNED BY deva_artikel_komponente.id;


--
-- TOC entry 220 (class 1259 OID 30064)
-- Name: deva_artikel_logbuch; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_logbuch (
    id bigint NOT NULL,
    version bigint,
    aktion character varying(255) NOT NULL,
    bezugsobjekt_text character varying(100) NOT NULL,
    datum timestamp without time zone NOT NULL,
    benutzer bigint NOT NULL,
    artikel_id bigint
);


ALTER TABLE public.deva_artikel_logbuch OWNER TO meyle;

--
-- TOC entry 219 (class 1259 OID 30062)
-- Name: deva_artikel_logbuch_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_artikel_logbuch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_artikel_logbuch_id_seq OWNER TO meyle;

--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 219
-- Name: deva_artikel_logbuch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_logbuch_id_seq OWNED BY deva_artikel_logbuch.id;


--

--
-- TOC entry 222 (class 1259 OID 30075)
-- Name: deva_artikel_verantwortliche; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_verantwortliche (
    artikel_id bigint NOT NULL,
    verantwortlicher_id bigint NOT NULL
);


ALTER TABLE public.deva_artikel_verantwortliche OWNER TO meyle;

--
-- TOC entry 224 (class 1259 OID 30080)
-- Name: deva_artikel_zubehoer; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_zubehoer (
    id bigint NOT NULL,
    version bigint,
    anzahl bigint NOT NULL,
    hinweis character varying(100) NOT NULL,
    artikel bigint NOT NULL,
    zubehoer bigint NOT NULL,
    CONSTRAINT deva_artikel_zubehoer_anzahl_check CHECK ((anzahl >= 1))
);


ALTER TABLE public.deva_artikel_zubehoer OWNER TO meyle;

--
-- TOC entry 223 (class 1259 OID 30078)
-- Name: deva_artikel_zubehoer_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_artikel_zubehoer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_artikel_zubehoer_id_seq OWNER TO meyle;

--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 223
-- Name: deva_artikel_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_zubehoer_id_seq OWNED BY deva_artikel_zubehoer.id;


--
-- TOC entry 225 (class 1259 OID 30087)
-- Name: deva_artikel_zusatzinformationen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_zusatzinformationen (
    artikel_id bigint NOT NULL,
    zusatzinfo_id bigint NOT NULL
);


ALTER TABLE public.deva_artikel_zusatzinformationen OWNER TO meyle;

--
-- TOC entry 227 (class 1259 OID 30092)
-- Name: deva_benutzer; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer (
    id bigint NOT NULL,
    version bigint,
    email character varying(255) NOT NULL,
    username character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    firma bigint NOT NULL
);


ALTER TABLE public.deva_benutzer OWNER TO meyle;

--
-- TOC entry 228 (class 1259 OID 30105)
-- Name: deva_benutzer_firma; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_firma (
    benutzer bigint NOT NULL,
    zugeordnete_firma bigint NOT NULL
);


ALTER TABLE public.deva_benutzer_firma OWNER TO meyle;

--
-- TOC entry 226 (class 1259 OID 30090)
-- Name: deva_benutzer_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_benutzer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_benutzer_id_seq OWNER TO meyle;

--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 226
-- Name: deva_benutzer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_benutzer_id_seq OWNED BY deva_benutzer.id;


--
-- TOC entry 230 (class 1259 OID 30112)
-- Name: deva_benutzer_liste; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_liste (
    id bigint NOT NULL,
    version bigint,
    singleton character varying(255) NOT NULL
);


ALTER TABLE public.deva_benutzer_liste OWNER TO meyle;

--
-- TOC entry 229 (class 1259 OID 30110)
-- Name: deva_benutzer_liste_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_benutzer_liste_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_benutzer_liste_id_seq OWNER TO meyle;

--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 229
-- Name: deva_benutzer_liste_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_benutzer_liste_id_seq OWNED BY deva_benutzer_liste.id;


--
-- TOC entry 231 (class 1259 OID 30120)
-- Name: deva_benutzer_produktgruppe; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_produktgruppe (
    benutzer bigint NOT NULL,
    produktgruppe bigint NOT NULL
);


ALTER TABLE public.deva_benutzer_produktgruppe OWNER TO meyle;

--
-- TOC entry 232 (class 1259 OID 30125)
-- Name: deva_benutzer_rollen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_rollen (
    benutzer bigint NOT NULL,
    rolle bigint NOT NULL
);


ALTER TABLE public.deva_benutzer_rollen OWNER TO meyle;

--
-- TOC entry 234 (class 1259 OID 30132)
-- Name: deva_bezeichnung_artikel; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_artikel (
    id bigint NOT NULL,
    version bigint,
    klassifikation character varying(255) NOT NULL,
    produktgruppe bigint NOT NULL
);


ALTER TABLE public.deva_bezeichnung_artikel OWNER TO meyle;

--
-- TOC entry 233 (class 1259 OID 30130)
-- Name: deva_bezeichnung_artikel_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_bezeichnung_artikel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_bezeichnung_artikel_id_seq OWNER TO meyle;

--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 233
-- Name: deva_bezeichnung_artikel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_artikel_id_seq OWNED BY deva_bezeichnung_artikel.id;


--
-- TOC entry 236 (class 1259 OID 30140)
-- Name: deva_bezeichnung_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_komponente (
    id bigint NOT NULL,
    version bigint,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_bezeichnung_komponente OWNER TO meyle;

--
-- TOC entry 235 (class 1259 OID 30138)
-- Name: deva_bezeichnung_komponente_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_bezeichnung_komponente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_bezeichnung_komponente_id_seq OWNER TO meyle;

--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 235
-- Name: deva_bezeichnung_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_komponente_id_seq OWNED BY deva_bezeichnung_komponente.id;


--
-- TOC entry 238 (class 1259 OID 30148)
-- Name: deva_bezeichnung_produktgruppe; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_produktgruppe (
    id bigint NOT NULL,
    version bigint
);


ALTER TABLE public.deva_bezeichnung_produktgruppe OWNER TO meyle;

--
-- TOC entry 237 (class 1259 OID 30146)
-- Name: deva_bezeichnung_produktgruppe_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_bezeichnung_produktgruppe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_bezeichnung_produktgruppe_id_seq OWNER TO meyle;

--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 237
-- Name: deva_bezeichnung_produktgruppe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_produktgruppe_id_seq OWNED BY deva_bezeichnung_produktgruppe.id;


--
-- TOC entry 240 (class 1259 OID 30156)
-- Name: deva_bezeichnung_zubehoer; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_zubehoer (
    id bigint NOT NULL,
    version bigint,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_bezeichnung_zubehoer OWNER TO meyle;

--
-- TOC entry 239 (class 1259 OID 30154)
-- Name: deva_bezeichnung_zubehoer_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_bezeichnung_zubehoer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_bezeichnung_zubehoer_id_seq OWNER TO meyle;

--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 239
-- Name: deva_bezeichnung_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_zubehoer_id_seq OWNED BY deva_bezeichnung_zubehoer.id;


--
-- TOC entry 242 (class 1259 OID 30164)
-- Name: deva_bezeichnung_zusatzinformation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_zusatzinformation (
    id bigint NOT NULL,
    version bigint,
    typ character varying(255) NOT NULL
);


ALTER TABLE public.deva_bezeichnung_zusatzinformation OWNER TO meyle;

--
-- TOC entry 241 (class 1259 OID 30162)
-- Name: deva_bezeichnung_zusatzinformation_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_bezeichnung_zusatzinformation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_bezeichnung_zusatzinformation_id_seq OWNER TO meyle;

--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 241
-- Name: deva_bezeichnung_zusatzinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_zusatzinformation_id_seq OWNED BY deva_bezeichnung_zusatzinformation.id;


--
-- TOC entry 244 (class 1259 OID 30172)
-- Name: deva_bezeichung_prozess_schritt; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichung_prozess_schritt (
    id bigint NOT NULL,
    version bigint,
    artikel_schritt character(1),
    identifier character varying(100) NOT NULL,
    komponenten_schritt character(1),
    meilenstein character(1),
    schritt_aktion character varying(255),
    schritt_typ character varying(255) NOT NULL,
    stand_typ character varying(255) NOT NULL
);


ALTER TABLE public.deva_bezeichung_prozess_schritt OWNER TO meyle;

--
-- TOC entry 243 (class 1259 OID 30170)
-- Name: deva_bezeichung_prozess_schritt_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_bezeichung_prozess_schritt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_bezeichung_prozess_schritt_id_seq OWNER TO meyle;

--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 243
-- Name: deva_bezeichung_prozess_schritt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichung_prozess_schritt_id_seq OWNED BY deva_bezeichung_prozess_schritt.id;


--
-- TOC entry 246 (class 1259 OID 30185)
-- Name: deva_bonuszeit; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bonuszeit (
    id bigint NOT NULL,
    version bigint,
    bonus_tage integer NOT NULL,
    gewaehrt_am date,
    kommentar character varying(1024) NOT NULL,
    gewaehrt_von bigint NOT NULL,
    prozess_schritt bigint,
    CONSTRAINT deva_bonuszeit_bonus_tage_check CHECK ((bonus_tage >= 1))
);


ALTER TABLE public.deva_bonuszeit OWNER TO meyle;

--
-- TOC entry 245 (class 1259 OID 30183)
-- Name: deva_bonuszeit_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_bonuszeit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_bonuszeit_id_seq OWNER TO meyle;

--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 245
-- Name: deva_bonuszeit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bonuszeit_id_seq OWNED BY deva_bonuszeit.id;


--
-- TOC entry 249 (class 1259 OID 30203)
-- Name: deva_bpmn_definition_task_handler_names; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bpmn_definition_task_handler_names (
    bpmn_definition_id bigint NOT NULL,
    taskhandlernames character varying(255)
);


ALTER TABLE public.deva_bpmn_definition_task_handler_names OWNER TO meyle;

--
-- TOC entry 248 (class 1259 OID 30197)
-- Name: deva_bpmndefinition; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bpmndefinition (
    id bigint NOT NULL,
    version bigint,
    bpmn oid NOT NULL,
    bpmn_process_id character varying(100) NOT NULL,
    bpmn_version integer NOT NULL,
    datum timestamp without time zone NOT NULL,
    name character varying(100) NOT NULL,
    prozessdefinition_id bigint
);


ALTER TABLE public.deva_bpmndefinition OWNER TO meyle;

--
-- TOC entry 247 (class 1259 OID 30195)
-- Name: deva_bpmndefinition_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_bpmndefinition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_bpmndefinition_id_seq OWNER TO meyle;

--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 247
-- Name: deva_bpmndefinition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bpmndefinition_id_seq OWNED BY deva_bpmndefinition.id;


--
-- TOC entry 251 (class 1259 OID 30208)
-- Name: deva_dokument; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_dokument (
    id bigint NOT NULL,
    version bigint,
    image_height bigint NOT NULL,
    image_width bigint NOT NULL,
    mime_type character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    data_id bigint NOT NULL,
    thumbnail_id bigint NOT NULL,
    CONSTRAINT deva_dokument_image_height_check CHECK ((image_height >= 1)),
    CONSTRAINT deva_dokument_image_width_check CHECK ((image_width >= 1))
);


ALTER TABLE public.deva_dokument OWNER TO meyle;

--
-- TOC entry 253 (class 1259 OID 30218)
-- Name: deva_dokument_binaerdaten; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_dokument_binaerdaten (
    id bigint NOT NULL,
    version bigint,
    data oid NOT NULL
);


ALTER TABLE public.deva_dokument_binaerdaten OWNER TO meyle;

--
-- TOC entry 252 (class 1259 OID 30216)
-- Name: deva_dokument_binaerdaten_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_dokument_binaerdaten_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_dokument_binaerdaten_id_seq OWNER TO meyle;

--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 252
-- Name: deva_dokument_binaerdaten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_dokument_binaerdaten_id_seq OWNED BY deva_dokument_binaerdaten.id;


--
-- TOC entry 250 (class 1259 OID 30206)
-- Name: deva_dokument_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_dokument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_dokument_id_seq OWNER TO meyle;

--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 250
-- Name: deva_dokument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_dokument_id_seq OWNED BY deva_dokument.id;


--
-- TOC entry 255 (class 1259 OID 30226)
-- Name: deva_faelligkeiten; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_faelligkeiten (
    id bigint NOT NULL,
    version bigint,
    faelligkeit_nachher bigint NOT NULL,
    singleton character varying(255) NOT NULL,
    faelligkeit_vorher bigint NOT NULL,
    CONSTRAINT deva_faelligkeiten_faelligkeit_nachher_check CHECK ((faelligkeit_nachher >= 0)),
    CONSTRAINT deva_faelligkeiten_faelligkeit_vorher_check CHECK ((faelligkeit_vorher >= 0))
);


ALTER TABLE public.deva_faelligkeiten OWNER TO meyle;

--
-- TOC entry 254 (class 1259 OID 30224)
-- Name: deva_faelligkeiten_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_faelligkeiten_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_faelligkeiten_id_seq OWNER TO meyle;

--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 254
-- Name: deva_faelligkeiten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_faelligkeiten_id_seq OWNED BY deva_faelligkeiten.id;


--
-- TOC entry 257 (class 1259 OID 30238)
-- Name: deva_fahrzeug_bezeichnung; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_fahrzeug_bezeichnung (
    id bigint NOT NULL,
    version bigint,
    bezeichnung character varying(100) NOT NULL,
    fahrzeug_typ character varying(100) NOT NULL,
    hersteller character varying(30) NOT NULL
);


ALTER TABLE public.deva_fahrzeug_bezeichnung OWNER TO meyle;

--
-- TOC entry 256 (class 1259 OID 30236)
-- Name: deva_fahrzeug_bezeichnung_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_fahrzeug_bezeichnung_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_fahrzeug_bezeichnung_id_seq OWNER TO meyle;

--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 256
-- Name: deva_fahrzeug_bezeichnung_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_fahrzeug_bezeichnung_id_seq OWNED BY deva_fahrzeug_bezeichnung.id;


--
-- TOC entry 259 (class 1259 OID 30250)
-- Name: deva_firma; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma (
    id bigint NOT NULL,
    version bigint,
    arbeitet_mit_deva character(1),
    lieferant character(1),
    name character varying(100) NOT NULL
);


ALTER TABLE public.deva_firma OWNER TO meyle;

--
-- TOC entry 260 (class 1259 OID 30258)
-- Name: deva_firma_ansprechpartner; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_ansprechpartner (
    firma_id bigint NOT NULL,
    benutzer_id bigint NOT NULL
);


ALTER TABLE public.deva_firma_ansprechpartner OWNER TO meyle;

--
-- TOC entry 258 (class 1259 OID 30248)
-- Name: deva_firma_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_firma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_firma_id_seq OWNER TO meyle;

--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 258
-- Name: deva_firma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_firma_id_seq OWNED BY deva_firma.id;


--
-- TOC entry 261 (class 1259 OID 30263)
-- Name: deva_firma_lieferanten; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_lieferanten (
    lieferant_id bigint NOT NULL,
    lieferant_fuer_firma_id bigint NOT NULL
);


ALTER TABLE public.deva_firma_lieferanten OWNER TO meyle;

--
-- TOC entry 262 (class 1259 OID 30266)
-- Name: deva_firma_sollzeiten_artikel; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_sollzeiten_artikel (
    firma_id bigint NOT NULL,
    sollzeiten_artikel_id bigint NOT NULL
);


ALTER TABLE public.deva_firma_sollzeiten_artikel OWNER TO meyle;

--
-- TOC entry 263 (class 1259 OID 30271)
-- Name: deva_firma_sollzeiten_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_sollzeiten_komponente (
    firma_id bigint NOT NULL,
    sollzeiten_komponente_id bigint NOT NULL
);


ALTER TABLE public.deva_firma_sollzeiten_komponente OWNER TO meyle;

--
-- TOC entry 265 (class 1259 OID 30278)
-- Name: deva_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente (
    id bigint NOT NULL,
    version bigint,
    ampel_status character varying(255) NOT NULL,
    beim_lieferanten_vorhanden character(1),
    klassifikation character varying(255) NOT NULL,
    komponente_prozess_status character varying(255) NOT NULL,
    orig_lieferantennummer character varying(50) NOT NULL,
    raw_lieferantennummer character varying(255) NOT NULL,
    angelegt_von bigint NOT NULL,
    artikelbild bigint,
    komponente_prozess bigint,
    komponentenbezeichnung bigint NOT NULL,
    kunde bigint NOT NULL,
    lieferant bigint
);


ALTER TABLE public.deva_komponente OWNER TO meyle;

--
-- TOC entry 267 (class 1259 OID 30289)
-- Name: deva_komponente_bestandteil; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_bestandteil (
    id bigint NOT NULL,
    version bigint,
    anzahl bigint NOT NULL,
    hinweis character varying(100) NOT NULL,
    komponente bigint NOT NULL,
    komponente_bestandteil bigint NOT NULL,
    CONSTRAINT deva_komponente_bestandteil_anzahl_check CHECK ((anzahl >= 1))
);


ALTER TABLE public.deva_komponente_bestandteil OWNER TO meyle;

--
-- TOC entry 266 (class 1259 OID 30287)
-- Name: deva_komponente_bestandteil_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_komponente_bestandteil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_komponente_bestandteil_id_seq OWNER TO meyle;

--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 266
-- Name: deva_komponente_bestandteil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_komponente_bestandteil_id_seq OWNED BY deva_komponente_bestandteil.id;


--
-- TOC entry 268 (class 1259 OID 30296)
-- Name: deva_komponente_dokumente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_dokumente (
    komponente_id bigint NOT NULL,
    dokument_id bigint NOT NULL
);


ALTER TABLE public.deva_komponente_dokumente OWNER TO meyle;

--
-- TOC entry 264 (class 1259 OID 30276)
-- Name: deva_komponente_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_komponente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_komponente_id_seq OWNER TO meyle;

--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 264
-- Name: deva_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_komponente_id_seq OWNED BY deva_komponente.id;


--
-- TOC entry 270 (class 1259 OID 30303)
-- Name: deva_komponente_kommentar; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_kommentar (
    id bigint NOT NULL,
    version bigint,
    datum timestamp without time zone NOT NULL,
    text character varying(1024) NOT NULL,
    benutzer bigint NOT NULL,
    komponente_id bigint
);


ALTER TABLE public.deva_komponente_kommentar OWNER TO meyle;

--
-- TOC entry 269 (class 1259 OID 30301)
-- Name: deva_komponente_kommentar_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_komponente_kommentar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_komponente_kommentar_id_seq OWNER TO meyle;

--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 269
-- Name: deva_komponente_kommentar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_komponente_kommentar_id_seq OWNED BY deva_komponente_kommentar.id;


--
-- TOC entry 272 (class 1259 OID 30314)
-- Name: deva_komponente_logbuch; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_logbuch (
    id bigint NOT NULL,
    version bigint,
    aktion character varying(255) NOT NULL,
    bezugsobjekt_text character varying(100) NOT NULL,
    datum timestamp without time zone NOT NULL,
    benutzer bigint NOT NULL,
    komponente_id bigint
);


ALTER TABLE public.deva_komponente_logbuch OWNER TO meyle;

--
-- TOC entry 271 (class 1259 OID 30312)
-- Name: deva_komponente_logbuch_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_komponente_logbuch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_komponente_logbuch_id_seq OWNER TO meyle;

--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 271
-- Name: deva_komponente_logbuch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_komponente_logbuch_id_seq OWNED BY deva_komponente_logbuch.id;


--
-- TOC entry 274 (class 1259 OID 30325)
-- Name: deva_komponente_verantwortliche; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_verantwortliche (
    komponente_id bigint NOT NULL,
    verantwortlicher_id bigint NOT NULL
);


ALTER TABLE public.deva_komponente_verantwortliche OWNER TO meyle;

--
-- TOC entry 275 (class 1259 OID 30328)
-- Name: deva_komponente_zusatzinformationen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_zusatzinformationen (
    komponente_id bigint NOT NULL,
    zusatzinfo_id bigint NOT NULL
);


ALTER TABLE public.deva_komponente_zusatzinformationen OWNER TO meyle;

--
-- TOC entry 277 (class 1259 OID 30335)
-- Name: deva_produktgruppe; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_produktgruppe (
    id bigint NOT NULL,
    version bigint,
    bezeichnung bigint NOT NULL,
    obergruppe bigint
);


ALTER TABLE public.deva_produktgruppe OWNER TO meyle;

--
-- TOC entry 276 (class 1259 OID 30333)
-- Name: deva_produktgruppe_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_produktgruppe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_produktgruppe_id_seq OWNER TO meyle;

--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 276
-- Name: deva_produktgruppe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_produktgruppe_id_seq OWNED BY deva_produktgruppe.id;


--
-- TOC entry 279 (class 1259 OID 30343)
-- Name: deva_prozess; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_prozess (
    id bigint NOT NULL,
    version bigint,
    soll_datum date NOT NULL,
    ampel_status character varying(255) NOT NULL,
    ksession_id bigint,
    process_id bigint NOT NULL,
    workitem_id bigint,
    bpmn_definition bigint NOT NULL,
    naechster_meilenstein bigint NOT NULL,
    prozess_definition bigint NOT NULL
);


ALTER TABLE public.deva_prozess OWNER TO meyle;

--
-- TOC entry 278 (class 1259 OID 30341)
-- Name: deva_prozess_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_prozess_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_prozess_id_seq OWNER TO meyle;

--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 278
-- Name: deva_prozess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_prozess_id_seq OWNED BY deva_prozess.id;


--
-- TOC entry 283 (class 1259 OID 30361)
-- Name: deva_prozess_schritt; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_prozess_schritt (
    id bigint NOT NULL,
    version bigint,
    ist_datum date,
    soll_datum date,
    typ character varying(100),
    zaehler integer,
    zuletzt_bestaetigt character(1),
    weitergeschaltet_datum date,
    prozess_schritt_definition bigint NOT NULL,
    aktueller_schritt bigint,
    index_aktueller_schritt integer,
    abgeschlossener_schritt bigint,
    index_abgeschlossener_schritt integer
);


ALTER TABLE public.deva_prozess_schritt OWNER TO meyle;

--
-- TOC entry 282 (class 1259 OID 30359)
-- Name: deva_prozess_schritt_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_prozess_schritt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_prozess_schritt_id_seq OWNER TO meyle;

--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 282
-- Name: deva_prozess_schritt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_prozess_schritt_id_seq OWNED BY deva_prozess_schritt.id;


--
-- TOC entry 281 (class 1259 OID 30353)
-- Name: deva_prozessdefinition; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_prozessdefinition (
    id bigint NOT NULL,
    version bigint,
    prozessart character varying(255) NOT NULL,
    kunde bigint NOT NULL,
    lieferant bigint NOT NULL
);


ALTER TABLE public.deva_prozessdefinition OWNER TO meyle;

--
-- TOC entry 280 (class 1259 OID 30351)
-- Name: deva_prozessdefinition_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_prozessdefinition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_prozessdefinition_id_seq OWNER TO meyle;

--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 280
-- Name: deva_prozessdefinition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_prozessdefinition_id_seq OWNED BY deva_prozessdefinition.id;


--
-- TOC entry 285 (class 1259 OID 30369)
-- Name: deva_rolle; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle (
    id bigint NOT NULL,
    version bigint,
    feste_rolle character(1),
    rolle character varying(100) NOT NULL
);


ALTER TABLE public.deva_rolle OWNER TO meyle;

--
-- TOC entry 286 (class 1259 OID 30377)
-- Name: deva_rolle_aktions_berechtigungen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_aktions_berechtigungen (
    berechtigung_id bigint NOT NULL,
    aktion_berechtigungen character varying(255)
);


ALTER TABLE public.deva_rolle_aktions_berechtigungen OWNER TO meyle;

--
-- TOC entry 287 (class 1259 OID 30380)
-- Name: deva_rolle_ampelstatus; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_ampelstatus (
    ampelstatus_id bigint NOT NULL,
    ampelstatus character varying(255)
);


ALTER TABLE public.deva_rolle_ampelstatus OWNER TO meyle;

--
-- TOC entry 284 (class 1259 OID 30367)
-- Name: deva_rolle_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_rolle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_rolle_id_seq OWNER TO meyle;

--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 284
-- Name: deva_rolle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_rolle_id_seq OWNED BY deva_rolle.id;


--
-- TOC entry 288 (class 1259 OID 30383)
-- Name: deva_rolle_prozess_schritt; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_prozess_schritt (
    rolle bigint NOT NULL,
    prozess_schritt_definition bigint NOT NULL
);


ALTER TABLE public.deva_rolle_prozess_schritt OWNER TO meyle;

--
-- TOC entry 289 (class 1259 OID 30388)
-- Name: deva_rolle_sicht_berechtigungen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_sicht_berechtigungen (
    berechtigung_id bigint NOT NULL,
    sicht_berechtigungen character varying(255)
);


ALTER TABLE public.deva_rolle_sicht_berechtigungen OWNER TO meyle;

--
-- TOC entry 293 (class 1259 OID 30406)
-- Name: deva_sollzeit_wdh_klassifikation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_sollzeit_wdh_klassifikation (
    sollzeiten_id bigint NOT NULL,
    sollzeit bigint,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_sollzeit_wdh_klassifikation OWNER TO meyle;

--
-- TOC entry 291 (class 1259 OID 30393)
-- Name: deva_sollzeiten; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_sollzeiten (
    id bigint NOT NULL,
    version bigint,
    sollzeit_bereits_vorhanden bigint,
    sollzeit_bereits_vorhanden_wdh bigint,
    meilenstein_definition bigint NOT NULL,
    CONSTRAINT deva_sollzeiten_sollzeit_bereits_vorhanden_check CHECK ((sollzeit_bereits_vorhanden >= 1)),
    CONSTRAINT deva_sollzeiten_sollzeit_bereits_vorhanden_wdh_check CHECK ((sollzeit_bereits_vorhanden_wdh >= 1))
);


ALTER TABLE public.deva_sollzeiten OWNER TO meyle;

--
-- TOC entry 290 (class 1259 OID 30391)
-- Name: deva_sollzeiten_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_sollzeiten_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_sollzeiten_id_seq OWNER TO meyle;

--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 290
-- Name: deva_sollzeiten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_sollzeiten_id_seq OWNED BY deva_sollzeiten.id;


--
-- TOC entry 292 (class 1259 OID 30401)
-- Name: deva_sollzeiten_klassifikation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_sollzeiten_klassifikation (
    sollzeiten_id bigint NOT NULL,
    sollzeit bigint,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_sollzeiten_klassifikation OWNER TO meyle;

--
-- TOC entry 295 (class 1259 OID 30413)
-- Name: deva_uebersetzung_artikel; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_uebersetzung_artikel (
    id bigint NOT NULL,
    version bigint,
    locale character varying(2) NOT NULL,
    wort character varying(100) NOT NULL,
    bezeichnung bigint
);


ALTER TABLE public.deva_uebersetzung_artikel OWNER TO meyle;

--
-- TOC entry 294 (class 1259 OID 30411)
-- Name: deva_uebersetzung_artikel_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_uebersetzung_artikel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_uebersetzung_artikel_id_seq OWNER TO meyle;

--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 294
-- Name: deva_uebersetzung_artikel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_artikel_id_seq OWNED BY deva_uebersetzung_artikel.id;


--
-- TOC entry 297 (class 1259 OID 30421)
-- Name: deva_uebersetzung_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_uebersetzung_komponente (
    id bigint NOT NULL,
    version bigint,
    locale character varying(2) NOT NULL,
    wort character varying(100) NOT NULL,
    bezeichnung bigint
);


ALTER TABLE public.deva_uebersetzung_komponente OWNER TO meyle;

--
-- TOC entry 296 (class 1259 OID 30419)
-- Name: deva_uebersetzung_komponente_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_uebersetzung_komponente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_uebersetzung_komponente_id_seq OWNER TO meyle;

--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 296
-- Name: deva_uebersetzung_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_komponente_id_seq OWNED BY deva_uebersetzung_komponente.id;


--
-- TOC entry 299 (class 1259 OID 30429)
-- Name: deva_uebersetzung_produktgruppe; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_uebersetzung_produktgruppe (
    id bigint NOT NULL,
    version bigint,
    locale character varying(2) NOT NULL,
    wort character varying(100) NOT NULL,
    bezeichnung bigint
);


ALTER TABLE public.deva_uebersetzung_produktgruppe OWNER TO meyle;

--
-- TOC entry 298 (class 1259 OID 30427)
-- Name: deva_uebersetzung_produktgruppe_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_uebersetzung_produktgruppe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_uebersetzung_produktgruppe_id_seq OWNER TO meyle;

--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 298
-- Name: deva_uebersetzung_produktgruppe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_produktgruppe_id_seq OWNED BY deva_uebersetzung_produktgruppe.id;


--
-- TOC entry 301 (class 1259 OID 30437)
-- Name: deva_uebersetzung_prozess_schritt; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_uebersetzung_prozess_schritt (
    id bigint NOT NULL,
    version bigint,
    locale character varying(2) NOT NULL,
    wort character varying(100) NOT NULL,
    bezeichnung bigint
);


ALTER TABLE public.deva_uebersetzung_prozess_schritt OWNER TO meyle;

--
-- TOC entry 300 (class 1259 OID 30435)
-- Name: deva_uebersetzung_prozess_schritt_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_uebersetzung_prozess_schritt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_uebersetzung_prozess_schritt_id_seq OWNER TO meyle;

--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 300
-- Name: deva_uebersetzung_prozess_schritt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_prozess_schritt_id_seq OWNED BY deva_uebersetzung_prozess_schritt.id;


--
-- TOC entry 303 (class 1259 OID 30445)
-- Name: deva_uebersetzung_zubehoer; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_uebersetzung_zubehoer (
    id bigint NOT NULL,
    version bigint,
    locale character varying(2) NOT NULL,
    wort character varying(100) NOT NULL,
    bezeichnung bigint
);


ALTER TABLE public.deva_uebersetzung_zubehoer OWNER TO meyle;

--
-- TOC entry 302 (class 1259 OID 30443)
-- Name: deva_uebersetzung_zubehoer_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_uebersetzung_zubehoer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_uebersetzung_zubehoer_id_seq OWNER TO meyle;

--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 302
-- Name: deva_uebersetzung_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_zubehoer_id_seq OWNED BY deva_uebersetzung_zubehoer.id;


--
-- TOC entry 305 (class 1259 OID 30453)
-- Name: deva_uebersetzung_zusatzinformation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_uebersetzung_zusatzinformation (
    id bigint NOT NULL,
    version bigint,
    locale character varying(2) NOT NULL,
    wort character varying(100) NOT NULL,
    bezeichnung bigint
);


ALTER TABLE public.deva_uebersetzung_zusatzinformation OWNER TO meyle;

--
-- TOC entry 304 (class 1259 OID 30451)
-- Name: deva_uebersetzung_zusatzinformation_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_uebersetzung_zusatzinformation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_uebersetzung_zusatzinformation_id_seq OWNER TO meyle;

--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 304
-- Name: deva_uebersetzung_zusatzinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_zusatzinformation_id_seq OWNED BY deva_uebersetzung_zusatzinformation.id;


--
-- TOC entry 307 (class 1259 OID 30461)
-- Name: deva_zubehoer; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_zubehoer (
    id bigint NOT NULL,
    version bigint,
    klassifikation character varying(255) NOT NULL,
    orig_oenummer character varying(50) NOT NULL,
    raw_oenummer character varying(255) NOT NULL,
    zubehoerbezeichnung bigint NOT NULL
);


ALTER TABLE public.deva_zubehoer OWNER TO meyle;

--
-- TOC entry 306 (class 1259 OID 30459)
-- Name: deva_zubehoer_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_zubehoer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_zubehoer_id_seq OWNER TO meyle;

--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 306
-- Name: deva_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_zubehoer_id_seq OWNED BY deva_zubehoer.id;


--
-- TOC entry 309 (class 1259 OID 30472)
-- Name: deva_zusatzinformation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_zusatzinformation (
    id bigint NOT NULL,
    version bigint,
    wert character varying(1024) NOT NULL,
    zusatzinformationbezeichnung bigint NOT NULL
);


ALTER TABLE public.deva_zusatzinformation OWNER TO meyle;

--
-- TOC entry 308 (class 1259 OID 30470)
-- Name: deva_zusatzinformation_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE deva_zusatzinformation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deva_zusatzinformation_id_seq OWNER TO meyle;

--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 308
-- Name: deva_zusatzinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_zusatzinformation_id_seq OWNED BY deva_zusatzinformation.id;


--
-- TOC entry 172 (class 1259 OID 29690)
-- Name: drools_sessioninfo; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE drools_sessioninfo (
    id integer NOT NULL,
    lastmodificationdate timestamp without time zone,
    rulesbytearray oid,
    startdate timestamp without time zone,
    optlock integer
);


ALTER TABLE public.drools_sessioninfo OWNER TO meyle;

--
-- TOC entry 173 (class 1259 OID 29695)
-- Name: drools_workiteminfo; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE drools_workiteminfo (
    workitemid bigint NOT NULL,
    creationdate timestamp without time zone,
    name character varying(255),
    processinstanceid bigint NOT NULL,
    state bigint NOT NULL,
    optlock integer,
    workitembytearray oid
);


ALTER TABLE public.drools_workiteminfo OWNER TO meyle;

--
-- TOC entry 204 (class 1259 OID 29994)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO meyle;

--
-- TOC entry 174 (class 1259 OID 29700)
-- Name: jbpm_attachment; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_attachment (
    id bigint NOT NULL,
    accesstype integer,
    attachedat timestamp without time zone,
    attachmentcontentid bigint NOT NULL,
    contenttype character varying(255),
    name character varying(255),
    attachment_size integer,
    attachedby_id character varying(255),
    taskdata_attachments_id bigint
);


ALTER TABLE public.jbpm_attachment OWNER TO meyle;

--
-- TOC entry 175 (class 1259 OID 29708)
-- Name: jbpm_boolean_expression; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_boolean_expression (
    id bigint NOT NULL,
    expression text,
    type character varying(255),
    escalation_constraints_id bigint
);


ALTER TABLE public.jbpm_boolean_expression OWNER TO meyle;

--
-- TOC entry 176 (class 1259 OID 29716)
-- Name: jbpm_content; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_content (
    id bigint NOT NULL,
    content oid
);


ALTER TABLE public.jbpm_content OWNER TO meyle;

--
-- TOC entry 177 (class 1259 OID 29721)
-- Name: jbpm_deadline; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_deadline (
    id bigint NOT NULL,
    deadline_date date,
    escalated integer NOT NULL,
    deadlines_startdeadline_id bigint,
    deadlines_enddeadline_id bigint
);


ALTER TABLE public.jbpm_deadline OWNER TO meyle;

--
-- TOC entry 178 (class 1259 OID 29726)
-- Name: jbpm_delegation_delegates; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_delegation_delegates (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_delegation_delegates OWNER TO meyle;

--
-- TOC entry 179 (class 1259 OID 29729)
-- Name: jbpm_email_header; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_email_header (
    id bigint NOT NULL,
    body text,
    fromaddress character varying(255),
    language character varying(255),
    replytoaddress character varying(255),
    subject character varying(255)
);


ALTER TABLE public.jbpm_email_header OWNER TO meyle;

--
-- TOC entry 180 (class 1259 OID 29737)
-- Name: jbpm_email_notification; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_email_notification (
    id bigint NOT NULL,
    priority integer NOT NULL,
    escalation_notifications_id bigint
);


ALTER TABLE public.jbpm_email_notification OWNER TO meyle;

--
-- TOC entry 181 (class 1259 OID 29742)
-- Name: jbpm_email_notification_jbpm_email_header; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_email_notification_jbpm_email_header (
    jbpm_email_notification_id bigint NOT NULL,
    emailheaders_id bigint NOT NULL,
    emailheaders_key character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_email_notification_jbpm_email_header OWNER TO meyle;

--
-- TOC entry 182 (class 1259 OID 29749)
-- Name: jbpm_escalation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_escalation (
    id bigint NOT NULL,
    name character varying(255),
    deadline_escalation_id bigint
);


ALTER TABLE public.jbpm_escalation OWNER TO meyle;

--
-- TOC entry 183 (class 1259 OID 29754)
-- Name: jbpm_group; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_group (
    id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_group OWNER TO meyle;

--
-- TOC entry 184 (class 1259 OID 29759)
-- Name: jbpm_i18ntext; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_i18ntext (
    id bigint NOT NULL,
    language character varying(255),
    text text,
    task_subjects_id bigint,
    task_names_id bigint,
    task_descriptions_id bigint,
    reassignment_documentation_id bigint,
    notification_subjects_id bigint,
    notification_names_id bigint,
    notification_documentation_id bigint,
    notification_descriptions_id bigint,
    deadline_documentation_id bigint
);


ALTER TABLE public.jbpm_i18ntext OWNER TO meyle;

--
-- TOC entry 185 (class 1259 OID 29767)
-- Name: jbpm_notification; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_notification (
    id bigint NOT NULL,
    priority integer NOT NULL,
    escalation_notifications_id bigint
);


ALTER TABLE public.jbpm_notification OWNER TO meyle;

--
-- TOC entry 186 (class 1259 OID 29772)
-- Name: jbpm_notification_bas; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_notification_bas (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_notification_bas OWNER TO meyle;

--
-- TOC entry 187 (class 1259 OID 29775)
-- Name: jbpm_notification_recipients; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_notification_recipients (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_notification_recipients OWNER TO meyle;

--
-- TOC entry 188 (class 1259 OID 29778)
-- Name: jbpm_peopleassignments_bas; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_bas (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_bas OWNER TO meyle;

--
-- TOC entry 189 (class 1259 OID 29781)
-- Name: jbpm_peopleassignments_exclowners; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_exclowners (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_exclowners OWNER TO meyle;

--
-- TOC entry 190 (class 1259 OID 29784)
-- Name: jbpm_peopleassignments_potowners; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_potowners (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_potowners OWNER TO meyle;

--
-- TOC entry 191 (class 1259 OID 29787)
-- Name: jbpm_peopleassignments_recipients; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_recipients (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_recipients OWNER TO meyle;

--
-- TOC entry 192 (class 1259 OID 29790)
-- Name: jbpm_peopleassignments_stakeholders; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_stakeholders (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_stakeholders OWNER TO meyle;

--
-- TOC entry 193 (class 1259 OID 29793)
-- Name: jbpm_processinstance_eventinfo; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_processinstance_eventinfo (
    id bigint NOT NULL,
    eventtype character varying(255),
    processinstanceid bigint NOT NULL,
    optlock integer
);


ALTER TABLE public.jbpm_processinstance_eventinfo OWNER TO meyle;

--
-- TOC entry 194 (class 1259 OID 29798)
-- Name: jbpm_processinstance_info; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_processinstance_info (
    instanceid bigint NOT NULL,
    lastmodificationdate timestamp without time zone,
    lastreaddate timestamp without time zone,
    processid character varying(255),
    processinstancebytearray oid,
    startdate timestamp without time zone,
    state integer NOT NULL,
    optlock integer
);


ALTER TABLE public.jbpm_processinstance_info OWNER TO meyle;

--
-- TOC entry 195 (class 1259 OID 29803)
-- Name: jbpm_processinstance_info_eventtypes; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_processinstance_info_eventtypes (
    jbpm_processinstance_info_id bigint NOT NULL,
    eventtypes character varying(255)
);


ALTER TABLE public.jbpm_processinstance_info_eventtypes OWNER TO meyle;

--
-- TOC entry 196 (class 1259 OID 29806)
-- Name: jbpm_reassignment; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_reassignment (
    id bigint NOT NULL,
    escalation_reassignments_id bigint
);


ALTER TABLE public.jbpm_reassignment OWNER TO meyle;

--
-- TOC entry 197 (class 1259 OID 29811)
-- Name: jbpm_reassignment_potentialowners; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_reassignment_potentialowners (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_reassignment_potentialowners OWNER TO meyle;

--
-- TOC entry 198 (class 1259 OID 29814)
-- Name: jbpm_subtasksstrategy; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_subtasksstrategy (
    dtype character varying(100) NOT NULL,
    id bigint NOT NULL,
    name character varying(255),
    task_id bigint
);


ALTER TABLE public.jbpm_subtasksstrategy OWNER TO meyle;

--
-- TOC entry 199 (class 1259 OID 29819)
-- Name: jbpm_task; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_task (
    id bigint NOT NULL,
    allowedtodelegate character varying(255),
    priority integer NOT NULL,
    activationtime timestamp without time zone,
    createdon date,
    documentaccesstype character varying(255),
    documentcontentid bigint NOT NULL,
    documenttype character varying(255),
    expirationtime timestamp without time zone,
    faultaccesstype character varying(255),
    faultcontentid bigint NOT NULL,
    faultname character varying(255),
    faulttype character varying(255),
    outputaccesstype character varying(255),
    outputcontentid bigint NOT NULL,
    outputtype character varying(255),
    parentid bigint NOT NULL,
    previousstatus integer,
    processinstanceid bigint NOT NULL,
    skipable integer NOT NULL,
    status character varying(255),
    workitemid bigint NOT NULL,
    taskinitiator_id character varying(255),
    actualowner_id character varying(255),
    createdby_id character varying(255)
);


ALTER TABLE public.jbpm_task OWNER TO meyle;

--
-- TOC entry 200 (class 1259 OID 29827)
-- Name: jbpm_task_comment; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_task_comment (
    id bigint NOT NULL,
    addedat timestamp without time zone,
    text text,
    addedby_id character varying(255),
    taskdata_comments_id bigint
);


ALTER TABLE public.jbpm_task_comment OWNER TO meyle;

--
-- TOC entry 201 (class 1259 OID 29835)
-- Name: jbpm_user; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_user (
    id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_user OWNER TO meyle;

--
-- TOC entry 202 (class 1259 OID 29990)
-- Name: sessioninfo_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE sessioninfo_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessioninfo_id_seq OWNER TO meyle;

--
-- TOC entry 203 (class 1259 OID 29992)
-- Name: workiteminfo_id_seq; Type: SEQUENCE; Schema: public; Owner: meyle
--

CREATE SEQUENCE workiteminfo_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workiteminfo_id_seq OWNER TO meyle;


--
-- TOC entry 2664 (class 2604 OID 30009)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_angemeldeter_benutzer ALTER COLUMN id SET DEFAULT nextval('deva_angemeldeter_benutzer_id_seq'::regclass);


--
-- TOC entry 2665 (class 2604 OID 30017)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel ALTER COLUMN id SET DEFAULT nextval('deva_artikel_id_seq'::regclass);


--
-- TOC entry 2666 (class 2604 OID 30028)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_bestandteil ALTER COLUMN id SET DEFAULT nextval('deva_artikel_bestandteil_id_seq'::regclass);


--
-- TOC entry 2668 (class 2604 OID 30047)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_kommentar ALTER COLUMN id SET DEFAULT nextval('deva_artikel_kommentar_id_seq'::regclass);


--
-- TOC entry 2669 (class 2604 OID 30058)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_komponente ALTER COLUMN id SET DEFAULT nextval('deva_artikel_komponente_id_seq'::regclass);


--
-- TOC entry 2671 (class 2604 OID 30067)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_logbuch ALTER COLUMN id SET DEFAULT nextval('deva_artikel_logbuch_id_seq'::regclass);


--
-- TOC entry 2672 (class 2604 OID 30083)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_artikel_zubehoer_id_seq'::regclass);


--
-- TOC entry 2674 (class 2604 OID 30095)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer ALTER COLUMN id SET DEFAULT nextval('deva_benutzer_id_seq'::regclass);


--
-- TOC entry 2675 (class 2604 OID 30115)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_liste ALTER COLUMN id SET DEFAULT nextval('deva_benutzer_liste_id_seq'::regclass);


--
-- TOC entry 2676 (class 2604 OID 30135)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_artikel ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_artikel_id_seq'::regclass);


--
-- TOC entry 2677 (class 2604 OID 30143)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_komponente ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_komponente_id_seq'::regclass);


--
-- TOC entry 2678 (class 2604 OID 30151)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_produktgruppe ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_produktgruppe_id_seq'::regclass);


--
-- TOC entry 2679 (class 2604 OID 30159)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_zubehoer_id_seq'::regclass);


--
-- TOC entry 2680 (class 2604 OID 30167)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_zusatzinformation ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_zusatzinformation_id_seq'::regclass);


--
-- TOC entry 2681 (class 2604 OID 30175)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichung_prozess_schritt ALTER COLUMN id SET DEFAULT nextval('deva_bezeichung_prozess_schritt_id_seq'::regclass);


--
-- TOC entry 2682 (class 2604 OID 30188)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bonuszeit ALTER COLUMN id SET DEFAULT nextval('deva_bonuszeit_id_seq'::regclass);


--
-- TOC entry 2684 (class 2604 OID 30200)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bpmndefinition ALTER COLUMN id SET DEFAULT nextval('deva_bpmndefinition_id_seq'::regclass);


--
-- TOC entry 2685 (class 2604 OID 30211)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument ALTER COLUMN id SET DEFAULT nextval('deva_dokument_id_seq'::regclass);


--
-- TOC entry 2688 (class 2604 OID 30221)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument_binaerdaten ALTER COLUMN id SET DEFAULT nextval('deva_dokument_binaerdaten_id_seq'::regclass);


--
-- TOC entry 2689 (class 2604 OID 30229)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_faelligkeiten ALTER COLUMN id SET DEFAULT nextval('deva_faelligkeiten_id_seq'::regclass);


--
-- TOC entry 2692 (class 2604 OID 30241)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung ALTER COLUMN id SET DEFAULT nextval('deva_fahrzeug_bezeichnung_id_seq'::regclass);


--
-- TOC entry 2693 (class 2604 OID 30253)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma ALTER COLUMN id SET DEFAULT nextval('deva_firma_id_seq'::regclass);


--
-- TOC entry 2694 (class 2604 OID 30281)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente ALTER COLUMN id SET DEFAULT nextval('deva_komponente_id_seq'::regclass);


--
-- TOC entry 2695 (class 2604 OID 30292)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_bestandteil ALTER COLUMN id SET DEFAULT nextval('deva_komponente_bestandteil_id_seq'::regclass);


--
-- TOC entry 2697 (class 2604 OID 30306)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_kommentar ALTER COLUMN id SET DEFAULT nextval('deva_komponente_kommentar_id_seq'::regclass);


--
-- TOC entry 2698 (class 2604 OID 30317)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_logbuch ALTER COLUMN id SET DEFAULT nextval('deva_komponente_logbuch_id_seq'::regclass);


--
-- TOC entry 2699 (class 2604 OID 30338)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_produktgruppe ALTER COLUMN id SET DEFAULT nextval('deva_produktgruppe_id_seq'::regclass);


--
-- TOC entry 2700 (class 2604 OID 30346)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess ALTER COLUMN id SET DEFAULT nextval('deva_prozess_id_seq'::regclass);


--
-- TOC entry 2702 (class 2604 OID 30364)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt ALTER COLUMN id SET DEFAULT nextval('deva_prozess_schritt_id_seq'::regclass);


--
-- TOC entry 2701 (class 2604 OID 30356)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozessdefinition ALTER COLUMN id SET DEFAULT nextval('deva_prozessdefinition_id_seq'::regclass);


--
-- TOC entry 2703 (class 2604 OID 30372)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle ALTER COLUMN id SET DEFAULT nextval('deva_rolle_id_seq'::regclass);


--
-- TOC entry 2704 (class 2604 OID 30396)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeiten ALTER COLUMN id SET DEFAULT nextval('deva_sollzeiten_id_seq'::regclass);


--
-- TOC entry 2707 (class 2604 OID 30416)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_artikel ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_artikel_id_seq'::regclass);


--
-- TOC entry 2708 (class 2604 OID 30424)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_komponente ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_komponente_id_seq'::regclass);


--
-- TOC entry 2709 (class 2604 OID 30432)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_produktgruppe ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_produktgruppe_id_seq'::regclass);


--
-- TOC entry 2710 (class 2604 OID 30440)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_prozess_schritt ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_prozess_schritt_id_seq'::regclass);


--
-- TOC entry 2711 (class 2604 OID 30448)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_zubehoer_id_seq'::regclass);


--
-- TOC entry 2712 (class 2604 OID 30456)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zusatzinformation ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_zusatzinformation_id_seq'::regclass);


--
-- TOC entry 2713 (class 2604 OID 30464)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_zubehoer_id_seq'::regclass);


--
-- TOC entry 2714 (class 2604 OID 30475)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zusatzinformation ALTER COLUMN id SET DEFAULT nextval('deva_zusatzinformation_id_seq'::regclass);



--
-- TOC entry 2760 (class 2606 OID 30011)
-- Name: deva_angemeldeter_benutzer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_angemeldeter_benutzer
    ADD CONSTRAINT deva_angemeldeter_benutzer_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 30031)
-- Name: deva_artikel_bestandteil_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_bestandteil
    ADD CONSTRAINT deva_artikel_bestandteil_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 30036)
-- Name: deva_artikel_dokumente_dokument_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_dokumente
    ADD CONSTRAINT deva_artikel_dokumente_dokument_id_key UNIQUE (dokument_id);


--
-- TOC entry 2776 (class 2606 OID 30041)
-- Name: deva_artikel_fahrzeuge_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_fahrzeuge
    ADD CONSTRAINT deva_artikel_fahrzeuge_pkey PRIMARY KEY (artikel_id, sort_order);


--
-- TOC entry 2778 (class 2606 OID 30052)
-- Name: deva_artikel_kommentar_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_kommentar
    ADD CONSTRAINT deva_artikel_kommentar_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 30061)
-- Name: deva_artikel_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_komponente
    ADD CONSTRAINT deva_artikel_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 30069)
-- Name: deva_artikel_logbuch_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_logbuch
    ADD CONSTRAINT deva_artikel_logbuch_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 30022)
-- Name: deva_artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT deva_artikel_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 30086)
-- Name: deva_artikel_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_zubehoer
    ADD CONSTRAINT deva_artikel_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 30109)
-- Name: deva_benutzer_firma_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_firma
    ADD CONSTRAINT deva_benutzer_firma_pkey PRIMARY KEY (benutzer, zugeordnete_firma);


--
-- TOC entry 2797 (class 2606 OID 30117)
-- Name: deva_benutzer_liste_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_liste
    ADD CONSTRAINT deva_benutzer_liste_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 30119)
-- Name: deva_benutzer_liste_singleton_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_liste
    ADD CONSTRAINT deva_benutzer_liste_singleton_key UNIQUE (singleton);


--
-- TOC entry 2788 (class 2606 OID 30104)
-- Name: deva_benutzer_name_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT deva_benutzer_name_key UNIQUE (name);


--
-- TOC entry 2790 (class 2606 OID 30100)
-- Name: deva_benutzer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT deva_benutzer_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 30124)
-- Name: deva_benutzer_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_produktgruppe
    ADD CONSTRAINT deva_benutzer_produktgruppe_pkey PRIMARY KEY (benutzer, produktgruppe);


--
-- TOC entry 2803 (class 2606 OID 30129)
-- Name: deva_benutzer_rollen_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_rollen
    ADD CONSTRAINT deva_benutzer_rollen_pkey PRIMARY KEY (benutzer, rolle);


--
-- TOC entry 2792 (class 2606 OID 30102)
-- Name: deva_benutzer_username_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT deva_benutzer_username_key UNIQUE (username);


--
-- TOC entry 2805 (class 2606 OID 30137)
-- Name: deva_bezeichnung_artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_artikel
    ADD CONSTRAINT deva_bezeichnung_artikel_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 30145)
-- Name: deva_bezeichnung_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_komponente
    ADD CONSTRAINT deva_bezeichnung_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 30153)
-- Name: deva_bezeichnung_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_produktgruppe
    ADD CONSTRAINT deva_bezeichnung_produktgruppe_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 30161)
-- Name: deva_bezeichnung_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_zubehoer
    ADD CONSTRAINT deva_bezeichnung_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 30169)
-- Name: deva_bezeichnung_zusatzinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_zusatzinformation
    ADD CONSTRAINT deva_bezeichnung_zusatzinformation_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 30182)
-- Name: deva_bezeichung_prozess_schritt_identifier_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichung_prozess_schritt
    ADD CONSTRAINT deva_bezeichung_prozess_schritt_identifier_key UNIQUE (identifier);


--
-- TOC entry 2818 (class 2606 OID 30180)
-- Name: deva_bezeichung_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichung_prozess_schritt
    ADD CONSTRAINT deva_bezeichung_prozess_schritt_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 30194)
-- Name: deva_bonuszeit_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bonuszeit
    ADD CONSTRAINT deva_bonuszeit_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 30202)
-- Name: deva_bpmndefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bpmndefinition
    ADD CONSTRAINT deva_bpmndefinition_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 30223)
-- Name: deva_dokument_binaerdaten_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_dokument_binaerdaten
    ADD CONSTRAINT deva_dokument_binaerdaten_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 30215)
-- Name: deva_dokument_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_dokument
    ADD CONSTRAINT deva_dokument_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 30233)
-- Name: deva_faelligkeiten_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_faelligkeiten
    ADD CONSTRAINT deva_faelligkeiten_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 30235)
-- Name: deva_faelligkeiten_singleton_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_faelligkeiten
    ADD CONSTRAINT deva_faelligkeiten_singleton_key UNIQUE (singleton);


--
-- TOC entry 2833 (class 2606 OID 30245)
-- Name: deva_fahrzeug_bezeichnung_bezeichnung_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung
    ADD CONSTRAINT deva_fahrzeug_bezeichnung_bezeichnung_key UNIQUE (bezeichnung);


--
-- TOC entry 2835 (class 2606 OID 30247)
-- Name: deva_fahrzeug_bezeichnung_fahrzeug_typ_hersteller_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung
    ADD CONSTRAINT deva_fahrzeug_bezeichnung_fahrzeug_typ_hersteller_key UNIQUE (fahrzeug_typ, hersteller);


--
-- TOC entry 2837 (class 2606 OID 30243)
-- Name: deva_fahrzeug_bezeichnung_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung
    ADD CONSTRAINT deva_fahrzeug_bezeichnung_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 30262)
-- Name: deva_firma_ansprechpartner_benutzer_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma_ansprechpartner
    ADD CONSTRAINT deva_firma_ansprechpartner_benutzer_id_key UNIQUE (benutzer_id);


--
-- TOC entry 2839 (class 2606 OID 30257)
-- Name: deva_firma_name_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma
    ADD CONSTRAINT deva_firma_name_key UNIQUE (name);


--
-- TOC entry 2841 (class 2606 OID 30255)
-- Name: deva_firma_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma
    ADD CONSTRAINT deva_firma_pkey PRIMARY KEY (id);


--
-- TOC entry 2845 (class 2606 OID 30270)
-- Name: deva_firma_sollzeiten_artikel_sollzeiten_artikel_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma_sollzeiten_artikel
    ADD CONSTRAINT deva_firma_sollzeiten_artikel_sollzeiten_artikel_id_key UNIQUE (sollzeiten_artikel_id);


--
-- TOC entry 2847 (class 2606 OID 30275)
-- Name: deva_firma_sollzeiten_komponente_sollzeiten_komponente_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma_sollzeiten_komponente
    ADD CONSTRAINT deva_firma_sollzeiten_komponente_sollzeiten_komponente_id_key UNIQUE (sollzeiten_komponente_id);


--
-- TOC entry 2852 (class 2606 OID 30295)
-- Name: deva_komponente_bestandteil_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_bestandteil
    ADD CONSTRAINT deva_komponente_bestandteil_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 30300)
-- Name: deva_komponente_dokumente_dokument_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_dokumente
    ADD CONSTRAINT deva_komponente_dokumente_dokument_id_key UNIQUE (dokument_id);


--
-- TOC entry 2856 (class 2606 OID 30311)
-- Name: deva_komponente_kommentar_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_kommentar
    ADD CONSTRAINT deva_komponente_kommentar_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 30319)
-- Name: deva_komponente_logbuch_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_logbuch
    ADD CONSTRAINT deva_komponente_logbuch_pkey PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 30286)
-- Name: deva_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT deva_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 30332)
-- Name: deva_komponente_zusatzinformationen_zusatzinfo_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_zusatzinformationen
    ADD CONSTRAINT deva_komponente_zusatzinformationen_zusatzinfo_id_key UNIQUE (zusatzinfo_id);


--
-- TOC entry 2864 (class 2606 OID 30340)
-- Name: deva_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_produktgruppe
    ADD CONSTRAINT deva_produktgruppe_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 30348)
-- Name: deva_prozess_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT deva_prozess_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 30350)
-- Name: deva_prozess_process_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT deva_prozess_process_id_key UNIQUE (process_id);


--
-- TOC entry 2872 (class 2606 OID 30366)
-- Name: deva_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT deva_prozess_schritt_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 30358)
-- Name: deva_prozessdefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozessdefinition
    ADD CONSTRAINT deva_prozessdefinition_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 30374)
-- Name: deva_rolle_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_rolle
    ADD CONSTRAINT deva_rolle_pkey PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 30387)
-- Name: deva_rolle_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_rolle_prozess_schritt
    ADD CONSTRAINT deva_rolle_prozess_schritt_pkey PRIMARY KEY (rolle, prozess_schritt_definition);


--
-- TOC entry 2876 (class 2606 OID 30376)
-- Name: deva_rolle_rolle_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_rolle
    ADD CONSTRAINT deva_rolle_rolle_key UNIQUE (rolle);


--
-- TOC entry 2884 (class 2606 OID 30410)
-- Name: deva_sollzeit_wdh_klassifikation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_sollzeit_wdh_klassifikation
    ADD CONSTRAINT deva_sollzeit_wdh_klassifikation_pkey PRIMARY KEY (sollzeiten_id, klassifikation);


--
-- TOC entry 2882 (class 2606 OID 30405)
-- Name: deva_sollzeiten_klassifikation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_sollzeiten_klassifikation
    ADD CONSTRAINT deva_sollzeiten_klassifikation_pkey PRIMARY KEY (sollzeiten_id, klassifikation);


--
-- TOC entry 2880 (class 2606 OID 30400)
-- Name: deva_sollzeiten_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_sollzeiten
    ADD CONSTRAINT deva_sollzeiten_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 30418)
-- Name: deva_uebersetzung_artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_artikel
    ADD CONSTRAINT deva_uebersetzung_artikel_pkey PRIMARY KEY (id);


--
-- TOC entry 2888 (class 2606 OID 30426)
-- Name: deva_uebersetzung_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_komponente
    ADD CONSTRAINT deva_uebersetzung_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 30434)
-- Name: deva_uebersetzung_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_produktgruppe
    ADD CONSTRAINT deva_uebersetzung_produktgruppe_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 30442)
-- Name: deva_uebersetzung_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_prozess_schritt
    ADD CONSTRAINT deva_uebersetzung_prozess_schritt_pkey PRIMARY KEY (id);


--
-- TOC entry 2894 (class 2606 OID 30450)
-- Name: deva_uebersetzung_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_zubehoer
    ADD CONSTRAINT deva_uebersetzung_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 30458)
-- Name: deva_uebersetzung_zusatzinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_zusatzinformation
    ADD CONSTRAINT deva_uebersetzung_zusatzinformation_pkey PRIMARY KEY (id);


--
-- TOC entry 2898 (class 2606 OID 30469)
-- Name: deva_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_zubehoer
    ADD CONSTRAINT deva_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2900 (class 2606 OID 30480)
-- Name: deva_zusatzinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_zusatzinformation
    ADD CONSTRAINT deva_zusatzinformation_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 29694)
-- Name: drools_sessioninfo_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY drools_sessioninfo
    ADD CONSTRAINT drools_sessioninfo_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 29699)
-- Name: drools_workiteminfo_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY drools_workiteminfo
    ADD CONSTRAINT drools_workiteminfo_pkey PRIMARY KEY (workitemid);


--
-- TOC entry 2720 (class 2606 OID 29707)
-- Name: jbpm_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_attachment
    ADD CONSTRAINT jbpm_attachment_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 29715)
-- Name: jbpm_boolean_expression_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_boolean_expression
    ADD CONSTRAINT jbpm_boolean_expression_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 29720)
-- Name: jbpm_content_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_content
    ADD CONSTRAINT jbpm_content_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 29725)
-- Name: jbpm_deadline_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_deadline
    ADD CONSTRAINT jbpm_deadline_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 29736)
-- Name: jbpm_email_header_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_header
    ADD CONSTRAINT jbpm_email_header_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 29748)
-- Name: jbpm_email_notification_jbpm_email_header_emailheaders_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT jbpm_email_notification_jbpm_email_header_emailheaders_id_key UNIQUE (emailheaders_id);


--
-- TOC entry 2734 (class 2606 OID 29746)
-- Name: jbpm_email_notification_jbpm_email_header_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT jbpm_email_notification_jbpm_email_header_pkey PRIMARY KEY (jbpm_email_notification_id, emailheaders_key);


--
-- TOC entry 2730 (class 2606 OID 29741)
-- Name: jbpm_email_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_notification
    ADD CONSTRAINT jbpm_email_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 29753)
-- Name: jbpm_escalation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_escalation
    ADD CONSTRAINT jbpm_escalation_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 29758)
-- Name: jbpm_group_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_group
    ADD CONSTRAINT jbpm_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 29766)
-- Name: jbpm_i18ntext_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT jbpm_i18ntext_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 29771)
-- Name: jbpm_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_notification
    ADD CONSTRAINT jbpm_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 29797)
-- Name: jbpm_processinstance_eventinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_processinstance_eventinfo
    ADD CONSTRAINT jbpm_processinstance_eventinfo_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 29802)
-- Name: jbpm_processinstance_info_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_processinstance_info
    ADD CONSTRAINT jbpm_processinstance_info_pkey PRIMARY KEY (instanceid);


--
-- TOC entry 2748 (class 2606 OID 29810)
-- Name: jbpm_reassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_reassignment
    ADD CONSTRAINT jbpm_reassignment_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 29818)
-- Name: jbpm_subtasksstrategy_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_subtasksstrategy
    ADD CONSTRAINT jbpm_subtasksstrategy_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 29834)
-- Name: jbpm_task_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_task_comment
    ADD CONSTRAINT jbpm_task_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 29826)
-- Name: jbpm_task_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT jbpm_task_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 29839)
-- Name: jbpm_user_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_user
    ADD CONSTRAINT jbpm_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 1259 OID 30491)
-- Name: ampel_status_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX ampel_status_idx ON deva_artikel USING btree (ampel_status);


--
-- TOC entry 2762 (class 1259 OID 30492)
-- Name: artikel_filter_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX artikel_filter_idx ON deva_artikel USING btree (lieferant, kunde, ampel_status, artikelbezeichnung);


--
-- TOC entry 2763 (class 1259 OID 30494)
-- Name: artikelprozess_status_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX artikelprozess_status_idx ON deva_artikel USING btree (artikelprozess_status);


--
-- TOC entry 2831 (class 1259 OID 30706)
-- Name: bezeichnung_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX bezeichnung_idx ON deva_fahrzeug_bezeichnung USING btree (bezeichnung);


--
-- TOC entry 2793 (class 1259 OID 30634)
-- Name: firma_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX firma_idx ON deva_benutzer USING btree (firma);


--
-- TOC entry 2850 (class 1259 OID 30747)
-- Name: komponente_filter_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX komponente_filter_idx ON deva_komponente USING btree (lieferant, kunde, komponentenbezeichnung);


--
-- TOC entry 2766 (class 1259 OID 30493)
-- Name: kunde_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX kunde_idx ON deva_artikel USING btree (kunde);


--
-- TOC entry 2767 (class 1259 OID 30495)
-- Name: lieferant_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX lieferant_idx ON deva_artikel USING btree (lieferant);


--
-- TOC entry 2806 (class 1259 OID 30670)
-- Name: produktgruppe_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX produktgruppe_idx ON deva_bezeichnung_artikel USING btree (produktgruppe);


--
-- TOC entry 2768 (class 1259 OID 30498)
-- Name: raw_lieferantennummer_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX raw_lieferantennummer_idx ON deva_artikel USING btree (raw_lieferantennummer);


--
-- TOC entry 2769 (class 1259 OID 30496)
-- Name: raw_meylenummer_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX raw_meylenummer_idx ON deva_artikel USING btree (raw_meylenummer);


--
-- TOC entry 2770 (class 1259 OID 30497)
-- Name: raw_oenummer_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX raw_oenummer_idx ON deva_artikel USING btree (raw_oenummer);


--
-- TOC entry 3019 (class 2606 OID 30933)
-- Name: fk12895194c589307f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeit_wdh_klassifikation
    ADD CONSTRAINT fk12895194c589307f FOREIGN KEY (sollzeiten_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2960 (class 2606 OID 30635)
-- Name: fk129925f083e97000; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT fk129925f083e97000 FOREIGN KEY (firma) REFERENCES deva_firma(id);


--
-- TOC entry 2950 (class 2606 OID 30589)
-- Name: fk147182967ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_logbuch
    ADD CONSTRAINT fk147182967ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2951 (class 2606 OID 30584)
-- Name: fk14718296dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_logbuch
    ADD CONSTRAINT fk14718296dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2914 (class 2606 OID 29895)
-- Name: fk17e984153330f6d9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e984153330f6d9 FOREIGN KEY (deadline_documentation_id) REFERENCES jbpm_deadline(id);


--
-- TOC entry 2915 (class 2606 OID 29890)
-- Name: fk17e984155eebb6d9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e984155eebb6d9 FOREIGN KEY (reassignment_documentation_id) REFERENCES jbpm_reassignment(id);


--
-- TOC entry 2913 (class 2606 OID 29900)
-- Name: fk17e9841569b21ee8; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e9841569b21ee8 FOREIGN KEY (task_descriptions_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2911 (class 2606 OID 29910)
-- Name: fk17e9841598b62b; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e9841598b62b FOREIGN KEY (task_names_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2912 (class 2606 OID 29905)
-- Name: fk17e98415b2fa6b18; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e98415b2fa6b18 FOREIGN KEY (task_subjects_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2974 (class 2606 OID 30712)
-- Name: fk21484eb75cf6cf14; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_ansprechpartner
    ADD CONSTRAINT fk21484eb75cf6cf14 FOREIGN KEY (firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2975 (class 2606 OID 30707)
-- Name: fk21484eb7d52de102; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_ansprechpartner
    ADD CONSTRAINT fk21484eb7d52de102 FOREIGN KEY (benutzer_id) REFERENCES deva_benutzer(id);


--
-- TOC entry 2967 (class 2606 OID 30671)
-- Name: fk2477d5ba2525ea1e; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_artikel
    ADD CONSTRAINT fk2477d5ba2525ea1e FOREIGN KEY (produktgruppe) REFERENCES deva_produktgruppe(id);


--
-- TOC entry 2918 (class 2606 OID 29925)
-- Name: fk2c7efe4e36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_exclowners
    ADD CONSTRAINT fk2c7efe4e36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2963 (class 2606 OID 30655)
-- Name: fk3133f1b32525ea1e; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_produktgruppe
    ADD CONSTRAINT fk3133f1b32525ea1e FOREIGN KEY (produktgruppe) REFERENCES deva_produktgruppe(id);


--
-- TOC entry 2964 (class 2606 OID 30650)
-- Name: fk3133f1b3dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_produktgruppe
    ADD CONSTRAINT fk3133f1b3dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2924 (class 2606 OID 29955)
-- Name: fk3178ef69e17e130f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_reassignment_potentialowners
    ADD CONSTRAINT fk3178ef69e17e130f FOREIGN KEY (task_id) REFERENCES jbpm_reassignment(id);


--
-- TOC entry 3017 (class 2606 OID 30923)
-- Name: fk31b0dbce38fe1d3c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeiten
    ADD CONSTRAINT fk31b0dbce38fe1d3c FOREIGN KEY (meilenstein_definition) REFERENCES deva_bezeichung_prozess_schritt(id);


--
-- TOC entry 2917 (class 2606 OID 29920)
-- Name: fk32b3fd6236b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_bas
    ADD CONSTRAINT fk32b3fd6236b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 3015 (class 2606 OID 30908)
-- Name: fk3804709e6273aba8; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_prozess_schritt
    ADD CONSTRAINT fk3804709e6273aba8 FOREIGN KEY (rolle) REFERENCES deva_rolle(id);


--
-- TOC entry 3014 (class 2606 OID 30913)
-- Name: fk3804709e75b486b9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_prozess_schritt
    ADD CONSTRAINT fk3804709e75b486b9 FOREIGN KEY (prozess_schritt_definition) REFERENCES deva_bezeichung_prozess_schritt(id);


--

--
-- TOC entry 2993 (class 2606 OID 30798)
-- Name: fk3b7548acdc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_kommentar
    ADD CONSTRAINT fk3b7548acdc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2992 (class 2606 OID 30803)
-- Name: fk3b7548acdfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_kommentar
    ADD CONSTRAINT fk3b7548acdfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2904 (class 2606 OID 29860)
-- Name: fk414b622227abeb8a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_deadline
    ADD CONSTRAINT fk414b622227abeb8a FOREIGN KEY (deadlines_enddeadline_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2905 (class 2606 OID 29855)
-- Name: fk414b6222684baca3; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_deadline
    ADD CONSTRAINT fk414b6222684baca3 FOREIGN KEY (deadlines_startdeadline_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2922 (class 2606 OID 29945)
-- Name: fk42e004eb2143f831; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_processinstance_info_eventtypes
    ADD CONSTRAINT fk42e004eb2143f831 FOREIGN KEY (jbpm_processinstance_info_id) REFERENCES jbpm_processinstance_info(instanceid);


--
-- TOC entry 2906 (class 2606 OID 29865)
-- Name: fk4e75de136b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_delegation_delegates
    ADD CONSTRAINT fk4e75de136b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2979 (class 2606 OID 30727)
-- Name: fk4f2030575cf6cf14; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_artikel
    ADD CONSTRAINT fk4f2030575cf6cf14 FOREIGN KEY (firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2978 (class 2606 OID 30732)
-- Name: fk4f20305774e70772; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_artikel
    ADD CONSTRAINT fk4f20305774e70772 FOREIGN KEY (sollzeiten_artikel_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2969 (class 2606 OID 30676)
-- Name: fk4f4940821123a3e4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bonuszeit
    ADD CONSTRAINT fk4f4940821123a3e4 FOREIGN KEY (prozess_schritt) REFERENCES deva_prozess_schritt(id);


--
-- TOC entry 2968 (class 2606 OID 30681)
-- Name: fk4f4940824c4c8e48; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bonuszeit
    ADD CONSTRAINT fk4f4940824c4c8e48 FOREIGN KEY (gewaehrt_von) REFERENCES deva_benutzer(id);


--
-- TOC entry 3013 (class 2606 OID 30903)
-- Name: fk511f24132e56239d; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_ampelstatus
    ADD CONSTRAINT fk511f24132e56239d FOREIGN KEY (ampelstatus_id) REFERENCES deva_rolle(id);


--
-- TOC entry 3020 (class 2606 OID 30938)
-- Name: fk51c371f7eacc69fa; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_artikel
    ADD CONSTRAINT fk51c371f7eacc69fa FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_artikel(id);


--
-- TOC entry 3023 (class 2606 OID 30953)
-- Name: fk560f3573153e746f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_prozess_schritt
    ADD CONSTRAINT fk560f3573153e746f FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichung_prozess_schritt(id);


--
-- TOC entry 3021 (class 2606 OID 30943)
-- Name: fk57aff0351dc451da; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_komponente
    ADD CONSTRAINT fk57aff0351dc451da FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_komponente(id);


--
-- TOC entry 2948 (class 2606 OID 30579)
-- Name: fk5b3e08463d3b7a12; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_komponente
    ADD CONSTRAINT fk5b3e08463d3b7a12 FOREIGN KEY (artikel) REFERENCES deva_artikel(id);


--
-- TOC entry 2949 (class 2606 OID 30574)
-- Name: fk5b3e08468d6ce006; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_komponente
    ADD CONSTRAINT fk5b3e08468d6ce006 FOREIGN KEY (komponente) REFERENCES deva_komponente(id);


--
-- TOC entry 3012 (class 2606 OID 30898)
-- Name: fk5b9f4d34d1137703; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_aktions_berechtigungen
    ADD CONSTRAINT fk5b9f4d34d1137703 FOREIGN KEY (berechtigung_id) REFERENCES deva_rolle(id);


--
-- TOC entry 2910 (class 2606 OID 29885)
-- Name: fk5ca4a3dfc7a04c70; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_escalation
    ADD CONSTRAINT fk5ca4a3dfc7a04c70 FOREIGN KEY (deadline_escalation_id) REFERENCES jbpm_deadline(id);


--
-- TOC entry 2956 (class 2606 OID 30619)
-- Name: fk5d10f7783d3b7a12; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zubehoer
    ADD CONSTRAINT fk5d10f7783d3b7a12 FOREIGN KEY (artikel) REFERENCES deva_artikel(id);


--
-- TOC entry 2957 (class 2606 OID 30614)
-- Name: fk5d10f778b3b24cea; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zubehoer
    ADD CONSTRAINT fk5d10f778b3b24cea FOREIGN KEY (zubehoer) REFERENCES deva_zubehoer(id);


--
-- TOC entry 2980 (class 2606 OID 30742)
-- Name: fk635e15d55cf6cf14; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_komponente
    ADD CONSTRAINT fk635e15d55cf6cf14 FOREIGN KEY (firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2981 (class 2606 OID 30737)
-- Name: fk635e15d5b3de8e56; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_komponente
    ADD CONSTRAINT fk635e15d5b3de8e56 FOREIGN KEY (sollzeiten_komponente_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2955 (class 2606 OID 30604)
-- Name: fk646ab9f7ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_verantwortliche
    ADD CONSTRAINT fk646ab9f7ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2954 (class 2606 OID 30609)
-- Name: fk646ab9fb2657c32; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_verantwortliche
    ADD CONSTRAINT fk646ab9fb2657c32 FOREIGN KEY (verantwortlicher_id) REFERENCES deva_benutzer(id);


--
-- TOC entry 2939 (class 2606 OID 30529)
-- Name: fk6e9467b92325ac4e; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b92325ac4e FOREIGN KEY (artikelbezeichnung) REFERENCES deva_bezeichnung_artikel(id);


--
-- TOC entry 2936 (class 2606 OID 30514)
-- Name: fk6e9467b938fd1c19; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b938fd1c19 FOREIGN KEY (lieferant) REFERENCES deva_firma(id);


--
-- TOC entry 2933 (class 2606 OID 30499)
-- Name: fk6e9467b96b6c33bf; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b96b6c33bf FOREIGN KEY (artikelprozess) REFERENCES deva_prozess(id);


--
-- TOC entry 2934 (class 2606 OID 30504)
-- Name: fk6e9467b9843549e2; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b9843549e2 FOREIGN KEY (kunde) REFERENCES deva_firma(id);


--
-- TOC entry 2937 (class 2606 OID 30519)
-- Name: fk6e9467b98c57da6c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b98c57da6c FOREIGN KEY (angelegt_von) REFERENCES deva_benutzer(id);


--
-- TOC entry 2935 (class 2606 OID 30509)
-- Name: fk6e9467b98c8fc63d; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b98c8fc63d FOREIGN KEY (paarbeziehung) REFERENCES deva_artikel(id);


--
-- TOC entry 2938 (class 2606 OID 30524)
-- Name: fk6e9467b9a1cbfc4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b9a1cbfc4 FOREIGN KEY (artikelbild) REFERENCES deva_dokument(id);


--
-- TOC entry 2971 (class 2606 OID 30691)
-- Name: fk70d1bb683ebdb8fe; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bpmn_definition_task_handler_names
    ADD CONSTRAINT fk70d1bb683ebdb8fe FOREIGN KEY (bpmn_definition_id) REFERENCES deva_bpmndefinition(id);


--
-- TOC entry 2919 (class 2606 OID 29930)
-- Name: fk73d7058336b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_potowners
    ADD CONSTRAINT fk73d7058336b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2995 (class 2606 OID 30808)
-- Name: fk77be0c10dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_logbuch
    ADD CONSTRAINT fk77be0c10dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2994 (class 2606 OID 30813)
-- Name: fk77be0c10dfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_logbuch
    ADD CONSTRAINT fk77be0c10dfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2946 (class 2606 OID 30569)
-- Name: fk792535b27ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_kommentar
    ADD CONSTRAINT fk792535b27ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2947 (class 2606 OID 30564)
-- Name: fk792535b2dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_kommentar
    ADD CONSTRAINT fk792535b2dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2940 (class 2606 OID 30539)
-- Name: fk7a16c7a13d3b7a12; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_bestandteil
    ADD CONSTRAINT fk7a16c7a13d3b7a12 FOREIGN KEY (artikel) REFERENCES deva_artikel(id);


--
-- TOC entry 2941 (class 2606 OID 30534)
-- Name: fk7a16c7a1f093319a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_bestandteil
    ADD CONSTRAINT fk7a16c7a1f093319a FOREIGN KEY (artikel_bestandteil) REFERENCES deva_artikel(id);


--
-- TOC entry 3009 (class 2606 OID 30893)
-- Name: fk7cf7493511000a0a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT fk7cf7493511000a0a FOREIGN KEY (aktueller_schritt) REFERENCES deva_prozess(id);


--
-- TOC entry 3011 (class 2606 OID 30883)
-- Name: fk7cf74935199fc6f5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT fk7cf74935199fc6f5 FOREIGN KEY (abgeschlossener_schritt) REFERENCES deva_prozess(id);


--
-- TOC entry 3010 (class 2606 OID 30888)
-- Name: fk7cf7493575b486b9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT fk7cf7493575b486b9 FOREIGN KEY (prozess_schritt_definition) REFERENCES deva_bezeichung_prozess_schritt(id);


--
-- TOC entry 2921 (class 2606 OID 29940)
-- Name: fk7dcd4ddf36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_stakeholders
    ADD CONSTRAINT fk7dcd4ddf36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2961 (class 2606 OID 30645)
-- Name: fk805a2eb45b19b851; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_firma
    ADD CONSTRAINT fk805a2eb45b19b851 FOREIGN KEY (zugeordnete_firma) REFERENCES deva_firma(id);


--
-- TOC entry 2962 (class 2606 OID 30640)
-- Name: fk805a2eb4dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_firma
    ADD CONSTRAINT fk805a2eb4dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 3005 (class 2606 OID 30863)
-- Name: fk87d3108562008c47; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT fk87d3108562008c47 FOREIGN KEY (naechster_meilenstein) REFERENCES deva_prozess_schritt(id);


--
-- TOC entry 3006 (class 2606 OID 30858)
-- Name: fk87d31085975a806a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT fk87d31085975a806a FOREIGN KEY (bpmn_definition) REFERENCES deva_bpmndefinition(id);


--
-- TOC entry 3004 (class 2606 OID 30868)
-- Name: fk87d31085eb1c5f20; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT fk87d31085eb1c5f20 FOREIGN KEY (prozess_definition) REFERENCES deva_prozessdefinition(id);


--
-- TOC entry 3022 (class 2606 OID 30948)
-- Name: fk88d3d6d9315e404; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_produktgruppe
    ADD CONSTRAINT fk88d3d6d9315e404 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_produktgruppe(id);


--
-- TOC entry 3024 (class 2606 OID 30958)
-- Name: fk8b6a0f27adede368; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zubehoer
    ADD CONSTRAINT fk8b6a0f27adede368 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_zubehoer(id);


--
-- TOC entry 3026 (class 2606 OID 30968)
-- Name: fk8b7d1a55e7b2276; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zubehoer
    ADD CONSTRAINT fk8b7d1a55e7b2276 FOREIGN KEY (zubehoerbezeichnung) REFERENCES deva_bezeichnung_zubehoer(id);


--
-- TOC entry 3018 (class 2606 OID 30928)
-- Name: fk8e4ee667c589307f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeiten_klassifikation
    ADD CONSTRAINT fk8e4ee667c589307f FOREIGN KEY (sollzeiten_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2908 (class 2606 OID 29880)
-- Name: fk9c2287131f7b912a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT fk9c2287131f7b912a FOREIGN KEY (emailheaders_id) REFERENCES jbpm_email_header(id);


--
-- TOC entry 2909 (class 2606 OID 29875)
-- Name: fk9c228713351621ef; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT fk9c228713351621ef FOREIGN KEY (jbpm_email_notification_id) REFERENCES jbpm_email_notification(id);


--
-- TOC entry 2925 (class 2606 OID 29960)
-- Name: fk9d95288b36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_subtasksstrategy
    ADD CONSTRAINT fk9d95288b36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2965 (class 2606 OID 30665)
-- Name: fk9fb79f156273aba8; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_rollen
    ADD CONSTRAINT fk9fb79f156273aba8 FOREIGN KEY (rolle) REFERENCES deva_rolle(id);


--
-- TOC entry 2966 (class 2606 OID 30660)
-- Name: fk9fb79f15dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_rollen
    ADD CONSTRAINT fk9fb79f15dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 3007 (class 2606 OID 30878)
-- Name: fka2830f9838fd1c19; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozessdefinition
    ADD CONSTRAINT fka2830f9838fd1c19 FOREIGN KEY (lieferant) REFERENCES deva_firma(id);


--
-- TOC entry 3008 (class 2606 OID 30873)
-- Name: fka2830f98843549e2; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozessdefinition
    ADD CONSTRAINT fka2830f98843549e2 FOREIGN KEY (kunde) REFERENCES deva_firma(id);


--
-- TOC entry 2903 (class 2606 OID 29850)
-- Name: fka4a3ea79afb75f7d; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_boolean_expression
    ADD CONSTRAINT fka4a3ea79afb75f7d FOREIGN KEY (escalation_constraints_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 2998 (class 2606 OID 30833)
-- Name: fka5971b19b2657c32; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_verantwortliche
    ADD CONSTRAINT fka5971b19b2657c32 FOREIGN KEY (verantwortlicher_id) REFERENCES deva_benutzer(id);


--
-- TOC entry 2999 (class 2606 OID 30828)
-- Name: fka5971b19dfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_verantwortliche
    ADD CONSTRAINT fka5971b19dfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2970 (class 2606 OID 30686)
-- Name: fka6ca9ab5cbfa49b5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bpmndefinition
    ADD CONSTRAINT fka6ca9ab5cbfa49b5 FOREIGN KEY (prozessdefinition_id) REFERENCES deva_prozessdefinition(id);


--
-- TOC entry 3000 (class 2606 OID 30843)
-- Name: fka7e180fa46b7fc54; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_zusatzinformationen
    ADD CONSTRAINT fka7e180fa46b7fc54 FOREIGN KEY (zusatzinfo_id) REFERENCES deva_zusatzinformation(id);


--
-- TOC entry 3001 (class 2606 OID 30838)
-- Name: fka7e180fadfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_zusatzinformationen
    ADD CONSTRAINT fka7e180fadfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2976 (class 2606 OID 30722)
-- Name: fkab4bb876793f005b; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_lieferanten
    ADD CONSTRAINT fkab4bb876793f005b FOREIGN KEY (lieferant_id) REFERENCES deva_firma(id);


--
-- TOC entry 2977 (class 2606 OID 30717)
-- Name: fkab4bb876e53e3934; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_lieferanten
    ADD CONSTRAINT fkab4bb876e53e3934 FOREIGN KEY (lieferant_fuer_firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2916 (class 2606 OID 29915)
-- Name: fkad3513b53e0890b; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_notification
    ADD CONSTRAINT fkad3513b53e0890b FOREIGN KEY (escalation_notifications_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 2907 (class 2606 OID 29870)
-- Name: fkad3513b53e0890b7099f418; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_email_notification
    ADD CONSTRAINT fkad3513b53e0890b7099f418 FOREIGN KEY (escalation_notifications_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 2927 (class 2606 OID 29970)
-- Name: fkb48f3a4f6ce1ef3a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fkb48f3a4f6ce1ef3a FOREIGN KEY (actualowner_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2928 (class 2606 OID 29965)
-- Name: fkb48f3a4f9e619a0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fkb48f3a4f9e619a0 FOREIGN KEY (createdby_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2926 (class 2606 OID 29975)
-- Name: fkb48f3a4ff213f8b5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fkb48f3a4ff213f8b5 FOREIGN KEY (taskinitiator_id) REFERENCES jbpm_user(id);


--
-- TOC entry 3003 (class 2606 OID 30848)
-- Name: fkb68b59af748e0737; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_produktgruppe
    ADD CONSTRAINT fkb68b59af748e0737 FOREIGN KEY (obergruppe) REFERENCES deva_produktgruppe(id);


--
-- TOC entry 3002 (class 2606 OID 30853)
-- Name: fkb68b59af9315e404; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_produktgruppe
    ADD CONSTRAINT fkb68b59af9315e404 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_produktgruppe(id);


--
-- TOC entry 3025 (class 2606 OID 30963)
-- Name: fkb807fcc8d2732549; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zusatzinformation
    ADD CONSTRAINT fkb807fcc8d2732549 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_zusatzinformation(id);


--
-- TOC entry 2984 (class 2606 OID 30763)
-- Name: fkb8970b3338fd1c19; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b3338fd1c19 FOREIGN KEY (lieferant) REFERENCES deva_firma(id);


--
-- TOC entry 2986 (class 2606 OID 30753)
-- Name: fkb8970b334e705a2c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b334e705a2c FOREIGN KEY (komponente_prozess) REFERENCES deva_prozess(id);


--
-- TOC entry 2985 (class 2606 OID 30758)
-- Name: fkb8970b33843549e2; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b33843549e2 FOREIGN KEY (kunde) REFERENCES deva_firma(id);


--
-- TOC entry 2983 (class 2606 OID 30768)
-- Name: fkb8970b338c57da6c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b338c57da6c FOREIGN KEY (angelegt_von) REFERENCES deva_benutzer(id);


--
-- TOC entry 2982 (class 2606 OID 30773)
-- Name: fkb8970b33a1cbfc4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b33a1cbfc4 FOREIGN KEY (artikelbild) REFERENCES deva_dokument(id);


--
-- TOC entry 2987 (class 2606 OID 30748)
-- Name: fkb8970b33a8076cac; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b33a8076cac FOREIGN KEY (komponentenbezeichnung) REFERENCES deva_bezeichnung_komponente(id);


--
-- TOC entry 3027 (class 2606 OID 30973)
-- Name: fkc53a280abb69726c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zusatzinformation
    ADD CONSTRAINT fkc53a280abb69726c FOREIGN KEY (zusatzinformationbezeichnung) REFERENCES deva_bezeichnung_zusatzinformation(id);



--
-- TOC entry 2991 (class 2606 OID 30788)
-- Name: fkd1dd1e86dfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_dokumente
    ADD CONSTRAINT fkd1dd1e86dfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2990 (class 2606 OID 30793)
-- Name: fkd1dd1e86fe056660; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_dokumente
    ADD CONSTRAINT fkd1dd1e86fe056660 FOREIGN KEY (dokument_id) REFERENCES deva_dokument(id);


--
-- TOC entry 3016 (class 2606 OID 30918)
-- Name: fkd632fa90d1137703; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_sicht_berechtigungen
    ADD CONSTRAINT fkd632fa90d1137703 FOREIGN KEY (berechtigung_id) REFERENCES deva_rolle(id);


--
-- TOC entry 2958 (class 2606 OID 30629)
-- Name: fkda95e8046b7fc54; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zusatzinformationen
    ADD CONSTRAINT fkda95e8046b7fc54 FOREIGN KEY (zusatzinfo_id) REFERENCES deva_zusatzinformation(id);


--
-- TOC entry 2959 (class 2606 OID 30624)
-- Name: fkda95e807ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zusatzinformationen
    ADD CONSTRAINT fkda95e807ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2931 (class 2606 OID 30486)
-- Name: fkdae0e2b231ed32e7; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_angemeldeter_benutzer
    ADD CONSTRAINT fkdae0e2b231ed32e7 FOREIGN KEY (benutzer_liste) REFERENCES deva_benutzer_liste(id);


--
-- TOC entry 2932 (class 2606 OID 30481)
-- Name: fkdae0e2b2dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_angemeldeter_benutzer
    ADD CONSTRAINT fkdae0e2b2dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2944 (class 2606 OID 30559)
-- Name: fke6ab83fd2bf81bd0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_fahrzeuge
    ADD CONSTRAINT fke6ab83fd2bf81bd0 FOREIGN KEY (fahrzeug_id) REFERENCES deva_fahrzeug_bezeichnung(id);


--
-- TOC entry 2945 (class 2606 OID 30554)
-- Name: fke6ab83fd7ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_fahrzeuge
    ADD CONSTRAINT fke6ab83fd7ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2929 (class 2606 OID 29985)
-- Name: fke7d49c4f2ff04688; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task_comment
    ADD CONSTRAINT fke7d49c4f2ff04688 FOREIGN KEY (addedby_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2930 (class 2606 OID 29980)
-- Name: fke7d49c4fb35e68f5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task_comment
    ADD CONSTRAINT fke7d49c4fb35e68f5 FOREIGN KEY (taskdata_comments_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2989 (class 2606 OID 30778)
-- Name: fke8ae041b8d6ce006; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_bestandteil
    ADD CONSTRAINT fke8ae041b8d6ce006 FOREIGN KEY (komponente) REFERENCES deva_komponente(id);


--
-- TOC entry 2988 (class 2606 OID 30783)
-- Name: fke8ae041bf69c798e; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_bestandteil
    ADD CONSTRAINT fke8ae041bf69c798e FOREIGN KEY (komponente_bestandteil) REFERENCES deva_komponente(id);


--
-- TOC entry 2972 (class 2606 OID 30701)
-- Name: fkee37ca061ad81661; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument
    ADD CONSTRAINT fkee37ca061ad81661 FOREIGN KEY (thumbnail_id) REFERENCES deva_dokument_binaerdaten(id);


--
-- TOC entry 2973 (class 2606 OID 30696)
-- Name: fkee37ca06862116e3; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument
    ADD CONSTRAINT fkee37ca06862116e3 FOREIGN KEY (data_id) REFERENCES deva_dokument_binaerdaten(id);


--
-- TOC entry 2923 (class 2606 OID 29950)
-- Name: fkf23c3c0aa5c17ee0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_reassignment
    ADD CONSTRAINT fkf23c3c0aa5c17ee0 FOREIGN KEY (escalation_reassignments_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 2920 (class 2606 OID 29935)
-- Name: fkf55e684c36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_recipients
    ADD CONSTRAINT fkf55e684c36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2902 (class 2606 OID 29840)
-- Name: fkf6bb126d8ef5f064; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_attachment
    ADD CONSTRAINT fkf6bb126d8ef5f064 FOREIGN KEY (attachedby_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2901 (class 2606 OID 29845)
-- Name: fkf6bb126df21826d9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_attachment
    ADD CONSTRAINT fkf6bb126df21826d9 FOREIGN KEY (taskdata_attachments_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2943 (class 2606 OID 30544)
-- Name: fkf8d0b8c7ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_dokumente
    ADD CONSTRAINT fkf8d0b8c7ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2942 (class 2606 OID 30549)
-- Name: fkf8d0b8cfe056660; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_dokumente
    ADD CONSTRAINT fkf8d0b8cfe056660 FOREIGN KEY (dokument_id) REFERENCES deva_dokument(id);


--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-04-23 11:06:20 CEST

--
-- PostgreSQL database dump complete
--

