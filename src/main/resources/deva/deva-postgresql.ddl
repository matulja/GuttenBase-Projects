--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.4
-- Dumped by pg_dump version 9.1.4
-- Started on 2012-06-13 15:22:55 CEST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 293 (class 3079 OID 11705)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2718 (class 0 OID 0)
-- Dependencies: 293
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 161 (class 1259 OID 368344)
-- Dependencies: 6
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
-- TOC entry 162 (class 1259 OID 368347)
-- Dependencies: 161 6
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
-- TOC entry 2719 (class 0 OID 0)
-- Dependencies: 162
-- Name: deva_angemeldeter_benutzer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_angemeldeter_benutzer_id_seq OWNED BY deva_angemeldeter_benutzer.id;


--
-- TOC entry 163 (class 1259 OID 368349)
-- Dependencies: 6
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
-- TOC entry 164 (class 1259 OID 368355)
-- Dependencies: 2368 6
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
-- TOC entry 165 (class 1259 OID 368359)
-- Dependencies: 164 6
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
-- TOC entry 2720 (class 0 OID 0)
-- Dependencies: 165
-- Name: deva_artikel_bestandteil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_bestandteil_id_seq OWNED BY deva_artikel_bestandteil.id;


--
-- TOC entry 166 (class 1259 OID 368361)
-- Dependencies: 6
-- Name: deva_artikel_dokumente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_dokumente (
    artikel_id bigint NOT NULL,
    dokument_id bigint NOT NULL
);


ALTER TABLE public.deva_artikel_dokumente OWNER TO meyle;

--
-- TOC entry 167 (class 1259 OID 368364)
-- Dependencies: 6
-- Name: deva_artikel_fahrzeuge; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_fahrzeuge (
    artikel_id bigint NOT NULL,
    fahrzeug_id bigint NOT NULL,
    sort_order integer NOT NULL
);


ALTER TABLE public.deva_artikel_fahrzeuge OWNER TO meyle;

--
-- TOC entry 168 (class 1259 OID 368367)
-- Dependencies: 6 163
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
-- TOC entry 2721 (class 0 OID 0)
-- Dependencies: 168
-- Name: deva_artikel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_id_seq OWNED BY deva_artikel.id;


--
-- TOC entry 169 (class 1259 OID 368369)
-- Dependencies: 6
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
-- TOC entry 170 (class 1259 OID 368375)
-- Dependencies: 169 6
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
-- TOC entry 2722 (class 0 OID 0)
-- Dependencies: 170
-- Name: deva_artikel_kommentar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_kommentar_id_seq OWNED BY deva_artikel_kommentar.id;


--
-- TOC entry 171 (class 1259 OID 368377)
-- Dependencies: 2371 6
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
-- TOC entry 172 (class 1259 OID 368381)
-- Dependencies: 171 6
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
-- TOC entry 2723 (class 0 OID 0)
-- Dependencies: 172
-- Name: deva_artikel_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_komponente_id_seq OWNED BY deva_artikel_komponente.id;


--
-- TOC entry 173 (class 1259 OID 368383)
-- Dependencies: 6
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
-- TOC entry 174 (class 1259 OID 368386)
-- Dependencies: 6 173
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
-- TOC entry 2724 (class 0 OID 0)
-- Dependencies: 174
-- Name: deva_artikel_logbuch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_logbuch_id_seq OWNED BY deva_artikel_logbuch.id;


--
-- TOC entry 291 (class 1259 OID 370876)
-- Dependencies: 6
-- Name: deva_artikel_verantwortliche; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE deva_artikel_verantwortliche (
    artikel_id bigint NOT NULL,
    verantwortlicher_id bigint NOT NULL
);


ALTER TABLE public.deva_artikel_verantwortliche OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 368388)
-- Dependencies: 2374 6
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
-- TOC entry 176 (class 1259 OID 368392)
-- Dependencies: 6 175
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
-- TOC entry 2725 (class 0 OID 0)
-- Dependencies: 176
-- Name: deva_artikel_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_zubehoer_id_seq OWNED BY deva_artikel_zubehoer.id;


--
-- TOC entry 177 (class 1259 OID 368394)
-- Dependencies: 6
-- Name: deva_artikel_zusatzinformationen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_zusatzinformationen (
    artikel_id bigint NOT NULL,
    zusatzinfo_id bigint NOT NULL
);


ALTER TABLE public.deva_artikel_zusatzinformationen OWNER TO meyle;

--
-- TOC entry 178 (class 1259 OID 368397)
-- Dependencies: 6
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
-- TOC entry 179 (class 1259 OID 368403)
-- Dependencies: 6
-- Name: deva_benutzer_firma; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_firma (
    benutzer bigint NOT NULL,
    zugeordnete_firma bigint NOT NULL
);


ALTER TABLE public.deva_benutzer_firma OWNER TO meyle;

--
-- TOC entry 180 (class 1259 OID 368406)
-- Dependencies: 178 6
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
-- TOC entry 2726 (class 0 OID 0)
-- Dependencies: 180
-- Name: deva_benutzer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_benutzer_id_seq OWNED BY deva_benutzer.id;


--
-- TOC entry 181 (class 1259 OID 368408)
-- Dependencies: 6
-- Name: deva_benutzer_liste; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_liste (
    id bigint NOT NULL,
    version bigint,
    singleton character varying(255) NOT NULL
);


ALTER TABLE public.deva_benutzer_liste OWNER TO meyle;

--
-- TOC entry 182 (class 1259 OID 368411)
-- Dependencies: 181 6
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
-- TOC entry 2727 (class 0 OID 0)
-- Dependencies: 182
-- Name: deva_benutzer_liste_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_benutzer_liste_id_seq OWNED BY deva_benutzer_liste.id;


--
-- TOC entry 183 (class 1259 OID 368413)
-- Dependencies: 6
-- Name: deva_benutzer_produktgruppe; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_produktgruppe (
    benutzer bigint NOT NULL,
    produktgruppe bigint NOT NULL
);


ALTER TABLE public.deva_benutzer_produktgruppe OWNER TO meyle;

--
-- TOC entry 184 (class 1259 OID 368416)
-- Dependencies: 6
-- Name: deva_benutzer_rollen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_rollen (
    benutzer bigint NOT NULL,
    rolle bigint NOT NULL
);


ALTER TABLE public.deva_benutzer_rollen OWNER TO meyle;

--
-- TOC entry 185 (class 1259 OID 368419)
-- Dependencies: 6
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
-- TOC entry 186 (class 1259 OID 368422)
-- Dependencies: 6 185
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
-- TOC entry 2728 (class 0 OID 0)
-- Dependencies: 186
-- Name: deva_bezeichnung_artikel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_artikel_id_seq OWNED BY deva_bezeichnung_artikel.id;


