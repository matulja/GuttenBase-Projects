--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.3
-- Dumped by pg_dump version 9.1.3
-- Started on 2012-04-03 18:26:53 CEST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 291 (class 3079 OID 11705)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2706 (class 0 OID 0)
-- Dependencies: 291
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 195 (class 1259 OID 252979)
-- Dependencies: 6
-- Name: deva_angemeldeter_benutzer; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_angemeldeter_benutzer (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    datum timestamp without time zone NOT NULL,
    remotehost character varying(100) NOT NULL,
    session_id character varying(100) NOT NULL,
    benutzer VARCHAR(40) NOT NULL,
    benutzer_liste VARCHAR(40)
);


ALTER TABLE public.deva_angemeldeter_benutzer OWNER TO meyle;

--
-- TOC entry 194 (class 1259 OID 252977)
-- Dependencies: 6 195
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
-- TOC entry 2707 (class 0 OID 0)
-- Dependencies: 194
-- Name: deva_angemeldeter_benutzer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_angemeldeter_benutzer_id_seq OWNED BY deva_angemeldeter_benutzer.id;


--
-- TOC entry 197 (class 1259 OID 252987)
-- Dependencies: 6
-- Name: deva_artikel; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
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
    angelegt_von VARCHAR(40) NOT NULL,
    artikelbild VARCHAR(40),
    artikelprozess VARCHAR(40),
    artikelbezeichnung VARCHAR(40) NOT NULL,
    kunde VARCHAR(40),
    lieferant VARCHAR(40),
    paarbeziehung VARCHAR(40)
);


ALTER TABLE public.deva_artikel OWNER TO meyle;

--
-- TOC entry 199 (class 1259 OID 252998)
-- Dependencies: 2360 6
-- Name: deva_artikel_bestandteil; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_bestandteil (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    anzahl bigint NOT NULL,
    hinweis character varying(100) NOT NULL,
    artikel VARCHAR(40) NOT NULL,
    artikel_bestandteil VARCHAR(40) NOT NULL,
    CONSTRAINT deva_artikel_bestandteil_anzahl_check CHECK ((anzahl >= 1))
);


ALTER TABLE public.deva_artikel_bestandteil OWNER TO meyle;

--
-- TOC entry 198 (class 1259 OID 252996)
-- Dependencies: 199 6
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
-- TOC entry 2708 (class 0 OID 0)
-- Dependencies: 198
-- Name: deva_artikel_bestandteil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_bestandteil_id_seq OWNED BY deva_artikel_bestandteil.id;


