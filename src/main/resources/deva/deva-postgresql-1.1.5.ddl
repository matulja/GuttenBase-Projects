--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.0
-- Dumped by pg_dump version 9.2.0
-- Started on 2013-05-28 17:34:19 CEST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 324 (class 1255 OID 42145)
-- Name: drop_all_constraints(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION drop_all_constraints() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
r record;
BEGIN
FOR r IN SELECT table_name, constraint_name FROM information_schema.constraint_table_usage
LOOP
EXECUTE 'ALTER TABLE ' || quote_ident(r.table_name) || ' DROP CONSTRAINT ' || quote_ident(r.constraint_name) || ' CASCADE';
END LOOP;
RETURN 1;
END;
$$;


ALTER FUNCTION public.drop_all_constraints() OWNER TO postgres;

--
-- TOC entry 323 (class 1255 OID 42144)
-- Name: drop_all_sequences(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION drop_all_sequences() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
rec record;
BEGIN
FOR rec IN SELECT relname as seqname FROM pg_class WHERE relkind='S'
LOOP
EXECUTE 'DROP SEQUENCE ' || rec.seqname || ' CASCADE';
END LOOP;
RETURN 1;
END;
$$;


ALTER FUNCTION public.drop_all_sequences() OWNER TO postgres;

--
-- TOC entry 321 (class 1255 OID 42146)
-- Name: drop_all_tables(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION drop_all_tables() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
r record;
BEGIN
FOR r IN SELECT schemaname, tablename FROM pg_tables WHERE schemaname ='public'
LOOP
EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.schemaname) || '.' || quote_ident(r.tablename) || ' CASCADE';
END LOOP;
RETURN 1;
END;
$$;


ALTER FUNCTION public.drop_all_tables() OWNER TO postgres;

--
-- TOC entry 322 (class 1255 OID 42147)
-- Name: truncate_all_tables(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION truncate_all_tables() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
r record;
BEGIN
FOR r IN SELECT schemaname, tablename FROM pg_tables WHERE schemaname ='public'
LOOP
EXECUTE 'TRUNCATE TABLE ' || quote_ident(r.schemaname) || '.' || quote_ident(r.tablename) || ' CASCADE';
END LOOP;
RETURN 1;
END;
$$;


ALTER FUNCTION public.truncate_all_tables() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 60445)
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
-- TOC entry 171 (class 1259 OID 60448)
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
-- Dependencies: 171
-- Name: deva_angemeldeter_benutzer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_angemeldeter_benutzer_id_seq OWNED BY deva_angemeldeter_benutzer.id;


--
-- TOC entry 172 (class 1259 OID 60450)
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
-- TOC entry 173 (class 1259 OID 60456)
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
-- TOC entry 174 (class 1259 OID 60460)
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
-- Dependencies: 174
-- Name: deva_artikel_bestandteil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_bestandteil_id_seq OWNED BY deva_artikel_bestandteil.id;


--
-- TOC entry 175 (class 1259 OID 60462)
-- Name: deva_artikel_dokumente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_dokumente (
    artikel_id bigint NOT NULL,
    dokument_id bigint NOT NULL
);


ALTER TABLE public.deva_artikel_dokumente OWNER TO meyle;

--
-- TOC entry 176 (class 1259 OID 60465)
-- Name: deva_artikel_fahrzeuge; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_fahrzeuge (
    artikel_id bigint NOT NULL,
    fahrzeug_id bigint NOT NULL,
    sort_order integer NOT NULL
);


ALTER TABLE public.deva_artikel_fahrzeuge OWNER TO meyle;

--
-- TOC entry 177 (class 1259 OID 60468)
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
-- Dependencies: 177
-- Name: deva_artikel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_id_seq OWNED BY deva_artikel.id;


--
-- TOC entry 178 (class 1259 OID 60470)
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
-- TOC entry 179 (class 1259 OID 60476)
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
-- Dependencies: 179
-- Name: deva_artikel_kommentar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_kommentar_id_seq OWNED BY deva_artikel_kommentar.id;


--
-- TOC entry 180 (class 1259 OID 60478)
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
-- TOC entry 181 (class 1259 OID 60482)
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
-- Dependencies: 181
-- Name: deva_artikel_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_komponente_id_seq OWNED BY deva_artikel_komponente.id;


--
-- TOC entry 182 (class 1259 OID 60484)
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
-- TOC entry 183 (class 1259 OID 60487)
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
-- Dependencies: 183
-- Name: deva_artikel_logbuch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_logbuch_id_seq OWNED BY deva_artikel_logbuch.id;

--
-- TOC entry 184 (class 1259 OID 60489)
-- Name: deva_artikel_verantwortliche; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_verantwortliche (
    artikel_id bigint NOT NULL,
    verantwortlicher_id bigint NOT NULL
);


ALTER TABLE public.deva_artikel_verantwortliche OWNER TO meyle;

--
-- TOC entry 185 (class 1259 OID 60492)
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
-- TOC entry 186 (class 1259 OID 60496)
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
-- Dependencies: 186
-- Name: deva_artikel_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_artikel_zubehoer_id_seq OWNED BY deva_artikel_zubehoer.id;


--
-- TOC entry 187 (class 1259 OID 60498)
-- Name: deva_artikel_zusatzinformationen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_artikel_zusatzinformationen (
    artikel_id bigint NOT NULL,
    zusatzinfo_id bigint NOT NULL
);


ALTER TABLE public.deva_artikel_zusatzinformationen OWNER TO meyle;

--
-- TOC entry 188 (class 1259 OID 60501)
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
-- TOC entry 189 (class 1259 OID 60507)
-- Name: deva_benutzer_firma; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_firma (
    benutzer bigint NOT NULL,
    zugeordnete_firma bigint NOT NULL
);


ALTER TABLE public.deva_benutzer_firma OWNER TO meyle;

--
-- TOC entry 190 (class 1259 OID 60510)
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
-- Dependencies: 190
-- Name: deva_benutzer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_benutzer_id_seq OWNED BY deva_benutzer.id;


--
-- TOC entry 191 (class 1259 OID 60512)
-- Name: deva_benutzer_liste; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_liste (
    id bigint NOT NULL,
    version bigint,
    singleton character varying(255) NOT NULL
);


ALTER TABLE public.deva_benutzer_liste OWNER TO meyle;

--
-- TOC entry 192 (class 1259 OID 60515)
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
-- Dependencies: 192
-- Name: deva_benutzer_liste_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_benutzer_liste_id_seq OWNED BY deva_benutzer_liste.id;


--
-- TOC entry 193 (class 1259 OID 60517)
-- Name: deva_benutzer_produktgruppe; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_produktgruppe (
    benutzer bigint NOT NULL,
    produktgruppe bigint NOT NULL
);


ALTER TABLE public.deva_benutzer_produktgruppe OWNER TO meyle;

--
-- TOC entry 194 (class 1259 OID 60520)
-- Name: deva_benutzer_rollen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_benutzer_rollen (
    benutzer bigint NOT NULL,
    rolle bigint NOT NULL
);


ALTER TABLE public.deva_benutzer_rollen OWNER TO meyle;

--
-- TOC entry 195 (class 1259 OID 60523)
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
-- TOC entry 196 (class 1259 OID 60526)
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
-- Dependencies: 196
-- Name: deva_bezeichnung_artikel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_artikel_id_seq OWNED BY deva_bezeichnung_artikel.id;


--
-- TOC entry 197 (class 1259 OID 60528)
-- Name: deva_bezeichnung_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_komponente (
    id bigint NOT NULL,
    version bigint,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_bezeichnung_komponente OWNER TO meyle;

--
-- TOC entry 198 (class 1259 OID 60531)
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
-- Dependencies: 198
-- Name: deva_bezeichnung_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_komponente_id_seq OWNED BY deva_bezeichnung_komponente.id;


--
-- TOC entry 199 (class 1259 OID 60533)
-- Name: deva_bezeichnung_produktgruppe; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_produktgruppe (
    id bigint NOT NULL,
    version bigint
);


ALTER TABLE public.deva_bezeichnung_produktgruppe OWNER TO meyle;

--
-- TOC entry 200 (class 1259 OID 60536)
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
-- Dependencies: 200
-- Name: deva_bezeichnung_produktgruppe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_produktgruppe_id_seq OWNED BY deva_bezeichnung_produktgruppe.id;


--
-- TOC entry 201 (class 1259 OID 60538)
-- Name: deva_bezeichnung_zubehoer; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_zubehoer (
    id bigint NOT NULL,
    version bigint,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_bezeichnung_zubehoer OWNER TO meyle;

--
-- TOC entry 202 (class 1259 OID 60541)
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
-- Dependencies: 202
-- Name: deva_bezeichnung_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_zubehoer_id_seq OWNED BY deva_bezeichnung_zubehoer.id;


--
-- TOC entry 203 (class 1259 OID 60543)
-- Name: deva_bezeichnung_zusatzinformation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bezeichnung_zusatzinformation (
    id bigint NOT NULL,
    version bigint,
    typ character varying(255) NOT NULL
);


ALTER TABLE public.deva_bezeichnung_zusatzinformation OWNER TO meyle;

--
-- TOC entry 204 (class 1259 OID 60546)
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
-- Dependencies: 204
-- Name: deva_bezeichnung_zusatzinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichnung_zusatzinformation_id_seq OWNED BY deva_bezeichnung_zusatzinformation.id;


--
-- TOC entry 205 (class 1259 OID 60548)
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
-- TOC entry 206 (class 1259 OID 60554)
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
-- Dependencies: 206
-- Name: deva_bezeichung_prozess_schritt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bezeichung_prozess_schritt_id_seq OWNED BY deva_bezeichung_prozess_schritt.id;


--
-- TOC entry 207 (class 1259 OID 60556)
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
-- TOC entry 208 (class 1259 OID 60563)
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
-- Dependencies: 208
-- Name: deva_bonuszeit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bonuszeit_id_seq OWNED BY deva_bonuszeit.id;


--
-- TOC entry 209 (class 1259 OID 60565)
-- Name: deva_bpmn_definition_task_handler_names; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_bpmn_definition_task_handler_names (
    bpmn_definition_id bigint NOT NULL,
    taskhandlernames character varying(255)
);


ALTER TABLE public.deva_bpmn_definition_task_handler_names OWNER TO meyle;

--
-- TOC entry 210 (class 1259 OID 60568)
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
-- TOC entry 211 (class 1259 OID 60571)
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
-- Dependencies: 211
-- Name: deva_bpmndefinition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_bpmndefinition_id_seq OWNED BY deva_bpmndefinition.id;


--
-- TOC entry 212 (class 1259 OID 60573)
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
-- TOC entry 213 (class 1259 OID 60578)
-- Name: deva_dokument_binaerdaten; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_dokument_binaerdaten (
    id bigint NOT NULL,
    version bigint,
    data oid NOT NULL
);


ALTER TABLE public.deva_dokument_binaerdaten OWNER TO meyle;

--
-- TOC entry 214 (class 1259 OID 60581)
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
-- Dependencies: 214
-- Name: deva_dokument_binaerdaten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_dokument_binaerdaten_id_seq OWNED BY deva_dokument_binaerdaten.id;


--
-- TOC entry 215 (class 1259 OID 60583)
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
-- Dependencies: 215
-- Name: deva_dokument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_dokument_id_seq OWNED BY deva_dokument.id;


--
-- TOC entry 216 (class 1259 OID 60585)
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
-- TOC entry 217 (class 1259 OID 60590)
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
-- Dependencies: 217
-- Name: deva_faelligkeiten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_faelligkeiten_id_seq OWNED BY deva_faelligkeiten.id;


--
-- TOC entry 218 (class 1259 OID 60592)
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
-- TOC entry 219 (class 1259 OID 60595)
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
-- Dependencies: 219
-- Name: deva_fahrzeug_bezeichnung_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_fahrzeug_bezeichnung_id_seq OWNED BY deva_fahrzeug_bezeichnung.id;


--
-- TOC entry 220 (class 1259 OID 60597)
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
-- TOC entry 221 (class 1259 OID 60600)
-- Name: deva_firma_ansprechpartner; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_ansprechpartner (
    firma_id bigint NOT NULL,
    benutzer_id bigint NOT NULL
);


ALTER TABLE public.deva_firma_ansprechpartner OWNER TO meyle;

--
-- TOC entry 222 (class 1259 OID 60603)
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
-- Dependencies: 222
-- Name: deva_firma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_firma_id_seq OWNED BY deva_firma.id;


--
-- TOC entry 223 (class 1259 OID 60605)
-- Name: deva_firma_lieferanten; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_lieferanten (
    lieferant_id bigint NOT NULL,
    lieferant_fuer_firma_id bigint NOT NULL
);


ALTER TABLE public.deva_firma_lieferanten OWNER TO meyle;

--
-- TOC entry 224 (class 1259 OID 60608)
-- Name: deva_firma_sollzeiten_artikel; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_sollzeiten_artikel (
    firma_id bigint NOT NULL,
    sollzeiten_artikel_id bigint NOT NULL
);


ALTER TABLE public.deva_firma_sollzeiten_artikel OWNER TO meyle;

--
-- TOC entry 225 (class 1259 OID 60611)
-- Name: deva_firma_sollzeiten_komponente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_firma_sollzeiten_komponente (
    firma_id bigint NOT NULL,
    sollzeiten_komponente_id bigint NOT NULL
);


ALTER TABLE public.deva_firma_sollzeiten_komponente OWNER TO meyle;

--
-- TOC entry 226 (class 1259 OID 60614)
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
    lieferant bigint,
    ampel_status character varying(255) DEFAULT 'GRAU'::character varying NOT NULL
);


ALTER TABLE public.deva_komponente OWNER TO meyle;

--
-- TOC entry 307 (class 1259 OID 65438)
-- Name: deva_komponente_bestandteil; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_bestandteil (
    id bigint NOT NULL,
    version bigint,
    anzahl bigint NOT NULL,
    hinweis character varying(100) NOT NULL,
    komponente bigint NOT NULL,
    komponente_bestandteil bigint NOT NULL
);


ALTER TABLE public.deva_komponente_bestandteil OWNER TO meyle;

--
-- TOC entry 306 (class 1259 OID 65436)
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
-- Dependencies: 306
-- Name: deva_komponente_bestandteil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_komponente_bestandteil_id_seq OWNED BY deva_komponente_bestandteil.id;


--
-- TOC entry 227 (class 1259 OID 60620)
-- Name: deva_komponente_dokumente; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_dokumente (
    komponente_id bigint NOT NULL,
    dokument_id bigint NOT NULL
);


ALTER TABLE public.deva_komponente_dokumente OWNER TO meyle;

--
-- TOC entry 228 (class 1259 OID 60623)
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
-- Dependencies: 228
-- Name: deva_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_komponente_id_seq OWNED BY deva_komponente.id;


--
-- TOC entry 229 (class 1259 OID 60625)
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
-- TOC entry 230 (class 1259 OID 60631)
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
-- Dependencies: 230
-- Name: deva_komponente_kommentar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_komponente_kommentar_id_seq OWNED BY deva_komponente_kommentar.id;


--
-- TOC entry 231 (class 1259 OID 60633)
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
-- TOC entry 232 (class 1259 OID 60636)
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
-- Dependencies: 232
-- Name: deva_komponente_logbuch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_komponente_logbuch_id_seq OWNED BY deva_komponente_logbuch.id;

--
-- TOC entry 233 (class 1259 OID 60638)
-- Name: deva_komponente_verantwortliche; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_verantwortliche (
    komponente_id bigint NOT NULL,
    verantwortlicher_id bigint NOT NULL
);


ALTER TABLE public.deva_komponente_verantwortliche OWNER TO meyle;

--
-- TOC entry 234 (class 1259 OID 60641)
-- Name: deva_komponente_zusatzinformationen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_komponente_zusatzinformationen (
    komponente_id bigint NOT NULL,
    zusatzinfo_id bigint NOT NULL
);


ALTER TABLE public.deva_komponente_zusatzinformationen OWNER TO meyle;

--
-- TOC entry 235 (class 1259 OID 60644)
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
-- TOC entry 236 (class 1259 OID 60647)
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
-- Dependencies: 236
-- Name: deva_produktgruppe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_produktgruppe_id_seq OWNED BY deva_produktgruppe.id;


--
-- TOC entry 237 (class 1259 OID 60649)
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
-- TOC entry 238 (class 1259 OID 60652)
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
-- Dependencies: 238
-- Name: deva_prozess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_prozess_id_seq OWNED BY deva_prozess.id;


--
-- TOC entry 239 (class 1259 OID 60654)
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
-- TOC entry 240 (class 1259 OID 60657)
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
-- Dependencies: 240
-- Name: deva_prozess_schritt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_prozess_schritt_id_seq OWNED BY deva_prozess_schritt.id;


--
-- TOC entry 241 (class 1259 OID 60659)
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
-- TOC entry 242 (class 1259 OID 60662)
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
-- Dependencies: 242
-- Name: deva_prozessdefinition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_prozessdefinition_id_seq OWNED BY deva_prozessdefinition.id;


--
-- TOC entry 243 (class 1259 OID 60664)
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
-- TOC entry 244 (class 1259 OID 60667)
-- Name: deva_rolle_aktions_berechtigungen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_aktions_berechtigungen (
    berechtigung_id bigint NOT NULL,
    aktion_berechtigungen character varying(255)
);


ALTER TABLE public.deva_rolle_aktions_berechtigungen OWNER TO meyle;

--
-- TOC entry 245 (class 1259 OID 60670)
-- Name: deva_rolle_ampelstatus; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_ampelstatus (
    ampelstatus_id bigint NOT NULL,
    ampelstatus character varying(255)
);


ALTER TABLE public.deva_rolle_ampelstatus OWNER TO meyle;

--
-- TOC entry 246 (class 1259 OID 60673)
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
-- Dependencies: 246
-- Name: deva_rolle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_rolle_id_seq OWNED BY deva_rolle.id;


--
-- TOC entry 247 (class 1259 OID 60675)
-- Name: deva_rolle_prozess_schritt; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_prozess_schritt (
    rolle bigint NOT NULL,
    prozess_schritt_definition bigint NOT NULL
);


ALTER TABLE public.deva_rolle_prozess_schritt OWNER TO meyle;

--
-- TOC entry 248 (class 1259 OID 60678)
-- Name: deva_rolle_sicht_berechtigungen; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_rolle_sicht_berechtigungen (
    berechtigung_id bigint NOT NULL,
    sicht_berechtigungen character varying(255)
);


ALTER TABLE public.deva_rolle_sicht_berechtigungen OWNER TO meyle;

--
-- TOC entry 249 (class 1259 OID 60681)
-- Name: deva_sollzeit_wdh_klassifikation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_sollzeit_wdh_klassifikation (
    sollzeiten_id bigint NOT NULL,
    sollzeit bigint,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_sollzeit_wdh_klassifikation OWNER TO meyle;

--
-- TOC entry 250 (class 1259 OID 60684)
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
-- TOC entry 251 (class 1259 OID 60689)
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
-- Dependencies: 251
-- Name: deva_sollzeiten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_sollzeiten_id_seq OWNED BY deva_sollzeiten.id;


--
-- TOC entry 252 (class 1259 OID 60691)
-- Name: deva_sollzeiten_klassifikation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE deva_sollzeiten_klassifikation (
    sollzeiten_id bigint NOT NULL,
    sollzeit bigint,
    klassifikation character varying(255) NOT NULL
);


ALTER TABLE public.deva_sollzeiten_klassifikation OWNER TO meyle;

--
-- TOC entry 253 (class 1259 OID 60694)
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
-- TOC entry 254 (class 1259 OID 60697)
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
-- Dependencies: 254
-- Name: deva_uebersetzung_artikel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_artikel_id_seq OWNED BY deva_uebersetzung_artikel.id;


--
-- TOC entry 255 (class 1259 OID 60699)
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
-- TOC entry 256 (class 1259 OID 60702)
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
-- Dependencies: 256
-- Name: deva_uebersetzung_komponente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_komponente_id_seq OWNED BY deva_uebersetzung_komponente.id;


--
-- TOC entry 257 (class 1259 OID 60704)
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
-- TOC entry 258 (class 1259 OID 60707)
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
-- Dependencies: 258
-- Name: deva_uebersetzung_produktgruppe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_produktgruppe_id_seq OWNED BY deva_uebersetzung_produktgruppe.id;


--
-- TOC entry 259 (class 1259 OID 60709)
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
-- TOC entry 260 (class 1259 OID 60712)
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
-- Dependencies: 260
-- Name: deva_uebersetzung_prozess_schritt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_prozess_schritt_id_seq OWNED BY deva_uebersetzung_prozess_schritt.id;


--
-- TOC entry 261 (class 1259 OID 60714)
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
-- TOC entry 262 (class 1259 OID 60717)
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
-- Dependencies: 262
-- Name: deva_uebersetzung_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_zubehoer_id_seq OWNED BY deva_uebersetzung_zubehoer.id;


--
-- TOC entry 263 (class 1259 OID 60719)
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
-- TOC entry 264 (class 1259 OID 60722)
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
-- Dependencies: 264
-- Name: deva_uebersetzung_zusatzinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_uebersetzung_zusatzinformation_id_seq OWNED BY deva_uebersetzung_zusatzinformation.id;


--
-- TOC entry 265 (class 1259 OID 60724)
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
-- TOC entry 266 (class 1259 OID 60730)
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
-- Dependencies: 266
-- Name: deva_zubehoer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_zubehoer_id_seq OWNED BY deva_zubehoer.id;


--
-- TOC entry 267 (class 1259 OID 60732)
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
-- TOC entry 268 (class 1259 OID 60738)
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
-- Dependencies: 268
-- Name: deva_zusatzinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meyle
--

ALTER SEQUENCE deva_zusatzinformation_id_seq OWNED BY deva_zusatzinformation.id;


--
-- TOC entry 269 (class 1259 OID 60740)
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
-- TOC entry 270 (class 1259 OID 60743)
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
-- TOC entry 271 (class 1259 OID 60746)
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
-- TOC entry 272 (class 1259 OID 60748)
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
-- TOC entry 273 (class 1259 OID 60754)
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
-- TOC entry 274 (class 1259 OID 60760)
-- Name: jbpm_content; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_content (
    id bigint NOT NULL,
    content oid
);


ALTER TABLE public.jbpm_content OWNER TO meyle;

--
-- TOC entry 275 (class 1259 OID 60763)
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
-- TOC entry 276 (class 1259 OID 60766)
-- Name: jbpm_delegation_delegates; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_delegation_delegates (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_delegation_delegates OWNER TO meyle;

--
-- TOC entry 277 (class 1259 OID 60769)
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
-- TOC entry 278 (class 1259 OID 60775)
-- Name: jbpm_email_notification; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_email_notification (
    id bigint NOT NULL,
    priority integer NOT NULL,
    escalation_notifications_id bigint
);


ALTER TABLE public.jbpm_email_notification OWNER TO meyle;

--
-- TOC entry 279 (class 1259 OID 60778)
-- Name: jbpm_email_notification_jbpm_email_header; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_email_notification_jbpm_email_header (
    jbpm_email_notification_id bigint NOT NULL,
    emailheaders_id bigint NOT NULL,
    emailheaders_key character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_email_notification_jbpm_email_header OWNER TO meyle;

--
-- TOC entry 280 (class 1259 OID 60781)
-- Name: jbpm_escalation; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_escalation (
    id bigint NOT NULL,
    name character varying(255),
    deadline_escalation_id bigint
);


ALTER TABLE public.jbpm_escalation OWNER TO meyle;

--
-- TOC entry 281 (class 1259 OID 60784)
-- Name: jbpm_group; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_group (
    id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_group OWNER TO meyle;

--
-- TOC entry 282 (class 1259 OID 60787)
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
-- TOC entry 283 (class 1259 OID 60793)
-- Name: jbpm_notification; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_notification (
    id bigint NOT NULL,
    priority integer NOT NULL,
    escalation_notifications_id bigint
);


ALTER TABLE public.jbpm_notification OWNER TO meyle;

--
-- TOC entry 284 (class 1259 OID 60796)
-- Name: jbpm_notification_bas; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_notification_bas (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_notification_bas OWNER TO meyle;

--
-- TOC entry 285 (class 1259 OID 60799)
-- Name: jbpm_notification_recipients; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_notification_recipients (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_notification_recipients OWNER TO meyle;

--
-- TOC entry 286 (class 1259 OID 60802)
-- Name: jbpm_peopleassignments_bas; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_bas (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_bas OWNER TO meyle;

--
-- TOC entry 287 (class 1259 OID 60805)
-- Name: jbpm_peopleassignments_exclowners; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_exclowners (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_exclowners OWNER TO meyle;

--
-- TOC entry 288 (class 1259 OID 60808)
-- Name: jbpm_peopleassignments_potowners; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_potowners (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_potowners OWNER TO meyle;

--
-- TOC entry 289 (class 1259 OID 60811)
-- Name: jbpm_peopleassignments_recipients; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_recipients (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_recipients OWNER TO meyle;

--
-- TOC entry 290 (class 1259 OID 60814)
-- Name: jbpm_peopleassignments_stakeholders; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_peopleassignments_stakeholders (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_peopleassignments_stakeholders OWNER TO meyle;

--
-- TOC entry 291 (class 1259 OID 60817)
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
-- TOC entry 292 (class 1259 OID 60820)
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
-- TOC entry 293 (class 1259 OID 60823)
-- Name: jbpm_processinstance_info_eventtypes; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_processinstance_info_eventtypes (
    jbpm_processinstance_info_id bigint NOT NULL,
    eventtypes character varying(255)
);


ALTER TABLE public.jbpm_processinstance_info_eventtypes OWNER TO meyle;

--
-- TOC entry 294 (class 1259 OID 60826)
-- Name: jbpm_reassignment; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_reassignment (
    id bigint NOT NULL,
    escalation_reassignments_id bigint
);


ALTER TABLE public.jbpm_reassignment OWNER TO meyle;

--
-- TOC entry 295 (class 1259 OID 60829)
-- Name: jbpm_reassignment_potentialowners; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_reassignment_potentialowners (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_reassignment_potentialowners OWNER TO meyle;

--
-- TOC entry 296 (class 1259 OID 60832)
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
-- TOC entry 297 (class 1259 OID 60835)
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
-- TOC entry 298 (class 1259 OID 60841)
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
-- TOC entry 299 (class 1259 OID 60847)
-- Name: jbpm_user; Type: TABLE; Schema: public; Owner: meyle; Tablespace: 
--

CREATE TABLE jbpm_user (
    id character varying(255) NOT NULL
);


ALTER TABLE public.jbpm_user OWNER TO meyle;

--
-- TOC entry 300 (class 1259 OID 60850)
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
-- TOC entry 301 (class 1259 OID 60852)
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
-- TOC entry 2663 (class 2604 OID 60854)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_angemeldeter_benutzer ALTER COLUMN id SET DEFAULT nextval('deva_angemeldeter_benutzer_id_seq'::regclass);


--
-- TOC entry 2664 (class 2604 OID 60855)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel ALTER COLUMN id SET DEFAULT nextval('deva_artikel_id_seq'::regclass);


--
-- TOC entry 2665 (class 2604 OID 60856)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_bestandteil ALTER COLUMN id SET DEFAULT nextval('deva_artikel_bestandteil_id_seq'::regclass);


--
-- TOC entry 2667 (class 2604 OID 60857)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_kommentar ALTER COLUMN id SET DEFAULT nextval('deva_artikel_kommentar_id_seq'::regclass);


--
-- TOC entry 2668 (class 2604 OID 60858)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_komponente ALTER COLUMN id SET DEFAULT nextval('deva_artikel_komponente_id_seq'::regclass);


--
-- TOC entry 2670 (class 2604 OID 60859)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_logbuch ALTER COLUMN id SET DEFAULT nextval('deva_artikel_logbuch_id_seq'::regclass);


--
-- TOC entry 2671 (class 2604 OID 60860)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_artikel_zubehoer_id_seq'::regclass);


--
-- TOC entry 2673 (class 2604 OID 60861)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer ALTER COLUMN id SET DEFAULT nextval('deva_benutzer_id_seq'::regclass);


--
-- TOC entry 2674 (class 2604 OID 60862)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_liste ALTER COLUMN id SET DEFAULT nextval('deva_benutzer_liste_id_seq'::regclass);


--
-- TOC entry 2675 (class 2604 OID 60863)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_artikel ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_artikel_id_seq'::regclass);


--
-- TOC entry 2676 (class 2604 OID 60864)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_komponente ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_komponente_id_seq'::regclass);


--
-- TOC entry 2677 (class 2604 OID 60865)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_produktgruppe ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_produktgruppe_id_seq'::regclass);


--
-- TOC entry 2678 (class 2604 OID 60866)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_zubehoer_id_seq'::regclass);


--
-- TOC entry 2679 (class 2604 OID 60867)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_zusatzinformation ALTER COLUMN id SET DEFAULT nextval('deva_bezeichnung_zusatzinformation_id_seq'::regclass);


--
-- TOC entry 2680 (class 2604 OID 60868)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichung_prozess_schritt ALTER COLUMN id SET DEFAULT nextval('deva_bezeichung_prozess_schritt_id_seq'::regclass);


--
-- TOC entry 2681 (class 2604 OID 60869)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bonuszeit ALTER COLUMN id SET DEFAULT nextval('deva_bonuszeit_id_seq'::regclass);


--
-- TOC entry 2683 (class 2604 OID 60870)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bpmndefinition ALTER COLUMN id SET DEFAULT nextval('deva_bpmndefinition_id_seq'::regclass);


--
-- TOC entry 2684 (class 2604 OID 60871)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument ALTER COLUMN id SET DEFAULT nextval('deva_dokument_id_seq'::regclass);


--
-- TOC entry 2687 (class 2604 OID 60872)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument_binaerdaten ALTER COLUMN id SET DEFAULT nextval('deva_dokument_binaerdaten_id_seq'::regclass);


--
-- TOC entry 2688 (class 2604 OID 60873)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_faelligkeiten ALTER COLUMN id SET DEFAULT nextval('deva_faelligkeiten_id_seq'::regclass);


--
-- TOC entry 2691 (class 2604 OID 60874)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung ALTER COLUMN id SET DEFAULT nextval('deva_fahrzeug_bezeichnung_id_seq'::regclass);


--
-- TOC entry 2692 (class 2604 OID 60875)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma ALTER COLUMN id SET DEFAULT nextval('deva_firma_id_seq'::regclass);


--
-- TOC entry 2693 (class 2604 OID 60876)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente ALTER COLUMN id SET DEFAULT nextval('deva_komponente_id_seq'::regclass);


--
-- TOC entry 2714 (class 2604 OID 65441)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_bestandteil ALTER COLUMN id SET DEFAULT nextval('deva_komponente_bestandteil_id_seq'::regclass);


--
-- TOC entry 2695 (class 2604 OID 60877)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_kommentar ALTER COLUMN id SET DEFAULT nextval('deva_komponente_kommentar_id_seq'::regclass);


--
-- TOC entry 2696 (class 2604 OID 60878)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_logbuch ALTER COLUMN id SET DEFAULT nextval('deva_komponente_logbuch_id_seq'::regclass);


--
-- TOC entry 2697 (class 2604 OID 60879)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_produktgruppe ALTER COLUMN id SET DEFAULT nextval('deva_produktgruppe_id_seq'::regclass);


--
-- TOC entry 2698 (class 2604 OID 60880)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess ALTER COLUMN id SET DEFAULT nextval('deva_prozess_id_seq'::regclass);


--
-- TOC entry 2699 (class 2604 OID 60881)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt ALTER COLUMN id SET DEFAULT nextval('deva_prozess_schritt_id_seq'::regclass);


--
-- TOC entry 2700 (class 2604 OID 60882)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozessdefinition ALTER COLUMN id SET DEFAULT nextval('deva_prozessdefinition_id_seq'::regclass);


--
-- TOC entry 2701 (class 2604 OID 60883)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle ALTER COLUMN id SET DEFAULT nextval('deva_rolle_id_seq'::regclass);


--
-- TOC entry 2702 (class 2604 OID 60884)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeiten ALTER COLUMN id SET DEFAULT nextval('deva_sollzeiten_id_seq'::regclass);


--
-- TOC entry 2705 (class 2604 OID 60885)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_artikel ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_artikel_id_seq'::regclass);


--
-- TOC entry 2706 (class 2604 OID 60886)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_komponente ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_komponente_id_seq'::regclass);


--
-- TOC entry 2707 (class 2604 OID 60887)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_produktgruppe ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_produktgruppe_id_seq'::regclass);


--
-- TOC entry 2708 (class 2604 OID 60888)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_prozess_schritt ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_prozess_schritt_id_seq'::regclass);


--
-- TOC entry 2709 (class 2604 OID 60889)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_zubehoer_id_seq'::regclass);


--
-- TOC entry 2710 (class 2604 OID 60890)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zusatzinformation ALTER COLUMN id SET DEFAULT nextval('deva_uebersetzung_zusatzinformation_id_seq'::regclass);


--
-- TOC entry 2711 (class 2604 OID 60891)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zubehoer ALTER COLUMN id SET DEFAULT nextval('deva_zubehoer_id_seq'::regclass);


--
-- TOC entry 2712 (class 2604 OID 60892)
-- Name: id; Type: DEFAULT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zusatzinformation ALTER COLUMN id SET DEFAULT nextval('deva_zusatzinformation_id_seq'::regclass);


--
-- TOC entry 2716 (class 2606 OID 60894)
-- Name: deva_angemeldeter_benutzer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_angemeldeter_benutzer
    ADD CONSTRAINT deva_angemeldeter_benutzer_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 60896)
-- Name: deva_artikel_bestandteil_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_bestandteil
    ADD CONSTRAINT deva_artikel_bestandteil_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 60898)
-- Name: deva_artikel_dokumente_dokument_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_dokumente
    ADD CONSTRAINT deva_artikel_dokumente_dokument_id_key UNIQUE (dokument_id);


--
-- TOC entry 2732 (class 2606 OID 60900)
-- Name: deva_artikel_fahrzeuge_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_fahrzeuge
    ADD CONSTRAINT deva_artikel_fahrzeuge_pkey PRIMARY KEY (artikel_id, sort_order);


--
-- TOC entry 2734 (class 2606 OID 60902)
-- Name: deva_artikel_kommentar_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_kommentar
    ADD CONSTRAINT deva_artikel_kommentar_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 60904)
-- Name: deva_artikel_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_komponente
    ADD CONSTRAINT deva_artikel_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 60906)
-- Name: deva_artikel_logbuch_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_logbuch
    ADD CONSTRAINT deva_artikel_logbuch_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 60908)
-- Name: deva_artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT deva_artikel_pkey PRIMARY KEY (id);



--
-- TOC entry 2740 (class 2606 OID 60910)
-- Name: deva_artikel_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_artikel_zubehoer
    ADD CONSTRAINT deva_artikel_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 60912)
-- Name: deva_benutzer_firma_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_firma
    ADD CONSTRAINT deva_benutzer_firma_pkey PRIMARY KEY (benutzer, zugeordnete_firma);


--
-- TOC entry 2751 (class 2606 OID 60914)
-- Name: deva_benutzer_liste_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_liste
    ADD CONSTRAINT deva_benutzer_liste_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 60916)
-- Name: deva_benutzer_liste_singleton_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_liste
    ADD CONSTRAINT deva_benutzer_liste_singleton_key UNIQUE (singleton);


--
-- TOC entry 2742 (class 2606 OID 60918)
-- Name: deva_benutzer_name_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT deva_benutzer_name_key UNIQUE (name);


--
-- TOC entry 2744 (class 2606 OID 60920)
-- Name: deva_benutzer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT deva_benutzer_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 60922)
-- Name: deva_benutzer_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_produktgruppe
    ADD CONSTRAINT deva_benutzer_produktgruppe_pkey PRIMARY KEY (benutzer, produktgruppe);


--
-- TOC entry 2757 (class 2606 OID 60924)
-- Name: deva_benutzer_rollen_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer_rollen
    ADD CONSTRAINT deva_benutzer_rollen_pkey PRIMARY KEY (benutzer, rolle);


--
-- TOC entry 2746 (class 2606 OID 60926)
-- Name: deva_benutzer_username_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT deva_benutzer_username_key UNIQUE (username);


--
-- TOC entry 2759 (class 2606 OID 60928)
-- Name: deva_bezeichnung_artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_artikel
    ADD CONSTRAINT deva_bezeichnung_artikel_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 60930)
-- Name: deva_bezeichnung_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_komponente
    ADD CONSTRAINT deva_bezeichnung_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 60932)
-- Name: deva_bezeichnung_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_produktgruppe
    ADD CONSTRAINT deva_bezeichnung_produktgruppe_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 60934)
-- Name: deva_bezeichnung_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_zubehoer
    ADD CONSTRAINT deva_bezeichnung_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 60936)
-- Name: deva_bezeichnung_zusatzinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichnung_zusatzinformation
    ADD CONSTRAINT deva_bezeichnung_zusatzinformation_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 60938)
-- Name: deva_bezeichung_prozess_schritt_identifier_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichung_prozess_schritt
    ADD CONSTRAINT deva_bezeichung_prozess_schritt_identifier_key UNIQUE (identifier);


--
-- TOC entry 2772 (class 2606 OID 60940)
-- Name: deva_bezeichung_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bezeichung_prozess_schritt
    ADD CONSTRAINT deva_bezeichung_prozess_schritt_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 60942)
-- Name: deva_bonuszeit_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bonuszeit
    ADD CONSTRAINT deva_bonuszeit_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 60944)