--
-- TOC entry 187 (class 1259 OID 368424)
-- Dependencies: 6
-- Name: deva_bezeichnung_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_komponente (
    id bigint NOT NULL,
    version bigint,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_bezeichnung_komponente OWNER TO meyle;

--
-- TOC entry 188 (class 1259 OID 368427)
-- Dependencies: 187 6
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
-- TOC entry 2729 (class 0 OID 0)
-- Dependencies: 188
-- Name: deva_bezeichnung_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_komponente_id_seq OWNED BY deva_bezeichnung_komponente.id;


--
-- TOC entry 189 (class 1259 OID 368429)
-- Dependencies: 6
-- Name: deva_bezeichnung_produktgruppe; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_produktgruppe (
    id bigint NOT NULL,
    version bigint
);


ALTER TABLE public.deva_bezeichnung_produktgruppe OWNER TO meyle;

--
-- TOC entry 190 (class 1259 OID 368432)
-- Dependencies: 189 6
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
-- TOC entry 2730 (class 0 OID 0)
-- Dependencies: 190
-- Name: deva_bezeichnung_produktgruppe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_produktgruppe_id_seq OWNED BY deva_bezeichnung_produktgruppe.id;


--
-- TOC entry 191 (class 1259 OID 368434)
-- Dependencies: 6
-- Name: deva_bezeichnung_zubehoer; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_zubehoer (
    id bigint NOT NULL,
    version bigint,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_bezeichnung_zubehoer OWNER TO meyle;

--
-- TOC entry 192 (class 1259 OID 368437)
-- Dependencies: 191 6
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
-- TOC entry 2731 (class 0 OID 0)
-- Dependencies: 192
-- Name: deva_bezeichnung_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_zubehoer_id_seq OWNED BY deva_bezeichnung_zubehoer.id;


--
-- TOC entry 193 (class 1259 OID 368439)
-- Dependencies: 6
-- Name: deva_bezeichnung_zusatzinformation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_zusatzinformation (
    id bigint NOT NULL,
    version bigint,
    typ character varying(255) NOT NULL
);


ALTER TABLE public.deva_bezeichnung_zusatzinformation OWNER TO meyle;

--
-- TOC entry 194 (class 1259 OID 368442)
-- Dependencies: 193 6
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
-- TOC entry 2732 (class 0 OID 0)
-- Dependencies: 194
-- Name: deva_bezeichnung_zusatzinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_zusatzinformation_id_seq OWNED BY deva_bezeichnung_zusatzinformation.id;


--
-- TOC entry 195 (class 1259 OID 368444)
-- Dependencies: 6
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
-- TOC entry 196 (class 1259 OID 368450)
-- Dependencies: 195 6
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
-- TOC entry 2733 (class 0 OID 0)
-- Dependencies: 196
-- Name: deva_bezeichung_prozess_schritt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichung_prozess_schritt_id_seq OWNED BY deva_bezeichung_prozess_schritt.id;


--
-- TOC entry 197 (class 1259 OID 368452)
-- Dependencies: 2384 6
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
-- TOC entry 198 (class 1259 OID 368459)
-- Dependencies: 6 197
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
-- TOC entry 2734 (class 0 OID 0)
-- Dependencies: 198
-- Name: deva_bonuszeit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bonuszeit_id_seq OWNED BY deva_bonuszeit.id;


--
-- TOC entry 199 (class 1259 OID 368461)
-- Dependencies: 6
-- Name: deva_bpmn_definition_task_handler_names; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bpmn_definition_task_handler_names (
    bpmn_definition_id bigint NOT NULL,
    taskhandlernames character varying(255)
);


ALTER TABLE public.deva_bpmn_definition_task_handler_names OWNER TO meyle;

--
-- TOC entry 200 (class 1259 OID 368464)
-- Dependencies: 6
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
-- TOC entry 201 (class 1259 OID 368467)
-- Dependencies: 200 6
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
-- TOC entry 2735 (class 0 OID 0)
-- Dependencies: 201
-- Name: deva_bpmndefinition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bpmndefinition_id_seq OWNED BY deva_bpmndefinition.id;


--
-- TOC entry 202 (class 1259 OID 368469)
-- Dependencies: 2387 2388 6
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
-- TOC entry 203 (class 1259 OID 368474)
-- Dependencies: 6
-- Name: deva_dokument_binaerdaten; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_dokument_binaerdaten (
    id bigint NOT NULL,
    version bigint,
    data oid NOT NULL
);


ALTER TABLE public.deva_dokument_binaerdaten OWNER TO meyle;

--
-- TOC entry 204 (class 1259 OID 368477)
-- Dependencies: 6 203
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
-- TOC entry 2736 (class 0 OID 0)
-- Dependencies: 204
-- Name: deva_dokument_binaerdaten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_dokument_binaerdaten_id_seq OWNED BY deva_dokument_binaerdaten.id;


--
-- TOC entry 205 (class 1259 OID 368479)
-- Dependencies: 202 6
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
-- TOC entry 2737 (class 0 OID 0)
-- Dependencies: 205
-- Name: deva_dokument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_dokument_id_seq OWNED BY deva_dokument.id;


--
-- TOC entry 206 (class 1259 OID 368481)
-- Dependencies: 2391 2392 6
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
-- TOC entry 207 (class 1259 OID 368486)
-- Dependencies: 206 6
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
-- TOC entry 2738 (class 0 OID 0)
-- Dependencies: 207
-- Name: deva_faelligkeiten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_faelligkeiten_id_seq OWNED BY deva_faelligkeiten.id;


--
-- TOC entry 208 (class 1259 OID 368488)
-- Dependencies: 6
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
-- TOC entry 209 (class 1259 OID 368491)
-- Dependencies: 6 208
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
-- TOC entry 2739 (class 0 OID 0)
-- Dependencies: 209
-- Name: deva_fahrzeug_bezeichnung_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_fahrzeug_bezeichnung_id_seq OWNED BY deva_fahrzeug_bezeichnung.id;


--
-- TOC entry 210 (class 1259 OID 368493)
-- Dependencies: 6
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
-- TOC entry 211 (class 1259 OID 368496)
-- Dependencies: 6
-- Name: deva_firma_ansprechpartner; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_ansprechpartner (
    firma_id bigint NOT NULL,
    benutzer_id bigint NOT NULL
);


ALTER TABLE public.deva_firma_ansprechpartner OWNER TO meyle;

--
-- TOC entry 212 (class 1259 OID 368499)
-- Dependencies: 6 210
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
-- TOC entry 2740 (class 0 OID 0)
-- Dependencies: 212
-- Name: deva_firma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_firma_id_seq OWNED BY deva_firma.id;


--
-- TOC entry 213 (class 1259 OID 368501)
-- Dependencies: 6
-- Name: deva_firma_lieferanten; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_lieferanten (
    lieferant_id bigint NOT NULL,
    lieferant_fuer_firma_id bigint NOT NULL
);


ALTER TABLE public.deva_firma_lieferanten OWNER TO meyle;

--
-- TOC entry 214 (class 1259 OID 368504)
-- Dependencies: 6
-- Name: deva_firma_sollzeiten_artikel; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_sollzeiten_artikel (
    firma_id bigint NOT NULL,
    sollzeiten_artikel_id bigint NOT NULL
);


ALTER TABLE public.deva_firma_sollzeiten_artikel OWNER TO meyle;

--
-- TOC entry 215 (class 1259 OID 368507)
-- Dependencies: 6
-- Name: deva_firma_sollzeiten_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_sollzeiten_komponente (
    firma_id bigint NOT NULL,
    sollzeiten_komponente_id bigint NOT NULL
);


ALTER TABLE public.deva_firma_sollzeiten_komponente OWNER TO meyle;

--
-- TOC entry 216 (class 1259 OID 368510)
-- Dependencies: 6
-- Name: deva_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente (
    id bigint NOT NULL,
    version bigint,
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
-- TOC entry 217 (class 1259 OID 368516)
-- Dependencies: 6
-- Name: deva_komponente_dokumente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_dokumente (
    komponente_id bigint NOT NULL,
    dokument_id bigint NOT NULL
);


ALTER TABLE public.deva_komponente_dokumente OWNER TO meyle;

--
-- TOC entry 218 (class 1259 OID 368519)
-- Dependencies: 216 6
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
-- TOC entry 2741 (class 0 OID 0)
-- Dependencies: 218
-- Name: deva_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_komponente_id_seq OWNED BY deva_komponente.id;


--
-- TOC entry 219 (class 1259 OID 368521)
-- Dependencies: 6
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
-- TOC entry 220 (class 1259 OID 368527)
-- Dependencies: 219 6
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
-- TOC entry 2742 (class 0 OID 0)
-- Dependencies: 220
-- Name: deva_komponente_kommentar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_komponente_kommentar_id_seq OWNED BY deva_komponente_kommentar.id;


--
-- TOC entry 221 (class 1259 OID 368529)
-- Dependencies: 6
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
-- TOC entry 222 (class 1259 OID 368532)
-- Dependencies: 221 6
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
-- TOC entry 2743 (class 0 OID 0)
-- Dependencies: 222
-- Name: deva_komponente_logbuch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_komponente_logbuch_id_seq OWNED BY deva_komponente_logbuch.id;


--
-- TOC entry 292 (class 1259 OID 370889)
-- Dependencies: 6
-- Name: deva_komponente_verantwortliche; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE deva_komponente_verantwortliche (
    komponente_id bigint NOT NULL,
    verantwortlicher_id bigint NOT NULL
);


ALTER TABLE public.deva_komponente_verantwortliche OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 368534)
-- Dependencies: 6
-- Name: deva_komponente_zusatzinformationen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_zusatzinformationen (
    komponente_id bigint NOT NULL,
    zusatzinfo_id bigint NOT NULL
);


ALTER TABLE public.deva_komponente_zusatzinformationen OWNER TO meyle;

--
-- TOC entry 224 (class 1259 OID 368537)
-- Dependencies: 6
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
-- TOC entry 225 (class 1259 OID 368540)
-- Dependencies: 224 6
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
-- TOC entry 2744 (class 0 OID 0)
-- Dependencies: 225
-- Name: deva_produktgruppe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_produktgruppe_id_seq OWNED BY deva_produktgruppe.id;


--
-- TOC entry 226 (class 1259 OID 368542)
-- Dependencies: 6
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
-- TOC entry 227 (class 1259 OID 368545)
-- Dependencies: 226 6
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
-- TOC entry 2745 (class 0 OID 0)
-- Dependencies: 227
-- Name: deva_prozess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_prozess_id_seq OWNED BY deva_prozess.id;


--
-- TOC entry 228 (class 1259 OID 368547)
-- Dependencies: 6
-- Name: deva_prozess_schritt; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_prozess_schritt (
    id bigint NOT NULL,
    version bigint,
    ist_datum date,
    soll_datum date,
    processnode_id bigint,
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
-- TOC entry 229 (class 1259 OID 368550)
-- Dependencies: 228 6
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
-- TOC entry 2746 (class 0 OID 0)
-- Dependencies: 229
-- Name: deva_prozess_schritt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_prozess_schritt_id_seq OWNED BY deva_prozess_schritt.id;


--
-- TOC entry 230 (class 1259 OID 368552)
-- Dependencies: 6
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
-- TOC entry 231 (class 1259 OID 368555)
-- Dependencies: 6 230
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
-- TOC entry 2747 (class 0 OID 0)
-- Dependencies: 231
-- Name: deva_prozessdefinition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_prozessdefinition_id_seq OWNED BY deva_prozessdefinition.id;


--
-- TOC entry 232 (class 1259 OID 368557)
-- Dependencies: 6
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
-- TOC entry 233 (class 1259 OID 368560)
-- Dependencies: 6
-- Name: deva_rolle_aktions_berechtigungen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_aktions_berechtigungen (
    berechtigung_id bigint NOT NULL,
    aktion_berechtigungen character varying(255)
);


ALTER TABLE public.deva_rolle_aktions_berechtigungen OWNER TO meyle;

--
-- TOC entry 234 (class 1259 OID 368563)
-- Dependencies: 6
-- Name: deva_rolle_ampelstatus; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_ampelstatus (
    ampelstatus_id bigint NOT NULL,
    ampelstatus character varying(255)
);


ALTER TABLE public.deva_rolle_ampelstatus OWNER TO meyle;

--
-- TOC entry 235 (class 1259 OID 368566)
-- Dependencies: 6 232
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
-- TOC entry 2748 (class 0 OID 0)
-- Dependencies: 235
-- Name: deva_rolle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_rolle_id_seq OWNED BY deva_rolle.id;


--
-- TOC entry 236 (class 1259 OID 368568)
-- Dependencies: 6
-- Name: deva_rolle_prozess_schritt; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_prozess_schritt (
    rolle bigint NOT NULL,
    prozess_schritt_definition bigint NOT NULL
);


ALTER TABLE public.deva_rolle_prozess_schritt OWNER TO meyle;

--
-- TOC entry 237 (class 1259 OID 368571)
-- Dependencies: 6
-- Name: deva_rolle_sicht_berechtigungen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_sicht_berechtigungen (
    berechtigung_id bigint NOT NULL,
    sicht_berechtigungen character varying(255)
);


ALTER TABLE public.deva_rolle_sicht_berechtigungen OWNER TO meyle;

--
-- TOC entry 238 (class 1259 OID 368574)
-- Dependencies: 6
-- Name: deva_sollzeit_wdh_klassifikation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_sollzeit_wdh_klassifikation (
    sollzeiten_id bigint NOT NULL,
    sollzeit bigint,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_sollzeit_wdh_klassifikation OWNER TO meyle;

--
-- TOC entry 239 (class 1259 OID 368577)
-- Dependencies: 2404 2405 6
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
-- TOC entry 240 (class 1259 OID 368582)
-- Dependencies: 6 239
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
-- TOC entry 2749 (class 0 OID 0)
-- Dependencies: 240
-- Name: deva_sollzeiten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_sollzeiten_id_seq OWNED BY deva_sollzeiten.id;


--
-- TOC entry 241 (class 1259 OID 368584)
-- Dependencies: 6
-- Name: deva_sollzeiten_klassifikation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_sollzeiten_klassifikation (
    sollzeiten_id bigint NOT NULL,
    sollzeit bigint,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_sollzeiten_klassifikation OWNER TO meyle;

--
-- TOC entry 242 (class 1259 OID 368587)
-- Dependencies: 6
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
-- TOC entry 243 (class 1259 OID 368590)
-- Dependencies: 242 6
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
-- TOC entry 2750 (class 0 OID 0)
-- Dependencies: 243
-- Name: deva_uebersetzung_artikel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_artikel_id_seq OWNED BY deva_uebersetzung_artikel.id;


--
-- TOC entry 244 (class 1259 OID 368592)
-- Dependencies: 6
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
-- TOC entry 245 (class 1259 OID 368595)
-- Dependencies: 244 6
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
-- TOC entry 2751 (class 0 OID 0)
-- Dependencies: 245
-- Name: deva_uebersetzung_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_komponente_id_seq OWNED BY deva_uebersetzung_komponente.id;


--
-- TOC entry 246 (class 1259 OID 368597)
-- Dependencies: 6
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
-- TOC entry 247 (class 1259 OID 368600)
-- Dependencies: 6 246
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
-- TOC entry 2752 (class 0 OID 0)
-- Dependencies: 247
-- Name: deva_uebersetzung_produktgruppe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_produktgruppe_id_seq OWNED BY deva_uebersetzung_produktgruppe.id;


--
-- TOC entry 248 (class 1259 OID 368602)
-- Dependencies: 6
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
-- TOC entry 249 (class 1259 OID 368605)
-- Dependencies: 248 6
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
-- TOC entry 2753 (class 0 OID 0)
-- Dependencies: 249
-- Name: deva_uebersetzung_prozess_schritt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_prozess_schritt_id_seq OWNED BY deva_uebersetzung_prozess_schritt.id;


--
-- TOC entry 250 (class 1259 OID 368607)
-- Dependencies: 6
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
-- TOC entry 251 (class 1259 OID 368610)
-- Dependencies: 6 250
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
-- TOC entry 2754 (class 0 OID 0)
-- Dependencies: 251
-- Name: deva_uebersetzung_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_zubehoer_id_seq OWNED BY deva_uebersetzung_zubehoer.id;


--
-- TOC entry 252 (class 1259 OID 368612)
-- Dependencies: 6
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
-- TOC entry 253 (class 1259 OID 368615)
-- Dependencies: 6 252
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
-- TOC entry 2755 (class 0 OID 0)
-- Dependencies: 253
-- Name: deva_uebersetzung_zusatzinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_zusatzinformation_id_seq OWNED BY deva_uebersetzung_zusatzinformation.id;


--
-- TOC entry 254 (class 1259 OID 368617)
-- Dependencies: 6
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
-- TOC entry 255 (class 1259 OID 368623)
-- Dependencies: 254 6
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
-- TOC entry 2756 (class 0 OID 0)
-- Dependencies: 255
-- Name: deva_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_zubehoer_id_seq OWNED BY deva_zubehoer.id;


--
-- TOC entry 256 (class 1259 OID 368625)
-- Dependencies: 6
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
-- TOC entry 257 (class 1259 OID 368631)
-- Dependencies: 6 256
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
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 257
-- Name: deva_zusatzinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_zusatzinformation_id_seq OWNED BY deva_zusatzinformation.id;


--
-- TOC entry 258 (class 1259 OID 368633)
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
-- TOC entry 259 (class 1259 OID 368636)
-- Dependencies: 6
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
-- TOC entry 260 (class 1259 OID 368639)
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
-- TOC entry 261 (class 1259 OID 368641)
-- Dependencies: 6
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
-- TOC entry 262 (class 1259 OID 368647)
-- Dependencies: 6
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
-- TOC entry 263 (class 1259 OID 368653)
-- Dependencies: 6
-- Name: jbpm_content; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_content (
    id bigint NOT NULL,
    content oid
);


ALTER TABLE public.jbpm_content OWNER TO meyle;

--
-- TOC entry 264 (class 1259 OID 368656)
-- Dependencies: 6
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
-- TOC entry 265 (class 1259 OID 368659)
-- Dependencies: 6
-- Name: jbpm_delegation_delegates; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_delegation_delegates (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_delegation_delegates OWNER TO meyle;

--
-- TOC entry 266 (class 1259 OID 368662)
-- Dependencies: 6
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
-- TOC entry 267 (class 1259 OID 368668)
-- Dependencies: 6
-- Name: jbpm_email_notification; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_email_notification (
    id bigint NOT NULL,
    priority integer NOT NULL,
    escalation_notifications_id bigint
);


ALTER TABLE public.jbpm_email_notification OWNER TO meyle;

--
-- TOC entry 268 (class 1259 OID 368671)
-- Dependencies: 6
-- Name: jbpm_email_notification_jbpm_email_header; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_email_notification_jbpm_email_header (
    jbpm_email_notification_id bigint NOT NULL,
    emailheaders_id bigint NOT NULL,
    emailheaders_key character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_email_notification_jbpm_email_header OWNER TO meyle;

--
-- TOC entry 269 (class 1259 OID 368674)
-- Dependencies: 6
-- Name: jbpm_escalation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_escalation (
    id bigint NOT NULL,
    name character varying(255),
    deadline_escalation_id bigint
);


ALTER TABLE public.jbpm_escalation OWNER TO meyle;

--
-- TOC entry 270 (class 1259 OID 368677)
-- Dependencies: 6
-- Name: jbpm_group; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_group (
    id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_group OWNER TO meyle;

--
-- TOC entry 271 (class 1259 OID 368680)
-- Dependencies: 6
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
-- TOC entry 272 (class 1259 OID 368686)
-- Dependencies: 6
-- Name: jbpm_notification; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_notification (
    id bigint NOT NULL,
    priority integer NOT NULL,
    escalation_notifications_id bigint
);


ALTER TABLE public.jbpm_notification OWNER TO meyle;

--
-- TOC entry 273 (class 1259 OID 368689)
-- Dependencies: 6
-- Name: jbpm_notification_bas; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_notification_bas (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_notification_bas OWNER TO meyle;

--
-- TOC entry 274 (class 1259 OID 368692)
-- Dependencies: 6
-- Name: jbpm_notification_recipients; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_notification_recipients (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_notification_recipients OWNER TO meyle;

--
-- TOC entry 275 (class 1259 OID 368695)
-- Dependencies: 6
-- Name: jbpm_peopleassignments_bas; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_bas (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_bas OWNER TO meyle;

--
-- TOC entry 276 (class 1259 OID 368698)
-- Dependencies: 6
-- Name: jbpm_peopleassignments_exclowners; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_exclowners (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_exclowners OWNER TO meyle;

--
-- TOC entry 277 (class 1259 OID 368701)
-- Dependencies: 6
-- Name: jbpm_peopleassignments_potowners; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_potowners (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_potowners OWNER TO meyle;

--
-- TOC entry 278 (class 1259 OID 368704)
-- Dependencies: 6
-- Name: jbpm_peopleassignments_recipients; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_recipients (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_recipients OWNER TO meyle;

--
-- TOC entry 279 (class 1259 OID 368707)
-- Dependencies: 6
-- Name: jbpm_peopleassignments_stakeholders; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_stakeholders (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_stakeholders OWNER TO meyle;

--
-- TOC entry 280 (class 1259 OID 368710)
-- Dependencies: 6
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
-- TOC entry 281 (class 1259 OID 368713)
-- Dependencies: 6
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
-- TOC entry 282 (class 1259 OID 368716)
-- Dependencies: 6
-- Name: jbpm_processinstance_info_eventtypes; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_processinstance_info_eventtypes (
    jbpm_processinstance_info_id bigint NOT NULL,
    eventtypes character varying(255)
);


ALTER TABLE public.jbpm_processinstance_info_eventtypes OWNER TO meyle;

--
-- TOC entry 283 (class 1259 OID 368719)
-- Dependencies: 6
-- Name: jbpm_reassignment; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_reassignment (
    id bigint NOT NULL,
    escalation_reassignments_id bigint
);


ALTER TABLE public.jbpm_reassignment OWNER TO meyle;

--
-- TOC entry 284 (class 1259 OID 368722)
-- Dependencies: 6
-- Name: jbpm_reassignment_potentialowners; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_reassignment_potentialowners (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_reassignment_potentialowners OWNER TO meyle;

--
-- TOC entry 285 (class 1259 OID 368725)
-- Dependencies: 6
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
-- TOC entry 286 (class 1259 OID 368728)
-- Dependencies: 6
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
-- TOC entry 287 (class 1259 OID 368734)
-- Dependencies: 6
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
-- TOC entry 288 (class 1259 OID 368740)
-- Dependencies: 6
-- Name: jbpm_user; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_user (
    id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_user OWNER TO meyle;

--
-- TOC entry 289 (class 1259 OID 368743)
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
-- TOC entry 290 (class 1259 OID 368745)
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
-- TOC entry 2365 (class 2604 OID 368747)
-- Dependencies: 162 161
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_angemeldeter_benutzer ALTER COLUMN id SET DEFAULT nextval('deva_angemeldeter_benutzer_id_seq'::regclass);


--
-- TOC entry 2366 (class 2604 OID 368748)
-- Dependencies: 168 163
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel ALTER COLUMN id SET DEFAULT nextval('deva_artikel_id_seq'::regclass);


--
-- TOC entry 2367 (class 2604 OID 368749)
-- Dependencies: 165 164
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_bestandteil ALTER COLUMN id SET DEFAULT nextval('deva_artikel_bestandteil_id_seq'::regclass);


--
-- TOC entry 2369 (class 2604 OID 368750)
-- Dependencies: 170 169
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_kommentar ALTER COLUMN id SET DEFAULT nextval('deva_artikel_kommentar_id_seq'::regclass);


--
-- TOC entry 2370 (class 2604 OID 368751)
-- Dependencies: 172 171
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_komponente ALTER COLUMN id SET DEFAULT nextval('deva_artikel_komponente_id_seq'::regclass);


--
-- TOC entry 2372 (class 2604 OID 368752)
-- Dependencies: 174 173
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_logbuch ALTER COLUMN id SET DEFAULT nextval('deva_artikel_logbuch_id_seq'::regclass);


--
-- TOC entry 2373 (class 2604 OID 368753)
-- Dependencies: 176 175
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_artikel_zubehoer_id_seq'::regclass);


--
-- TOC entry 2375 (class 2604 OID 368754)
-- Dependencies: 180 178
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer ALTER COLUMN id SET DEFAULT nextval('deva_benutzer_id_seq'::regclass);


--
-- TOC entry 2376 (class 2604 OID 368755)
-- Dependencies: 182 181
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_liste ALTER COLUMN id SET DEFAULT nextval('deva_benutzer_liste_id_seq'::regclass);


--
-- TOC entry 2377 (class 2604 OID 368756)
-- Dependencies: 186 185
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_artikel ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_artikel_id_seq'::regclass);


--
-- TOC entry 2378 (class 2604 OID 368757)
-- Dependencies: 188 187
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_komponente ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_komponente_id_seq'::regclass);


--
-- TOC entry 2379 (class 2604 OID 368758)
-- Dependencies: 190 189
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_produktgruppe ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_produktgruppe_id_seq'::regclass);


--
-- TOC entry 2380 (class 2604 OID 368759)
-- Dependencies: 192 191
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_zubehoer_id_seq'::regclass);


--
-- TOC entry 2381 (class 2604 OID 368760)
-- Dependencies: 194 193
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_zusatzinformation ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_zusatzinformation_id_seq'::regclass);


--
-- TOC entry 2382 (class 2604 OID 368761)
-- Dependencies: 196 195
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichung_prozess_schritt ALTER COLUMN id SET DEFAULT nextval('deva_bezeichung_prozess_schritt_id_seq'::regclass);


--
-- TOC entry 2383 (class 2604 OID 368762)
-- Dependencies: 198 197
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bonuszeit ALTER COLUMN id SET DEFAULT nextval('deva_bonuszeit_id_seq'::regclass);


--
-- TOC entry 2385 (class 2604 OID 368763)
-- Dependencies: 201 200
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bpmndefinition ALTER COLUMN id SET DEFAULT nextval('deva_bpmndefinition_id_seq'::regclass);


--
-- TOC entry 2386 (class 2604 OID 368764)
-- Dependencies: 205 202
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument ALTER COLUMN id SET DEFAULT nextval('deva_dokument_id_seq'::regclass);


--
-- TOC entry 2389 (class 2604 OID 368765)
-- Dependencies: 204 203
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument_binaerdaten ALTER COLUMN id SET DEFAULT nextval('deva_dokument_binaerdaten_id_seq'::regclass);


--
-- TOC entry 2390 (class 2604 OID 368766)
-- Dependencies: 207 206
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_faelligkeiten ALTER COLUMN id SET DEFAULT nextval('deva_faelligkeiten_id_seq'::regclass);


--
-- TOC entry 2393 (class 2604 OID 368767)
-- Dependencies: 209 208
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung ALTER COLUMN id SET DEFAULT nextval('deva_fahrzeug_bezeichnung_id_seq'::regclass);


--
-- TOC entry 2394 (class 2604 OID 368768)
-- Dependencies: 212 210
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma ALTER COLUMN id SET DEFAULT nextval('deva_firma_id_seq'::regclass);


--
-- TOC entry 2395 (class 2604 OID 368769)
-- Dependencies: 218 216
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente ALTER COLUMN id SET DEFAULT nextval('deva_komponente_id_seq'::regclass);


--
-- TOC entry 2396 (class 2604 OID 368770)
-- Dependencies: 220 219
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_kommentar ALTER COLUMN id SET DEFAULT nextval('deva_komponente_kommentar_id_seq'::regclass);


--
-- TOC entry 2397 (class 2604 OID 368771)
-- Dependencies: 222 221
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_logbuch ALTER COLUMN id SET DEFAULT nextval('deva_komponente_logbuch_id_seq'::regclass);


--
-- TOC entry 2398 (class 2604 OID 368772)
-- Dependencies: 225 224
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_produktgruppe ALTER COLUMN id SET DEFAULT nextval('deva_produktgruppe_id_seq'::regclass);


--
-- TOC entry 2399 (class 2604 OID 368773)
-- Dependencies: 227 226
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess ALTER COLUMN id SET DEFAULT nextval('deva_prozess_id_seq'::regclass);


--
-- TOC entry 2400 (class 2604 OID 368774)
-- Dependencies: 229 228
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt ALTER COLUMN id SET DEFAULT nextval('deva_prozess_schritt_id_seq'::regclass);


--
-- TOC entry 2401 (class 2604 OID 368775)
-- Dependencies: 231 230
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozessdefinition ALTER COLUMN id SET DEFAULT nextval('deva_prozessdefinition_id_seq'::regclass);


--
-- TOC entry 2402 (class 2604 OID 368776)
-- Dependencies: 235 232
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle ALTER COLUMN id SET DEFAULT nextval('deva_rolle_id_seq'::regclass);


--
-- TOC entry 2403 (class 2604 OID 368777)
-- Dependencies: 240 239
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeiten ALTER COLUMN id SET DEFAULT nextval('deva_sollzeiten_id_seq'::regclass);


--
-- TOC entry 2406 (class 2604 OID 368778)
-- Dependencies: 243 242
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_artikel ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_artikel_id_seq'::regclass);


--
-- TOC entry 2407 (class 2604 OID 368779)
-- Dependencies: 245 244
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_komponente ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_komponente_id_seq'::regclass);


--
-- TOC entry 2408 (class 2604 OID 368780)
-- Dependencies: 247 246
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_produktgruppe ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_produktgruppe_id_seq'::regclass);


--
-- TOC entry 2409 (class 2604 OID 368781)
-- Dependencies: 249 248
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_prozess_schritt ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_prozess_schritt_id_seq'::regclass);


--
-- TOC entry 2410 (class 2604 OID 368782)
-- Dependencies: 251 250
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_zubehoer_id_seq'::regclass);


--
-- TOC entry 2411 (class 2604 OID 368783)
-- Dependencies: 253 252
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zusatzinformation ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_zusatzinformation_id_seq'::regclass);


--
-- TOC entry 2412 (class 2604 OID 368784)
-- Dependencies: 255 254
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_zubehoer_id_seq'::regclass);


--
-- TOC entry 2413 (class 2604 OID 368785)
-- Dependencies: 257 256
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zusatzinformation ALTER COLUMN id SET DEFAULT nextval('deva_zusatzinformation_id_seq'::regclass);


--
-- TOC entry 2415 (class 2606 OID 368787)
-- Dependencies: 161 161
-- Name: deva_angemeldeter_benutzer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_angemeldeter_benutzer
    ADD CONSTRAINT deva_angemeldeter_benutzer_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 368789)
-- Dependencies: 164 164
-- Name: deva_artikel_bestandteil_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_bestandteil
    ADD CONSTRAINT deva_artikel_bestandteil_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 368791)
-- Dependencies: 166 166
-- Name: deva_artikel_dokumente_dokument_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_dokumente
    ADD CONSTRAINT deva_artikel_dokumente_dokument_id_key UNIQUE (dokument_id);


--
-- TOC entry 2431 (class 2606 OID 368793)
-- Dependencies: 167 167 167
-- Name: deva_artikel_fahrzeuge_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_fahrzeuge
    ADD CONSTRAINT deva_artikel_fahrzeuge_pkey PRIMARY KEY (artikel_id, sort_order);


--
-- TOC entry 2433 (class 2606 OID 368795)
-- Dependencies: 169 169
-- Name: deva_artikel_kommentar_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_kommentar
    ADD CONSTRAINT deva_artikel_kommentar_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 368797)
-- Dependencies: 171 171
-- Name: deva_artikel_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_komponente
    ADD CONSTRAINT deva_artikel_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 368799)
-- Dependencies: 173 173
-- Name: deva_artikel_logbuch_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_logbuch
    ADD CONSTRAINT deva_artikel_logbuch_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 368801)
-- Dependencies: 163 163
-- Name: deva_artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT deva_artikel_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 368803)
-- Dependencies: 175 175
-- Name: deva_artikel_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_zubehoer
    ADD CONSTRAINT deva_artikel_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 368805)
-- Dependencies: 179 179 179
-- Name: deva_benutzer_firma_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_firma
    ADD CONSTRAINT deva_benutzer_firma_pkey PRIMARY KEY (benutzer, zugeordnete_firma);


--
-- TOC entry 2450 (class 2606 OID 368807)
-- Dependencies: 181 181
-- Name: deva_benutzer_liste_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_liste
    ADD CONSTRAINT deva_benutzer_liste_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 368809)
-- Dependencies: 181 181
-- Name: deva_benutzer_liste_singleton_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_liste
    ADD CONSTRAINT deva_benutzer_liste_singleton_key UNIQUE (singleton);


--
-- TOC entry 2441 (class 2606 OID 368811)
-- Dependencies: 178 178
-- Name: deva_benutzer_name_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT deva_benutzer_name_key UNIQUE (name);


--
-- TOC entry 2443 (class 2606 OID 368813)
-- Dependencies: 178 178
-- Name: deva_benutzer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT deva_benutzer_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 368815)
-- Dependencies: 183 183 183
-- Name: deva_benutzer_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_produktgruppe
    ADD CONSTRAINT deva_benutzer_produktgruppe_pkey PRIMARY KEY (benutzer, produktgruppe);


--
-- TOC entry 2456 (class 2606 OID 368817)
-- Dependencies: 184 184 184
-- Name: deva_benutzer_rollen_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_rollen
    ADD CONSTRAINT deva_benutzer_rollen_pkey PRIMARY KEY (benutzer, rolle);


--
-- TOC entry 2445 (class 2606 OID 368819)
-- Dependencies: 178 178
-- Name: deva_benutzer_username_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT deva_benutzer_username_key UNIQUE (username);


--
-- TOC entry 2458 (class 2606 OID 368821)
-- Dependencies: 185 185
-- Name: deva_bezeichnung_artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_artikel
    ADD CONSTRAINT deva_bezeichnung_artikel_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 368823)
-- Dependencies: 187 187
-- Name: deva_bezeichnung_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_komponente
    ADD CONSTRAINT deva_bezeichnung_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 368825)
-- Dependencies: 189 189
-- Name: deva_bezeichnung_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_produktgruppe
    ADD CONSTRAINT deva_bezeichnung_produktgruppe_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 368827)
-- Dependencies: 191 191
-- Name: deva_bezeichnung_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_zubehoer
    ADD CONSTRAINT deva_bezeichnung_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 368829)
-- Dependencies: 193 193
-- Name: deva_bezeichnung_zusatzinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_zusatzinformation
    ADD CONSTRAINT deva_bezeichnung_zusatzinformation_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 368831)
-- Dependencies: 195 195
-- Name: deva_bezeichung_prozess_schritt_identifier_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichung_prozess_schritt
    ADD CONSTRAINT deva_bezeichung_prozess_schritt_identifier_key UNIQUE (identifier);


--
-- TOC entry 2471 (class 2606 OID 368833)
-- Dependencies: 195 195
-- Name: deva_bezeichung_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichung_prozess_schritt
    ADD CONSTRAINT deva_bezeichung_prozess_schritt_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 368835)
-- Dependencies: 197 197
-- Name: deva_bonuszeit_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bonuszeit
    ADD CONSTRAINT deva_bonuszeit_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 368837)
-- Dependencies: 200 200
-- Name: deva_bpmndefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bpmndefinition
    ADD CONSTRAINT deva_bpmndefinition_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 368839)