--
-- TOC entry 200 (class 1259 OID 253005)
-- Dependencies: 6
-- Name: deva_artikel_dokumente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_dokumente (
    artikel_id VARCHAR(40) NOT NULL,
    dokument_id VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_artikel_dokumente OWNER TO meyle;

--
-- TOC entry 201 (class 1259 OID 253010)
-- Dependencies: 6
-- Name: deva_artikel_fahrzeuge; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_fahrzeuge (
    artikel_id VARCHAR(40) NOT NULL,
    fahrzeug_id VARCHAR(40) NOT NULL,
    sort_order integer NOT NULL
);


ALTER TABLE public.deva_artikel_fahrzeuge OWNER TO meyle;

--
-- TOC entry 196 (class 1259 OID 252985)
-- Dependencies: 6 197
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
-- TOC entry 2709 (class 0 OID 0)
-- Dependencies: 196
-- Name: deva_artikel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_id_seq OWNED BY deva_artikel.id;


--
-- TOC entry 203 (class 1259 OID 253017)
-- Dependencies: 6
-- Name: deva_artikel_kommentar; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_kommentar (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    datum timestamp without time zone NOT NULL,
    text character varying(1024) NOT NULL,
    benutzer VARCHAR(40) NOT NULL,
    artikel_id VARCHAR(40)
);


ALTER TABLE public.deva_artikel_kommentar OWNER TO meyle;

--
-- TOC entry 202 (class 1259 OID 253015)
-- Dependencies: 6 203
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
-- TOC entry 2710 (class 0 OID 0)
-- Dependencies: 202
-- Name: deva_artikel_kommentar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_kommentar_id_seq OWNED BY deva_artikel_kommentar.id;


--
-- TOC entry 205 (class 1259 OID 253028)
-- Dependencies: 2363 6
-- Name: deva_artikel_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_komponente (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    anzahl bigint NOT NULL,
    hinweis character varying(100) NOT NULL,
    artikel VARCHAR(40) NOT NULL,
    komponente VARCHAR(40) NOT NULL,
    CONSTRAINT deva_artikel_komponente_anzahl_check CHECK ((anzahl >= 1))
);


ALTER TABLE public.deva_artikel_komponente OWNER TO meyle;

--
-- TOC entry 204 (class 1259 OID 253026)
-- Dependencies: 6 205
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
-- TOC entry 2711 (class 0 OID 0)
-- Dependencies: 204
-- Name: deva_artikel_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_komponente_id_seq OWNED BY deva_artikel_komponente.id;


--
-- TOC entry 207 (class 1259 OID 253037)
-- Dependencies: 6
-- Name: deva_artikel_logbuch; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_logbuch (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    aktion character varying(255) NOT NULL,
    bezugsobjekt_text character varying(100) NOT NULL,
    datum timestamp without time zone NOT NULL,
    benutzer VARCHAR(40) NOT NULL,
    artikel_id VARCHAR(40)
);


ALTER TABLE public.deva_artikel_logbuch OWNER TO meyle;

--
-- TOC entry 206 (class 1259 OID 253035)
-- Dependencies: 6 207
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
-- TOC entry 2712 (class 0 OID 0)
-- Dependencies: 206
-- Name: deva_artikel_logbuch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_logbuch_id_seq OWNED BY deva_artikel_logbuch.id;


--
-- TOC entry 209 (class 1259 OID 253045)
-- Dependencies: 2366 6
-- Name: deva_artikel_zubehoer; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_zubehoer (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    anzahl bigint NOT NULL,
    hinweis character varying(100) NOT NULL,
    artikel VARCHAR(40) NOT NULL,
    zubehoer VARCHAR(40) NOT NULL,
    CONSTRAINT deva_artikel_zubehoer_anzahl_check CHECK ((anzahl >= 1))
);


ALTER TABLE public.deva_artikel_zubehoer OWNER TO meyle;

--
-- TOC entry 208 (class 1259 OID 253043)
-- Dependencies: 209 6
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
-- TOC entry 2713 (class 0 OID 0)
-- Dependencies: 208
-- Name: deva_artikel_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_zubehoer_id_seq OWNED BY deva_artikel_zubehoer.id;


--
-- TOC entry 210 (class 1259 OID 253052)
-- Dependencies: 6
-- Name: deva_artikel_zusatzinformationen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_zusatzinformationen (
    artikel_id VARCHAR(40) NOT NULL,
    zusatzinfo_id VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_artikel_zusatzinformationen OWNER TO meyle;

--
-- TOC entry 212 (class 1259 OID 253057)
-- Dependencies: 6
-- Name: deva_benutzer; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    email character varying(255) NOT NULL,
    username character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    firma VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_benutzer OWNER TO meyle;

--
-- TOC entry 213 (class 1259 OID 253070)
-- Dependencies: 6
-- Name: deva_benutzer_firma; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_firma (
    benutzer VARCHAR(40) NOT NULL,
    zugeordnete_firma VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_benutzer_firma OWNER TO meyle;

--
-- TOC entry 211 (class 1259 OID 253055)
-- Dependencies: 212 6
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
-- TOC entry 2714 (class 0 OID 0)
-- Dependencies: 211
-- Name: deva_benutzer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_benutzer_id_seq OWNED BY deva_benutzer.id;


--
-- TOC entry 215 (class 1259 OID 253077)
-- Dependencies: 6
-- Name: deva_benutzer_liste; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_liste (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    singleton character varying(255) NOT NULL
);


ALTER TABLE public.deva_benutzer_liste OWNER TO meyle;

--
-- TOC entry 214 (class 1259 OID 253075)
-- Dependencies: 6 215
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
-- TOC entry 2715 (class 0 OID 0)
-- Dependencies: 214
-- Name: deva_benutzer_liste_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_benutzer_liste_id_seq OWNED BY deva_benutzer_liste.id;


--
-- TOC entry 216 (class 1259 OID 253085)
-- Dependencies: 6
-- Name: deva_benutzer_produktgruppe; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_produktgruppe (
    benutzer VARCHAR(40) NOT NULL,
    produktgruppe VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_benutzer_produktgruppe OWNER TO meyle;

--
-- TOC entry 217 (class 1259 OID 253090)
-- Dependencies: 6
-- Name: deva_benutzer_rollen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_rollen (
    benutzer VARCHAR(40) NOT NULL,
    rolle VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_benutzer_rollen OWNER TO meyle;

--
-- TOC entry 219 (class 1259 OID 253097)
-- Dependencies: 6
-- Name: deva_bezeichnung_artikel; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_artikel (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    klassifikation character varying(255) NOT NULL,
    produktgruppe VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_bezeichnung_artikel OWNER TO meyle;

--
-- TOC entry 218 (class 1259 OID 253095)
-- Dependencies: 6 219
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
-- TOC entry 2716 (class 0 OID 0)
-- Dependencies: 218
-- Name: deva_bezeichnung_artikel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_artikel_id_seq OWNED BY deva_bezeichnung_artikel.id;


--
-- TOC entry 221 (class 1259 OID 253105)
-- Dependencies: 6
-- Name: deva_bezeichnung_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_komponente (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_bezeichnung_komponente OWNER TO meyle;

--
-- TOC entry 220 (class 1259 OID 253103)
-- Dependencies: 6 221
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
-- TOC entry 2717 (class 0 OID 0)
-- Dependencies: 220
-- Name: deva_bezeichnung_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_komponente_id_seq OWNED BY deva_bezeichnung_komponente.id;


--
-- TOC entry 223 (class 1259 OID 253113)
-- Dependencies: 6
-- Name: deva_bezeichnung_produktgruppe; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_produktgruppe (
    id VARCHAR(40) NOT NULL,
    version BIGINT
);


ALTER TABLE public.deva_bezeichnung_produktgruppe OWNER TO meyle;

--
-- TOC entry 222 (class 1259 OID 253111)
-- Dependencies: 223 6
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
-- TOC entry 2718 (class 0 OID 0)
-- Dependencies: 222
-- Name: deva_bezeichnung_produktgruppe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_produktgruppe_id_seq OWNED BY deva_bezeichnung_produktgruppe.id;


--
-- TOC entry 225 (class 1259 OID 253121)
-- Dependencies: 6
-- Name: deva_bezeichnung_zubehoer; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_zubehoer (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_bezeichnung_zubehoer OWNER TO meyle;

--
-- TOC entry 224 (class 1259 OID 253119)
-- Dependencies: 225 6
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
-- TOC entry 2719 (class 0 OID 0)
-- Dependencies: 224
-- Name: deva_bezeichnung_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_zubehoer_id_seq OWNED BY deva_bezeichnung_zubehoer.id;


--
-- TOC entry 227 (class 1259 OID 253129)
-- Dependencies: 6
-- Name: deva_bezeichnung_zusatzinformation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_zusatzinformation (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    typ character varying(255) NOT NULL
);


ALTER TABLE public.deva_bezeichnung_zusatzinformation OWNER TO meyle;

--
-- TOC entry 226 (class 1259 OID 253127)
-- Dependencies: 227 6
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
-- TOC entry 2720 (class 0 OID 0)
-- Dependencies: 226
-- Name: deva_bezeichnung_zusatzinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_zusatzinformation_id_seq OWNED BY deva_bezeichnung_zusatzinformation.id;


--
-- TOC entry 229 (class 1259 OID 253137)
-- Dependencies: 6
-- Name: deva_bezeichung_prozess_schritt; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichung_prozess_schritt (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
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
-- TOC entry 228 (class 1259 OID 253135)
-- Dependencies: 6 229
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
-- TOC entry 2721 (class 0 OID 0)
-- Dependencies: 228
-- Name: deva_bezeichung_prozess_schritt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichung_prozess_schritt_id_seq OWNED BY deva_bezeichung_prozess_schritt.id;


--
-- TOC entry 231 (class 1259 OID 253150)
-- Dependencies: 2376 6
-- Name: deva_bonuszeit; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bonuszeit (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    bonus_tage integer NOT NULL,
    gewaehrt_am date,
    kommentar character varying(1024) NOT NULL,
    gewaehrt_von VARCHAR(40) NOT NULL,
    prozess_schritt VARCHAR(40),
    CONSTRAINT deva_bonuszeit_bonus_tage_check CHECK ((bonus_tage >= 1))
);


ALTER TABLE public.deva_bonuszeit OWNER TO meyle;

--
-- TOC entry 230 (class 1259 OID 253148)
-- Dependencies: 6 231
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
-- TOC entry 2722 (class 0 OID 0)
-- Dependencies: 230
-- Name: deva_bonuszeit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bonuszeit_id_seq OWNED BY deva_bonuszeit.id;


--
-- TOC entry 234 (class 1259 OID 253168)
-- Dependencies: 6
-- Name: deva_bpmn_definition_task_handler_names; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bpmn_definition_task_handler_names (
    bpmn_definition_id VARCHAR(40) NOT NULL,
    taskhandlernames character varying(255)
);


ALTER TABLE public.deva_bpmn_definition_task_handler_names OWNER TO meyle;

--
-- TOC entry 233 (class 1259 OID 253162)
-- Dependencies: 6
-- Name: deva_bpmndefinition; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bpmndefinition (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    bpmn oid NOT NULL,
    bpmn_process_id character varying(100) NOT NULL,
    bpmn_version integer NOT NULL,
    datum timestamp without time zone NOT NULL,
    name character varying(100) NOT NULL,
    prozessdefinition_id VARCHAR(40)
);


ALTER TABLE public.deva_bpmndefinition OWNER TO meyle;

--
-- TOC entry 232 (class 1259 OID 253160)
-- Dependencies: 6 233
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
-- TOC entry 2723 (class 0 OID 0)
-- Dependencies: 232
-- Name: deva_bpmndefinition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bpmndefinition_id_seq OWNED BY deva_bpmndefinition.id;


--
-- TOC entry 236 (class 1259 OID 253173)
-- Dependencies: 2379 2380 6
-- Name: deva_dokument; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_dokument (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    image_height bigint NOT NULL,
    image_width bigint NOT NULL,
    mime_type character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    data_id VARCHAR(40) NOT NULL,
    thumbnail_id VARCHAR(40) NOT NULL,
    CONSTRAINT deva_dokument_image_height_check CHECK ((image_height >= 1)),
    CONSTRAINT deva_dokument_image_width_check CHECK ((image_width >= 1))
);


ALTER TABLE public.deva_dokument OWNER TO meyle;

--
-- TOC entry 238 (class 1259 OID 253183)
-- Dependencies: 6
-- Name: deva_dokument_binaerdaten; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_dokument_binaerdaten (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    data oid NOT NULL
);


ALTER TABLE public.deva_dokument_binaerdaten OWNER TO meyle;

--
-- TOC entry 237 (class 1259 OID 253181)
-- Dependencies: 238 6
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
-- TOC entry 2724 (class 0 OID 0)
-- Dependencies: 237
-- Name: deva_dokument_binaerdaten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_dokument_binaerdaten_id_seq OWNED BY deva_dokument_binaerdaten.id;


--
-- TOC entry 235 (class 1259 OID 253171)
-- Dependencies: 236 6
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
-- TOC entry 2725 (class 0 OID 0)
-- Dependencies: 235
-- Name: deva_dokument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_dokument_id_seq OWNED BY deva_dokument.id;


--
-- TOC entry 240 (class 1259 OID 253191)
-- Dependencies: 2383 2384 6
-- Name: deva_faelligkeiten; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_faelligkeiten (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    faelligkeit_nachher bigint NOT NULL,
    singleton character varying(255) NOT NULL,
    faelligkeit_vorher bigint NOT NULL,
    CONSTRAINT deva_faelligkeiten_faelligkeit_nachher_check CHECK ((faelligkeit_nachher >= 0)),
    CONSTRAINT deva_faelligkeiten_faelligkeit_vorher_check CHECK ((faelligkeit_vorher >= 0))
);


ALTER TABLE public.deva_faelligkeiten OWNER TO meyle;

--
-- TOC entry 239 (class 1259 OID 253189)
-- Dependencies: 240 6
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
-- TOC entry 2726 (class 0 OID 0)
-- Dependencies: 239
-- Name: deva_faelligkeiten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_faelligkeiten_id_seq OWNED BY deva_faelligkeiten.id;


--
-- TOC entry 242 (class 1259 OID 253203)
-- Dependencies: 6
-- Name: deva_fahrzeug_bezeichnung; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_fahrzeug_bezeichnung (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    bezeichnung character varying(100) NOT NULL,
    fahrzeug_typ character varying(100) NOT NULL,
    hersteller character varying(30) NOT NULL
);


ALTER TABLE public.deva_fahrzeug_bezeichnung OWNER TO meyle;

--
-- TOC entry 241 (class 1259 OID 253201)
-- Dependencies: 242 6
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
-- TOC entry 2727 (class 0 OID 0)
-- Dependencies: 241
-- Name: deva_fahrzeug_bezeichnung_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_fahrzeug_bezeichnung_id_seq OWNED BY deva_fahrzeug_bezeichnung.id;


--
-- TOC entry 244 (class 1259 OID 253215)
-- Dependencies: 6
-- Name: deva_firma; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    arbeitet_mit_deva character(1),
    lieferant character(1),
    name character varying(100) NOT NULL
);


ALTER TABLE public.deva_firma OWNER TO meyle;

--
-- TOC entry 245 (class 1259 OID 253223)
-- Dependencies: 6
-- Name: deva_firma_ansprechpartner; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_ansprechpartner (
    firma_id VARCHAR(40) NOT NULL,
    benutzer_id VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_firma_ansprechpartner OWNER TO meyle;

--
-- TOC entry 243 (class 1259 OID 253213)
-- Dependencies: 244 6
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
-- TOC entry 2728 (class 0 OID 0)
-- Dependencies: 243
-- Name: deva_firma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_firma_id_seq OWNED BY deva_firma.id;


--
-- TOC entry 246 (class 1259 OID 253228)
-- Dependencies: 6
-- Name: deva_firma_lieferanten; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_lieferanten (
    lieferant_id VARCHAR(40) NOT NULL,
    lieferant_fuer_firma_id VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_firma_lieferanten OWNER TO meyle;

--
-- TOC entry 247 (class 1259 OID 253231)
-- Dependencies: 6
-- Name: deva_firma_sollzeiten_artikel; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_sollzeiten_artikel (
    firma_id VARCHAR(40) NOT NULL,
    sollzeiten_artikel_id VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_firma_sollzeiten_artikel OWNER TO meyle;

--
-- TOC entry 248 (class 1259 OID 253236)
-- Dependencies: 6
-- Name: deva_firma_sollzeiten_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_sollzeiten_komponente (
    firma_id VARCHAR(40) NOT NULL,
    sollzeiten_komponente_id VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_firma_sollzeiten_komponente OWNER TO meyle;

--
-- TOC entry 250 (class 1259 OID 253243)
-- Dependencies: 6
-- Name: deva_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    beim_lieferanten_vorhanden character(1),
    klassifikation character varying(255) NOT NULL,
    komponente_prozess_status character varying(255) NOT NULL,
    orig_lieferantennummer character varying(50) NOT NULL,
    raw_lieferantennummer character varying(255) NOT NULL,
    angelegt_von VARCHAR(40) NOT NULL,
    artikelbild VARCHAR(40),
    komponente_prozess VARCHAR(40),
    komponentenbezeichnung VARCHAR(40) NOT NULL,
    kunde VARCHAR(40) NOT NULL,
    lieferant VARCHAR(40)
);


ALTER TABLE public.deva_komponente OWNER TO meyle;

--
-- TOC entry 251 (class 1259 OID 253252)
-- Dependencies: 6
-- Name: deva_komponente_dokumente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_dokumente (
    komponente_id VARCHAR(40) NOT NULL,
    dokument_id VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_komponente_dokumente OWNER TO meyle;

--
-- TOC entry 249 (class 1259 OID 253241)
-- Dependencies: 6 250
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
-- TOC entry 2729 (class 0 OID 0)
-- Dependencies: 249
-- Name: deva_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_komponente_id_seq OWNED BY deva_komponente.id;


--
-- TOC entry 253 (class 1259 OID 253259)
-- Dependencies: 6
-- Name: deva_komponente_kommentar; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_kommentar (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    datum timestamp without time zone NOT NULL,
    text character varying(1024) NOT NULL,
    benutzer VARCHAR(40) NOT NULL,
    komponente_id VARCHAR(40)
);


ALTER TABLE public.deva_komponente_kommentar OWNER TO meyle;

--
-- TOC entry 252 (class 1259 OID 253257)
-- Dependencies: 6 253
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
-- TOC entry 2730 (class 0 OID 0)
-- Dependencies: 252
-- Name: deva_komponente_kommentar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_komponente_kommentar_id_seq OWNED BY deva_komponente_kommentar.id;


--
-- TOC entry 255 (class 1259 OID 253270)
-- Dependencies: 6
-- Name: deva_komponente_logbuch; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_logbuch (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    aktion character varying(255) NOT NULL,
    bezugsobjekt_text character varying(100) NOT NULL,
    datum timestamp without time zone NOT NULL,
    benutzer VARCHAR(40) NOT NULL,
    komponente_id VARCHAR(40)
);


ALTER TABLE public.deva_komponente_logbuch OWNER TO meyle;

--
-- TOC entry 254 (class 1259 OID 253268)
-- Dependencies: 255 6
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
-- TOC entry 2731 (class 0 OID 0)
-- Dependencies: 254
-- Name: deva_komponente_logbuch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_komponente_logbuch_id_seq OWNED BY deva_komponente_logbuch.id;


--
-- TOC entry 256 (class 1259 OID 253276)
-- Dependencies: 6
-- Name: deva_komponente_zusatzinformationen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_zusatzinformationen (
    komponente_id VARCHAR(40) NOT NULL,
    zusatzinfo_id VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_komponente_zusatzinformationen OWNER TO meyle;

--
-- TOC entry 258 (class 1259 OID 253283)
-- Dependencies: 6
-- Name: deva_produktgruppe; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_produktgruppe (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    bezeichnung VARCHAR(40) NOT NULL,
    obergruppe VARCHAR(40)
);


ALTER TABLE public.deva_produktgruppe OWNER TO meyle;

--
-- TOC entry 257 (class 1259 OID 253281)
-- Dependencies: 258 6
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
-- TOC entry 2732 (class 0 OID 0)
-- Dependencies: 257
-- Name: deva_produktgruppe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_produktgruppe_id_seq OWNED BY deva_produktgruppe.id;


--
-- TOC entry 260 (class 1259 OID 253291)
-- Dependencies: 6
-- Name: deva_prozess; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_prozess (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    soll_datum date NOT NULL,
    ampel_status character varying(255) NOT NULL,
    ksession_id VARCHAR(40),
    process_id VARCHAR(40) NOT NULL,
    workitem_id VARCHAR(40),
    bpmn_definition VARCHAR(40) NOT NULL,
    naechster_meilenstein VARCHAR(40) NOT NULL,
    prozess_definition VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_prozess OWNER TO meyle;

--
-- TOC entry 259 (class 1259 OID 253289)
-- Dependencies: 6 260
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
-- TOC entry 2733 (class 0 OID 0)
-- Dependencies: 259
-- Name: deva_prozess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_prozess_id_seq OWNED BY deva_prozess.id;


--
-- TOC entry 264 (class 1259 OID 253309)
-- Dependencies: 6
-- Name: deva_prozess_schritt; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_prozess_schritt (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    ist_datum date,
    soll_datum date,
    processnode_id VARCHAR(40),
    typ character varying(100),
    zaehler integer,
    zuletzt_bestaetigt character(1),
    weitergeschaltet_datum date,
    prozess_schritt_definition VARCHAR(40) NOT NULL,
    aktueller_schritt VARCHAR(40),
    index_aktueller_schritt integer,
    abgeschlossener_schritt VARCHAR(40),
    index_abgeschlossener_schritt integer
);


ALTER TABLE public.deva_prozess_schritt OWNER TO meyle;

--
-- TOC entry 263 (class 1259 OID 253307)
-- Dependencies: 6 264
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
-- TOC entry 2734 (class 0 OID 0)
-- Dependencies: 263
-- Name: deva_prozess_schritt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_prozess_schritt_id_seq OWNED BY deva_prozess_schritt.id;


--
-- TOC entry 262 (class 1259 OID 253301)
-- Dependencies: 6
-- Name: deva_prozessdefinition; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_prozessdefinition (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    prozessart character varying(255) NOT NULL,
    kunde VARCHAR(40) NOT NULL,
    lieferant VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_prozessdefinition OWNER TO meyle;

--
-- TOC entry 261 (class 1259 OID 253299)
-- Dependencies: 262 6
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
-- TOC entry 2735 (class 0 OID 0)
-- Dependencies: 261
-- Name: deva_prozessdefinition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_prozessdefinition_id_seq OWNED BY deva_prozessdefinition.id;


--
-- TOC entry 266 (class 1259 OID 253317)
-- Dependencies: 6
-- Name: deva_rolle; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    feste_rolle character(1),
    rolle character varying(100) NOT NULL
);


ALTER TABLE public.deva_rolle OWNER TO meyle;

--
-- TOC entry 267 (class 1259 OID 253325)
-- Dependencies: 6
-- Name: deva_rolle_aktions_berechtigungen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_aktions_berechtigungen (
    berechtigung_id VARCHAR(40) NOT NULL,
    aktion_berechtigungen character varying(255)
);


ALTER TABLE public.deva_rolle_aktions_berechtigungen OWNER TO meyle;

--
-- TOC entry 268 (class 1259 OID 253328)
-- Dependencies: 6
-- Name: deva_rolle_ampelstatus; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_ampelstatus (
    ampelstatus_id VARCHAR(40) NOT NULL,
    ampelstatus character varying(255)
);


ALTER TABLE public.deva_rolle_ampelstatus OWNER TO meyle;

--
-- TOC entry 265 (class 1259 OID 253315)
-- Dependencies: 6 266
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
-- TOC entry 2736 (class 0 OID 0)
-- Dependencies: 265
-- Name: deva_rolle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_rolle_id_seq OWNED BY deva_rolle.id;


--
-- TOC entry 269 (class 1259 OID 253331)
-- Dependencies: 6
-- Name: deva_rolle_prozess_schritt; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_prozess_schritt (
    rolle VARCHAR(40) NOT NULL,
    prozess_schritt_definition VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_rolle_prozess_schritt OWNER TO meyle;

--
-- TOC entry 270 (class 1259 OID 253336)
-- Dependencies: 6
-- Name: deva_rolle_sicht_berechtigungen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_sicht_berechtigungen (
    berechtigung_id VARCHAR(40) NOT NULL,
    sicht_berechtigungen character varying(255)
);


ALTER TABLE public.deva_rolle_sicht_berechtigungen OWNER TO meyle;

--
-- TOC entry 274 (class 1259 OID 253354)
-- Dependencies: 6
-- Name: deva_sollzeit_wdh_klassifikation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_sollzeit_wdh_klassifikation (
    sollzeiten_id VARCHAR(40) NOT NULL,
    sollzeit BIGINT,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_sollzeit_wdh_klassifikation OWNER TO meyle;

--
-- TOC entry 272 (class 1259 OID 253341)
-- Dependencies: 2396 2397 6
-- Name: deva_sollzeiten; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_sollzeiten (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    sollzeit_bereits_vorhanden bigint,
    sollzeit_bereits_vorhanden_wdh bigint,
    meilenstein_definition VARCHAR(40) NOT NULL,
    CONSTRAINT deva_sollzeiten_sollzeit_bereits_vorhanden_check CHECK ((sollzeit_bereits_vorhanden >= 1)),
    CONSTRAINT deva_sollzeiten_sollzeit_bereits_vorhanden_wdh_check CHECK ((sollzeit_bereits_vorhanden_wdh >= 1))
);


ALTER TABLE public.deva_sollzeiten OWNER TO meyle;

--
-- TOC entry 271 (class 1259 OID 253339)
-- Dependencies: 272 6
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
-- TOC entry 2737 (class 0 OID 0)
-- Dependencies: 271
-- Name: deva_sollzeiten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_sollzeiten_id_seq OWNED BY deva_sollzeiten.id;


--
-- TOC entry 273 (class 1259 OID 253349)
-- Dependencies: 6
-- Name: deva_sollzeiten_klassifikation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_sollzeiten_klassifikation (
    sollzeiten_id VARCHAR(40) NOT NULL,
    sollzeit bigint,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_sollzeiten_klassifikation OWNER TO meyle;

--
-- TOC entry 276 (class 1259 OID 253361)
-- Dependencies: 6
-- Name: deva_uebersetzung_artikel; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_uebersetzung_artikel (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    locale character varying(2) NOT NULL,
    wort character varying(100) NOT NULL,
    bezeichnung VARCHAR(40)
);


ALTER TABLE public.deva_uebersetzung_artikel OWNER TO meyle;

--
-- TOC entry 275 (class 1259 OID 253359)
-- Dependencies: 6 276
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
-- TOC entry 2738 (class 0 OID 0)
-- Dependencies: 275
-- Name: deva_uebersetzung_artikel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_artikel_id_seq OWNED BY deva_uebersetzung_artikel.id;


--
-- TOC entry 278 (class 1259 OID 253369)
-- Dependencies: 6
-- Name: deva_uebersetzung_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_uebersetzung_komponente (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    locale character varying(2) NOT NULL,
    wort character varying(100) NOT NULL,
    bezeichnung VARCHAR(40)
);


ALTER TABLE public.deva_uebersetzung_komponente OWNER TO meyle;

--
-- TOC entry 277 (class 1259 OID 253367)
-- Dependencies: 6 278
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
-- TOC entry 2739 (class 0 OID 0)
-- Dependencies: 277
-- Name: deva_uebersetzung_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_komponente_id_seq OWNED BY deva_uebersetzung_komponente.id;


--
-- TOC entry 280 (class 1259 OID 253377)
-- Dependencies: 6
-- Name: deva_uebersetzung_produktgruppe; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_uebersetzung_produktgruppe (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    locale character varying(2) NOT NULL,
    wort character varying(100) NOT NULL,
    bezeichnung VARCHAR(40)
);


ALTER TABLE public.deva_uebersetzung_produktgruppe OWNER TO meyle;

--
-- TOC entry 279 (class 1259 OID 253375)
-- Dependencies: 6 280
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
-- TOC entry 2740 (class 0 OID 0)
-- Dependencies: 279
-- Name: deva_uebersetzung_produktgruppe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_produktgruppe_id_seq OWNED BY deva_uebersetzung_produktgruppe.id;


--
-- TOC entry 282 (class 1259 OID 253385)
-- Dependencies: 6
-- Name: deva_uebersetzung_prozess_schritt; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_uebersetzung_prozess_schritt (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    locale character varying(2) NOT NULL,
    wort character varying(100) NOT NULL,
    bezeichnung VARCHAR(40)
);


ALTER TABLE public.deva_uebersetzung_prozess_schritt OWNER TO meyle;

--
-- TOC entry 281 (class 1259 OID 253383)
-- Dependencies: 6 282
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
-- TOC entry 2741 (class 0 OID 0)
-- Dependencies: 281
-- Name: deva_uebersetzung_prozess_schritt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_prozess_schritt_id_seq OWNED BY deva_uebersetzung_prozess_schritt.id;


--
-- TOC entry 284 (class 1259 OID 253393)
-- Dependencies: 6
-- Name: deva_uebersetzung_zubehoer; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_uebersetzung_zubehoer (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    locale character varying(2) NOT NULL,
    wort character varying(100) NOT NULL,
    bezeichnung VARCHAR(40)
);


ALTER TABLE public.deva_uebersetzung_zubehoer OWNER TO meyle;

--
-- TOC entry 283 (class 1259 OID 253391)
-- Dependencies: 284 6
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
-- TOC entry 2742 (class 0 OID 0)
-- Dependencies: 283
-- Name: deva_uebersetzung_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_zubehoer_id_seq OWNED BY deva_uebersetzung_zubehoer.id;


--
-- TOC entry 286 (class 1259 OID 253401)
-- Dependencies: 6
-- Name: deva_uebersetzung_zusatzinformation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_uebersetzung_zusatzinformation (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    locale character varying(2) NOT NULL,
    wort character varying(100) NOT NULL,
    bezeichnung VARCHAR(40)
);


ALTER TABLE public.deva_uebersetzung_zusatzinformation OWNER TO meyle;

--
-- TOC entry 285 (class 1259 OID 253399)
-- Dependencies: 286 6
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
-- TOC entry 2743 (class 0 OID 0)
-- Dependencies: 285
-- Name: deva_uebersetzung_zusatzinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_zusatzinformation_id_seq OWNED BY deva_uebersetzung_zusatzinformation.id;


--
-- TOC entry 288 (class 1259 OID 253409)
-- Dependencies: 6
-- Name: deva_zubehoer; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_zubehoer (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    klassifikation character varying(255) NOT NULL,
    orig_oenummer character varying(50) NOT NULL,
    raw_oenummer character varying(255) NOT NULL,
    zubehoerbezeichnung VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_zubehoer OWNER TO meyle;

--
-- TOC entry 287 (class 1259 OID 253407)
-- Dependencies: 288 6
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
-- TOC entry 2744 (class 0 OID 0)
-- Dependencies: 287
-- Name: deva_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_zubehoer_id_seq OWNED BY deva_zubehoer.id;


--
-- TOC entry 290 (class 1259 OID 253420)
-- Dependencies: 6
-- Name: deva_zusatzinformation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_zusatzinformation (
    id VARCHAR(40) NOT NULL,
    version BIGINT,
    wert character varying(1024) NOT NULL,
    zusatzinformationbezeichnung VARCHAR(40) NOT NULL
);


ALTER TABLE public.deva_zusatzinformation OWNER TO meyle;

--
-- TOC entry 289 (class 1259 OID 253418)
-- Dependencies: 6 290
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
-- TOC entry 2745 (class 0 OID 0)
-- Dependencies: 289
-- Name: deva_zusatzinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_zusatzinformation_id_seq OWNED BY deva_zusatzinformation.id;


--
-- TOC entry 161 (class 1259 OID 252671)
-- Dependencies: 6
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
-- TOC entry 162 (class 1259 OID 252676)
-- Dependencies: 6
-- Name: drools_workiteminfo; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE drools_workiteminfo (
    workitemid VARCHAR(40) NOT NULL,
    creationdate timestamp without time zone,
    name character varying(255),
    processinstanceid VARCHAR(40) NOT NULL,
    state bigint NOT NULL,
    optlock integer,
    workitembytearray oid
);


ALTER TABLE public.drools_workiteminfo OWNER TO meyle;

--
-- TOC entry 193 (class 1259 OID 252975)
-- Dependencies: 6
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
-- TOC entry 163 (class 1259 OID 252681)
-- Dependencies: 6
-- Name: jbpm_attachment; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_attachment (
    id VARCHAR(40) NOT NULL,
    accesstype integer,
    attachedat timestamp without time zone,
    attachmentcontentid VARCHAR(40) NOT NULL,
    contenttype character varying(255),
    name character varying(255),
    attachment_size integer,
    attachedby_id character varying(255),
    taskdata_attachments_id VARCHAR(40)
);


ALTER TABLE public.jbpm_attachment OWNER TO meyle;

--
-- TOC entry 164 (class 1259 OID 252689)
-- Dependencies: 6
-- Name: jbpm_boolean_expression; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_boolean_expression (
    id VARCHAR(40) NOT NULL,
    expression text,
    type character varying(255),
    escalation_constraints_id VARCHAR(40)
);


ALTER TABLE public.jbpm_boolean_expression OWNER TO meyle;

--
-- TOC entry 165 (class 1259 OID 252697)
-- Dependencies: 6
-- Name: jbpm_content; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_content (
    id VARCHAR(40) NOT NULL,
    content oid
);


ALTER TABLE public.jbpm_content OWNER TO meyle;

--
-- TOC entry 166 (class 1259 OID 252702)
-- Dependencies: 6
-- Name: jbpm_deadline; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_deadline (
    id VARCHAR(40) NOT NULL,
    deadline_date date,
    escalated integer NOT NULL,
    deadlines_startdeadline_id VARCHAR(40),
    deadlines_enddeadline_id VARCHAR(40)
);


ALTER TABLE public.jbpm_deadline OWNER TO meyle;

--
-- TOC entry 167 (class 1259 OID 252707)
-- Dependencies: 6
-- Name: jbpm_delegation_delegates; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_delegation_delegates (
    task_id VARCHAR(40) NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_delegation_delegates OWNER TO meyle;

--
-- TOC entry 168 (class 1259 OID 252710)
-- Dependencies: 6
-- Name: jbpm_email_header; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_email_header (
    id VARCHAR(40) NOT NULL,
    body text,
    fromaddress character varying(255),
    language character varying(255),
    replytoaddress character varying(255),
    subject character varying(255)
);


ALTER TABLE public.jbpm_email_header OWNER TO meyle;

--
-- TOC entry 169 (class 1259 OID 252718)
-- Dependencies: 6
-- Name: jbpm_email_notification; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_email_notification (
    id VARCHAR(40) NOT NULL,
    priority integer NOT NULL,
    escalation_notifications_id VARCHAR(40)
);


ALTER TABLE public.jbpm_email_notification OWNER TO meyle;

--
-- TOC entry 170 (class 1259 OID 252723)
-- Dependencies: 6
-- Name: jbpm_email_notification_jbpm_email_header; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_email_notification_jbpm_email_header (
    jbpm_email_notification_id VARCHAR(40) NOT NULL,
    emailheaders_id VARCHAR(40) NOT NULL,
    emailheaders_key character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_email_notification_jbpm_email_header OWNER TO meyle;

--
-- TOC entry 171 (class 1259 OID 252730)
-- Dependencies: 6
-- Name: jbpm_escalation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_escalation (
    id VARCHAR(40) NOT NULL,
    name character varying(255),
    deadline_escalation_id VARCHAR(40)
);


ALTER TABLE public.jbpm_escalation OWNER TO meyle;

--
-- TOC entry 172 (class 1259 OID 252735)
-- Dependencies: 6
-- Name: jbpm_group; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_group (
    id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_group OWNER TO meyle;

--
-- TOC entry 173 (class 1259 OID 252740)
-- Dependencies: 6
-- Name: jbpm_i18ntext; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_i18ntext (
    id VARCHAR(40) NOT NULL,
    language character varying(255),
    text text,
    task_subjects_id VARCHAR(40),
    task_names_id VARCHAR(40),
    task_descriptions_id VARCHAR(40),
    reassignment_documentation_id VARCHAR(40),
    notification_subjects_id VARCHAR(40),
    notification_names_id VARCHAR(40),
    notification_documentation_id VARCHAR(40),
    notification_descriptions_id VARCHAR(40),
    deadline_documentation_id VARCHAR(40)
);


ALTER TABLE public.jbpm_i18ntext OWNER TO meyle;

--
-- TOC entry 174 (class 1259 OID 252748)
-- Dependencies: 6
-- Name: jbpm_notification; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_notification (
    id VARCHAR(40) NOT NULL,
    priority integer NOT NULL,
    escalation_notifications_id VARCHAR(40)
);


ALTER TABLE public.jbpm_notification OWNER TO meyle;

--
-- TOC entry 175 (class 1259 OID 252753)
-- Dependencies: 6
-- Name: jbpm_notification_bas; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_notification_bas (
    task_id VARCHAR(40) NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_notification_bas OWNER TO meyle;

--
-- TOC entry 176 (class 1259 OID 252756)
-- Dependencies: 6
-- Name: jbpm_notification_recipients; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_notification_recipients (
    task_id VARCHAR(40) NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_notification_recipients OWNER TO meyle;

--
-- TOC entry 177 (class 1259 OID 252759)
-- Dependencies: 6
-- Name: jbpm_peopleassignments_bas; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_bas (
    task_id VARCHAR(40) NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_bas OWNER TO meyle;

--
-- TOC entry 178 (class 1259 OID 252762)
-- Dependencies: 6
-- Name: jbpm_peopleassignments_exclowners; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_exclowners (
    task_id VARCHAR(40) NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_exclowners OWNER TO meyle;

--
-- TOC entry 179 (class 1259 OID 252765)
-- Dependencies: 6
-- Name: jbpm_peopleassignments_potowners; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_potowners (
    task_id VARCHAR(40) NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_potowners OWNER TO meyle;

--
-- TOC entry 180 (class 1259 OID 252768)
-- Dependencies: 6
-- Name: jbpm_peopleassignments_recipients; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_recipients (
    task_id VARCHAR(40) NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_recipients OWNER TO meyle;

--
-- TOC entry 181 (class 1259 OID 252771)
-- Dependencies: 6
-- Name: jbpm_peopleassignments_stakeholders; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_stakeholders (
    task_id VARCHAR(40) NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_stakeholders OWNER TO meyle;

--
-- TOC entry 182 (class 1259 OID 252774)
-- Dependencies: 6
-- Name: jbpm_processinstance_eventinfo; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_processinstance_eventinfo (
    id VARCHAR(40) NOT NULL,
    eventtype character varying(255),
    processinstanceid VARCHAR(40) NOT NULL,
    optlock integer
);


ALTER TABLE public.jbpm_processinstance_eventinfo OWNER TO meyle;

--
-- TOC entry 183 (class 1259 OID 252779)
-- Dependencies: 6
-- Name: jbpm_processinstance_info; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_processinstance_info (
    instanceid VARCHAR(40) NOT NULL,
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
-- TOC entry 184 (class 1259 OID 252784)
-- Dependencies: 6
-- Name: jbpm_processinstance_info_eventtypes; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_processinstance_info_eventtypes (
    jbpm_processinstance_info_id VARCHAR(40) NOT NULL,
    eventtypes character varying(255)
);


ALTER TABLE public.jbpm_processinstance_info_eventtypes OWNER TO meyle;

--
-- TOC entry 185 (class 1259 OID 252787)
-- Dependencies: 6
-- Name: jbpm_reassignment; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_reassignment (
    id VARCHAR(40) NOT NULL,
    escalation_reassignments_id VARCHAR(40)
);


ALTER TABLE public.jbpm_reassignment OWNER TO meyle;

--
-- TOC entry 186 (class 1259 OID 252792)
-- Dependencies: 6
-- Name: jbpm_reassignment_potentialowners; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_reassignment_potentialowners (
    task_id VARCHAR(40) NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_reassignment_potentialowners OWNER TO meyle;

--
-- TOC entry 187 (class 1259 OID 252795)
-- Dependencies: 6
-- Name: jbpm_subtasksstrategy; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_subtasksstrategy (
    dtype character varying(100) NOT NULL,
    id VARCHAR(40) NOT NULL,
    name character varying(255),
    task_id VARCHAR(40)
);


ALTER TABLE public.jbpm_subtasksstrategy OWNER TO meyle;

--
-- TOC entry 188 (class 1259 OID 252800)
-- Dependencies: 6
-- Name: jbpm_task; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_task (
    id VARCHAR(40) NOT NULL,
    allowedtodelegate character varying(255),
    priority integer NOT NULL,
    activationtime timestamp without time zone,
    createdon date,
    documentaccesstype character varying(255),
    documentcontentid VARCHAR(40) NOT NULL,
    documenttype character varying(255),
    expirationtime timestamp without time zone,
    faultaccesstype character varying(255),
    faultcontentid VARCHAR(40) NOT NULL,
    faultname character varying(255),
    faulttype character varying(255),
    outputaccesstype character varying(255),
    outputcontentid VARCHAR(40) NOT NULL,
    outputtype character varying(255),
    parentid VARCHAR(40) NOT NULL,
    previousstatus integer,
    processinstanceid VARCHAR(40) NOT NULL,
    skipable integer NOT NULL,
    status character varying(255),
    workitemid VARCHAR(40) NOT NULL,
    taskinitiator_id character varying(255),
    actualowner_id character varying(255),
    createdby_id character varying(255)
);


ALTER TABLE public.jbpm_task OWNER TO meyle;

--
-- TOC entry 189 (class 1259 OID 252808)
-- Dependencies: 6
-- Name: jbpm_task_comment; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_task_comment (
    id VARCHAR(40) NOT NULL,
    addedat timestamp without time zone,
    text text,
    addedby_id character varying(255),
    taskdata_comments_id VARCHAR(40)
);


ALTER TABLE public.jbpm_task_comment OWNER TO meyle;

--
-- TOC entry 190 (class 1259 OID 252816)
-- Dependencies: 6
-- Name: jbpm_user; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_user (
    id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_user OWNER TO meyle;

--
-- TOC entry 191 (class 1259 OID 252971)
-- Dependencies: 6
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
-- TOC entry 192 (class 1259 OID 252973)
-- Dependencies: 6
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
-- TOC entry 2357 (class 2604 OID 252982)
-- Dependencies: 195 194 195
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_angemeldeter_benutzer ALTER COLUMN id SET DEFAULT nextval('deva_angemeldeter_benutzer_id_seq'::regclass);


--
-- TOC entry 2358 (class 2604 OID 252990)
-- Dependencies: 196 197 197
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel ALTER COLUMN id SET DEFAULT nextval('deva_artikel_id_seq'::regclass);


--
-- TOC entry 2359 (class 2604 OID 253001)
-- Dependencies: 198 199 199
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_bestandteil ALTER COLUMN id SET DEFAULT nextval('deva_artikel_bestandteil_id_seq'::regclass);


--
-- TOC entry 2361 (class 2604 OID 253020)
-- Dependencies: 203 202 203
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_kommentar ALTER COLUMN id SET DEFAULT nextval('deva_artikel_kommentar_id_seq'::regclass);


--
-- TOC entry 2362 (class 2604 OID 253031)
-- Dependencies: 205 204 205
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_komponente ALTER COLUMN id SET DEFAULT nextval('deva_artikel_komponente_id_seq'::regclass);


--
-- TOC entry 2364 (class 2604 OID 253040)
-- Dependencies: 206 207 207
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_logbuch ALTER COLUMN id SET DEFAULT nextval('deva_artikel_logbuch_id_seq'::regclass);


--
-- TOC entry 2365 (class 2604 OID 253048)
-- Dependencies: 208 209 209
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_artikel_zubehoer_id_seq'::regclass);


--
-- TOC entry 2367 (class 2604 OID 253060)
-- Dependencies: 211 212 212
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer ALTER COLUMN id SET DEFAULT nextval('deva_benutzer_id_seq'::regclass);


--
-- TOC entry 2368 (class 2604 OID 253080)
-- Dependencies: 214 215 215
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_liste ALTER COLUMN id SET DEFAULT nextval('deva_benutzer_liste_id_seq'::regclass);


--
-- TOC entry 2369 (class 2604 OID 253100)
-- Dependencies: 219 218 219
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_artikel ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_artikel_id_seq'::regclass);


--
-- TOC entry 2370 (class 2604 OID 253108)
-- Dependencies: 221 220 221
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_komponente ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_komponente_id_seq'::regclass);


--
-- TOC entry 2371 (class 2604 OID 253116)
-- Dependencies: 222 223 223
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_produktgruppe ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_produktgruppe_id_seq'::regclass);


--
-- TOC entry 2372 (class 2604 OID 253124)
-- Dependencies: 224 225 225
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_zubehoer_id_seq'::regclass);


--
-- TOC entry 2373 (class 2604 OID 253132)
-- Dependencies: 227 226 227
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_zusatzinformation ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_zusatzinformation_id_seq'::regclass);


--
-- TOC entry 2374 (class 2604 OID 253140)
-- Dependencies: 229 228 229
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichung_prozess_schritt ALTER COLUMN id SET DEFAULT nextval('deva_bezeichung_prozess_schritt_id_seq'::regclass);


--
-- TOC entry 2375 (class 2604 OID 253153)
-- Dependencies: 230 231 231
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bonuszeit ALTER COLUMN id SET DEFAULT nextval('deva_bonuszeit_id_seq'::regclass);


--
-- TOC entry 2377 (class 2604 OID 253165)
-- Dependencies: 233 232 233
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bpmndefinition ALTER COLUMN id SET DEFAULT nextval('deva_bpmndefinition_id_seq'::regclass);


--
-- TOC entry 2378 (class 2604 OID 253176)
-- Dependencies: 236 235 236
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument ALTER COLUMN id SET DEFAULT nextval('deva_dokument_id_seq'::regclass);


--
-- TOC entry 2381 (class 2604 OID 253186)
-- Dependencies: 237 238 238
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument_binaerdaten ALTER COLUMN id SET DEFAULT nextval('deva_dokument_binaerdaten_id_seq'::regclass);


--
-- TOC entry 2382 (class 2604 OID 253194)
-- Dependencies: 239 240 240
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_faelligkeiten ALTER COLUMN id SET DEFAULT nextval('deva_faelligkeiten_id_seq'::regclass);


--
-- TOC entry 2385 (class 2604 OID 253206)
-- Dependencies: 241 242 242
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung ALTER COLUMN id SET DEFAULT nextval('deva_fahrzeug_bezeichnung_id_seq'::regclass);


--
-- TOC entry 2386 (class 2604 OID 253218)
-- Dependencies: 244 243 244
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma ALTER COLUMN id SET DEFAULT nextval('deva_firma_id_seq'::regclass);


--
-- TOC entry 2387 (class 2604 OID 253246)
-- Dependencies: 249 250 250
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente ALTER COLUMN id SET DEFAULT nextval('deva_komponente_id_seq'::regclass);


--
-- TOC entry 2388 (class 2604 OID 253262)
-- Dependencies: 253 252 253
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_kommentar ALTER COLUMN id SET DEFAULT nextval('deva_komponente_kommentar_id_seq'::regclass);


--
-- TOC entry 2389 (class 2604 OID 253273)
-- Dependencies: 254 255 255
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_logbuch ALTER COLUMN id SET DEFAULT nextval('deva_komponente_logbuch_id_seq'::regclass);


--
-- TOC entry 2390 (class 2604 OID 253286)
-- Dependencies: 258 257 258
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_produktgruppe ALTER COLUMN id SET DEFAULT nextval('deva_produktgruppe_id_seq'::regclass);


--
-- TOC entry 2391 (class 2604 OID 253294)
-- Dependencies: 259 260 260
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess ALTER COLUMN id SET DEFAULT nextval('deva_prozess_id_seq'::regclass);


--
-- TOC entry 2393 (class 2604 OID 253312)
-- Dependencies: 264 263 264
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt ALTER COLUMN id SET DEFAULT nextval('deva_prozess_schritt_id_seq'::regclass);


--
-- TOC entry 2392 (class 2604 OID 253304)
-- Dependencies: 262 261 262
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozessdefinition ALTER COLUMN id SET DEFAULT nextval('deva_prozessdefinition_id_seq'::regclass);


--
-- TOC entry 2394 (class 2604 OID 253320)
-- Dependencies: 266 265 266
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle ALTER COLUMN id SET DEFAULT nextval('deva_rolle_id_seq'::regclass);


--
-- TOC entry 2395 (class 2604 OID 253344)
-- Dependencies: 272 271 272
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeiten ALTER COLUMN id SET DEFAULT nextval('deva_sollzeiten_id_seq'::regclass);


--
-- TOC entry 2398 (class 2604 OID 253364)
-- Dependencies: 276 275 276
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_artikel ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_artikel_id_seq'::regclass);


--
-- TOC entry 2399 (class 2604 OID 253372)
-- Dependencies: 278 277 278
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_komponente ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_komponente_id_seq'::regclass);


--
-- TOC entry 2400 (class 2604 OID 253380)
-- Dependencies: 280 279 280
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_produktgruppe ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_produktgruppe_id_seq'::regclass);


--
-- TOC entry 2401 (class 2604 OID 253388)
-- Dependencies: 281 282 282
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_prozess_schritt ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_prozess_schritt_id_seq'::regclass);


--
-- TOC entry 2402 (class 2604 OID 253396)
-- Dependencies: 283 284 284
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_zubehoer_id_seq'::regclass);


--
-- TOC entry 2403 (class 2604 OID 253404)
-- Dependencies: 285 286 286
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zusatzinformation ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_zusatzinformation_id_seq'::regclass);


--
-- TOC entry 2404 (class 2604 OID 253412)
-- Dependencies: 287 288 288
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_zubehoer_id_seq'::regclass);


--
-- TOC entry 2405 (class 2604 OID 253423)
-- Dependencies: 290 289 290
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zusatzinformation ALTER COLUMN id SET DEFAULT nextval('deva_zusatzinformation_id_seq'::regclass);


--
-- TOC entry 2449 (class 2606 OID 252984)
-- Dependencies: 195 195
-- Name: deva_angemeldeter_benutzer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_angemeldeter_benutzer
    ADD CONSTRAINT deva_angemeldeter_benutzer_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 253004)
-- Dependencies: 199 199
-- Name: deva_artikel_bestandteil_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_bestandteil
    ADD CONSTRAINT deva_artikel_bestandteil_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 253009)
-- Dependencies: 200 200
-- Name: deva_artikel_dokumente_dokument_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_dokumente
    ADD CONSTRAINT deva_artikel_dokumente_dokument_id_key UNIQUE (dokument_id);


--
-- TOC entry 2465 (class 2606 OID 253014)
-- Dependencies: 201 201 201
-- Name: deva_artikel_fahrzeuge_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_fahrzeuge
    ADD CONSTRAINT deva_artikel_fahrzeuge_pkey PRIMARY KEY (artikel_id, sort_order);


--
-- TOC entry 2467 (class 2606 OID 253025)
-- Dependencies: 203 203
-- Name: deva_artikel_kommentar_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_kommentar
    ADD CONSTRAINT deva_artikel_kommentar_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 253034)
-- Dependencies: 205 205
-- Name: deva_artikel_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_komponente
    ADD CONSTRAINT deva_artikel_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 253042)
-- Dependencies: 207 207
-- Name: deva_artikel_logbuch_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_logbuch
    ADD CONSTRAINT deva_artikel_logbuch_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 252995)
-- Dependencies: 197 197
-- Name: deva_artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT deva_artikel_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 253051)
-- Dependencies: 209 209
-- Name: deva_artikel_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_zubehoer
    ADD CONSTRAINT deva_artikel_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 253074)
-- Dependencies: 213 213 213
-- Name: deva_benutzer_firma_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_firma
    ADD CONSTRAINT deva_benutzer_firma_pkey PRIMARY KEY (benutzer, zugeordnete_firma);


--
-- TOC entry 2484 (class 2606 OID 253082)
-- Dependencies: 215 215
-- Name: deva_benutzer_liste_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_liste
    ADD CONSTRAINT deva_benutzer_liste_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 253084)
-- Dependencies: 215 215
-- Name: deva_benutzer_liste_singleton_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_liste
    ADD CONSTRAINT deva_benutzer_liste_singleton_key UNIQUE (singleton);


--
-- TOC entry 2475 (class 2606 OID 253069)
-- Dependencies: 212 212
-- Name: deva_benutzer_name_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT deva_benutzer_name_key UNIQUE (name);


--
-- TOC entry 2477 (class 2606 OID 253065)
-- Dependencies: 212 212
-- Name: deva_benutzer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT deva_benutzer_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 253089)
-- Dependencies: 216 216 216
-- Name: deva_benutzer_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_produktgruppe
    ADD CONSTRAINT deva_benutzer_produktgruppe_pkey PRIMARY KEY (benutzer, produktgruppe);


--
-- TOC entry 2490 (class 2606 OID 253094)
-- Dependencies: 217 217 217
-- Name: deva_benutzer_rollen_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_rollen
    ADD CONSTRAINT deva_benutzer_rollen_pkey PRIMARY KEY (benutzer, rolle);


--
-- TOC entry 2479 (class 2606 OID 253067)
-- Dependencies: 212 212
-- Name: deva_benutzer_username_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT deva_benutzer_username_key UNIQUE (username);


--
-- TOC entry 2492 (class 2606 OID 253102)
-- Dependencies: 219 219
-- Name: deva_bezeichnung_artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_artikel
    ADD CONSTRAINT deva_bezeichnung_artikel_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 253110)
-- Dependencies: 221 221
-- Name: deva_bezeichnung_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_komponente
    ADD CONSTRAINT deva_bezeichnung_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 253118)
-- Dependencies: 223 223
-- Name: deva_bezeichnung_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_produktgruppe
    ADD CONSTRAINT deva_bezeichnung_produktgruppe_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 253126)
-- Dependencies: 225 225
-- Name: deva_bezeichnung_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_zubehoer
    ADD CONSTRAINT deva_bezeichnung_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 253134)
-- Dependencies: 227 227
-- Name: deva_bezeichnung_zusatzinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_zusatzinformation
    ADD CONSTRAINT deva_bezeichnung_zusatzinformation_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 253147)
-- Dependencies: 229 229
-- Name: deva_bezeichung_prozess_schritt_identifier_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichung_prozess_schritt
    ADD CONSTRAINT deva_bezeichung_prozess_schritt_identifier_key UNIQUE (identifier);


--
-- TOC entry 2505 (class 2606 OID 253145)
-- Dependencies: 229 229
-- Name: deva_bezeichung_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichung_prozess_schritt
    ADD CONSTRAINT deva_bezeichung_prozess_schritt_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 253159)
-- Dependencies: 231 231
-- Name: deva_bonuszeit_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bonuszeit
    ADD CONSTRAINT deva_bonuszeit_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 253167)
-- Dependencies: 233 233
-- Name: deva_bpmndefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bpmndefinition
    ADD CONSTRAINT deva_bpmndefinition_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 253188)
-- Dependencies: 238 238
-- Name: deva_dokument_binaerdaten_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_dokument_binaerdaten
    ADD CONSTRAINT deva_dokument_binaerdaten_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 253180)
-- Dependencies: 236 236
-- Name: deva_dokument_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_dokument
    ADD CONSTRAINT deva_dokument_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 253198)
-- Dependencies: 240 240
-- Name: deva_faelligkeiten_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_faelligkeiten
    ADD CONSTRAINT deva_faelligkeiten_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 253200)
-- Dependencies: 240 240
-- Name: deva_faelligkeiten_singleton_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_faelligkeiten
    ADD CONSTRAINT deva_faelligkeiten_singleton_key UNIQUE (singleton);


--
-- TOC entry 2520 (class 2606 OID 253210)
-- Dependencies: 242 242
-- Name: deva_fahrzeug_bezeichnung_bezeichnung_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung
    ADD CONSTRAINT deva_fahrzeug_bezeichnung_bezeichnung_key UNIQUE (bezeichnung);


--
-- TOC entry 2522 (class 2606 OID 253212)
-- Dependencies: 242 242 242
-- Name: deva_fahrzeug_bezeichnung_fahrzeug_typ_hersteller_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung
    ADD CONSTRAINT deva_fahrzeug_bezeichnung_fahrzeug_typ_hersteller_key UNIQUE (fahrzeug_typ, hersteller);


--
-- TOC entry 2524 (class 2606 OID 253208)
-- Dependencies: 242 242
-- Name: deva_fahrzeug_bezeichnung_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung
    ADD CONSTRAINT deva_fahrzeug_bezeichnung_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 253227)
-- Dependencies: 245 245
-- Name: deva_firma_ansprechpartner_benutzer_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma_ansprechpartner
    ADD CONSTRAINT deva_firma_ansprechpartner_benutzer_id_key UNIQUE (benutzer_id);


--
-- TOC entry 2526 (class 2606 OID 253222)
-- Dependencies: 244 244
-- Name: deva_firma_name_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma
    ADD CONSTRAINT deva_firma_name_key UNIQUE (name);


--
-- TOC entry 2528 (class 2606 OID 253220)
-- Dependencies: 244 244
-- Name: deva_firma_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma
    ADD CONSTRAINT deva_firma_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 253235)
-- Dependencies: 247 247
-- Name: deva_firma_sollzeiten_artikel_sollzeiten_artikel_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma_sollzeiten_artikel
    ADD CONSTRAINT deva_firma_sollzeiten_artikel_sollzeiten_artikel_id_key UNIQUE (sollzeiten_artikel_id);


--
-- TOC entry 2534 (class 2606 OID 253240)
-- Dependencies: 248 248
-- Name: deva_firma_sollzeiten_komponente_sollzeiten_komponente_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma_sollzeiten_komponente
    ADD CONSTRAINT deva_firma_sollzeiten_komponente_sollzeiten_komponente_id_key UNIQUE (sollzeiten_komponente_id);


--
-- TOC entry 2539 (class 2606 OID 253256)
-- Dependencies: 251 251
-- Name: deva_komponente_dokumente_dokument_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_dokumente
    ADD CONSTRAINT deva_komponente_dokumente_dokument_id_key UNIQUE (dokument_id);


--
-- TOC entry 2541 (class 2606 OID 253267)
-- Dependencies: 253 253
-- Name: deva_komponente_kommentar_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_kommentar
    ADD CONSTRAINT deva_komponente_kommentar_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 253275)
-- Dependencies: 255 255
-- Name: deva_komponente_logbuch_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_logbuch
    ADD CONSTRAINT deva_komponente_logbuch_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 253251)
-- Dependencies: 250 250
-- Name: deva_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT deva_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 253280)
-- Dependencies: 256 256
-- Name: deva_komponente_zusatzinformationen_zusatzinfo_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_zusatzinformationen
    ADD CONSTRAINT deva_komponente_zusatzinformationen_zusatzinfo_id_key UNIQUE (zusatzinfo_id);


--
-- TOC entry 2547 (class 2606 OID 253288)
-- Dependencies: 258 258
-- Name: deva_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_produktgruppe
    ADD CONSTRAINT deva_produktgruppe_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 253296)
-- Dependencies: 260 260
-- Name: deva_prozess_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT deva_prozess_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 253298)
-- Dependencies: 260 260
-- Name: deva_prozess_process_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT deva_prozess_process_id_key UNIQUE (process_id);


--
-- TOC entry 2555 (class 2606 OID 253314)
-- Dependencies: 264 264
-- Name: deva_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT deva_prozess_schritt_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 253306)
-- Dependencies: 262 262
-- Name: deva_prozessdefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozessdefinition
    ADD CONSTRAINT deva_prozessdefinition_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 253322)
-- Dependencies: 266 266
-- Name: deva_rolle_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_rolle
    ADD CONSTRAINT deva_rolle_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 253335)
-- Dependencies: 269 269 269
-- Name: deva_rolle_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_rolle_prozess_schritt
    ADD CONSTRAINT deva_rolle_prozess_schritt_pkey PRIMARY KEY (rolle, prozess_schritt_definition);


--
-- TOC entry 2559 (class 2606 OID 253324)
-- Dependencies: 266 266
-- Name: deva_rolle_rolle_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_rolle
    ADD CONSTRAINT deva_rolle_rolle_key UNIQUE (rolle);


--
-- TOC entry 2567 (class 2606 OID 253358)
-- Dependencies: 274 274 274
-- Name: deva_sollzeit_wdh_klassifikation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_sollzeit_wdh_klassifikation
    ADD CONSTRAINT deva_sollzeit_wdh_klassifikation_pkey PRIMARY KEY (sollzeiten_id, klassifikation);


--
-- TOC entry 2565 (class 2606 OID 253353)
-- Dependencies: 273 273 273
-- Name: deva_sollzeiten_klassifikation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_sollzeiten_klassifikation
    ADD CONSTRAINT deva_sollzeiten_klassifikation_pkey PRIMARY KEY (sollzeiten_id, klassifikation);


--
-- TOC entry 2563 (class 2606 OID 253348)
-- Dependencies: 272 272
-- Name: deva_sollzeiten_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_sollzeiten
    ADD CONSTRAINT deva_sollzeiten_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 253366)