-- Name: deva_bpmndefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_bpmndefinition
    ADD CONSTRAINT deva_bpmndefinition_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 60946)
-- Name: deva_dokument_binaerdaten_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_dokument_binaerdaten
    ADD CONSTRAINT deva_dokument_binaerdaten_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 60948)
-- Name: deva_dokument_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_dokument
    ADD CONSTRAINT deva_dokument_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 60950)
-- Name: deva_faelligkeiten_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_faelligkeiten
    ADD CONSTRAINT deva_faelligkeiten_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 60952)
-- Name: deva_faelligkeiten_singleton_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_faelligkeiten
    ADD CONSTRAINT deva_faelligkeiten_singleton_key UNIQUE (singleton);


--
-- TOC entry 2787 (class 2606 OID 60954)
-- Name: deva_fahrzeug_bezeichnung_bezeichnung_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung
    ADD CONSTRAINT deva_fahrzeug_bezeichnung_bezeichnung_key UNIQUE (bezeichnung);


--
-- TOC entry 2789 (class 2606 OID 60956)
-- Name: deva_fahrzeug_bezeichnung_fahrzeug_typ_hersteller_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung
    ADD CONSTRAINT deva_fahrzeug_bezeichnung_fahrzeug_typ_hersteller_key UNIQUE (fahrzeug_typ, hersteller);