-- Dependencies: 203 203
-- Name: deva_dokument_binaerdaten_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_dokument_binaerdaten
    ADD CONSTRAINT deva_dokument_binaerdaten_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 368841)
-- Dependencies: 202 202
-- Name: deva_dokument_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_dokument
    ADD CONSTRAINT deva_dokument_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 368843)
-- Dependencies: 206 206
-- Name: deva_faelligkeiten_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_faelligkeiten
    ADD CONSTRAINT deva_faelligkeiten_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 368845)
-- Dependencies: 206 206
-- Name: deva_faelligkeiten_singleton_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_faelligkeiten
    ADD CONSTRAINT deva_faelligkeiten_singleton_key UNIQUE (singleton);


--
-- TOC entry 2486 (class 2606 OID 368847)
-- Dependencies: 208 208
-- Name: deva_fahrzeug_bezeichnung_bezeichnung_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung
    ADD CONSTRAINT deva_fahrzeug_bezeichnung_bezeichnung_key UNIQUE (bezeichnung);


--
-- TOC entry 2488 (class 2606 OID 368849)
-- Dependencies: 208 208 208
-- Name: deva_fahrzeug_bezeichnung_fahrzeug_typ_hersteller_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung
    ADD CONSTRAINT deva_fahrzeug_bezeichnung_fahrzeug_typ_hersteller_key UNIQUE (fahrzeug_typ, hersteller);