-- Dependencies: 276 276
-- Name: deva_uebersetzung_artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_artikel
    ADD CONSTRAINT deva_uebersetzung_artikel_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 253374)
-- Dependencies: 278 278
-- Name: deva_uebersetzung_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_komponente
    ADD CONSTRAINT deva_uebersetzung_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 253382)
-- Dependencies: 280 280
-- Name: deva_uebersetzung_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_produktgruppe
    ADD CONSTRAINT deva_uebersetzung_produktgruppe_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 253390)
-- Dependencies: 282 282
-- Name: deva_uebersetzung_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_prozess_schritt
    ADD CONSTRAINT deva_uebersetzung_prozess_schritt_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 253398)
-- Dependencies: 284 284
-- Name: deva_uebersetzung_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_zubehoer
    ADD CONSTRAINT deva_uebersetzung_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 253406)
-- Dependencies: 286 286
-- Name: deva_uebersetzung_zusatzinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_zusatzinformation
    ADD CONSTRAINT deva_uebersetzung_zusatzinformation_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 253417)
-- Dependencies: 288 288
-- Name: deva_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_zubehoer
    ADD CONSTRAINT deva_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 253428)
-- Dependencies: 290 290
-- Name: deva_zusatzinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_zusatzinformation
    ADD CONSTRAINT deva_zusatzinformation_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 252675)