--
-- TOC entry 2791 (class 2606 OID 60958)
-- Name: deva_fahrzeug_bezeichnung_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_fahrzeug_bezeichnung
    ADD CONSTRAINT deva_fahrzeug_bezeichnung_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 60960)
-- Name: deva_firma_ansprechpartner_benutzer_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma_ansprechpartner
    ADD CONSTRAINT deva_firma_ansprechpartner_benutzer_id_key UNIQUE (benutzer_id);


--
-- TOC entry 2793 (class 2606 OID 60962)
-- Name: deva_firma_name_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma
    ADD CONSTRAINT deva_firma_name_key UNIQUE (name);


--
-- TOC entry 2795 (class 2606 OID 60964)
-- Name: deva_firma_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma
    ADD CONSTRAINT deva_firma_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 60966)
-- Name: deva_firma_sollzeiten_artikel_sollzeiten_artikel_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma_sollzeiten_artikel
    ADD CONSTRAINT deva_firma_sollzeiten_artikel_sollzeiten_artikel_id_key UNIQUE (sollzeiten_artikel_id);


--
-- TOC entry 2801 (class 2606 OID 60968)
-- Name: deva_firma_sollzeiten_komponente_sollzeiten_komponente_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_firma_sollzeiten_komponente
    ADD CONSTRAINT deva_firma_sollzeiten_komponente_sollzeiten_komponente_id_key UNIQUE (sollzeiten_komponente_id);