--
-- TOC entry 2490 (class 2606 OID 368851)
-- Dependencies: 208 208
-- Name: deva_fahrzeug_bezeichnung_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung
    ADD CONSTRAINT deva_fahrzeug_bezeichnung_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 368853)
-- Dependencies: 211 211
-- Name: deva_firma_ansprechpartner_benutzer_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma_ansprechpartner
    ADD CONSTRAINT deva_firma_ansprechpartner_benutzer_id_key UNIQUE (benutzer_id);


--
-- TOC entry 2492 (class 2606 OID 368855)
-- Dependencies: 210 210
-- Name: deva_firma_name_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma
    ADD CONSTRAINT deva_firma_name_key UNIQUE (name);


--
-- TOC entry 2494 (class 2606 OID 368857)
-- Dependencies: 210 210
-- Name: deva_firma_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma
    ADD CONSTRAINT deva_firma_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 368859)
-- Dependencies: 214 214
-- Name: deva_firma_sollzeiten_artikel_sollzeiten_artikel_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma_sollzeiten_artikel
    ADD CONSTRAINT deva_firma_sollzeiten_artikel_sollzeiten_artikel_id_key UNIQUE (sollzeiten_artikel_id);


--
-- TOC entry 2500 (class 2606 OID 368861)
-- Dependencies: 215 215
-- Name: deva_firma_sollzeiten_komponente_sollzeiten_komponente_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma_sollzeiten_komponente
    ADD CONSTRAINT deva_firma_sollzeiten_komponente_sollzeiten_komponente_id_key UNIQUE (sollzeiten_komponente_id);