-- Dependencies: 161 161
-- Name: drools_sessioninfo_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY drools_sessioninfo
    ADD CONSTRAINT drools_sessioninfo_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 252680)
-- Dependencies: 162 162
-- Name: drools_workiteminfo_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY drools_workiteminfo
    ADD CONSTRAINT drools_workiteminfo_pkey PRIMARY KEY (workitemid);


--
-- TOC entry 2411 (class 2606 OID 252688)
-- Dependencies: 163 163
-- Name: jbpm_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_attachment
    ADD CONSTRAINT jbpm_attachment_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 252696)
-- Dependencies: 164 164
-- Name: jbpm_boolean_expression_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_boolean_expression
    ADD CONSTRAINT jbpm_boolean_expression_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 252701)
-- Dependencies: 165 165
-- Name: jbpm_content_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_content
    ADD CONSTRAINT jbpm_content_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 252706)
-- Dependencies: 166 166
-- Name: jbpm_deadline_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_deadline
    ADD CONSTRAINT jbpm_deadline_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 252717)
-- Dependencies: 168 168
-- Name: jbpm_email_header_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_header
    ADD CONSTRAINT jbpm_email_header_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 252729)
-- Dependencies: 170 170
-- Name: jbpm_email_notification_jbpm_email_header_emailheaders_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT jbpm_email_notification_jbpm_email_header_emailheaders_id_key UNIQUE (emailheaders_id);