--
-- TOC entry 2900 (class 2606 OID 65443)
-- Name: deva_komponente_bestandteil_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_bestandteil
    ADD CONSTRAINT deva_komponente_bestandteil_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 60970)
-- Name: deva_komponente_dokumente_dokument_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_dokumente
    ADD CONSTRAINT deva_komponente_dokumente_dokument_id_key UNIQUE (dokument_id);


--
-- TOC entry 2808 (class 2606 OID 60972)
-- Name: deva_komponente_kommentar_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_kommentar
    ADD CONSTRAINT deva_komponente_kommentar_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 60974)
-- Name: deva_komponente_logbuch_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_logbuch
    ADD CONSTRAINT deva_komponente_logbuch_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 60976)
-- Name: deva_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT deva_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 60978)
-- Name: deva_komponente_zusatzinformationen_zusatzinfo_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_komponente_zusatzinformationen
    ADD CONSTRAINT deva_komponente_zusatzinformationen_zusatzinfo_id_key UNIQUE (zusatzinfo_id);


--
-- TOC entry 2814 (class 2606 OID 60980)
-- Name: deva_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_produktgruppe
    ADD CONSTRAINT deva_produktgruppe_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 60982)
-- Name: deva_prozess_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT deva_prozess_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 60984)
-- Name: deva_prozess_process_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT deva_prozess_process_id_key UNIQUE (process_id);