--
-- TOC entry 2505 (class 2606 OID 368863)
-- Dependencies: 217 217
-- Name: deva_komponente_dokumente_dokument_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_dokumente
    ADD CONSTRAINT deva_komponente_dokumente_dokument_id_key UNIQUE (dokument_id);


--
-- TOC entry 2507 (class 2606 OID 368865)
-- Dependencies: 219 219
-- Name: deva_komponente_kommentar_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_kommentar
    ADD CONSTRAINT deva_komponente_kommentar_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 368867)
-- Dependencies: 221 221
-- Name: deva_komponente_logbuch_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_logbuch
    ADD CONSTRAINT deva_komponente_logbuch_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 368869)
-- Dependencies: 216 216
-- Name: deva_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT deva_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 368871)
-- Dependencies: 223 223
-- Name: deva_komponente_zusatzinformationen_zusatzinfo_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_zusatzinformationen
    ADD CONSTRAINT deva_komponente_zusatzinformationen_zusatzinfo_id_key UNIQUE (zusatzinfo_id);


--
-- TOC entry 2513 (class 2606 OID 368873)
-- Dependencies: 224 224
-- Name: deva_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_produktgruppe
    ADD CONSTRAINT deva_produktgruppe_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 368875)
-- Dependencies: 226 226
-- Name: deva_prozess_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT deva_prozess_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 368877)
-- Dependencies: 226 226
-- Name: deva_prozess_process_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT deva_prozess_process_id_key UNIQUE (process_id);


--
-- TOC entry 2519 (class 2606 OID 368879)
-- Dependencies: 228 228
-- Name: deva_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT deva_prozess_schritt_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 368881)
-- Dependencies: 230 230
-- Name: deva_prozessdefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozessdefinition
    ADD CONSTRAINT deva_prozessdefinition_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 368883)
-- Dependencies: 232 232
-- Name: deva_rolle_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_rolle
    ADD CONSTRAINT deva_rolle_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 368885)
-- Dependencies: 236 236 236
-- Name: deva_rolle_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_rolle_prozess_schritt
    ADD CONSTRAINT deva_rolle_prozess_schritt_pkey PRIMARY KEY (rolle, prozess_schritt_definition);


--
-- TOC entry 2525 (class 2606 OID 368887)
-- Dependencies: 232 232
-- Name: deva_rolle_rolle_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_rolle
    ADD CONSTRAINT deva_rolle_rolle_key UNIQUE (rolle);


--
-- TOC entry 2529 (class 2606 OID 368889)
-- Dependencies: 238 238 238
-- Name: deva_sollzeit_wdh_klassifikation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_sollzeit_wdh_klassifikation
    ADD CONSTRAINT deva_sollzeit_wdh_klassifikation_pkey PRIMARY KEY (sollzeiten_id, klassifikation);


--
-- TOC entry 2533 (class 2606 OID 368891)
-- Dependencies: 241 241 241
-- Name: deva_sollzeiten_klassifikation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_sollzeiten_klassifikation
    ADD CONSTRAINT deva_sollzeiten_klassifikation_pkey PRIMARY KEY (sollzeiten_id, klassifikation);


--
-- TOC entry 2531 (class 2606 OID 368893)
-- Dependencies: 239 239
-- Name: deva_sollzeiten_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_sollzeiten
    ADD CONSTRAINT deva_sollzeiten_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 368895)
-- Dependencies: 242 242
-- Name: deva_uebersetzung_artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_artikel
    ADD CONSTRAINT deva_uebersetzung_artikel_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 368897)
-- Dependencies: 244 244
-- Name: deva_uebersetzung_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_komponente
    ADD CONSTRAINT deva_uebersetzung_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 368899)
-- Dependencies: 246 246
-- Name: deva_uebersetzung_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_produktgruppe
    ADD CONSTRAINT deva_uebersetzung_produktgruppe_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 368901)
-- Dependencies: 248 248
-- Name: deva_uebersetzung_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_prozess_schritt
    ADD CONSTRAINT deva_uebersetzung_prozess_schritt_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 368903)
-- Dependencies: 250 250
-- Name: deva_uebersetzung_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_zubehoer
    ADD CONSTRAINT deva_uebersetzung_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 368905)
-- Dependencies: 252 252
-- Name: deva_uebersetzung_zusatzinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_zusatzinformation
    ADD CONSTRAINT deva_uebersetzung_zusatzinformation_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 368907)
-- Dependencies: 254 254
-- Name: deva_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_zubehoer
    ADD CONSTRAINT deva_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 368909)
-- Dependencies: 256 256
-- Name: deva_zusatzinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_zusatzinformation
    ADD CONSTRAINT deva_zusatzinformation_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 368911)
-- Dependencies: 258 258
-- Name: drools_sessioninfo_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY drools_sessioninfo
    ADD CONSTRAINT drools_sessioninfo_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 368913)
-- Dependencies: 259 259
-- Name: drools_workiteminfo_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY drools_workiteminfo
    ADD CONSTRAINT drools_workiteminfo_pkey PRIMARY KEY (workitemid);


--
-- TOC entry 2555 (class 2606 OID 368915)
-- Dependencies: 261 261
-- Name: jbpm_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_attachment
    ADD CONSTRAINT jbpm_attachment_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 368917)
-- Dependencies: 262 262
-- Name: jbpm_boolean_expression_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_boolean_expression
    ADD CONSTRAINT jbpm_boolean_expression_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 368919)
-- Dependencies: 263 263
-- Name: jbpm_content_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_content
    ADD CONSTRAINT jbpm_content_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 368921)
-- Dependencies: 264 264
-- Name: jbpm_deadline_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_deadline
    ADD CONSTRAINT jbpm_deadline_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 368923)
-- Dependencies: 266 266
-- Name: jbpm_email_header_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_header
    ADD CONSTRAINT jbpm_email_header_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 368925)
-- Dependencies: 268 268
-- Name: jbpm_email_notification_jbpm_email_header_emailheaders_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT jbpm_email_notification_jbpm_email_header_emailheaders_id_key UNIQUE (emailheaders_id);


--
-- TOC entry 2569 (class 2606 OID 368927)
-- Dependencies: 268 268 268
-- Name: jbpm_email_notification_jbpm_email_header_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT jbpm_email_notification_jbpm_email_header_pkey PRIMARY KEY (jbpm_email_notification_id, emailheaders_key);


--
-- TOC entry 2565 (class 2606 OID 368929)
-- Dependencies: 267 267
-- Name: jbpm_email_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_notification
    ADD CONSTRAINT jbpm_email_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 368931)
-- Dependencies: 269 269
-- Name: jbpm_escalation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_escalation
    ADD CONSTRAINT jbpm_escalation_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 368933)
-- Dependencies: 270 270
-- Name: jbpm_group_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_group
    ADD CONSTRAINT jbpm_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 368935)
-- Dependencies: 271 271
-- Name: jbpm_i18ntext_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT jbpm_i18ntext_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 368937)
-- Dependencies: 272 272
-- Name: jbpm_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_notification
    ADD CONSTRAINT jbpm_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 368939)
-- Dependencies: 280 280
-- Name: jbpm_processinstance_eventinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_processinstance_eventinfo
    ADD CONSTRAINT jbpm_processinstance_eventinfo_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 368941)
-- Dependencies: 281 281
-- Name: jbpm_processinstance_info_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_processinstance_info
    ADD CONSTRAINT jbpm_processinstance_info_pkey PRIMARY KEY (instanceid);


--
-- TOC entry 2583 (class 2606 OID 368943)
-- Dependencies: 283 283
-- Name: jbpm_reassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_reassignment
    ADD CONSTRAINT jbpm_reassignment_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 368945)
-- Dependencies: 285 285
-- Name: jbpm_subtasksstrategy_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_subtasksstrategy
    ADD CONSTRAINT jbpm_subtasksstrategy_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 368947)
-- Dependencies: 287 287
-- Name: jbpm_task_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_task_comment
    ADD CONSTRAINT jbpm_task_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 368949)
-- Dependencies: 286 286
-- Name: jbpm_task_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT jbpm_task_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 368951)
-- Dependencies: 288 288
-- Name: jbpm_user_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_user
    ADD CONSTRAINT jbpm_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 1259 OID 368952)
-- Dependencies: 163
-- Name: ampel_status_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX ampel_status_idx ON deva_artikel USING btree (ampel_status);


--
-- TOC entry 2417 (class 1259 OID 368953)
-- Dependencies: 163 163 163 163
-- Name: artikel_filter_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX artikel_filter_idx ON deva_artikel USING btree (lieferant, kunde, ampel_status, artikelbezeichnung);


--
-- TOC entry 2418 (class 1259 OID 368954)
-- Dependencies: 163
-- Name: artikelprozess_status_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX artikelprozess_status_idx ON deva_artikel USING btree (artikelprozess_status);


--
-- TOC entry 2484 (class 1259 OID 368955)
-- Dependencies: 208
-- Name: bezeichnung_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX bezeichnung_idx ON deva_fahrzeug_bezeichnung USING btree (bezeichnung);


--
-- TOC entry 2446 (class 1259 OID 368956)
-- Dependencies: 178
-- Name: firma_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX firma_idx ON deva_benutzer USING btree (firma);


--
-- TOC entry 2503 (class 1259 OID 368957)
-- Dependencies: 216 216 216
-- Name: komponente_filter_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX komponente_filter_idx ON deva_komponente USING btree (lieferant, kunde, komponentenbezeichnung);