--
-- TOC entry 2425 (class 2606 OID 252727)
-- Dependencies: 170 170 170
-- Name: jbpm_email_notification_jbpm_email_header_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT jbpm_email_notification_jbpm_email_header_pkey PRIMARY KEY (jbpm_email_notification_id, emailheaders_key);


--
-- TOC entry 2421 (class 2606 OID 252722)
-- Dependencies: 169 169
-- Name: jbpm_email_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_notification
    ADD CONSTRAINT jbpm_email_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 252734)
-- Dependencies: 171 171
-- Name: jbpm_escalation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_escalation
    ADD CONSTRAINT jbpm_escalation_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 252739)
-- Dependencies: 172 172
-- Name: jbpm_group_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_group
    ADD CONSTRAINT jbpm_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 252747)
-- Dependencies: 173 173
-- Name: jbpm_i18ntext_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT jbpm_i18ntext_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 252752)
-- Dependencies: 174 174
-- Name: jbpm_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_notification
    ADD CONSTRAINT jbpm_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 252778)
-- Dependencies: 182 182
-- Name: jbpm_processinstance_eventinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_processinstance_eventinfo
    ADD CONSTRAINT jbpm_processinstance_eventinfo_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 252783)
-- Dependencies: 183 183
-- Name: jbpm_processinstance_info_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_processinstance_info
    ADD CONSTRAINT jbpm_processinstance_info_pkey PRIMARY KEY (instanceid);