--
-- TOC entry 2820 (class 2606 OID 60986)
-- Name: deva_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT deva_prozess_schritt_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 60988)
-- Name: deva_prozessdefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_prozessdefinition
    ADD CONSTRAINT deva_prozessdefinition_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 60990)
-- Name: deva_rolle_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_rolle
    ADD CONSTRAINT deva_rolle_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 60992)
-- Name: deva_rolle_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_rolle_prozess_schritt
    ADD CONSTRAINT deva_rolle_prozess_schritt_pkey PRIMARY KEY (rolle, prozess_schritt_definition);


--
-- TOC entry 2826 (class 2606 OID 60994)
-- Name: deva_rolle_rolle_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_rolle
    ADD CONSTRAINT deva_rolle_rolle_key UNIQUE (rolle);


--
-- TOC entry 2830 (class 2606 OID 60996)
-- Name: deva_sollzeit_wdh_klassifikation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_sollzeit_wdh_klassifikation
    ADD CONSTRAINT deva_sollzeit_wdh_klassifikation_pkey PRIMARY KEY (sollzeiten_id, klassifikation);


--
-- TOC entry 2834 (class 2606 OID 60998)
-- Name: deva_sollzeiten_klassifikation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_sollzeiten_klassifikation
    ADD CONSTRAINT deva_sollzeiten_klassifikation_pkey PRIMARY KEY (sollzeiten_id, klassifikation);


--
-- TOC entry 2832 (class 2606 OID 61000)
-- Name: deva_sollzeiten_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_sollzeiten
    ADD CONSTRAINT deva_sollzeiten_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 61002)
-- Name: deva_uebersetzung_artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_artikel
    ADD CONSTRAINT deva_uebersetzung_artikel_pkey PRIMARY KEY (id);


--
-- TOC entry 2838 (class 2606 OID 61004)
-- Name: deva_uebersetzung_komponente_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_komponente
    ADD CONSTRAINT deva_uebersetzung_komponente_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 61006)
-- Name: deva_uebersetzung_produktgruppe_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_produktgruppe
    ADD CONSTRAINT deva_uebersetzung_produktgruppe_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 61008)
-- Name: deva_uebersetzung_prozess_schritt_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_prozess_schritt
    ADD CONSTRAINT deva_uebersetzung_prozess_schritt_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 61010)
-- Name: deva_uebersetzung_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_zubehoer
    ADD CONSTRAINT deva_uebersetzung_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 61012)
-- Name: deva_uebersetzung_zusatzinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_uebersetzung_zusatzinformation
    ADD CONSTRAINT deva_uebersetzung_zusatzinformation_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 61014)
-- Name: deva_zubehoer_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_zubehoer
    ADD CONSTRAINT deva_zubehoer_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 61016)
-- Name: deva_zusatzinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY deva_zusatzinformation
    ADD CONSTRAINT deva_zusatzinformation_pkey PRIMARY KEY (id);


--
-- TOC entry 2852 (class 2606 OID 61018)
-- Name: drools_sessioninfo_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY drools_sessioninfo
    ADD CONSTRAINT drools_sessioninfo_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 61020)
-- Name: drools_workiteminfo_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY drools_workiteminfo
    ADD CONSTRAINT drools_workiteminfo_pkey PRIMARY KEY (workitemid);


--
-- TOC entry 2856 (class 2606 OID 61022)
-- Name: jbpm_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_attachment
    ADD CONSTRAINT jbpm_attachment_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 61024)
-- Name: jbpm_boolean_expression_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_boolean_expression
    ADD CONSTRAINT jbpm_boolean_expression_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 61026)
-- Name: jbpm_content_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_content
    ADD CONSTRAINT jbpm_content_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 61028)
-- Name: jbpm_deadline_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_deadline
    ADD CONSTRAINT jbpm_deadline_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 61030)
-- Name: jbpm_email_header_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_header
    ADD CONSTRAINT jbpm_email_header_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 61032)
-- Name: jbpm_email_notification_jbpm_email_header_emailheaders_id_key; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT jbpm_email_notification_jbpm_email_header_emailheaders_id_key UNIQUE (emailheaders_id);


--
-- TOC entry 2870 (class 2606 OID 61034)
-- Name: jbpm_email_notification_jbpm_email_header_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT jbpm_email_notification_jbpm_email_header_pkey PRIMARY KEY (jbpm_email_notification_id, emailheaders_key);


--
-- TOC entry 2866 (class 2606 OID 61036)
-- Name: jbpm_email_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_email_notification
    ADD CONSTRAINT jbpm_email_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 2872 (class 2606 OID 61038)
-- Name: jbpm_escalation_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_escalation
    ADD CONSTRAINT jbpm_escalation_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 61040)
-- Name: jbpm_group_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_group
    ADD CONSTRAINT jbpm_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 61042)
-- Name: jbpm_i18ntext_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT jbpm_i18ntext_pkey PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 61044)
-- Name: jbpm_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_notification
    ADD CONSTRAINT jbpm_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 2880 (class 2606 OID 61046)
-- Name: jbpm_processinstance_eventinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_processinstance_eventinfo
    ADD CONSTRAINT jbpm_processinstance_eventinfo_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 61048)
-- Name: jbpm_processinstance_info_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_processinstance_info
    ADD CONSTRAINT jbpm_processinstance_info_pkey PRIMARY KEY (instanceid);


--
-- TOC entry 2884 (class 2606 OID 61050)
-- Name: jbpm_reassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_reassignment
    ADD CONSTRAINT jbpm_reassignment_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 61052)
-- Name: jbpm_subtasksstrategy_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_subtasksstrategy
    ADD CONSTRAINT jbpm_subtasksstrategy_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 61054)
-- Name: jbpm_task_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_task_comment
    ADD CONSTRAINT jbpm_task_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 2888 (class 2606 OID 61056)
-- Name: jbpm_task_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT jbpm_task_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 61058)
-- Name: jbpm_user_pkey; Type: CONSTRAINT; Schema: public; Owner: meyle; Tablespace: 
--

ALTER TABLE ONLY jbpm_user
    ADD CONSTRAINT jbpm_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 1259 OID 61059)
-- Name: ampel_status_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX ampel_status_idx ON deva_artikel USING btree (ampel_status);


--
-- TOC entry 2718 (class 1259 OID 61060)
-- Name: artikel_filter_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX artikel_filter_idx ON deva_artikel USING btree (lieferant, kunde, ampel_status, artikelbezeichnung);


--
-- TOC entry 2719 (class 1259 OID 61061)
-- Name: artikelprozess_status_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX artikelprozess_status_idx ON deva_artikel USING btree (artikelprozess_status);


--
-- TOC entry 2785 (class 1259 OID 61062)
-- Name: bezeichnung_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX bezeichnung_idx ON deva_fahrzeug_bezeichnung USING btree (bezeichnung);


--
-- TOC entry 2747 (class 1259 OID 61063)
-- Name: firma_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX firma_idx ON deva_benutzer USING btree (firma);


--
-- TOC entry 2804 (class 1259 OID 61064)
-- Name: komponente_filter_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX komponente_filter_idx ON deva_komponente USING btree (lieferant, kunde, komponentenbezeichnung);


--
-- TOC entry 2722 (class 1259 OID 61065)
-- Name: kunde_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX kunde_idx ON deva_artikel USING btree (kunde);


--
-- TOC entry 2723 (class 1259 OID 61066)
-- Name: lieferant_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX lieferant_idx ON deva_artikel USING btree (lieferant);


--
-- TOC entry 2760 (class 1259 OID 61067)
-- Name: produktgruppe_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX produktgruppe_idx ON deva_bezeichnung_artikel USING btree (produktgruppe);