--
-- TOC entry 2421 (class 1259 OID 368958)
-- Dependencies: 163
-- Name: kunde_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX kunde_idx ON deva_artikel USING btree (kunde);


--
-- TOC entry 2422 (class 1259 OID 368959)
-- Dependencies: 163
-- Name: lieferant_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX lieferant_idx ON deva_artikel USING btree (lieferant);


--
-- TOC entry 2459 (class 1259 OID 368960)
-- Dependencies: 185
-- Name: produktgruppe_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX produktgruppe_idx ON deva_bezeichnung_artikel USING btree (produktgruppe);


--
-- TOC entry 2423 (class 1259 OID 368961)
-- Dependencies: 163
-- Name: raw_lieferantennummer_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX raw_lieferantennummer_idx ON deva_artikel USING btree (raw_lieferantennummer);


--
-- TOC entry 2424 (class 1259 OID 368962)
-- Dependencies: 163
-- Name: raw_meylenummer_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX raw_meylenummer_idx ON deva_artikel USING btree (raw_meylenummer);


--
-- TOC entry 2425 (class 1259 OID 368963)
-- Dependencies: 163
-- Name: raw_oenummer_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX raw_oenummer_idx ON deva_artikel USING btree (raw_oenummer);


--
-- TOC entry 2710 (class 2606 OID 370879)
-- Dependencies: 291 163 2419
-- Name: deva_artikel_verantwortliche_artikel_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY deva_artikel_verantwortliche
    ADD CONSTRAINT deva_artikel_verantwortliche_artikel_fk FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2709 (class 2606 OID 370884)
-- Dependencies: 291 178 2442
-- Name: deva_artikel_verantwortliche_benutzer_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY deva_artikel_verantwortliche
    ADD CONSTRAINT deva_artikel_verantwortliche_benutzer_fk FOREIGN KEY (verantwortlicher_id) REFERENCES deva_benutzer(id);


--
-- TOC entry 2711 (class 2606 OID 370897)
-- Dependencies: 292 178 2442
-- Name: deva_komponente_verantwortliche_benutzer_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY deva_komponente_verantwortliche
    ADD CONSTRAINT deva_komponente_verantwortliche_benutzer_fk FOREIGN KEY (verantwortlicher_id) REFERENCES deva_benutzer(id);


--
-- TOC entry 2712 (class 2606 OID 370892)
-- Dependencies: 292 216 2501
-- Name: deva_komponente_verantwortliche_komponente_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY deva_komponente_verantwortliche
    ADD CONSTRAINT deva_komponente_verantwortliche_komponente_fk FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2668 (class 2606 OID 368964)