--
-- TOC entry 2439 (class 2606 OID 252791)
-- Dependencies: 185 185
-- Name: jbpm_reassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_reassignment
    ADD CONSTRAINT jbpm_reassignment_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 252799)
-- Dependencies: 187 187
-- Name: jbpm_subtasksstrategy_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_subtasksstrategy
    ADD CONSTRAINT jbpm_subtasksstrategy_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 252815)
-- Dependencies: 189 189
-- Name: jbpm_task_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_task_comment
    ADD CONSTRAINT jbpm_task_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 252807)
-- Dependencies: 188 188
-- Name: jbpm_task_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT jbpm_task_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 252820)
-- Dependencies: 190 190
-- Name: jbpm_user_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_user
    ADD CONSTRAINT jbpm_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 1259 OID 253439)
-- Dependencies: 197
-- Name: ampel_status_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX ampel_status_idx ON deva_artikel USING btree (ampel_status);


--
-- TOC entry 2451 (class 1259 OID 253440)
-- Dependencies: 197 197 197 197
-- Name: artikel_filter_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX artikel_filter_idx ON deva_artikel USING btree (lieferant, kunde, ampel_status, artikelbezeichnung);


--
-- TOC entry 2452 (class 1259 OID 253442)
-- Dependencies: 197
-- Name: artikelprozess_status_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX artikelprozess_status_idx ON deva_artikel USING btree (artikelprozess_status);


--
-- TOC entry 2518 (class 1259 OID 253634)
-- Dependencies: 242
-- Name: bezeichnung_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX bezeichnung_idx ON deva_fahrzeug_bezeichnung USING btree (bezeichnung);


--
-- TOC entry 2480 (class 1259 OID 253562)
-- Dependencies: 212
-- Name: firma_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX firma_idx ON deva_benutzer USING btree (firma);


--
-- TOC entry 2537 (class 1259 OID 253675)
-- Dependencies: 250 250 250
-- Name: komponente_filter_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX komponente_filter_idx ON deva_komponente USING btree (lieferant, kunde, komponentenbezeichnung);


--
-- TOC entry 2455 (class 1259 OID 253441)
-- Dependencies: 197
-- Name: kunde_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX kunde_idx ON deva_artikel USING btree (kunde);


--
-- TOC entry 2456 (class 1259 OID 253443)
-- Dependencies: 197
-- Name: lieferant_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX lieferant_idx ON deva_artikel USING btree (lieferant);


--
-- TOC entry 2493 (class 1259 OID 253598)
-- Dependencies: 219
-- Name: produktgruppe_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX produktgruppe_idx ON deva_bezeichnung_artikel USING btree (produktgruppe);


--
-- TOC entry 2457 (class 1259 OID 253446)
-- Dependencies: 197
-- Name: raw_lieferantennummer_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX raw_lieferantennummer_idx ON deva_artikel USING btree (raw_lieferantennummer);


--
-- TOC entry 2458 (class 1259 OID 253444)
-- Dependencies: 197
-- Name: raw_meylenummer_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX raw_meylenummer_idx ON deva_artikel USING btree (raw_meylenummer);


--
-- TOC entry 2459 (class 1259 OID 253445)
-- Dependencies: 197
-- Name: raw_oenummer_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX raw_oenummer_idx ON deva_artikel USING btree (raw_oenummer);