--
-- TOC entry 2724 (class 1259 OID 61068)
-- Name: raw_lieferantennummer_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX raw_lieferantennummer_idx ON deva_artikel USING btree (raw_lieferantennummer);


--
-- TOC entry 2725 (class 1259 OID 61069)
-- Name: raw_meylenummer_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX raw_meylenummer_idx ON deva_artikel USING btree (raw_meylenummer);


--
-- TOC entry 2726 (class 1259 OID 61070)
-- Name: raw_oenummer_idx; Type: INDEX; Schema: public; Owner: meyle; Tablespace: 
--

CREATE INDEX raw_oenummer_idx ON deva_artikel USING btree (raw_oenummer);


--
-- TOC entry 2981 (class 2606 OID 61071)
-- Name: fk12895194c589307f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeit_wdh_klassifikation
    ADD CONSTRAINT fk12895194c589307f FOREIGN KEY (sollzeiten_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2928 (class 2606 OID 61076)
-- Name: fk129925f083e97000; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer
    ADD CONSTRAINT fk129925f083e97000 FOREIGN KEY (firma) REFERENCES deva_firma(id);


--
-- TOC entry 2920 (class 2606 OID 61081)
-- Name: fk147182967ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_logbuch
    ADD CONSTRAINT fk147182967ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2921 (class 2606 OID 61086)
-- Name: fk14718296dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_logbuch
    ADD CONSTRAINT fk14718296dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 3002 (class 2606 OID 61091)
-- Name: fk17e984153330f6d9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e984153330f6d9 FOREIGN KEY (deadline_documentation_id) REFERENCES jbpm_deadline(id);


--
-- TOC entry 3003 (class 2606 OID 61096)
-- Name: fk17e984155eebb6d9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e984155eebb6d9 FOREIGN KEY (reassignment_documentation_id) REFERENCES jbpm_reassignment(id);


--
-- TOC entry 3004 (class 2606 OID 61101)
-- Name: fk17e9841569b21ee8; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e9841569b21ee8 FOREIGN KEY (task_descriptions_id) REFERENCES jbpm_task(id);


--
-- TOC entry 3005 (class 2606 OID 61106)
-- Name: fk17e9841598b62b; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e9841598b62b FOREIGN KEY (task_names_id) REFERENCES jbpm_task(id);


--
-- TOC entry 3006 (class 2606 OID 61111)
-- Name: fk17e98415b2fa6b18; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_i18ntext
    ADD CONSTRAINT fk17e98415b2fa6b18 FOREIGN KEY (task_subjects_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2942 (class 2606 OID 61116)
-- Name: fk21484eb75cf6cf14; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_ansprechpartner
    ADD CONSTRAINT fk21484eb75cf6cf14 FOREIGN KEY (firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2943 (class 2606 OID 61121)
-- Name: fk21484eb7d52de102; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_ansprechpartner
    ADD CONSTRAINT fk21484eb7d52de102 FOREIGN KEY (benutzer_id) REFERENCES deva_benutzer(id);


--
-- TOC entry 2935 (class 2606 OID 61126)
-- Name: fk2477d5ba2525ea1e; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bezeichnung_artikel
    ADD CONSTRAINT fk2477d5ba2525ea1e FOREIGN KEY (produktgruppe) REFERENCES deva_produktgruppe(id);


--
-- TOC entry 3009 (class 2606 OID 61131)
-- Name: fk2c7efe4e36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_exclowners
    ADD CONSTRAINT fk2c7efe4e36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2931 (class 2606 OID 61136)
-- Name: fk3133f1b32525ea1e; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_produktgruppe
    ADD CONSTRAINT fk3133f1b32525ea1e FOREIGN KEY (produktgruppe) REFERENCES deva_produktgruppe(id);


--
-- TOC entry 2932 (class 2606 OID 61141)
-- Name: fk3133f1b3dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_produktgruppe
    ADD CONSTRAINT fk3133f1b3dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 3015 (class 2606 OID 61146)
-- Name: fk3178ef69e17e130f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_reassignment_potentialowners
    ADD CONSTRAINT fk3178ef69e17e130f FOREIGN KEY (task_id) REFERENCES jbpm_reassignment(id);


--
-- TOC entry 2982 (class 2606 OID 61151)
-- Name: fk31b0dbce38fe1d3c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeiten
    ADD CONSTRAINT fk31b0dbce38fe1d3c FOREIGN KEY (meilenstein_definition) REFERENCES deva_bezeichung_prozess_schritt(id);


--
-- TOC entry 3008 (class 2606 OID 61156)
-- Name: fk32b3fd6236b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_bas
    ADD CONSTRAINT fk32b3fd6236b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2978 (class 2606 OID 61161)
-- Name: fk3804709e6273aba8; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_prozess_schritt
    ADD CONSTRAINT fk3804709e6273aba8 FOREIGN KEY (rolle) REFERENCES deva_rolle(id);


--
-- TOC entry 2979 (class 2606 OID 61166)
-- Name: fk3804709e75b486b9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_prozess_schritt
    ADD CONSTRAINT fk3804709e75b486b9 FOREIGN KEY (prozess_schritt_definition) REFERENCES deva_bezeichung_prozess_schritt(id);


--

--
-- TOC entry 2958 (class 2606 OID 61171)
-- Name: fk3b7548acdc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_kommentar
    ADD CONSTRAINT fk3b7548acdc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2959 (class 2606 OID 61176)
-- Name: fk3b7548acdfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_kommentar
    ADD CONSTRAINT fk3b7548acdfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2995 (class 2606 OID 61181)
-- Name: fk414b622227abeb8a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_deadline
    ADD CONSTRAINT fk414b622227abeb8a FOREIGN KEY (deadlines_enddeadline_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2996 (class 2606 OID 61186)
-- Name: fk414b6222684baca3; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_deadline
    ADD CONSTRAINT fk414b6222684baca3 FOREIGN KEY (deadlines_startdeadline_id) REFERENCES jbpm_task(id);


--
-- TOC entry 3013 (class 2606 OID 61191)
-- Name: fk42e004eb2143f831; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_processinstance_info_eventtypes
    ADD CONSTRAINT fk42e004eb2143f831 FOREIGN KEY (jbpm_processinstance_info_id) REFERENCES jbpm_processinstance_info(instanceid);


--
-- TOC entry 2997 (class 2606 OID 61196)
-- Name: fk4e75de136b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_delegation_delegates
    ADD CONSTRAINT fk4e75de136b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2946 (class 2606 OID 61201)
-- Name: fk4f2030575cf6cf14; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_artikel
    ADD CONSTRAINT fk4f2030575cf6cf14 FOREIGN KEY (firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2947 (class 2606 OID 61206)
-- Name: fk4f20305774e70772; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_artikel
    ADD CONSTRAINT fk4f20305774e70772 FOREIGN KEY (sollzeiten_artikel_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2936 (class 2606 OID 61211)
-- Name: fk4f4940821123a3e4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bonuszeit
    ADD CONSTRAINT fk4f4940821123a3e4 FOREIGN KEY (prozess_schritt) REFERENCES deva_prozess_schritt(id);


--
-- TOC entry 2937 (class 2606 OID 61216)
-- Name: fk4f4940824c4c8e48; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bonuszeit
    ADD CONSTRAINT fk4f4940824c4c8e48 FOREIGN KEY (gewaehrt_von) REFERENCES deva_benutzer(id);


--
-- TOC entry 2977 (class 2606 OID 61221)
-- Name: fk511f24132e56239d; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_ampelstatus
    ADD CONSTRAINT fk511f24132e56239d FOREIGN KEY (ampelstatus_id) REFERENCES deva_rolle(id);


--
-- TOC entry 2984 (class 2606 OID 61226)
-- Name: fk51c371f7eacc69fa; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_artikel
    ADD CONSTRAINT fk51c371f7eacc69fa FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_artikel(id);


--
-- TOC entry 2987 (class 2606 OID 61231)
-- Name: fk560f3573153e746f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_prozess_schritt
    ADD CONSTRAINT fk560f3573153e746f FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichung_prozess_schritt(id);


--
-- TOC entry 2985 (class 2606 OID 61236)
-- Name: fk57aff0351dc451da; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_komponente
    ADD CONSTRAINT fk57aff0351dc451da FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_komponente(id);


--
-- TOC entry 2918 (class 2606 OID 61241)
-- Name: fk5b3e08463d3b7a12; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_komponente
    ADD CONSTRAINT fk5b3e08463d3b7a12 FOREIGN KEY (artikel) REFERENCES deva_artikel(id);


--
-- TOC entry 2919 (class 2606 OID 61246)
-- Name: fk5b3e08468d6ce006; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_komponente
    ADD CONSTRAINT fk5b3e08468d6ce006 FOREIGN KEY (komponente) REFERENCES deva_komponente(id);


--
-- TOC entry 2976 (class 2606 OID 61251)
-- Name: fk5b9f4d34d1137703; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_aktions_berechtigungen
    ADD CONSTRAINT fk5b9f4d34d1137703 FOREIGN KEY (berechtigung_id) REFERENCES deva_rolle(id);


--
-- TOC entry 3001 (class 2606 OID 61256)
-- Name: fk5ca4a3dfc7a04c70; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_escalation
    ADD CONSTRAINT fk5ca4a3dfc7a04c70 FOREIGN KEY (deadline_escalation_id) REFERENCES jbpm_deadline(id);


--
-- TOC entry 2924 (class 2606 OID 61261)
-- Name: fk5d10f7783d3b7a12; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zubehoer
    ADD CONSTRAINT fk5d10f7783d3b7a12 FOREIGN KEY (artikel) REFERENCES deva_artikel(id);


--
-- TOC entry 2925 (class 2606 OID 61266)
-- Name: fk5d10f778b3b24cea; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zubehoer
    ADD CONSTRAINT fk5d10f778b3b24cea FOREIGN KEY (zubehoer) REFERENCES deva_zubehoer(id);


--
-- TOC entry 2948 (class 2606 OID 61271)
-- Name: fk635e15d55cf6cf14; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_komponente
    ADD CONSTRAINT fk635e15d55cf6cf14 FOREIGN KEY (firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 2949 (class 2606 OID 61276)
-- Name: fk635e15d5b3de8e56; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_sollzeiten_komponente
    ADD CONSTRAINT fk635e15d5b3de8e56 FOREIGN KEY (sollzeiten_komponente_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2922 (class 2606 OID 61281)
-- Name: fk646ab9f7ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_verantwortliche
    ADD CONSTRAINT fk646ab9f7ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2923 (class 2606 OID 61286)
-- Name: fk646ab9fb2657c32; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_verantwortliche
    ADD CONSTRAINT fk646ab9fb2657c32 FOREIGN KEY (verantwortlicher_id) REFERENCES deva_benutzer(id);


--
-- TOC entry 2903 (class 2606 OID 61291)
-- Name: fk6e9467b92325ac4e; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b92325ac4e FOREIGN KEY (artikelbezeichnung) REFERENCES deva_bezeichnung_artikel(id);


--
-- TOC entry 2904 (class 2606 OID 61296)
-- Name: fk6e9467b938fd1c19; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b938fd1c19 FOREIGN KEY (lieferant) REFERENCES deva_firma(id);


--
-- TOC entry 2905 (class 2606 OID 61301)
-- Name: fk6e9467b96b6c33bf; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b96b6c33bf FOREIGN KEY (artikelprozess) REFERENCES deva_prozess(id);


--
-- TOC entry 2906 (class 2606 OID 61306)
-- Name: fk6e9467b9843549e2; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b9843549e2 FOREIGN KEY (kunde) REFERENCES deva_firma(id);


--
-- TOC entry 2907 (class 2606 OID 61311)
-- Name: fk6e9467b98c57da6c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b98c57da6c FOREIGN KEY (angelegt_von) REFERENCES deva_benutzer(id);


--
-- TOC entry 2908 (class 2606 OID 61316)
-- Name: fk6e9467b98c8fc63d; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b98c8fc63d FOREIGN KEY (paarbeziehung) REFERENCES deva_artikel(id);


--
-- TOC entry 2909 (class 2606 OID 61321)
-- Name: fk6e9467b9a1cbfc4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel
    ADD CONSTRAINT fk6e9467b9a1cbfc4 FOREIGN KEY (artikelbild) REFERENCES deva_dokument(id);


--
-- TOC entry 2938 (class 2606 OID 61326)
-- Name: fk70d1bb683ebdb8fe; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bpmn_definition_task_handler_names
    ADD CONSTRAINT fk70d1bb683ebdb8fe FOREIGN KEY (bpmn_definition_id) REFERENCES deva_bpmndefinition(id);


--
-- TOC entry 3010 (class 2606 OID 61331)
-- Name: fk73d7058336b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_potowners
    ADD CONSTRAINT fk73d7058336b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2960 (class 2606 OID 61336)
-- Name: fk77be0c10dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_logbuch
    ADD CONSTRAINT fk77be0c10dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2961 (class 2606 OID 61341)
-- Name: fk77be0c10dfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_logbuch
    ADD CONSTRAINT fk77be0c10dfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2916 (class 2606 OID 61346)
-- Name: fk792535b27ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_kommentar
    ADD CONSTRAINT fk792535b27ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2917 (class 2606 OID 61351)
-- Name: fk792535b2dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_kommentar
    ADD CONSTRAINT fk792535b2dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2910 (class 2606 OID 61356)
-- Name: fk7a16c7a13d3b7a12; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_bestandteil
    ADD CONSTRAINT fk7a16c7a13d3b7a12 FOREIGN KEY (artikel) REFERENCES deva_artikel(id);


--
-- TOC entry 2911 (class 2606 OID 61361)
-- Name: fk7a16c7a1f093319a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_bestandteil
    ADD CONSTRAINT fk7a16c7a1f093319a FOREIGN KEY (artikel_bestandteil) REFERENCES deva_artikel(id);


--
-- TOC entry 2971 (class 2606 OID 61366)
-- Name: fk7cf7493511000a0a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT fk7cf7493511000a0a FOREIGN KEY (aktueller_schritt) REFERENCES deva_prozess(id);


--
-- TOC entry 2972 (class 2606 OID 61371)
-- Name: fk7cf74935199fc6f5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT fk7cf74935199fc6f5 FOREIGN KEY (abgeschlossener_schritt) REFERENCES deva_prozess(id);


--
-- TOC entry 2973 (class 2606 OID 61376)
-- Name: fk7cf7493575b486b9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess_schritt
    ADD CONSTRAINT fk7cf7493575b486b9 FOREIGN KEY (prozess_schritt_definition) REFERENCES deva_bezeichung_prozess_schritt(id);


--
-- TOC entry 3012 (class 2606 OID 61381)
-- Name: fk7dcd4ddf36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_stakeholders
    ADD CONSTRAINT fk7dcd4ddf36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2929 (class 2606 OID 61386)
-- Name: fk805a2eb45b19b851; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_firma
    ADD CONSTRAINT fk805a2eb45b19b851 FOREIGN KEY (zugeordnete_firma) REFERENCES deva_firma(id);


--
-- TOC entry 2930 (class 2606 OID 61391)
-- Name: fk805a2eb4dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_firma
    ADD CONSTRAINT fk805a2eb4dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2968 (class 2606 OID 61396)
-- Name: fk87d3108562008c47; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT fk87d3108562008c47 FOREIGN KEY (naechster_meilenstein) REFERENCES deva_prozess_schritt(id);


--
-- TOC entry 2969 (class 2606 OID 61401)
-- Name: fk87d31085975a806a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT fk87d31085975a806a FOREIGN KEY (bpmn_definition) REFERENCES deva_bpmndefinition(id);


--
-- TOC entry 2970 (class 2606 OID 61406)
-- Name: fk87d31085eb1c5f20; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozess
    ADD CONSTRAINT fk87d31085eb1c5f20 FOREIGN KEY (prozess_definition) REFERENCES deva_prozessdefinition(id);


--
-- TOC entry 2986 (class 2606 OID 61411)
-- Name: fk88d3d6d9315e404; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_produktgruppe
    ADD CONSTRAINT fk88d3d6d9315e404 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_produktgruppe(id);


--
-- TOC entry 2988 (class 2606 OID 61416)
-- Name: fk8b6a0f27adede368; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zubehoer
    ADD CONSTRAINT fk8b6a0f27adede368 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_zubehoer(id);


--
-- TOC entry 2990 (class 2606 OID 61421)
-- Name: fk8b7d1a55e7b2276; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zubehoer
    ADD CONSTRAINT fk8b7d1a55e7b2276 FOREIGN KEY (zubehoerbezeichnung) REFERENCES deva_bezeichnung_zubehoer(id);


--
-- TOC entry 2983 (class 2606 OID 61426)
-- Name: fk8e4ee667c589307f; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_sollzeiten_klassifikation
    ADD CONSTRAINT fk8e4ee667c589307f FOREIGN KEY (sollzeiten_id) REFERENCES deva_sollzeiten(id);


--
-- TOC entry 2999 (class 2606 OID 61431)
-- Name: fk9c2287131f7b912a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT fk9c2287131f7b912a FOREIGN KEY (emailheaders_id) REFERENCES jbpm_email_header(id);


--
-- TOC entry 3000 (class 2606 OID 61436)
-- Name: fk9c228713351621ef; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_email_notification_jbpm_email_header
    ADD CONSTRAINT fk9c228713351621ef FOREIGN KEY (jbpm_email_notification_id) REFERENCES jbpm_email_notification(id);


--
-- TOC entry 3016 (class 2606 OID 61441)
-- Name: fk9d95288b36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_subtasksstrategy
    ADD CONSTRAINT fk9d95288b36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2933 (class 2606 OID 61446)
-- Name: fk9fb79f156273aba8; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_rollen
    ADD CONSTRAINT fk9fb79f156273aba8 FOREIGN KEY (rolle) REFERENCES deva_rolle(id);


--
-- TOC entry 2934 (class 2606 OID 61451)
-- Name: fk9fb79f15dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_benutzer_rollen
    ADD CONSTRAINT fk9fb79f15dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2974 (class 2606 OID 61456)
-- Name: fka2830f9838fd1c19; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozessdefinition
    ADD CONSTRAINT fka2830f9838fd1c19 FOREIGN KEY (lieferant) REFERENCES deva_firma(id);


--
-- TOC entry 2975 (class 2606 OID 61461)
-- Name: fka2830f98843549e2; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_prozessdefinition
    ADD CONSTRAINT fka2830f98843549e2 FOREIGN KEY (kunde) REFERENCES deva_firma(id);


--
-- TOC entry 2994 (class 2606 OID 61466)
-- Name: fka4a3ea79afb75f7d; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_boolean_expression
    ADD CONSTRAINT fka4a3ea79afb75f7d FOREIGN KEY (escalation_constraints_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 2962 (class 2606 OID 61471)
-- Name: fka5971b19b2657c32; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_verantwortliche
    ADD CONSTRAINT fka5971b19b2657c32 FOREIGN KEY (verantwortlicher_id) REFERENCES deva_benutzer(id);


--
-- TOC entry 2963 (class 2606 OID 61476)
-- Name: fka5971b19dfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_verantwortliche
    ADD CONSTRAINT fka5971b19dfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2939 (class 2606 OID 61481)
-- Name: fka6ca9ab5cbfa49b5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_bpmndefinition
    ADD CONSTRAINT fka6ca9ab5cbfa49b5 FOREIGN KEY (prozessdefinition_id) REFERENCES deva_prozessdefinition(id);


--
-- TOC entry 2964 (class 2606 OID 61486)
-- Name: fka7e180fa46b7fc54; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_zusatzinformationen
    ADD CONSTRAINT fka7e180fa46b7fc54 FOREIGN KEY (zusatzinfo_id) REFERENCES deva_zusatzinformation(id);


--
-- TOC entry 2965 (class 2606 OID 61491)
-- Name: fka7e180fadfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_zusatzinformationen
    ADD CONSTRAINT fka7e180fadfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2944 (class 2606 OID 61496)
-- Name: fkab4bb876793f005b; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_lieferanten
    ADD CONSTRAINT fkab4bb876793f005b FOREIGN KEY (lieferant_id) REFERENCES deva_firma(id);


--
-- TOC entry 2945 (class 2606 OID 61501)
-- Name: fkab4bb876e53e3934; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_firma_lieferanten
    ADD CONSTRAINT fkab4bb876e53e3934 FOREIGN KEY (lieferant_fuer_firma_id) REFERENCES deva_firma(id);


--
-- TOC entry 3007 (class 2606 OID 61506)
-- Name: fkad3513b53e0890b; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_notification
    ADD CONSTRAINT fkad3513b53e0890b FOREIGN KEY (escalation_notifications_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 2998 (class 2606 OID 61511)
-- Name: fkad3513b53e0890b7099f418; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_email_notification
    ADD CONSTRAINT fkad3513b53e0890b7099f418 FOREIGN KEY (escalation_notifications_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 3017 (class 2606 OID 61516)
-- Name: fkb48f3a4f6ce1ef3a; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fkb48f3a4f6ce1ef3a FOREIGN KEY (actualowner_id) REFERENCES jbpm_user(id);


--
-- TOC entry 3018 (class 2606 OID 61521)
-- Name: fkb48f3a4f9e619a0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fkb48f3a4f9e619a0 FOREIGN KEY (createdby_id) REFERENCES jbpm_user(id);


--
-- TOC entry 3019 (class 2606 OID 61526)
-- Name: fkb48f3a4ff213f8b5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fkb48f3a4ff213f8b5 FOREIGN KEY (taskinitiator_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2966 (class 2606 OID 61531)
-- Name: fkb68b59af748e0737; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_produktgruppe
    ADD CONSTRAINT fkb68b59af748e0737 FOREIGN KEY (obergruppe) REFERENCES deva_produktgruppe(id);


--
-- TOC entry 2967 (class 2606 OID 61536)
-- Name: fkb68b59af9315e404; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_produktgruppe
    ADD CONSTRAINT fkb68b59af9315e404 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_produktgruppe(id);


--
-- TOC entry 2989 (class 2606 OID 61541)
-- Name: fkb807fcc8d2732549; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_uebersetzung_zusatzinformation
    ADD CONSTRAINT fkb807fcc8d2732549 FOREIGN KEY (bezeichnung) REFERENCES deva_bezeichnung_zusatzinformation(id);


--
-- TOC entry 2950 (class 2606 OID 61546)
-- Name: fkb8970b3338fd1c19; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b3338fd1c19 FOREIGN KEY (lieferant) REFERENCES deva_firma(id);


--
-- TOC entry 2951 (class 2606 OID 61551)
-- Name: fkb8970b334e705a2c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b334e705a2c FOREIGN KEY (komponente_prozess) REFERENCES deva_prozess(id);


--
-- TOC entry 2952 (class 2606 OID 61556)
-- Name: fkb8970b33843549e2; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b33843549e2 FOREIGN KEY (kunde) REFERENCES deva_firma(id);


--
-- TOC entry 2953 (class 2606 OID 61561)
-- Name: fkb8970b338c57da6c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b338c57da6c FOREIGN KEY (angelegt_von) REFERENCES deva_benutzer(id);


--
-- TOC entry 2954 (class 2606 OID 61566)
-- Name: fkb8970b33a1cbfc4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b33a1cbfc4 FOREIGN KEY (artikelbild) REFERENCES deva_dokument(id);


--
-- TOC entry 2955 (class 2606 OID 61571)
-- Name: fkb8970b33a8076cac; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente
    ADD CONSTRAINT fkb8970b33a8076cac FOREIGN KEY (komponentenbezeichnung) REFERENCES deva_bezeichnung_komponente(id);


--
-- TOC entry 2991 (class 2606 OID 61576)
-- Name: fkc53a280abb69726c; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_zusatzinformation
    ADD CONSTRAINT fkc53a280abb69726c FOREIGN KEY (zusatzinformationbezeichnung) REFERENCES deva_bezeichnung_zusatzinformation(id);

--
-- TOC entry 2956 (class 2606 OID 61581)
-- Name: fkd1dd1e86dfa2b9c0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_dokumente
    ADD CONSTRAINT fkd1dd1e86dfa2b9c0 FOREIGN KEY (komponente_id) REFERENCES deva_komponente(id);


--
-- TOC entry 2957 (class 2606 OID 61586)
-- Name: fkd1dd1e86fe056660; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_dokumente
    ADD CONSTRAINT fkd1dd1e86fe056660 FOREIGN KEY (dokument_id) REFERENCES deva_dokument(id);


--
-- TOC entry 2980 (class 2606 OID 61591)
-- Name: fkd632fa90d1137703; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_rolle_sicht_berechtigungen
    ADD CONSTRAINT fkd632fa90d1137703 FOREIGN KEY (berechtigung_id) REFERENCES deva_rolle(id);


--
-- TOC entry 2926 (class 2606 OID 61596)
-- Name: fkda95e8046b7fc54; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zusatzinformationen
    ADD CONSTRAINT fkda95e8046b7fc54 FOREIGN KEY (zusatzinfo_id) REFERENCES deva_zusatzinformation(id);


--
-- TOC entry 2927 (class 2606 OID 61601)
-- Name: fkda95e807ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_zusatzinformationen
    ADD CONSTRAINT fkda95e807ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2901 (class 2606 OID 61606)
-- Name: fkdae0e2b231ed32e7; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_angemeldeter_benutzer
    ADD CONSTRAINT fkdae0e2b231ed32e7 FOREIGN KEY (benutzer_liste) REFERENCES deva_benutzer_liste(id);


--
-- TOC entry 2902 (class 2606 OID 61611)
-- Name: fkdae0e2b2dc74f062; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_angemeldeter_benutzer
    ADD CONSTRAINT fkdae0e2b2dc74f062 FOREIGN KEY (benutzer) REFERENCES deva_benutzer(id);


--
-- TOC entry 2914 (class 2606 OID 61616)
-- Name: fke6ab83fd2bf81bd0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_fahrzeuge
    ADD CONSTRAINT fke6ab83fd2bf81bd0 FOREIGN KEY (fahrzeug_id) REFERENCES deva_fahrzeug_bezeichnung(id);


--
-- TOC entry 2915 (class 2606 OID 61621)
-- Name: fke6ab83fd7ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_fahrzeuge
    ADD CONSTRAINT fke6ab83fd7ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 3020 (class 2606 OID 61626)
-- Name: fke7d49c4f2ff04688; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task_comment
    ADD CONSTRAINT fke7d49c4f2ff04688 FOREIGN KEY (addedby_id) REFERENCES jbpm_user(id);


--
-- TOC entry 3021 (class 2606 OID 61631)
-- Name: fke7d49c4fb35e68f5; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_task_comment
    ADD CONSTRAINT fke7d49c4fb35e68f5 FOREIGN KEY (taskdata_comments_id) REFERENCES jbpm_task(id);


--
-- TOC entry 3026 (class 2606 OID 65444)
-- Name: fke8ae041b8d6ce006; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_bestandteil
    ADD CONSTRAINT fke8ae041b8d6ce006 FOREIGN KEY (komponente) REFERENCES deva_komponente(id);


--
-- TOC entry 3027 (class 2606 OID 65449)
-- Name: fke8ae041bf69c798e; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_komponente_bestandteil
    ADD CONSTRAINT fke8ae041bf69c798e FOREIGN KEY (komponente_bestandteil) REFERENCES deva_komponente(id);


--
-- TOC entry 2940 (class 2606 OID 61636)
-- Name: fkee37ca061ad81661; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument
    ADD CONSTRAINT fkee37ca061ad81661 FOREIGN KEY (thumbnail_id) REFERENCES deva_dokument_binaerdaten(id);


--
-- TOC entry 2941 (class 2606 OID 61641)
-- Name: fkee37ca06862116e3; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_dokument
    ADD CONSTRAINT fkee37ca06862116e3 FOREIGN KEY (data_id) REFERENCES deva_dokument_binaerdaten(id);


--
-- TOC entry 3014 (class 2606 OID 61646)
-- Name: fkf23c3c0aa5c17ee0; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_reassignment
    ADD CONSTRAINT fkf23c3c0aa5c17ee0 FOREIGN KEY (escalation_reassignments_id) REFERENCES jbpm_escalation(id);


--
-- TOC entry 3011 (class 2606 OID 61651)
-- Name: fkf55e684c36b2f154; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_peopleassignments_recipients
    ADD CONSTRAINT fkf55e684c36b2f154 FOREIGN KEY (task_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2992 (class 2606 OID 61656)
-- Name: fkf6bb126d8ef5f064; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_attachment
    ADD CONSTRAINT fkf6bb126d8ef5f064 FOREIGN KEY (attachedby_id) REFERENCES jbpm_user(id);


--
-- TOC entry 2993 (class 2606 OID 61661)
-- Name: fkf6bb126df21826d9; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY jbpm_attachment
    ADD CONSTRAINT fkf6bb126df21826d9 FOREIGN KEY (taskdata_attachments_id) REFERENCES jbpm_task(id);


--
-- TOC entry 2912 (class 2606 OID 61666)
-- Name: fkf8d0b8c7ffed7f4; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_dokumente
    ADD CONSTRAINT fkf8d0b8c7ffed7f4 FOREIGN KEY (artikel_id) REFERENCES deva_artikel(id);


--
-- TOC entry 2913 (class 2606 OID 61671)
-- Name: fkf8d0b8cfe056660; Type: FK CONSTRAINT; Schema: public; Owner: meyle
--

ALTER TABLE ONLY deva_artikel_dokumente
    ADD CONSTRAINT fkf8d0b8cfe056660 FOREIGN KEY (dokument_id) REFERENCES deva_dokument(id);


--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-05-28 17:34:20 CEST

--
-- PostgreSQL database dump complete
--