-- Dependencies: 239 238 2530
-- Name: fk12895194c589307f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeit_wdh_klassifikation
    ADD CONSTRAINT fk12895194c589307f FOREIGN KEY (sollzeiten_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2617 (class 2606 OID 368969)
-- Dependencies: 210 178 2493
-- Name: fk129925f083e97000; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT fk129925f083e97000 FOREIGN KEY (firma) REFERENCES deva_firma(id);


--
-- TOC entry 2611 (class 2606 OID 368974)
-- Dependencies: 173 163 2419
-- Name: fk147182967ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_logbuch
    ADD CONSTRAINT fk147182967ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2612 (class 2606 OID 368979)
-- Dependencies: 173 2442 178
-- Name: fk14718296dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_logbuch
    ADD CONSTRAINT fk14718296dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2689 (class 2606 OID 368984)
-- Dependencies: 2560 264 271
-- Name: fk17e984153330f6d9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e984153330f6d9 FOREIGN KEY (deadline_documentation_id) REFERENCES jbpm_deadline(id);


--
-- TOC entry 2690 (class 2606 OID 368989)
-- Dependencies: 283 271 2582
-- Name: fk17e984155eebb6d9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e984155eebb6d9 FOREIGN KEY (reassignment_documentation_id) REFERENCES jbpm_reassignment(id);


--
-- TOC entry 2691 (class 2606 OID 368994)
-- Dependencies: 271 2586 286
-- Name: fk17e9841569b21ee8; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e9841569b21ee8 FOREIGN KEY (task_descriptions_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2692 (class 2606 OID 368999)
-- Dependencies: 2586 271 286
-- Name: fk17e9841598b62b; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e9841598b62b FOREIGN KEY (task_names_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2693 (class 2606 OID 369004)
-- Dependencies: 2586 286 271
-- Name: fk17e98415b2fa6b18; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e98415b2fa6b18 FOREIGN KEY (task_subjects_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2631 (class 2606 OID 369009)
-- Dependencies: 210 211 2493
-- Name: fk21484eb75cf6cf14; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_ansprechpartner
    ADD CONSTRAINT fk21484eb75cf6cf14 FOREIGN KEY (firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2632 (class 2606 OID 369014)
-- Dependencies: 2442 211 178
-- Name: fk21484eb7d52de102; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_ansprechpartner
    ADD CONSTRAINT fk21484eb7d52de102 FOREIGN KEY (benutzer_id) REFERENCES deva_benutzer(id);


--
-- TOC entry 2624 (class 2606 OID 369019)
-- Dependencies: 185 224 2512
-- Name: fk2477d5ba2525ea1e; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_artikel
    ADD CONSTRAINT fk2477d5ba2525ea1e FOREIGN KEY (produktgruppe) REFERENCES deva_produktgruppe(id);


--
-- TOC entry 2696 (class 2606 OID 369024)
-- Dependencies: 286 2586 276
-- Name: fk2c7efe4e36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_exclowners
    ADD CONSTRAINT fk2c7efe4e36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2620 (class 2606 OID 369029)
-- Dependencies: 2512 183 224
-- Name: fk3133f1b32525ea1e; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_produktgruppe
    ADD CONSTRAINT fk3133f1b32525ea1e FOREIGN KEY (produktgruppe) REFERENCES deva_produktgruppe(id);


--
-- TOC entry 2621 (class 2606 OID 369034)
-- Dependencies: 2442 183 178
-- Name: fk3133f1b3dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_produktgruppe
    ADD CONSTRAINT fk3133f1b3dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2702 (class 2606 OID 369039)
-- Dependencies: 283 2582 284
-- Name: fk3178ef69e17e130f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_reassignment_potentialowners
    ADD CONSTRAINT fk3178ef69e17e130f FOREIGN KEY (task_id) REFERENCES jbpm_reassignment(id);


--
-- TOC entry 2669 (class 2606 OID 369044)
-- Dependencies: 239 195 2470
-- Name: fk31b0dbce38fe1d3c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeiten
    ADD CONSTRAINT fk31b0dbce38fe1d3c FOREIGN KEY (meilenstein_definition) REFERENCES deva_bezeichung_prozess_schritt(id);


--
-- TOC entry 2695 (class 2606 OID 369049)
-- Dependencies: 275 286 2586
-- Name: fk32b3fd6236b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_bas
    ADD CONSTRAINT fk32b3fd6236b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2665 (class 2606 OID 369054)
-- Dependencies: 2522 232 236
-- Name: fk3804709e6273aba8; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_prozess_schritt
    ADD CONSTRAINT fk3804709e6273aba8 FOREIGN KEY (rolle) REFERENCES deva_rolle(id);


--
-- TOC entry 2666 (class 2606 OID 369059)
-- Dependencies: 236 195 2470
-- Name: fk3804709e75b486b9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_prozess_schritt
    ADD CONSTRAINT fk3804709e75b486b9 FOREIGN KEY (prozess_schritt_definition) REFERENCES deva_bezeichung_prozess_schritt(id);


--
-- TOC entry 2647 (class 2606 OID 369064)
-- Dependencies: 2442 219 178
-- Name: fk3b7548acdc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_kommentar
    ADD CONSTRAINT fk3b7548acdc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2648 (class 2606 OID 369069)
-- Dependencies: 216 219 2501
-- Name: fk3b7548acdfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_kommentar
    ADD CONSTRAINT fk3b7548acdfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2682 (class 2606 OID 369074)
-- Dependencies: 2586 264 286
-- Name: fk414b622227abeb8a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_deadline
    ADD CONSTRAINT fk414b622227abeb8a FOREIGN KEY (deadlines_enddeadline_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2683 (class 2606 OID 369079)
-- Dependencies: 286 264 2586
-- Name: fk414b6222684baca3; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_deadline
    ADD CONSTRAINT fk414b6222684baca3 FOREIGN KEY (deadlines_startdeadline_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2700 (class 2606 OID 369084)
-- Dependencies: 281 282 2580
-- Name: fk42e004eb2143f831; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_processinstance_info_eventtypes
    ADD CONSTRAINT fk42e004eb2143f831 FOREIGN KEY (jbpm_processinstance_info_id) REFERENCES jbpm_processinstance_info(instanceid);


--
-- TOC entry 2684 (class 2606 OID 369089)
-- Dependencies: 2586 265 286
-- Name: fk4e75de136b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_delegation_delegates
    ADD CONSTRAINT fk4e75de136b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2635 (class 2606 OID 369094)
-- Dependencies: 214 2493 210
-- Name: fk4f2030575cf6cf14; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_artikel
    ADD CONSTRAINT fk4f2030575cf6cf14 FOREIGN KEY (firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2636 (class 2606 OID 369099)
-- Dependencies: 214 2530 239
-- Name: fk4f20305774e70772; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_artikel
    ADD CONSTRAINT fk4f20305774e70772 FOREIGN KEY (sollzeiten_artikel_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2625 (class 2606 OID 369104)
-- Dependencies: 228 197 2518
-- Name: fk4f4940821123a3e4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bonuszeit
    ADD CONSTRAINT fk4f4940821123a3e4 FOREIGN KEY (prozess_schritt) REFERENCES deva_prozess_schritt(id);


--
-- TOC entry 2626 (class 2606 OID 369109)
-- Dependencies: 197 178 2442
-- Name: fk4f4940824c4c8e48; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bonuszeit
    ADD CONSTRAINT fk4f4940824c4c8e48 FOREIGN KEY (gewaehrt_von) REFERENCES deva_benutzer(id);


--
-- TOC entry 2664 (class 2606 OID 369114)
-- Dependencies: 232 234 2522
-- Name: fk511f24132e56239d; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_ampelstatus
    ADD CONSTRAINT fk511f24132e56239d FOREIGN KEY (ampelstatus_id) REFERENCES deva_rolle(id);


--
-- TOC entry 2671 (class 2606 OID 369119)
-- Dependencies: 2457 242 185
-- Name: fk51c371f7eacc69fa; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_artikel
    ADD CONSTRAINT fk51c371f7eacc69fa FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_artikel(id);


--
-- TOC entry 2674 (class 2606 OID 369124)
-- Dependencies: 2470 248 195
-- Name: fk560f3573153e746f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_prozess_schritt
    ADD CONSTRAINT fk560f3573153e746f FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichung_prozess_schritt(id);


--
-- TOC entry 2672 (class 2606 OID 369129)
-- Dependencies: 244 187 2460
-- Name: fk57aff0351dc451da; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_komponente
    ADD CONSTRAINT fk57aff0351dc451da FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_komponente(id);


--
-- TOC entry 2609 (class 2606 OID 369134)
-- Dependencies: 163 2419 171
-- Name: fk5b3e08463d3b7a12; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_komponente
    ADD CONSTRAINT fk5b3e08463d3b7a12 FOREIGN KEY (artikel) REFERENCES deva_artikel(id);


--
-- TOC entry 2610 (class 2606 OID 369139)
-- Dependencies: 2501 216 171
-- Name: fk5b3e08468d6ce006; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_komponente
    ADD CONSTRAINT fk5b3e08468d6ce006 FOREIGN KEY (komponente) REFERENCES deva_komponente(id);


--
-- TOC entry 2663 (class 2606 OID 369144)
-- Dependencies: 2522 233 232
-- Name: fk5b9f4d34d1137703; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_aktions_berechtigungen
    ADD CONSTRAINT fk5b9f4d34d1137703 FOREIGN KEY (berechtigung_id) REFERENCES deva_rolle(id);


--
-- TOC entry 2688 (class 2606 OID 369149)
-- Dependencies: 264 269 2560
-- Name: fk5ca4a3dfc7a04c70; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_escalation
    ADD CONSTRAINT fk5ca4a3dfc7a04c70 FOREIGN KEY (deadline_escalation_id) REFERENCES jbpm_deadline(id);


--
-- TOC entry 2613 (class 2606 OID 369154)
-- Dependencies: 163 2419 175
-- Name: fk5d10f7783d3b7a12; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zubehoer
    ADD CONSTRAINT fk5d10f7783d3b7a12 FOREIGN KEY (artikel) REFERENCES deva_artikel(id);


--
-- TOC entry 2614 (class 2606 OID 369159)
-- Dependencies: 254 175 2546
-- Name: fk5d10f778b3b24cea; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zubehoer
    ADD CONSTRAINT fk5d10f778b3b24cea FOREIGN KEY (zubehoer) REFERENCES deva_zubehoer(id);


--
-- TOC entry 2637 (class 2606 OID 369164)
-- Dependencies: 215 2493 210
-- Name: fk635e15d55cf6cf14; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_komponente
    ADD CONSTRAINT fk635e15d55cf6cf14 FOREIGN KEY (firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2638 (class 2606 OID 369169)
-- Dependencies: 239 2530 215
-- Name: fk635e15d5b3de8e56; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_komponente
    ADD CONSTRAINT fk635e15d5b3de8e56 FOREIGN KEY (sollzeiten_komponente_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2594 (class 2606 OID 369174)
-- Dependencies: 163 2457 185
-- Name: fk6e9467b92325ac4e; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b92325ac4e FOREIGN KEY (artikelbezeichnung) REFERENCES deva_bezeichnung_artikel(id);


--
-- TOC entry 2595 (class 2606 OID 369179)
-- Dependencies: 210 2493 163
-- Name: fk6e9467b938fd1c19; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b938fd1c19 FOREIGN KEY (lieferant) REFERENCES deva_firma(id);


--
-- TOC entry 2596 (class 2606 OID 369184)
-- Dependencies: 2514 226 163
-- Name: fk6e9467b96b6c33bf; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b96b6c33bf FOREIGN KEY (artikelprozess) REFERENCES deva_prozess(id);


--
-- TOC entry 2597 (class 2606 OID 369189)
-- Dependencies: 210 2493 163
-- Name: fk6e9467b9843549e2; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b9843549e2 FOREIGN KEY (kunde) REFERENCES deva_firma(id);


--
-- TOC entry 2598 (class 2606 OID 369194)
-- Dependencies: 178 2442 163
-- Name: fk6e9467b98c57da6c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b98c57da6c FOREIGN KEY (angelegt_von) REFERENCES deva_benutzer(id);


--
-- TOC entry 2599 (class 2606 OID 369199)
-- Dependencies: 163 163 2419
-- Name: fk6e9467b98c8fc63d; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b98c8fc63d FOREIGN KEY (paarbeziehung) REFERENCES deva_artikel(id);


--
-- TOC entry 2600 (class 2606 OID 369204)
-- Dependencies: 202 2476 163
-- Name: fk6e9467b9a1cbfc4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b9a1cbfc4 FOREIGN KEY (artikelbild) REFERENCES deva_dokument(id);


--
-- TOC entry 2627 (class 2606 OID 369209)
-- Dependencies: 199 2474 200
-- Name: fk70d1bb683ebdb8fe; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bpmn_definition_task_handler_names
    ADD CONSTRAINT fk70d1bb683ebdb8fe FOREIGN KEY (bpmn_definition_id) REFERENCES deva_bpmndefinition(id);


--
-- TOC entry 2697 (class 2606 OID 369214)
-- Dependencies: 277 2586 286
-- Name: fk73d7058336b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_potowners
    ADD CONSTRAINT fk73d7058336b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2649 (class 2606 OID 369219)
-- Dependencies: 2442 178 221
-- Name: fk77be0c10dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_logbuch
    ADD CONSTRAINT fk77be0c10dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2650 (class 2606 OID 369224)
-- Dependencies: 216 221 2501
-- Name: fk77be0c10dfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_logbuch
    ADD CONSTRAINT fk77be0c10dfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2607 (class 2606 OID 369229)
-- Dependencies: 2419 169 163
-- Name: fk792535b27ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_kommentar
    ADD CONSTRAINT fk792535b27ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2608 (class 2606 OID 369234)
-- Dependencies: 178 2442 169
-- Name: fk792535b2dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_kommentar
    ADD CONSTRAINT fk792535b2dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2601 (class 2606 OID 369239)
-- Dependencies: 2419 163 164
-- Name: fk7a16c7a13d3b7a12; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_bestandteil
    ADD CONSTRAINT fk7a16c7a13d3b7a12 FOREIGN KEY (artikel) REFERENCES deva_artikel(id);


--
-- TOC entry 2602 (class 2606 OID 369244)
-- Dependencies: 2419 164 163
-- Name: fk7a16c7a1f093319a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_bestandteil
    ADD CONSTRAINT fk7a16c7a1f093319a FOREIGN KEY (artikel_bestandteil) REFERENCES deva_artikel(id);


--
-- TOC entry 2658 (class 2606 OID 369249)
-- Dependencies: 2514 228 226
-- Name: fk7cf7493511000a0a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT fk7cf7493511000a0a FOREIGN KEY (aktueller_schritt) REFERENCES deva_prozess(id);


--
-- TOC entry 2659 (class 2606 OID 369254)
-- Dependencies: 228 2514 226
-- Name: fk7cf74935199fc6f5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT fk7cf74935199fc6f5 FOREIGN KEY (abgeschlossener_schritt) REFERENCES deva_prozess(id);


--
-- TOC entry 2660 (class 2606 OID 369259)
-- Dependencies: 228 195 2470
-- Name: fk7cf7493575b486b9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT fk7cf7493575b486b9 FOREIGN KEY (prozess_schritt_definition) REFERENCES deva_bezeichung_prozess_schritt(id);


--
-- TOC entry 2699 (class 2606 OID 369264)
-- Dependencies: 279 2586 286
-- Name: fk7dcd4ddf36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_stakeholders
    ADD CONSTRAINT fk7dcd4ddf36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2618 (class 2606 OID 369269)
-- Dependencies: 210 2493 179
-- Name: fk805a2eb45b19b851; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_firma
    ADD CONSTRAINT fk805a2eb45b19b851 FOREIGN KEY (zugeordnete_firma) REFERENCES deva_firma(id);


--
-- TOC entry 2619 (class 2606 OID 369274)
-- Dependencies: 2442 178 179
-- Name: fk805a2eb4dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_firma
    ADD CONSTRAINT fk805a2eb4dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2655 (class 2606 OID 369279)
-- Dependencies: 228 226 2518
-- Name: fk87d3108562008c47; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT fk87d3108562008c47 FOREIGN KEY (naechster_meilenstein) REFERENCES deva_prozess_schritt(id);


--
-- TOC entry 2656 (class 2606 OID 369284)
-- Dependencies: 2474 226 200
-- Name: fk87d31085975a806a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT fk87d31085975a806a FOREIGN KEY (bpmn_definition) REFERENCES deva_bpmndefinition(id);


--
-- TOC entry 2657 (class 2606 OID 369289)
-- Dependencies: 226 230 2520
-- Name: fk87d31085eb1c5f20; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT fk87d31085eb1c5f20 FOREIGN KEY (prozess_definition) REFERENCES deva_prozessdefinition(id);


--
-- TOC entry 2673 (class 2606 OID 369294)
-- Dependencies: 246 189 2462
-- Name: fk88d3d6d9315e404; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_produktgruppe
    ADD CONSTRAINT fk88d3d6d9315e404 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_produktgruppe(id);


--
-- TOC entry 2675 (class 2606 OID 369299)
-- Dependencies: 250 2464 191
-- Name: fk8b6a0f27adede368; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zubehoer
    ADD CONSTRAINT fk8b6a0f27adede368 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_zubehoer(id);


--
-- TOC entry 2677 (class 2606 OID 369304)
-- Dependencies: 254 2464 191
-- Name: fk8b7d1a55e7b2276; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zubehoer
    ADD CONSTRAINT fk8b7d1a55e7b2276 FOREIGN KEY (zubehoerbezeichnung) REFERENCES deva_bezeichnung_zubehoer(id);


--
-- TOC entry 2670 (class 2606 OID 369309)
-- Dependencies: 239 2530 241
-- Name: fk8e4ee667c589307f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeiten_klassifikation
    ADD CONSTRAINT fk8e4ee667c589307f FOREIGN KEY (sollzeiten_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2686 (class 2606 OID 369314)
-- Dependencies: 2562 266 268
-- Name: fk9c2287131f7b912a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT fk9c2287131f7b912a FOREIGN KEY (emailheaders_id) REFERENCES jbpm_email_header(id);


--
-- TOC entry 2687 (class 2606 OID 369319)
-- Dependencies: 2564 267 268
-- Name: fk9c228713351621ef; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT fk9c228713351621ef FOREIGN KEY (jbpm_email_notification_id) REFERENCES jbpm_email_notification(id);


--
-- TOC entry 2703 (class 2606 OID 369324)
-- Dependencies: 2586 286 285
-- Name: fk9d95288b36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_subtasksstrategy
    ADD CONSTRAINT fk9d95288b36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2622 (class 2606 OID 369329)
-- Dependencies: 232 184 2522
-- Name: fk9fb79f156273aba8; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_rollen
    ADD CONSTRAINT fk9fb79f156273aba8 FOREIGN KEY (rolle) REFERENCES deva_rolle(id);


--
-- TOC entry 2623 (class 2606 OID 369334)
-- Dependencies: 178 2442 184
-- Name: fk9fb79f15dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_rollen
    ADD CONSTRAINT fk9fb79f15dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2661 (class 2606 OID 369339)
-- Dependencies: 230 2493 210
-- Name: fka2830f9838fd1c19; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozessdefinition
    ADD CONSTRAINT fka2830f9838fd1c19 FOREIGN KEY (lieferant) REFERENCES deva_firma(id);


--
-- TOC entry 2662 (class 2606 OID 369344)
-- Dependencies: 230 2493 210
-- Name: fka2830f98843549e2; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozessdefinition
    ADD CONSTRAINT fka2830f98843549e2 FOREIGN KEY (kunde) REFERENCES deva_firma(id);


--
-- TOC entry 2681 (class 2606 OID 369349)
-- Dependencies: 2570 269 262
-- Name: fka4a3ea79afb75f7d; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_boolean_expression
    ADD CONSTRAINT fka4a3ea79afb75f7d FOREIGN KEY (escalation_constraints_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 2628 (class 2606 OID 369354)
-- Dependencies: 200 230 2520
-- Name: fka6ca9ab5cbfa49b5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bpmndefinition
    ADD CONSTRAINT fka6ca9ab5cbfa49b5 FOREIGN KEY (prozessdefinition_id) REFERENCES deva_prozessdefinition(id);


--
-- TOC entry 2651 (class 2606 OID 369359)
-- Dependencies: 256 223 2548
-- Name: fka7e180fa46b7fc54; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_zusatzinformationen
    ADD CONSTRAINT fka7e180fa46b7fc54 FOREIGN KEY (zusatzinfo_id) REFERENCES deva_zusatzinformation(id);


--
-- TOC entry 2652 (class 2606 OID 369364)
-- Dependencies: 2501 216 223
-- Name: fka7e180fadfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_zusatzinformationen
    ADD CONSTRAINT fka7e180fadfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2634 (class 2606 OID 369369)
-- Dependencies: 210 2493 213
-- Name: fkab4bb876793f005b; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_lieferanten
    ADD CONSTRAINT fkab4bb876793f005b FOREIGN KEY (lieferant_id) REFERENCES deva_firma(id);


--
-- TOC entry 2633 (class 2606 OID 369374)
-- Dependencies: 2493 210 213
-- Name: fkab4bb876e53e3934; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_lieferanten
    ADD CONSTRAINT fkab4bb876e53e3934 FOREIGN KEY (lieferant_fuer_firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2694 (class 2606 OID 369379)
-- Dependencies: 272 269 2570
-- Name: fkad3513b53e0890b; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_notification
    ADD CONSTRAINT fkad3513b53e0890b FOREIGN KEY (escalation_notifications_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 2685 (class 2606 OID 369384)
-- Dependencies: 2570 269 267
-- Name: fkad3513b53e0890b7099f418; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_email_notification
    ADD CONSTRAINT fkad3513b53e0890b7099f418 FOREIGN KEY (escalation_notifications_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 2704 (class 2606 OID 369389)
-- Dependencies: 2590 288 286
-- Name: fkb48f3a4f6ce1ef3a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fkb48f3a4f6ce1ef3a FOREIGN KEY (actualowner_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2705 (class 2606 OID 369394)
-- Dependencies: 288 286 2590
-- Name: fkb48f3a4f9e619a0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fkb48f3a4f9e619a0 FOREIGN KEY (createdby_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2706 (class 2606 OID 369399)
-- Dependencies: 286 2590 288
-- Name: fkb48f3a4ff213f8b5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fkb48f3a4ff213f8b5 FOREIGN KEY (taskinitiator_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2653 (class 2606 OID 369404)
-- Dependencies: 224 224 2512
-- Name: fkb68b59af748e0737; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_produktgruppe
    ADD CONSTRAINT fkb68b59af748e0737 FOREIGN KEY (obergruppe) REFERENCES deva_produktgruppe(id);


--
-- TOC entry 2654 (class 2606 OID 369409)
-- Dependencies: 224 189 2462
-- Name: fkb68b59af9315e404; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_produktgruppe
    ADD CONSTRAINT fkb68b59af9315e404 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_produktgruppe(id);


--
-- TOC entry 2676 (class 2606 OID 369414)
-- Dependencies: 193 252 2466
-- Name: fkb807fcc8d2732549; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zusatzinformation
    ADD CONSTRAINT fkb807fcc8d2732549 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_zusatzinformation(id);


--
-- TOC entry 2639 (class 2606 OID 369419)
-- Dependencies: 210 2493 216
-- Name: fkb8970b3338fd1c19; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b3338fd1c19 FOREIGN KEY (lieferant) REFERENCES deva_firma(id);


--
-- TOC entry 2640 (class 2606 OID 369424)
-- Dependencies: 226 216 2514
-- Name: fkb8970b334e705a2c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b334e705a2c FOREIGN KEY (komponente_prozess) REFERENCES deva_prozess(id);


--
-- TOC entry 2641 (class 2606 OID 369429)
-- Dependencies: 216 2493 210
-- Name: fkb8970b33843549e2; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b33843549e2 FOREIGN KEY (kunde) REFERENCES deva_firma(id);


--
-- TOC entry 2642 (class 2606 OID 369434)
-- Dependencies: 216 2442 178
-- Name: fkb8970b338c57da6c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b338c57da6c FOREIGN KEY (angelegt_von) REFERENCES deva_benutzer(id);


--
-- TOC entry 2643 (class 2606 OID 369439)
-- Dependencies: 216 2476 202
-- Name: fkb8970b33a1cbfc4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b33a1cbfc4 FOREIGN KEY (artikelbild) REFERENCES deva_dokument(id);


--
-- TOC entry 2644 (class 2606 OID 369444)
-- Dependencies: 216 2460 187
-- Name: fkb8970b33a8076cac; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b33a8076cac FOREIGN KEY (komponentenbezeichnung) REFERENCES deva_bezeichnung_komponente(id);


--
-- TOC entry 2678 (class 2606 OID 369449)
-- Dependencies: 256 193 2466
-- Name: fkc53a280abb69726c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zusatzinformation
    ADD CONSTRAINT fkc53a280abb69726c FOREIGN KEY (zusatzinformationbezeichnung) REFERENCES deva_bezeichnung_zusatzinformation(id);


--
-- TOC entry 2645 (class 2606 OID 369454)
-- Dependencies: 2501 216 217
-- Name: fkd1dd1e86dfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_dokumente
    ADD CONSTRAINT fkd1dd1e86dfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2646 (class 2606 OID 369459)
-- Dependencies: 217 202 2476
-- Name: fkd1dd1e86fe056660; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_dokumente
    ADD CONSTRAINT fkd1dd1e86fe056660 FOREIGN KEY (dokument_id) REFERENCES deva_dokument(id);


--
-- TOC entry 2667 (class 2606 OID 369464)
-- Dependencies: 237 232 2522
-- Name: fkd632fa90d1137703; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_sicht_berechtigungen
    ADD CONSTRAINT fkd632fa90d1137703 FOREIGN KEY (berechtigung_id) REFERENCES deva_rolle(id);


--
-- TOC entry 2616 (class 2606 OID 369469)
-- Dependencies: 177 2548 256
-- Name: fkda95e8046b7fc54; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zusatzinformationen
    ADD CONSTRAINT fkda95e8046b7fc54 FOREIGN KEY (zusatzinfo_id) REFERENCES deva_zusatzinformation(id);


--
-- TOC entry 2615 (class 2606 OID 369474)
-- Dependencies: 2419 177 163
-- Name: fkda95e807ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zusatzinformationen
    ADD CONSTRAINT fkda95e807ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2592 (class 2606 OID 369479)
-- Dependencies: 161 2449 181
-- Name: fkdae0e2b231ed32e7; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_angemeldeter_benutzer
    ADD CONSTRAINT fkdae0e2b231ed32e7 FOREIGN KEY (benutzer_liste) REFERENCES deva_benutzer_liste(id);


--
-- TOC entry 2593 (class 2606 OID 369484)
-- Dependencies: 2442 178 161
-- Name: fkdae0e2b2dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_angemeldeter_benutzer
    ADD CONSTRAINT fkdae0e2b2dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2605 (class 2606 OID 369489)
-- Dependencies: 167 2489 208
-- Name: fke6ab83fd2bf81bd0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_fahrzeuge
    ADD CONSTRAINT fke6ab83fd2bf81bd0 FOREIGN KEY (fahrzeug_id) REFERENCES deva_fahrzeug_bezeichnung(id);


--
-- TOC entry 2606 (class 2606 OID 369494)
-- Dependencies: 163 2419 167
-- Name: fke6ab83fd7ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_fahrzeuge
    ADD CONSTRAINT fke6ab83fd7ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2707 (class 2606 OID 369499)
-- Dependencies: 2590 288 287
-- Name: fke7d49c4f2ff04688; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task_comment
    ADD CONSTRAINT fke7d49c4f2ff04688 FOREIGN KEY (addedby_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2708 (class 2606 OID 369504)
-- Dependencies: 2586 286 287
-- Name: fke7d49c4fb35e68f5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task_comment
    ADD CONSTRAINT fke7d49c4fb35e68f5 FOREIGN KEY (taskdata_comments_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2629 (class 2606 OID 369509)
-- Dependencies: 202 203 2478
-- Name: fkee37ca061ad81661; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument
    ADD CONSTRAINT fkee37ca061ad81661 FOREIGN KEY (thumbnail_id) REFERENCES deva_dokument_binaerdaten(id);


--
-- TOC entry 2630 (class 2606 OID 369514)
-- Dependencies: 2478 202 203
-- Name: fkee37ca06862116e3; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument
    ADD CONSTRAINT fkee37ca06862116e3 FOREIGN KEY (data_id) REFERENCES deva_dokument_binaerdaten(id);


--
-- TOC entry 2701 (class 2606 OID 369519)
-- Dependencies: 269 283 2570
-- Name: fkf23c3c0aa5c17ee0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_reassignment
    ADD CONSTRAINT fkf23c3c0aa5c17ee0 FOREIGN KEY (escalation_reassignments_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 2698 (class 2606 OID 369524)
-- Dependencies: 2586 278 286
-- Name: fkf55e684c36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_recipients
    ADD CONSTRAINT fkf55e684c36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2679 (class 2606 OID 369529)
-- Dependencies: 261 2590 288
-- Name: fkf6bb126d8ef5f064; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_attachment
    ADD CONSTRAINT fkf6bb126d8ef5f064 FOREIGN KEY (attachedby_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2680 (class 2606 OID 369534)
-- Dependencies: 286 261 2586
-- Name: fkf6bb126df21826d9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_attachment
    ADD CONSTRAINT fkf6bb126df21826d9 FOREIGN KEY (taskdata_attachments_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2603 (class 2606 OID 369539)
-- Dependencies: 163 166 2419
-- Name: fkf8d0b8c7ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_dokumente
    ADD CONSTRAINT fkf8d0b8c7ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2604 (class 2606 OID 369544)
-- Dependencies: 166 2476 202
-- Name: fkf8d0b8cfe056660; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_dokumente
    ADD CONSTRAINT fkf8d0b8cfe056660 FOREIGN KEY (dokument_id) REFERENCES deva_dokument(id);


--
-- TOC entry 2717 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-06-13 15:22:56 CEST

--
-- PostgreSQL database dump complete
--