--
-- TOC entry 2692 (class 2606 OID 253831)
-- Dependencies: 2562 274 272
-- Name: fk12895194c589307f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeit_wdh_klassifikation
    ADD CONSTRAINT fk12895194c589307f FOREIGN KEY (sollzeiten_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2639 (class 2606 OID 253563)
-- Dependencies: 212 2527 244
-- Name: fk129925f083e97000; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT fk129925f083e97000 FOREIGN KEY (firma) REFERENCES deva_firma(id);


--
-- TOC entry 2634 (class 2606 OID 253537)
-- Dependencies: 207 197 2453
-- Name: fk147182967ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_logbuch
    ADD CONSTRAINT fk147182967ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2633 (class 2606 OID 253532)
-- Dependencies: 207 212 2476
-- Name: fk14718296dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_logbuch
    ADD CONSTRAINT fk14718296dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2595 (class 2606 OID 252876)
-- Dependencies: 166 2416 173
-- Name: fk17e984153330f6d9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e984153330f6d9 FOREIGN KEY (deadline_documentation_id) REFERENCES jbpm_deadline(id);


--
-- TOC entry 2594 (class 2606 OID 252871)
-- Dependencies: 2438 185 173
-- Name: fk17e984155eebb6d9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e984155eebb6d9 FOREIGN KEY (reassignment_documentation_id) REFERENCES jbpm_reassignment(id);


--
-- TOC entry 2596 (class 2606 OID 252881)
-- Dependencies: 173 188 2442
-- Name: fk17e9841569b21ee8; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e9841569b21ee8 FOREIGN KEY (task_descriptions_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2598 (class 2606 OID 252891)
-- Dependencies: 2442 188 173
-- Name: fk17e9841598b62b; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e9841598b62b FOREIGN KEY (task_names_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2597 (class 2606 OID 252886)
-- Dependencies: 2442 173 188
-- Name: fk17e98415b2fa6b18; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e98415b2fa6b18 FOREIGN KEY (task_subjects_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2654 (class 2606 OID 253640)
-- Dependencies: 245 244 2527
-- Name: fk21484eb75cf6cf14; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_ansprechpartner
    ADD CONSTRAINT fk21484eb75cf6cf14 FOREIGN KEY (firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2653 (class 2606 OID 253635)
-- Dependencies: 245 212 2476
-- Name: fk21484eb7d52de102; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_ansprechpartner
    ADD CONSTRAINT fk21484eb7d52de102 FOREIGN KEY (benutzer_id) REFERENCES deva_benutzer(id);


--
-- TOC entry 2646 (class 2606 OID 253599)
-- Dependencies: 219 258 2546
-- Name: fk2477d5ba2525ea1e; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_artikel
    ADD CONSTRAINT fk2477d5ba2525ea1e FOREIGN KEY (produktgruppe) REFERENCES deva_produktgruppe(id);


--
-- TOC entry 2601 (class 2606 OID 252906)
-- Dependencies: 178 188 2442
-- Name: fk2c7efe4e36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_exclowners
    ADD CONSTRAINT fk2c7efe4e36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2643 (class 2606 OID 253583)
-- Dependencies: 216 2546 258
-- Name: fk3133f1b32525ea1e; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_produktgruppe
    ADD CONSTRAINT fk3133f1b32525ea1e FOREIGN KEY (produktgruppe) REFERENCES deva_produktgruppe(id);


--
-- TOC entry 2642 (class 2606 OID 253578)
-- Dependencies: 216 2476 212
-- Name: fk3133f1b3dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_produktgruppe
    ADD CONSTRAINT fk3133f1b3dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2607 (class 2606 OID 252936)
-- Dependencies: 186 185 2438
-- Name: fk3178ef69e17e130f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_reassignment_potentialowners
    ADD CONSTRAINT fk3178ef69e17e130f FOREIGN KEY (task_id) REFERENCES jbpm_reassignment(id);


--
-- TOC entry 2690 (class 2606 OID 253821)
-- Dependencies: 2504 229 272
-- Name: fk31b0dbce38fe1d3c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeiten
    ADD CONSTRAINT fk31b0dbce38fe1d3c FOREIGN KEY (meilenstein_definition) REFERENCES deva_bezeichung_prozess_schritt(id);


--
-- TOC entry 2600 (class 2606 OID 252901)
-- Dependencies: 188 177 2442
-- Name: fk32b3fd6236b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_bas
    ADD CONSTRAINT fk32b3fd6236b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2687 (class 2606 OID 253806)
-- Dependencies: 2556 266 269
-- Name: fk3804709e6273aba8; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_prozess_schritt
    ADD CONSTRAINT fk3804709e6273aba8 FOREIGN KEY (rolle) REFERENCES deva_rolle(id);


--
-- TOC entry 2688 (class 2606 OID 253811)
-- Dependencies: 2504 269 229
-- Name: fk3804709e75b486b9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_prozess_schritt
    ADD CONSTRAINT fk3804709e75b486b9 FOREIGN KEY (prozess_schritt_definition) REFERENCES deva_bezeichung_prozess_schritt(id);


--
-- TOC entry 2669 (class 2606 OID 253716)
-- Dependencies: 253 212 2476
-- Name: fk3b7548acdc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_kommentar
    ADD CONSTRAINT fk3b7548acdc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2670 (class 2606 OID 253721)
-- Dependencies: 253 250 2535
-- Name: fk3b7548acdfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_kommentar
    ADD CONSTRAINT fk3b7548acdfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2588 (class 2606 OID 252841)
-- Dependencies: 166 2442 188
-- Name: fk414b622227abeb8a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_deadline
    ADD CONSTRAINT fk414b622227abeb8a FOREIGN KEY (deadlines_enddeadline_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2587 (class 2606 OID 252836)
-- Dependencies: 2442 166 188
-- Name: fk414b6222684baca3; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_deadline
    ADD CONSTRAINT fk414b6222684baca3 FOREIGN KEY (deadlines_startdeadline_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2605 (class 2606 OID 252926)
-- Dependencies: 184 2436 183
-- Name: fk42e004eb2143f831; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_processinstance_info_eventtypes
    ADD CONSTRAINT fk42e004eb2143f831 FOREIGN KEY (jbpm_processinstance_info_id) REFERENCES jbpm_processinstance_info(instanceid);


--
-- TOC entry 2589 (class 2606 OID 252846)
-- Dependencies: 167 188 2442
-- Name: fk4e75de136b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_delegation_delegates
    ADD CONSTRAINT fk4e75de136b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2657 (class 2606 OID 253655)
-- Dependencies: 247 244 2527
-- Name: fk4f2030575cf6cf14; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_artikel
    ADD CONSTRAINT fk4f2030575cf6cf14 FOREIGN KEY (firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2658 (class 2606 OID 253660)
-- Dependencies: 247 272 2562
-- Name: fk4f20305774e70772; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_artikel
    ADD CONSTRAINT fk4f20305774e70772 FOREIGN KEY (sollzeiten_artikel_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2647 (class 2606 OID 253604)
-- Dependencies: 2554 264 231
-- Name: fk4f4940821123a3e4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bonuszeit
    ADD CONSTRAINT fk4f4940821123a3e4 FOREIGN KEY (prozess_schritt) REFERENCES deva_prozess_schritt(id);


--
-- TOC entry 2648 (class 2606 OID 253609)
-- Dependencies: 2476 231 212
-- Name: fk4f4940824c4c8e48; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bonuszeit
    ADD CONSTRAINT fk4f4940824c4c8e48 FOREIGN KEY (gewaehrt_von) REFERENCES deva_benutzer(id);


--
-- TOC entry 2686 (class 2606 OID 253801)
-- Dependencies: 268 2556 266
-- Name: fk511f24132e56239d; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_ampelstatus
    ADD CONSTRAINT fk511f24132e56239d FOREIGN KEY (ampelstatus_id) REFERENCES deva_rolle(id);


--
-- TOC entry 2693 (class 2606 OID 253836)
-- Dependencies: 2491 219 276
-- Name: fk51c371f7eacc69fa; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_artikel
    ADD CONSTRAINT fk51c371f7eacc69fa FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_artikel(id);


--
-- TOC entry 2696 (class 2606 OID 253851)
-- Dependencies: 2504 282 229
-- Name: fk560f3573153e746f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_prozess_schritt
    ADD CONSTRAINT fk560f3573153e746f FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichung_prozess_schritt(id);


--
-- TOC entry 2694 (class 2606 OID 253841)
-- Dependencies: 2494 221 278
-- Name: fk57aff0351dc451da; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_komponente
    ADD CONSTRAINT fk57aff0351dc451da FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_komponente(id);


--
-- TOC entry 2632 (class 2606 OID 253527)
-- Dependencies: 205 197 2453
-- Name: fk5b3e08463d3b7a12; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_komponente
    ADD CONSTRAINT fk5b3e08463d3b7a12 FOREIGN KEY (artikel) REFERENCES deva_artikel(id);


--
-- TOC entry 2631 (class 2606 OID 253522)
-- Dependencies: 205 250 2535
-- Name: fk5b3e08468d6ce006; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_komponente
    ADD CONSTRAINT fk5b3e08468d6ce006 FOREIGN KEY (komponente) REFERENCES deva_komponente(id);


--
-- TOC entry 2685 (class 2606 OID 253796)
-- Dependencies: 267 266 2556
-- Name: fk5b9f4d34d1137703; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_aktions_berechtigungen
    ADD CONSTRAINT fk5b9f4d34d1137703 FOREIGN KEY (berechtigung_id) REFERENCES deva_rolle(id);


--
-- TOC entry 2593 (class 2606 OID 252866)
-- Dependencies: 171 166 2416
-- Name: fk5ca4a3dfc7a04c70; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_escalation
    ADD CONSTRAINT fk5ca4a3dfc7a04c70 FOREIGN KEY (deadline_escalation_id) REFERENCES jbpm_deadline(id);


--
-- TOC entry 2636 (class 2606 OID 253547)
-- Dependencies: 2453 209 197
-- Name: fk5d10f7783d3b7a12; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zubehoer
    ADD CONSTRAINT fk5d10f7783d3b7a12 FOREIGN KEY (artikel) REFERENCES deva_artikel(id);


--
-- TOC entry 2635 (class 2606 OID 253542)
-- Dependencies: 2580 288 209
-- Name: fk5d10f778b3b24cea; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zubehoer
    ADD CONSTRAINT fk5d10f778b3b24cea FOREIGN KEY (zubehoer) REFERENCES deva_zubehoer(id);


--
-- TOC entry 2660 (class 2606 OID 253670)
-- Dependencies: 248 244 2527
-- Name: fk635e15d55cf6cf14; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_komponente
    ADD CONSTRAINT fk635e15d55cf6cf14 FOREIGN KEY (firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2659 (class 2606 OID 253665)
-- Dependencies: 248 272 2562
-- Name: fk635e15d5b3de8e56; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_komponente
    ADD CONSTRAINT fk635e15d5b3de8e56 FOREIGN KEY (sollzeiten_komponente_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2622 (class 2606 OID 253477)
-- Dependencies: 2491 197 219
-- Name: fk6e9467b92325ac4e; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b92325ac4e FOREIGN KEY (artikelbezeichnung) REFERENCES deva_bezeichnung_artikel(id);


--
-- TOC entry 2619 (class 2606 OID 253462)
-- Dependencies: 244 2527 197
-- Name: fk6e9467b938fd1c19; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b938fd1c19 FOREIGN KEY (lieferant) REFERENCES deva_firma(id);


--
-- TOC entry 2616 (class 2606 OID 253447)
-- Dependencies: 2548 260 197
-- Name: fk6e9467b96b6c33bf; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b96b6c33bf FOREIGN KEY (artikelprozess) REFERENCES deva_prozess(id);


--
-- TOC entry 2617 (class 2606 OID 253452)
-- Dependencies: 2527 244 197
-- Name: fk6e9467b9843549e2; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b9843549e2 FOREIGN KEY (kunde) REFERENCES deva_firma(id);


--
-- TOC entry 2620 (class 2606 OID 253467)
-- Dependencies: 2476 197 212
-- Name: fk6e9467b98c57da6c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b98c57da6c FOREIGN KEY (angelegt_von) REFERENCES deva_benutzer(id);


--
-- TOC entry 2618 (class 2606 OID 253457)
-- Dependencies: 197 197 2453
-- Name: fk6e9467b98c8fc63d; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b98c8fc63d FOREIGN KEY (paarbeziehung) REFERENCES deva_artikel(id);


--
-- TOC entry 2621 (class 2606 OID 253472)
-- Dependencies: 2510 197 236
-- Name: fk6e9467b9a1cbfc4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b9a1cbfc4 FOREIGN KEY (artikelbild) REFERENCES deva_dokument(id);


--
-- TOC entry 2650 (class 2606 OID 253619)
-- Dependencies: 234 233 2508
-- Name: fk70d1bb683ebdb8fe; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bpmn_definition_task_handler_names
    ADD CONSTRAINT fk70d1bb683ebdb8fe FOREIGN KEY (bpmn_definition_id) REFERENCES deva_bpmndefinition(id);


--
-- TOC entry 2602 (class 2606 OID 252911)
-- Dependencies: 179 188 2442
-- Name: fk73d7058336b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_potowners
    ADD CONSTRAINT fk73d7058336b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2671 (class 2606 OID 253726)
-- Dependencies: 255 212 2476
-- Name: fk77be0c10dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_logbuch
    ADD CONSTRAINT fk77be0c10dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2672 (class 2606 OID 253731)
-- Dependencies: 255 250 2535
-- Name: fk77be0c10dfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_logbuch
    ADD CONSTRAINT fk77be0c10dfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2630 (class 2606 OID 253517)
-- Dependencies: 203 197 2453
-- Name: fk792535b27ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_kommentar
    ADD CONSTRAINT fk792535b27ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2629 (class 2606 OID 253512)
-- Dependencies: 2476 212 203
-- Name: fk792535b2dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_kommentar
    ADD CONSTRAINT fk792535b2dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2624 (class 2606 OID 253487)
-- Dependencies: 2453 197 199
-- Name: fk7a16c7a13d3b7a12; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_bestandteil
    ADD CONSTRAINT fk7a16c7a13d3b7a12 FOREIGN KEY (artikel) REFERENCES deva_artikel(id);


--
-- TOC entry 2623 (class 2606 OID 253482)
-- Dependencies: 2453 199 197
-- Name: fk7a16c7a1f093319a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_bestandteil
    ADD CONSTRAINT fk7a16c7a1f093319a FOREIGN KEY (artikel_bestandteil) REFERENCES deva_artikel(id);


--
-- TOC entry 2684 (class 2606 OID 253791)
-- Dependencies: 2548 264 260
-- Name: fk7cf7493511000a0a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT fk7cf7493511000a0a FOREIGN KEY (aktueller_schritt) REFERENCES deva_prozess(id);


--
-- TOC entry 2682 (class 2606 OID 253781)
-- Dependencies: 2548 264 260
-- Name: fk7cf74935199fc6f5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT fk7cf74935199fc6f5 FOREIGN KEY (abgeschlossener_schritt) REFERENCES deva_prozess(id);


--
-- TOC entry 2683 (class 2606 OID 253786)
-- Dependencies: 2504 229 264
-- Name: fk7cf7493575b486b9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT fk7cf7493575b486b9 FOREIGN KEY (prozess_schritt_definition) REFERENCES deva_bezeichung_prozess_schritt(id);


--
-- TOC entry 2604 (class 2606 OID 252921)
-- Dependencies: 181 188 2442
-- Name: fk7dcd4ddf36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_stakeholders
    ADD CONSTRAINT fk7dcd4ddf36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2641 (class 2606 OID 253573)
-- Dependencies: 213 2527 244
-- Name: fk805a2eb45b19b851; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_firma
    ADD CONSTRAINT fk805a2eb45b19b851 FOREIGN KEY (zugeordnete_firma) REFERENCES deva_firma(id);


--
-- TOC entry 2640 (class 2606 OID 253568)
-- Dependencies: 213 2476 212
-- Name: fk805a2eb4dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_firma
    ADD CONSTRAINT fk805a2eb4dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2678 (class 2606 OID 253761)
-- Dependencies: 260 2554 264
-- Name: fk87d3108562008c47; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT fk87d3108562008c47 FOREIGN KEY (naechster_meilenstein) REFERENCES deva_prozess_schritt(id);


--
-- TOC entry 2677 (class 2606 OID 253756)
-- Dependencies: 260 233 2508
-- Name: fk87d31085975a806a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT fk87d31085975a806a FOREIGN KEY (bpmn_definition) REFERENCES deva_bpmndefinition(id);


--
-- TOC entry 2679 (class 2606 OID 253766)
-- Dependencies: 262 260 2552
-- Name: fk87d31085eb1c5f20; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT fk87d31085eb1c5f20 FOREIGN KEY (prozess_definition) REFERENCES deva_prozessdefinition(id);


--
-- TOC entry 2695 (class 2606 OID 253846)
-- Dependencies: 280 223 2496
-- Name: fk88d3d6d9315e404; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_produktgruppe
    ADD CONSTRAINT fk88d3d6d9315e404 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_produktgruppe(id);


--
-- TOC entry 2697 (class 2606 OID 253856)
-- Dependencies: 284 225 2498
-- Name: fk8b6a0f27adede368; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zubehoer
    ADD CONSTRAINT fk8b6a0f27adede368 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_zubehoer(id);


--
-- TOC entry 2699 (class 2606 OID 253866)
-- Dependencies: 225 288 2498
-- Name: fk8b7d1a55e7b2276; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zubehoer
    ADD CONSTRAINT fk8b7d1a55e7b2276 FOREIGN KEY (zubehoerbezeichnung) REFERENCES deva_bezeichnung_zubehoer(id);


--
-- TOC entry 2691 (class 2606 OID 253826)
-- Dependencies: 2562 272 273
-- Name: fk8e4ee667c589307f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeiten_klassifikation
    ADD CONSTRAINT fk8e4ee667c589307f FOREIGN KEY (sollzeiten_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2592 (class 2606 OID 252861)
-- Dependencies: 168 2418 170
-- Name: fk9c2287131f7b912a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT fk9c2287131f7b912a FOREIGN KEY (emailheaders_id) REFERENCES jbpm_email_header(id);


--
-- TOC entry 2591 (class 2606 OID 252856)
-- Dependencies: 169 170 2420
-- Name: fk9c228713351621ef; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT fk9c228713351621ef FOREIGN KEY (jbpm_email_notification_id) REFERENCES jbpm_email_notification(id);


--
-- TOC entry 2608 (class 2606 OID 252941)
-- Dependencies: 188 187 2442
-- Name: fk9d95288b36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_subtasksstrategy
    ADD CONSTRAINT fk9d95288b36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2645 (class 2606 OID 253593)
-- Dependencies: 266 2556 217
-- Name: fk9fb79f156273aba8; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_rollen
    ADD CONSTRAINT fk9fb79f156273aba8 FOREIGN KEY (rolle) REFERENCES deva_rolle(id);


--
-- TOC entry 2644 (class 2606 OID 253588)
-- Dependencies: 2476 212 217
-- Name: fk9fb79f15dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_rollen
    ADD CONSTRAINT fk9fb79f15dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2681 (class 2606 OID 253776)
-- Dependencies: 262 244 2527
-- Name: fka2830f9838fd1c19; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozessdefinition
    ADD CONSTRAINT fka2830f9838fd1c19 FOREIGN KEY (lieferant) REFERENCES deva_firma(id);


--
-- TOC entry 2680 (class 2606 OID 253771)
-- Dependencies: 2527 244 262
-- Name: fka2830f98843549e2; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozessdefinition
    ADD CONSTRAINT fka2830f98843549e2 FOREIGN KEY (kunde) REFERENCES deva_firma(id);


--
-- TOC entry 2586 (class 2606 OID 252831)
-- Dependencies: 164 171 2426
-- Name: fka4a3ea79afb75f7d; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_boolean_expression
    ADD CONSTRAINT fka4a3ea79afb75f7d FOREIGN KEY (escalation_constraints_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 2649 (class 2606 OID 253614)
-- Dependencies: 233 262 2552
-- Name: fka6ca9ab5cbfa49b5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bpmndefinition
    ADD CONSTRAINT fka6ca9ab5cbfa49b5 FOREIGN KEY (prozessdefinition_id) REFERENCES deva_prozessdefinition(id);


--
-- TOC entry 2674 (class 2606 OID 253741)
-- Dependencies: 256 290 2582
-- Name: fka7e180fa46b7fc54; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_zusatzinformationen
    ADD CONSTRAINT fka7e180fa46b7fc54 FOREIGN KEY (zusatzinfo_id) REFERENCES deva_zusatzinformation(id);


--
-- TOC entry 2673 (class 2606 OID 253736)
-- Dependencies: 256 250 2535
-- Name: fka7e180fadfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_zusatzinformationen
    ADD CONSTRAINT fka7e180fadfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2655 (class 2606 OID 253650)
-- Dependencies: 246 244 2527
-- Name: fkab4bb876793f005b; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_lieferanten
    ADD CONSTRAINT fkab4bb876793f005b FOREIGN KEY (lieferant_id) REFERENCES deva_firma(id);


--
-- TOC entry 2656 (class 2606 OID 253645)
-- Dependencies: 246 244 2527
-- Name: fkab4bb876e53e3934; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_lieferanten
    ADD CONSTRAINT fkab4bb876e53e3934 FOREIGN KEY (lieferant_fuer_firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2599 (class 2606 OID 252896)
-- Dependencies: 174 171 2426
-- Name: fkad3513b53e0890b; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_notification
    ADD CONSTRAINT fkad3513b53e0890b FOREIGN KEY (escalation_notifications_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 2590 (class 2606 OID 252851)
-- Dependencies: 169 2426 171
-- Name: fkad3513b53e0890b7099f418; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_email_notification
    ADD CONSTRAINT fkad3513b53e0890b7099f418 FOREIGN KEY (escalation_notifications_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 2610 (class 2606 OID 252951)
-- Dependencies: 2446 188 190
-- Name: fkb48f3a4f6ce1ef3a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fkb48f3a4f6ce1ef3a FOREIGN KEY (actualowner_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2609 (class 2606 OID 252946)
-- Dependencies: 2446 190 188
-- Name: fkb48f3a4f9e619a0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fkb48f3a4f9e619a0 FOREIGN KEY (createdby_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2611 (class 2606 OID 252956)
-- Dependencies: 190 2446 188
-- Name: fkb48f3a4ff213f8b5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fkb48f3a4ff213f8b5 FOREIGN KEY (taskinitiator_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2675 (class 2606 OID 253746)
-- Dependencies: 258 258 2546
-- Name: fkb68b59af748e0737; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_produktgruppe
    ADD CONSTRAINT fkb68b59af748e0737 FOREIGN KEY (obergruppe) REFERENCES deva_produktgruppe(id);


--
-- TOC entry 2676 (class 2606 OID 253751)
-- Dependencies: 223 258 2496
-- Name: fkb68b59af9315e404; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_produktgruppe
    ADD CONSTRAINT fkb68b59af9315e404 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_produktgruppe(id);


--
-- TOC entry 2698 (class 2606 OID 253861)
-- Dependencies: 2500 286 227
-- Name: fkb807fcc8d2732549; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zusatzinformation
    ADD CONSTRAINT fkb807fcc8d2732549 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_zusatzinformation(id);


--
-- TOC entry 2664 (class 2606 OID 253691)
-- Dependencies: 250 244 2527
-- Name: fkb8970b3338fd1c19; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b3338fd1c19 FOREIGN KEY (lieferant) REFERENCES deva_firma(id);


--
-- TOC entry 2662 (class 2606 OID 253681)
-- Dependencies: 250 260 2548
-- Name: fkb8970b334e705a2c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b334e705a2c FOREIGN KEY (komponente_prozess) REFERENCES deva_prozess(id);


--
-- TOC entry 2663 (class 2606 OID 253686)
-- Dependencies: 250 244 2527
-- Name: fkb8970b33843549e2; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b33843549e2 FOREIGN KEY (kunde) REFERENCES deva_firma(id);


--
-- TOC entry 2665 (class 2606 OID 253696)
-- Dependencies: 250 212 2476
-- Name: fkb8970b338c57da6c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b338c57da6c FOREIGN KEY (angelegt_von) REFERENCES deva_benutzer(id);


--
-- TOC entry 2666 (class 2606 OID 253701)
-- Dependencies: 250 236 2510
-- Name: fkb8970b33a1cbfc4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b33a1cbfc4 FOREIGN KEY (artikelbild) REFERENCES deva_dokument(id);


--
-- TOC entry 2661 (class 2606 OID 253676)
-- Dependencies: 250 221 2494
-- Name: fkb8970b33a8076cac; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b33a8076cac FOREIGN KEY (komponentenbezeichnung) REFERENCES deva_bezeichnung_komponente(id);


--
-- TOC entry 2700 (class 2606 OID 253871)
-- Dependencies: 2500 227 290
-- Name: fkc53a280abb69726c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zusatzinformation
    ADD CONSTRAINT fkc53a280abb69726c FOREIGN KEY (zusatzinformationbezeichnung) REFERENCES deva_bezeichnung_zusatzinformation(id);


--
-- TOC entry 2667 (class 2606 OID 253706)
-- Dependencies: 251 250 2535
-- Name: fkd1dd1e86dfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_dokumente
    ADD CONSTRAINT fkd1dd1e86dfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2668 (class 2606 OID 253711)
-- Dependencies: 251 236 2510
-- Name: fkd1dd1e86fe056660; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_dokumente
    ADD CONSTRAINT fkd1dd1e86fe056660 FOREIGN KEY (dokument_id) REFERENCES deva_dokument(id);


--
-- TOC entry 2689 (class 2606 OID 253816)
-- Dependencies: 2556 266 270
-- Name: fkd632fa90d1137703; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_sicht_berechtigungen
    ADD CONSTRAINT fkd632fa90d1137703 FOREIGN KEY (berechtigung_id) REFERENCES deva_rolle(id);


--
-- TOC entry 2637 (class 2606 OID 253557)
-- Dependencies: 210 290 2582
-- Name: fkda95e8046b7fc54; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zusatzinformationen
    ADD CONSTRAINT fkda95e8046b7fc54 FOREIGN KEY (zusatzinfo_id) REFERENCES deva_zusatzinformation(id);


--
-- TOC entry 2638 (class 2606 OID 253552)
-- Dependencies: 2453 210 197
-- Name: fkda95e807ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zusatzinformationen
    ADD CONSTRAINT fkda95e807ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2615 (class 2606 OID 253434)
-- Dependencies: 2483 215 195
-- Name: fkdae0e2b231ed32e7; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_angemeldeter_benutzer
    ADD CONSTRAINT fkdae0e2b231ed32e7 FOREIGN KEY (benutzer_liste) REFERENCES deva_benutzer_liste(id);


--
-- TOC entry 2614 (class 2606 OID 253429)
-- Dependencies: 2476 212 195
-- Name: fkdae0e2b2dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_angemeldeter_benutzer
    ADD CONSTRAINT fkdae0e2b2dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2628 (class 2606 OID 253507)
-- Dependencies: 201 242 2523
-- Name: fke6ab83fd2bf81bd0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_fahrzeuge
    ADD CONSTRAINT fke6ab83fd2bf81bd0 FOREIGN KEY (fahrzeug_id) REFERENCES deva_fahrzeug_bezeichnung(id);


--
-- TOC entry 2627 (class 2606 OID 253502)
-- Dependencies: 201 197 2453
-- Name: fke6ab83fd7ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_fahrzeuge
    ADD CONSTRAINT fke6ab83fd7ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2613 (class 2606 OID 252966)
-- Dependencies: 190 189 2446
-- Name: fke7d49c4f2ff04688; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task_comment
    ADD CONSTRAINT fke7d49c4f2ff04688 FOREIGN KEY (addedby_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2612 (class 2606 OID 252961)
-- Dependencies: 189 2442 188
-- Name: fke7d49c4fb35e68f5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task_comment
    ADD CONSTRAINT fke7d49c4fb35e68f5 FOREIGN KEY (taskdata_comments_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2652 (class 2606 OID 253629)
-- Dependencies: 236 238 2512
-- Name: fkee37ca061ad81661; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument
    ADD CONSTRAINT fkee37ca061ad81661 FOREIGN KEY (thumbnail_id) REFERENCES deva_dokument_binaerdaten(id);


--
-- TOC entry 2651 (class 2606 OID 253624)
-- Dependencies: 236 238 2512
-- Name: fkee37ca06862116e3; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument
    ADD CONSTRAINT fkee37ca06862116e3 FOREIGN KEY (data_id) REFERENCES deva_dokument_binaerdaten(id);


--
-- TOC entry 2606 (class 2606 OID 252931)
-- Dependencies: 2426 185 171
-- Name: fkf23c3c0aa5c17ee0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_reassignment
    ADD CONSTRAINT fkf23c3c0aa5c17ee0 FOREIGN KEY (escalation_reassignments_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 2603 (class 2606 OID 252916)
-- Dependencies: 188 2442 180
-- Name: fkf55e684c36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_recipients
    ADD CONSTRAINT fkf55e684c36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2584 (class 2606 OID 252821)
-- Dependencies: 2446 163 190
-- Name: fkf6bb126d8ef5f064; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_attachment
    ADD CONSTRAINT fkf6bb126d8ef5f064 FOREIGN KEY (attachedby_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2585 (class 2606 OID 252826)
-- Dependencies: 188 2442 163
-- Name: fkf6bb126df21826d9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_attachment
    ADD CONSTRAINT fkf6bb126df21826d9 FOREIGN KEY (taskdata_attachments_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2625 (class 2606 OID 253492)
-- Dependencies: 200 2453 197
-- Name: fkf8d0b8c7ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_dokumente
    ADD CONSTRAINT fkf8d0b8c7ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2626 (class 2606 OID 253497)
-- Dependencies: 200 236 2510
-- Name: fkf8d0b8cfe056660; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_dokumente
    ADD CONSTRAINT fkf8d0b8cfe056660 FOREIGN KEY (dokument_id) REFERENCES deva_dokument(id);


--
-- TOC entry 2705 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-04-03 18:26:53 CEST

--
-- PostgreSQL database dump complete
--
