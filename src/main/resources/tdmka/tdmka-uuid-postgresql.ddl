--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.3
-- Dumped by pg_dump version 9.1.3
-- Started on 2012-04-25 17:19:57 CEST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 305 (class 3079 OID 11705)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 305
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 161 (class 1259 OID 309590)
-- Dependencies: 6
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO tdm;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 309652)
-- Dependencies: 6
-- Name: tdm_abstractreportparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_abstractreportparameter (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    name character varying(255),
    analysetimespanstart timestamp without time zone,
    analysetimespanend timestamp without time zone,
    entitiesperpagelimit integer,
    selectedreporttimespan character varying(255),
    selectedreportfuturetimespan character varying(255),
    periodicity character varying(255),
    quartztriggername character varying(255),
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_abstractreportparameter OWNER TO tdm;

--
-- TOC entry 175 (class 1259 OID 309658)
-- Dependencies: 6
-- Name: tdm_abstractreportparameter_tdm_nonusermessagerecipient; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_abstractreportparameter_tdm_nonusermessagerecipient (
    tdm_abstractreportparameter_id bigint NOT NULL,
    nonuserrecipients_id bigint NOT NULL
);


ALTER TABLE public.tdm_abstractreportparameter_tdm_nonusermessagerecipient OWNER TO tdm;

--
-- TOC entry 176 (class 1259 OID 309661)
-- Dependencies: 6
-- Name: tdm_abstractreportparameter_tdm_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_abstractreportparameter_tdm_user (
    tdm_abstractreportparameter_id bigint NOT NULL,
    userrecipients_id bigint NOT NULL
);


ALTER TABLE public.tdm_abstractreportparameter_tdm_user OWNER TO tdm;

--
-- TOC entry 177 (class 1259 OID 309664)
-- Dependencies: 6
-- Name: tdm_access_collection; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_access_collection (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255),
    unlockaftershockreduction boolean NOT NULL,
    validuntil timestamp without time zone,
    accesscollectiontype character varying(255) NOT NULL,
    organisationalunit_id bigint NOT NULL,
    rfid_id bigint,
    reduction_id bigint NOT NULL,
    lightfeatures_id bigint NOT NULL,
    card_id bigint,
    drivergroup_id bigint,
    driver_id bigint,
    pin_id bigint,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_access_collection OWNER TO tdm;

--
-- TOC entry 178 (class 1259 OID 309670)
-- Dependencies: 6
-- Name: tdm_access_id_generator; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_access_id_generator (
    id bigint NOT NULL
);


ALTER TABLE public.tdm_access_id_generator OWNER TO tdm;

--
-- TOC entry 179 (class 1259 OID 309673)
-- Dependencies: 6
-- Name: tdm_accessid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tdm_accessid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tdm_accessid OWNER TO tdm;

--
-- TOC entry 180 (class 1259 OID 309675)
-- Dependencies: 2523 6
-- Name: tdm_access_token; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_access_token (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    tdmaccessid character varying(255) DEFAULT nextval('tdm_accessid'::regclass) NOT NULL,
    active boolean NOT NULL,
    accesscollection_id bigint,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_access_token OWNER TO tdm;

--
-- TOC entry 181 (class 1259 OID 309679)
-- Dependencies: 6
-- Name: tdm_access_token_assignment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_access_token_assignment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    accesstoken_id bigint NOT NULL,
    vehicle_id bigint NOT NULL
);


ALTER TABLE public.tdm_access_token_assignment OWNER TO tdm;

--
-- TOC entry 182 (class 1259 OID 309682)
-- Dependencies: 6
-- Name: tdm_address; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_address (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    street character varying(255),
    city character varying(255),
    zipcode character varying(255),
    postofficebox character varying(255),
    zipcodepostofficebox character varying(255),
    email character varying(255),
    phone character varying(255),
    fax character varying(255)
);


ALTER TABLE public.tdm_address OWNER TO tdm;

--
-- TOC entry 183 (class 1259 OID 309688)
-- Dependencies: 2524 6
-- Name: tdm_attachment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_attachment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255) NOT NULL,
    yearofconstruction bigint NOT NULL,
    serialnumber character varying(255) NOT NULL,
    inventorynumber character varying(255),
    bringingintoservice date NOT NULL,
    load bigint,
    forkwidth bigint,
    organisationalunit_id bigint NOT NULL,
    attachmentmanufacturer_id bigint NOT NULL,
    attachmentmodel_id bigint NOT NULL,
    client_id bigint NOT NULL,
    vehicle_id bigint,
    CONSTRAINT tdm_attachment_yearofconstruction_check CHECK (((yearofconstruction >= 0) AND (yearofconstruction <= 9999)))
);


ALTER TABLE public.tdm_attachment OWNER TO tdm;

--
-- TOC entry 184 (class 1259 OID 309695)
-- Dependencies: 6
-- Name: tdm_attachmentmanufacturer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_attachmentmanufacturer (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    name character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_attachmentmanufacturer OWNER TO tdm;

--
-- TOC entry 185 (class 1259 OID 309698)
-- Dependencies: 6
-- Name: tdm_attachmentmodel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_attachmentmodel (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    name character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_attachmentmodel OWNER TO tdm;

--
-- TOC entry 186 (class 1259 OID 309701)
-- Dependencies: 2525 6
-- Name: tdm_attachmenttemplate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_attachmenttemplate (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255),
    yearofconstruction bigint,
    serialnumber character varying(255),
    inventorynumber character varying(255),
    bringingintoservice date,
    load bigint,
    forkwidth bigint,
    templatename character varying(255) NOT NULL,
    model_id bigint,
    manufacturer_id bigint,
    client_id bigint NOT NULL,
    CONSTRAINT tdm_attachmenttemplate_yearofconstruction_check CHECK (((yearofconstruction >= 0) AND (yearofconstruction <= 9999)))
);


ALTER TABLE public.tdm_attachmenttemplate OWNER TO tdm;

--
-- TOC entry 187 (class 1259 OID 309708)
-- Dependencies: 2526 6
-- Name: tdm_battery; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_battery (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255) NOT NULL,
    yearofconstruction smallint NOT NULL,
    serialnumber character varying(255) NOT NULL,
    bringingintoservice date NOT NULL,
    voltage_value numeric(19,2),
    rating_value numeric(19,2),
    electrolyte boolean NOT NULL,
    waterrefill boolean NOT NULL,
    inventorynumber character varying(255),
    batterymanufacturer_id bigint NOT NULL,
    client_id bigint NOT NULL,
    batterymodel_id bigint NOT NULL,
    organisationalunit_id bigint NOT NULL,
    vehicle_id bigint,
    CONSTRAINT tdm_battery_yearofconstruction_check CHECK (((yearofconstruction >= 0) AND (yearofconstruction <= 9999)))
);


ALTER TABLE public.tdm_battery OWNER TO tdm;

--
-- TOC entry 188 (class 1259 OID 309715)
-- Dependencies: 6
-- Name: tdm_batterymanufacturer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_batterymanufacturer (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    name character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_batterymanufacturer OWNER TO tdm;

--
-- TOC entry 189 (class 1259 OID 309718)
-- Dependencies: 6
-- Name: tdm_batterymodel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_batterymodel (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    name character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_batterymodel OWNER TO tdm;

--
-- TOC entry 190 (class 1259 OID 309721)
-- Dependencies: 6
-- Name: tdm_card; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_card (
    id bigint NOT NULL,
    serialnumber character varying(255) NOT NULL,
    automaticextension integer
);


ALTER TABLE public.tdm_card OWNER TO tdm;

--
-- TOC entry 191 (class 1259 OID 309724)
-- Dependencies: 6
-- Name: tdm_charger; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_charger (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255) NOT NULL,
    yearofconstruction bigint NOT NULL,
    serialnumber character varying(255) NOT NULL,
    inventorynumber character varying(255),
    bringingintoservice date NOT NULL,
    voltage_value numeric(19,2),
    rating_value numeric(19,2),
    chargermodel_id bigint NOT NULL,
    organisationalunit_id bigint NOT NULL,
    client_id bigint NOT NULL,
    chargermanufacturer_id bigint NOT NULL
);


ALTER TABLE public.tdm_charger OWNER TO tdm;

--
-- TOC entry 192 (class 1259 OID 309730)
-- Dependencies: 6
-- Name: tdm_chargermanufacturer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_chargermanufacturer (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    name character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_chargermanufacturer OWNER TO tdm;

--
-- TOC entry 193 (class 1259 OID 309733)
-- Dependencies: 6
-- Name: tdm_chargermodel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_chargermodel (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    name character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_chargermodel OWNER TO tdm;

--
-- TOC entry 194 (class 1259 OID 309736)
-- Dependencies: 6
-- Name: tdm_chargertemplate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_chargertemplate (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255),
    yearofconstruction bigint,
    serialnumber character varying(255),
    inventorynumber character varying(255),
    bringingintoservice date,
    voltage_value numeric(19,2),
    rating_value numeric(19,2),
    templatename character varying(255) NOT NULL,
    client_id bigint NOT NULL,
    model_id bigint,
    manufacturer_id bigint
);


ALTER TABLE public.tdm_chargertemplate OWNER TO tdm;

--
-- TOC entry 195 (class 1259 OID 309742)
-- Dependencies: 6
-- Name: tdm_client; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_client (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    clientid character varying(255) NOT NULL,
    clientname character varying(255) NOT NULL,
    lockflag boolean NOT NULL,
    clientprofile_id bigint NOT NULL
);


ALTER TABLE public.tdm_client OWNER TO tdm;

--
-- TOC entry 196 (class 1259 OID 309748)
-- Dependencies: 6
-- Name: tdm_clientprofile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_clientprofile (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    uitheme character varying(255),
    tdm_locale character varying(255)
);


ALTER TABLE public.tdm_clientprofile OWNER TO tdm;

--
-- TOC entry 197 (class 1259 OID 309754)
-- Dependencies: 6
-- Name: tdm_crash; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_crash (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    "timestamp" timestamp without time zone NOT NULL,
    aggregatesince bigint NOT NULL,
    sessionid character varying(255) NOT NULL,
    occurrencetime timestamp without time zone NOT NULL,
    severity character varying(255),
    load integer,
    lift real,
    accesstoken_id bigint NOT NULL,
    vehicle_id bigint NOT NULL
);


ALTER TABLE public.tdm_crash OWNER TO tdm;

--
-- TOC entry 198 (class 1259 OID 309760)
-- Dependencies: 6
-- Name: tdm_crash_brakeactuation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_crash_brakeactuation (
    tdm_crash_id bigint NOT NULL,
    element integer,
    mapkey integer NOT NULL
);


ALTER TABLE public.tdm_crash_brakeactuation OWNER TO tdm;

--
-- TOC entry 199 (class 1259 OID 309763)
-- Dependencies: 6
-- Name: tdm_crash_drivingspeed; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_crash_drivingspeed (
    tdm_crash_id bigint NOT NULL,
    element real,
    mapkey integer NOT NULL
);


ALTER TABLE public.tdm_crash_drivingspeed OWNER TO tdm;

--
-- TOC entry 200 (class 1259 OID 309766)
-- Dependencies: 6
-- Name: tdm_crash_features; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_crash_features (
    tdm_crash_id bigint NOT NULL,
    element boolean,
    mapkey integer NOT NULL
);


ALTER TABLE public.tdm_crash_features OWNER TO tdm;

--
-- TOC entry 201 (class 1259 OID 309769)
-- Dependencies: 6
-- Name: tdm_crash_steeringangle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_crash_steeringangle (
    tdm_crash_id bigint NOT NULL,
    element integer,
    mapkey integer NOT NULL
);


ALTER TABLE public.tdm_crash_steeringangle OWNER TO tdm;

--
-- TOC entry 202 (class 1259 OID 309772)
-- Dependencies: 6
-- Name: tdm_crashdetailsreportparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_crashdetailsreportparameter (
    id bigint NOT NULL
);


ALTER TABLE public.tdm_crashdetailsreportparameter OWNER TO tdm;

--
-- TOC entry 203 (class 1259 OID 309775)
-- Dependencies: 6
-- Name: tdm_crashdetailsreportparameter_tdm_vehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_crashdetailsreportparameter_tdm_vehicle (
    tdm_crashdetailsreportparameter_id bigint NOT NULL,
    vehicles_id bigint NOT NULL
);


ALTER TABLE public.tdm_crashdetailsreportparameter_tdm_vehicle OWNER TO tdm;

--
-- TOC entry 204 (class 1259 OID 309778)
-- Dependencies: 6
-- Name: tdm_customer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_customer (
    id bigint NOT NULL,
    vendortype character varying(255) NOT NULL,
    anonymousemployees boolean NOT NULL,
    suppressedlogbookactiveduration boolean NOT NULL,
    testofdriverlicences boolean NOT NULL,
    maxnumberofvehicles integer NOT NULL,
    periodstart date NOT NULL,
    periodend date NOT NULL,
    vehiclestatusinterval integer NOT NULL,
    fleetid integer NOT NULL,
    address_id bigint NOT NULL,
    overviewsettings_id bigint,
    vendor_id bigint NOT NULL,
    usermessagepriority character varying(255),
    applicationvisibilitytype integer NOT NULL
);


ALTER TABLE public.tdm_customer OWNER TO tdm;

--
-- TOC entry 205 (class 1259 OID 309784)
-- Dependencies: 6
-- Name: tdm_customer_tdm_nonusermessagerecipient; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_customer_tdm_nonusermessagerecipient (
    tdm_customer_id bigint NOT NULL,
    nonuserrecipients_id bigint NOT NULL
);


ALTER TABLE public.tdm_customer_tdm_nonusermessagerecipient OWNER TO tdm;

--
-- TOC entry 206 (class 1259 OID 309787)
-- Dependencies: 6
-- Name: tdm_customer_tdm_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_customer_tdm_user (
    tdm_customer_id bigint NOT NULL,
    userrecipients_id bigint NOT NULL
);


ALTER TABLE public.tdm_customer_tdm_user OWNER TO tdm;

--
-- TOC entry 207 (class 1259 OID 309790)
-- Dependencies: 6
-- Name: tdm_driver; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_driver (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    lastname character varying(255),
    firstname character varying(255),
    personnelnumber character varying(255),
    mobilenumber character varying(255),
    costunit character varying(255),
    expirationdateofcommondriveauthority date,
    unlockaftershockreduction boolean,
    drivergroup_id bigint NOT NULL,
    client_id bigint NOT NULL,
    organisationalunit_id bigint NOT NULL
);


ALTER TABLE public.tdm_driver OWNER TO tdm;

--
-- TOC entry 208 (class 1259 OID 309796)
-- Dependencies: 6
-- Name: tdm_driveraccesslistreportparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_driveraccesslistreportparameter (
    id bigint NOT NULL
);


ALTER TABLE public.tdm_driveraccesslistreportparameter OWNER TO tdm;

--
-- TOC entry 209 (class 1259 OID 309799)
-- Dependencies: 6
-- Name: tdm_driveraccesslistreportparameter_tdm_access_collection; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_driveraccesslistreportparameter_tdm_access_collection (
    tdm_driveraccesslistreportparameter_id bigint NOT NULL,
    accesscollections_id bigint NOT NULL
);


ALTER TABLE public.tdm_driveraccesslistreportparameter_tdm_access_collection OWNER TO tdm;

--
-- TOC entry 210 (class 1259 OID 309802)
-- Dependencies: 6
-- Name: tdm_drivergroup; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_drivergroup (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    lightfeatures_id bigint,
    reduction_id bigint,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_drivergroup OWNER TO tdm;

--
-- TOC entry 211 (class 1259 OID 309808)
-- Dependencies: 6
-- Name: tdm_driverlicence; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_driverlicence (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    validitydate date NOT NULL,
    durationofvaliditymonth bigint NOT NULL,
    driverlicenceclass_id bigint NOT NULL,
    driver_id bigint NOT NULL
);


ALTER TABLE public.tdm_driverlicence OWNER TO tdm;

--
-- TOC entry 212 (class 1259 OID 309811)
-- Dependencies: 6
-- Name: tdm_driverlicenceclass; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_driverlicenceclass (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_driverlicenceclass OWNER TO tdm;

--
-- TOC entry 213 (class 1259 OID 309814)
-- Dependencies: 6
-- Name: tdm_driverlicenceclass_tdm_vehicleclass; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_driverlicenceclass_tdm_vehicleclass (
    tdm_driverlicenceclass_id bigint NOT NULL,
    vehicleclasses_id bigint NOT NULL
);


ALTER TABLE public.tdm_driverlicenceclass_tdm_vehicleclass OWNER TO tdm;

--
-- TOC entry 214 (class 1259 OID 309817)
-- Dependencies: 6
-- Name: tdm_driverlogbookreportparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_driverlogbookreportparameter (
    id bigint NOT NULL
);


ALTER TABLE public.tdm_driverlogbookreportparameter OWNER TO tdm;

--
-- TOC entry 215 (class 1259 OID 309820)
-- Dependencies: 6
-- Name: tdm_driverlogbookreportparameter_tdm_access_collection; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_driverlogbookreportparameter_tdm_access_collection (
    tdm_driverlogbookreportparameter_id bigint NOT NULL,
    accesscollections_id bigint NOT NULL
);


ALTER TABLE public.tdm_driverlogbookreportparameter_tdm_access_collection OWNER TO tdm;

--
-- TOC entry 216 (class 1259 OID 309823)
-- Dependencies: 6
-- Name: tdm_driverlogin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_driverlogin (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    "timestamp" timestamp without time zone NOT NULL,
    aggregatesince bigint NOT NULL,
    sessionid character varying(255) NOT NULL,
    logintime timestamp without time zone NOT NULL,
    accesstoken_id bigint NOT NULL,
    vehicle_id bigint NOT NULL
);


ALTER TABLE public.tdm_driverlogin OWNER TO tdm;

--
-- TOC entry 217 (class 1259 OID 309826)
-- Dependencies: 6
-- Name: tdm_driverlogout; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_driverlogout (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    "timestamp" timestamp without time zone NOT NULL,
    aggregatesince bigint NOT NULL,
    sessionid character varying(255) NOT NULL,
    logouttime timestamp without time zone NOT NULL,
    automaticlogout boolean NOT NULL,
    accesstoken_id bigint NOT NULL,
    vehicle_id bigint NOT NULL
);


ALTER TABLE public.tdm_driverlogout OWNER TO tdm;

--
-- TOC entry 218 (class 1259 OID 309829)
-- Dependencies: 6
-- Name: tdm_drivertemplate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_drivertemplate (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    lastname character varying(255),
    firstname character varying(255),
    personnelnumber character varying(255),
    mobilenumber character varying(255),
    costunit character varying(255),
    expirationdateofcommondriveauthority date,
    unlockaftershockreduction boolean NOT NULL,
    templatename character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_drivertemplate OWNER TO tdm;

--
-- TOC entry 219 (class 1259 OID 309835)
-- Dependencies: 6
-- Name: tdm_energyconsumption; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_energyconsumption (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    "timestamp" timestamp without time zone NOT NULL,
    aggregatesince bigint NOT NULL,
    sessionid character varying(255) NOT NULL,
    readoutduration bigint,
    consumedamount real,
    energyunit character varying(255),
    vehicle_id bigint NOT NULL
);


ALTER TABLE public.tdm_energyconsumption OWNER TO tdm;

--
-- TOC entry 220 (class 1259 OID 309841)
-- Dependencies: 6
-- Name: tdm_evaluation_dynamicdata; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_evaluation_dynamicdata (
    id bigint NOT NULL,
    version bigint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    evaluation integer,
    vehicle_id bigint
);


ALTER TABLE public.tdm_evaluation_dynamicdata OWNER TO tdm;

--
-- TOC entry 221 (class 1259 OID 309844)
-- Dependencies: 6
-- Name: tdm_fleetusagereportparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_fleetusagereportparameter (
    id bigint NOT NULL
);


ALTER TABLE public.tdm_fleetusagereportparameter OWNER TO tdm;

--
-- TOC entry 222 (class 1259 OID 309847)
-- Dependencies: 6
-- Name: tdm_fleetusagereportparameter_tdm_vehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_fleetusagereportparameter_tdm_vehicle (
    tdm_fleetusagereportparameter_id bigint NOT NULL,
    vehicles_id bigint NOT NULL
);


ALTER TABLE public.tdm_fleetusagereportparameter_tdm_vehicle OWNER TO tdm;

--
-- TOC entry 223 (class 1259 OID 309850)
-- Dependencies: 6
-- Name: tdm_frontend; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_frontend (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    frontendkey character varying(1000) NOT NULL,
    frontendid character varying(1000),
    description character varying(1000),
    registered boolean NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_frontend OWNER TO tdm;

--
-- TOC entry 224 (class 1259 OID 309856)
-- Dependencies: 2527 2528 6
-- Name: tdm_guarantee; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_guarantee (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    duration bigint,
    hoursofoperation bigint,
    guarantee_begin date,
    CONSTRAINT tdm_guarantee_duration_check CHECK (((duration >= 1) AND (duration <= 99))),
    CONSTRAINT tdm_guarantee_hoursofoperation_check CHECK ((hoursofoperation >= 0))
);


ALTER TABLE public.tdm_guarantee OWNER TO tdm;

--
-- TOC entry 225 (class 1259 OID 309861)
-- Dependencies: 6
-- Name: tdm_licence; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_licence (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    licencekey character varying(255) NOT NULL,
    active boolean NOT NULL,
    serverid character varying(255),
    customer_id bigint NOT NULL
);


ALTER TABLE public.tdm_licence OWNER TO tdm;

--
-- TOC entry 226 (class 1259 OID 309867)
-- Dependencies: 6
-- Name: tdm_liftanddrivereportparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_liftanddrivereportparameter (
    id bigint NOT NULL
);


ALTER TABLE public.tdm_liftanddrivereportparameter OWNER TO tdm;

--
-- TOC entry 227 (class 1259 OID 309870)
-- Dependencies: 6
-- Name: tdm_liftanddrivereportparameter_tdm_vehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_liftanddrivereportparameter_tdm_vehicle (
    tdm_liftanddrivereportparameter_id bigint NOT NULL,
    vehicles_id bigint NOT NULL
);


ALTER TABLE public.tdm_liftanddrivereportparameter_tdm_vehicle OWNER TO tdm;

--
-- TOC entry 228 (class 1259 OID 309873)
-- Dependencies: 6
-- Name: tdm_liftanddrivetimes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_liftanddrivetimes (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    "timestamp" timestamp without time zone NOT NULL,
    aggregatesince bigint NOT NULL,
    sessionid character varying(255) NOT NULL,
    readouttime timestamp without time zone NOT NULL,
    readoutduration bigint,
    lifttime bigint,
    drivetime bigint,
    liftanddrivetime bigint,
    vehicle_id bigint NOT NULL
);


ALTER TABLE public.tdm_liftanddrivetimes OWNER TO tdm;

--
-- TOC entry 229 (class 1259 OID 309876)
-- Dependencies: 6
-- Name: tdm_lightfeatures; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_lightfeatures (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    dippedlight boolean,
    searchlight boolean,
    warninglight boolean,
    beaconlight boolean
);


ALTER TABLE public.tdm_lightfeatures OWNER TO tdm;

--
-- TOC entry 230 (class 1259 OID 309879)
-- Dependencies: 6
-- Name: tdm_loadtransportation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_loadtransportation (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    "timestamp" timestamp without time zone NOT NULL,
    readouttime timestamp without time zone NOT NULL,
    readoutduration bigint NOT NULL,
    maxload integer,
    maxlift real,
    maxtorque integer,
    maxspeed real,
    distance integer,
    drivewithloadtime integer,
    distancewithload integer,
    numberofdirectionchanges integer,
    vehicle_id bigint NOT NULL
);


ALTER TABLE public.tdm_loadtransportation OWNER TO tdm;

--
-- TOC entry 231 (class 1259 OID 309882)
-- Dependencies: 6
-- Name: tdm_loadtransportationhistogram; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_loadtransportationhistogram (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    "timestamp" timestamp without time zone NOT NULL,
    readouttime timestamp without time zone NOT NULL,
    readoutduration bigint NOT NULL,
    vehicle_id bigint NOT NULL
);


ALTER TABLE public.tdm_loadtransportationhistogram OWNER TO tdm;

--
-- TOC entry 232 (class 1259 OID 309885)
-- Dependencies: 6
-- Name: tdm_loadtransportationhistogram_addeddistances; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_loadtransportationhistogram_addeddistances (
    tdm_loadtransportationhistogram_id bigint NOT NULL,
    element integer,
    mapkey integer NOT NULL
);


ALTER TABLE public.tdm_loadtransportationhistogram_addeddistances OWNER TO tdm;

--
-- TOC entry 233 (class 1259 OID 309888)
-- Dependencies: 6
-- Name: tdm_loadtransportationhistogram_distanceswithload; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_loadtransportationhistogram_distanceswithload (
    tdm_loadtransportationhistogram_id bigint NOT NULL,
    element integer,
    mapkey integer NOT NULL
);


ALTER TABLE public.tdm_loadtransportationhistogram_distanceswithload OWNER TO tdm;

--
-- TOC entry 234 (class 1259 OID 309891)
-- Dependencies: 6
-- Name: tdm_logbook; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_logbook (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    ontime timestamp without time zone NOT NULL,
    offtime timestamp without time zone NOT NULL,
    ucctotalreportedtime bigint NOT NULL,
    liftanddrivetime bigint NOT NULL,
    lifttime bigint NOT NULL,
    drivetime bigint NOT NULL,
    numberofcrashs integer NOT NULL,
    complete boolean NOT NULL,
    preshiftcheck_id bigint,
    accesstoken_id bigint NOT NULL,
    vehicle_id bigint NOT NULL
);


ALTER TABLE public.tdm_logbook OWNER TO tdm;

--
-- TOC entry 235 (class 1259 OID 309894)
-- Dependencies: 6
-- Name: tdm_loggedin_dynamicdata; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_loggedin_dynamicdata (
    id bigint NOT NULL,
    version bigint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    loggedin boolean,
    vehicle_id bigint
);


ALTER TABLE public.tdm_loggedin_dynamicdata OWNER TO tdm;

--
-- TOC entry 236 (class 1259 OID 309897)
-- Dependencies: 6
-- Name: tdm_logmessage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_logmessage (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    priority integer NOT NULL,
    category integer NOT NULL,
    templatekey character varying(255) NOT NULL
);


ALTER TABLE public.tdm_logmessage OWNER TO tdm;

--
-- TOC entry 237 (class 1259 OID 309900)
-- Dependencies: 6
-- Name: tdm_logmessage_tdm_messageparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_logmessage_tdm_messageparameter (
    tdm_logmessage_id bigint NOT NULL,
    parameters_id bigint NOT NULL
);


ALTER TABLE public.tdm_logmessage_tdm_messageparameter OWNER TO tdm;

--
-- TOC entry 238 (class 1259 OID 309903)
-- Dependencies: 6
-- Name: tdm_mast; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_mast (
    id bigint NOT NULL,
    form character varying(255),
    load integer,
    loadcenter double precision,
    height double precision,
    nominalstroke integer,
    freelift double precision,
    forklength double precision,
    forkwidth double precision,
    extrahydraulics character varying(255)
);


ALTER TABLE public.tdm_mast OWNER TO tdm;

--
-- TOC entry 239 (class 1259 OID 309909)
-- Dependencies: 6
-- Name: tdm_maxloadreportparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_maxloadreportparameter (
    id bigint NOT NULL
);


ALTER TABLE public.tdm_maxloadreportparameter OWNER TO tdm;

--
-- TOC entry 240 (class 1259 OID 309912)
-- Dependencies: 6
-- Name: tdm_maxloadreportparameter_tdm_vehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_maxloadreportparameter_tdm_vehicle (
    tdm_maxloadreportparameter_id bigint NOT NULL,
    vehicles_id bigint NOT NULL
);


ALTER TABLE public.tdm_maxloadreportparameter_tdm_vehicle OWNER TO tdm;

--
-- TOC entry 241 (class 1259 OID 309915)
-- Dependencies: 6
-- Name: tdm_messageparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_messageparameter (
    dtype character varying(31) NOT NULL,
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    messageparameter_key character varying(255) NOT NULL,
    numbervalue bytea,
    stringvalue character varying(255),
    datevalue timestamp without time zone,
    gmt boolean
);


ALTER TABLE public.tdm_messageparameter OWNER TO tdm;

--
-- TOC entry 242 (class 1259 OID 309921)
-- Dependencies: 6
-- Name: tdm_nonusermessagerecipient; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_nonusermessagerecipient (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_nonusermessagerecipient OWNER TO tdm;

--
-- TOC entry 243 (class 1259 OID 309927)
-- Dependencies: 6
-- Name: tdm_operatinghour_dynamicdata; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_operatinghour_dynamicdata (
    id bigint NOT NULL,
    version bigint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    hoursofoperation bigint,
    vehicle_id bigint
);


ALTER TABLE public.tdm_operatinghour_dynamicdata OWNER TO tdm;

--
-- TOC entry 244 (class 1259 OID 309930)
-- Dependencies: 6
-- Name: tdm_operatinghours; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_operatinghours (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    "timestamp" timestamp without time zone NOT NULL,
    readouttime timestamp without time zone NOT NULL,
    value integer NOT NULL,
    vehicle_id bigint NOT NULL
);


ALTER TABLE public.tdm_operatinghours OWNER TO tdm;

--
-- TOC entry 245 (class 1259 OID 309933)
-- Dependencies: 2529 6
-- Name: tdm_organisationalunit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_organisationalunit (
    type character(1) NOT NULL,
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255) NOT NULL,
    index integer NOT NULL,
    fleetidentifier bigint,
    localidentifier integer,
    treepositionchanged boolean,
    lightfeatures_id bigint,
    client_id bigint NOT NULL,
    reduction_id bigint,
    organisationalunit_id bigint,
    CONSTRAINT tdm_organisationalunit_localidentifier_check CHECK (((localidentifier >= 1) AND (localidentifier <= 15)))
);


ALTER TABLE public.tdm_organisationalunit OWNER TO tdm;

--
-- TOC entry 246 (class 1259 OID 309937)
-- Dependencies: 6
-- Name: tdm_organisationalunit_tdm_shiftmodel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_organisationalunit_tdm_shiftmodel (
    tdm_organisationalunit_id bigint NOT NULL,
    shiftmodels_id bigint NOT NULL
);


ALTER TABLE public.tdm_organisationalunit_tdm_shiftmodel OWNER TO tdm;

--
-- TOC entry 247 (class 1259 OID 309940)
-- Dependencies: 6
-- Name: tdm_outstandingmaintenanceparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_outstandingmaintenanceparameter (
    id bigint NOT NULL
);


ALTER TABLE public.tdm_outstandingmaintenanceparameter OWNER TO tdm;

--
-- TOC entry 248 (class 1259 OID 309943)
-- Dependencies: 6
-- Name: tdm_outstandingmaintenanceparameter_tdm_vehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_outstandingmaintenanceparameter_tdm_vehicle (
    tdm_outstandingmaintenanceparameter_id bigint NOT NULL,
    vehicles_id bigint NOT NULL
);


ALTER TABLE public.tdm_outstandingmaintenanceparameter_tdm_vehicle OWNER TO tdm;

--
-- TOC entry 249 (class 1259 OID 309946)
-- Dependencies: 6
-- Name: tdm_overviewsettings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_overviewsettings (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    maintenancewarnyellow integer NOT NULL,
    maintenancewarnred integer NOT NULL,
    preshiftcheckwarnyellow integer NOT NULL,
    preshiftcheckwarnred integer NOT NULL,
    updatewarnyellow integer NOT NULL,
    updatewarnred integer NOT NULL,
    updateoutstandinghours integer NOT NULL,
    accessexpirationwarnyellow integer NOT NULL,
    accessexpirationwarnred integer NOT NULL,
    trainingwarnyellow integer NOT NULL,
    trainingwarnred integer NOT NULL,
    activewarnyellow integer NOT NULL,
    activewarnred integer NOT NULL
);


ALTER TABLE public.tdm_overviewsettings OWNER TO tdm;

--
-- TOC entry 250 (class 1259 OID 309949)
-- Dependencies: 6
-- Name: tdm_overviewsettings_tdm_vehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_overviewsettings_tdm_vehicle (
    tdm_overviewsettings_id bigint NOT NULL,
    vehicleselection_id bigint NOT NULL
);


ALTER TABLE public.tdm_overviewsettings_tdm_vehicle OWNER TO tdm;

--
-- TOC entry 251 (class 1259 OID 309952)
-- Dependencies: 6
-- Name: tdm_performedmaintenance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_performedmaintenance (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    dateofperformance timestamp without time zone NOT NULL,
    maintenancetype character varying(255),
    operatinghoursreading integer NOT NULL,
    vehicle_id bigint NOT NULL
);


ALTER TABLE public.tdm_performedmaintenance OWNER TO tdm;

--
-- TOC entry 252 (class 1259 OID 309955)
-- Dependencies: 6
-- Name: tdm_performedmaintenanceparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_performedmaintenanceparameter (
    id bigint NOT NULL
);


ALTER TABLE public.tdm_performedmaintenanceparameter OWNER TO tdm;

--
-- TOC entry 253 (class 1259 OID 309958)
-- Dependencies: 6
-- Name: tdm_performedmaintenanceparameter_tdm_vehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_performedmaintenanceparameter_tdm_vehicle (
    tdm_performedmaintenanceparameter_id bigint NOT NULL,
    vehicles_id bigint NOT NULL
);


ALTER TABLE public.tdm_performedmaintenanceparameter_tdm_vehicle OWNER TO tdm;

--
-- TOC entry 254 (class 1259 OID 309961)
-- Dependencies: 6
-- Name: tdm_pin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_pin (
    id bigint NOT NULL,
    number character varying(8) NOT NULL
);


ALTER TABLE public.tdm_pin OWNER TO tdm;

--
-- TOC entry 255 (class 1259 OID 309964)
-- Dependencies: 6
-- Name: tdm_preshiftcheck; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_preshiftcheck (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    "timestamp" timestamp without time zone NOT NULL,
    aggregatesince bigint NOT NULL,
    sessionid character varying(255) NOT NULL,
    vehiclestate integer,
    checktime timestamp without time zone NOT NULL,
    vehicle_id bigint NOT NULL,
    accesstoken_id bigint NOT NULL
);


ALTER TABLE public.tdm_preshiftcheck OWNER TO tdm;

--
-- TOC entry 256 (class 1259 OID 309967)
-- Dependencies: 6
-- Name: tdm_preshiftcheckreportparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_preshiftcheckreportparameter (
    id bigint NOT NULL
);


ALTER TABLE public.tdm_preshiftcheckreportparameter OWNER TO tdm;

--
-- TOC entry 257 (class 1259 OID 309970)
-- Dependencies: 6
-- Name: tdm_preshiftcheckreportparameter_tdm_vehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_preshiftcheckreportparameter_tdm_vehicle (
    tdm_preshiftcheckreportparameter_id bigint NOT NULL,
    vehicles_id bigint NOT NULL
);


ALTER TABLE public.tdm_preshiftcheckreportparameter_tdm_vehicle OWNER TO tdm;

--
-- TOC entry 258 (class 1259 OID 309973)
-- Dependencies: 6
-- Name: tdm_profiletype; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_profiletype (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    name character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_profiletype OWNER TO tdm;

--
-- TOC entry 259 (class 1259 OID 309976)
-- Dependencies: 6
-- Name: tdm_reduction; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_reduction (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    speedreductionactive boolean,
    speedreductionforward double precision,
    speedreductionbackward double precision,
    mastspeedreductionactive boolean,
    mastspeedreductionlift double precision,
    mastspeedreductiondrop double precision,
    declinespeedreductionactive boolean,
    declinespeedreductionforward double precision,
    declinespeedreductionbackward double precision,
    profiletypeactive boolean,
    profiletype_id bigint
);


ALTER TABLE public.tdm_reduction OWNER TO tdm;

--
-- TOC entry 260 (class 1259 OID 309979)
-- Dependencies: 6
-- Name: tdm_rfid; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_rfid (
    id bigint NOT NULL,
    rfid_identity character varying(255) NOT NULL,
    rfid_type character varying(2) NOT NULL
);


ALTER TABLE public.tdm_rfid OWNER TO tdm;

--
-- TOC entry 261 (class 1259 OID 309982)
-- Dependencies: 6
-- Name: tdm_sessioncorrelation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_sessioncorrelation (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    sessid character varying(255) NOT NULL,
    counts integer NOT NULL
);


ALTER TABLE public.tdm_sessioncorrelation OWNER TO tdm;

--
-- TOC entry 262 (class 1259 OID 309985)
-- Dependencies: 6
-- Name: tdm_shift; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_shift (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255) NOT NULL,
    starttime time without time zone NOT NULL,
    endtime time without time zone NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_shift OWNER TO tdm;

--
-- TOC entry 263 (class 1259 OID 309988)
-- Dependencies: 6
-- Name: tdm_shiftmodel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_shiftmodel (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    monday boolean NOT NULL,
    tuesday boolean NOT NULL,
    wednesday boolean NOT NULL,
    thursday boolean NOT NULL,
    friday boolean NOT NULL,
    saturday boolean NOT NULL,
    sunday boolean NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_shiftmodel OWNER TO tdm;

--
-- TOC entry 264 (class 1259 OID 309994)
-- Dependencies: 6
-- Name: tdm_shiftmodel_tdm_shift; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_shiftmodel_tdm_shift (
    tdm_shiftmodel_id bigint NOT NULL,
    shifts_id bigint NOT NULL
);


ALTER TABLE public.tdm_shiftmodel_tdm_shift OWNER TO tdm;

--
-- TOC entry 265 (class 1259 OID 309997)
-- Dependencies: 6
-- Name: tdm_shock; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_shock (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    "timestamp" timestamp without time zone NOT NULL,
    aggregatesince bigint NOT NULL,
    sessionid character varying(255) NOT NULL,
    occurrencetime timestamp without time zone NOT NULL,
    shocktotal real,
    directional boolean,
    vehicle_id bigint NOT NULL
);


ALTER TABLE public.tdm_shock OWNER TO tdm;

--
-- TOC entry 266 (class 1259 OID 310000)
-- Dependencies: 6
-- Name: tdm_shockanalysisreportparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_shockanalysisreportparameter (
    id bigint NOT NULL
);


ALTER TABLE public.tdm_shockanalysisreportparameter OWNER TO tdm;

--
-- TOC entry 267 (class 1259 OID 310003)
-- Dependencies: 6
-- Name: tdm_shockanalysisreportparameter_tdm_vehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_shockanalysisreportparameter_tdm_vehicle (
    tdm_shockanalysisreportparameter_id bigint NOT NULL,
    vehicles_id bigint NOT NULL
);


ALTER TABLE public.tdm_shockanalysisreportparameter_tdm_vehicle OWNER TO tdm;

--
-- TOC entry 268 (class 1259 OID 310006)
-- Dependencies: 6
-- Name: tdm_simultaneouslyusedvehiclesreportparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_simultaneouslyusedvehiclesreportparameter (
    id bigint NOT NULL
);


ALTER TABLE public.tdm_simultaneouslyusedvehiclesreportparameter OWNER TO tdm;

--
-- TOC entry 269 (class 1259 OID 310009)
-- Dependencies: 6
-- Name: tdm_simultaneouslyusedvehiclesreportparameter_tdm_vehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_simultaneouslyusedvehiclesreportparameter_tdm_vehicle (
    tdm_simultaneouslyusedvehiclesreportparameter_id bigint NOT NULL,
    vehicles_id bigint NOT NULL
);


ALTER TABLE public.tdm_simultaneouslyusedvehiclesreportparameter_tdm_vehicle OWNER TO tdm;

--
-- TOC entry 270 (class 1259 OID 310012)
-- Dependencies: 6
-- Name: tdm_synchronisationdata; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_synchronisationdata (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    objectid bigint NOT NULL,
    synchronisationmessagetype character varying(255) NOT NULL,
    messageid character varying(255),
    timestampsync timestamp without time zone,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_synchronisationdata OWNER TO tdm;

--
-- TOC entry 271 (class 1259 OID 310018)
-- Dependencies: 6
-- Name: tdm_templates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_templates (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    templatename character varying(255) NOT NULL,
    entityname character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_templates OWNER TO tdm;

--
-- TOC entry 272 (class 1259 OID 310024)
-- Dependencies: 6
-- Name: tdm_templates_property; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_templates_property (
    id bigint NOT NULL,
    version bigint NOT NULL,
    propertyname character varying(255) NOT NULL,
    propertyvalue character varying(255) NOT NULL,
    template_id bigint
);


ALTER TABLE public.tdm_templates_property OWNER TO tdm;

--
-- TOC entry 273 (class 1259 OID 310030)
-- Dependencies: 6
-- Name: tdm_unknownvehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_unknownvehicle (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    serialnumber character varying(255) NOT NULL,
    phonenumber character varying(255) NOT NULL
);


ALTER TABLE public.tdm_unknownvehicle OWNER TO tdm;

--
-- TOC entry 274 (class 1259 OID 310036)
-- Dependencies: 6
-- Name: tdm_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_user (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    personnelnumber character varying(255),
    lastname character varying(255),
    firstname character varying(255),
    shortmark character varying(255),
    lockflag boolean NOT NULL,
    password character varying(255),
    username character varying(255) NOT NULL,
    organisationalunit_id bigint,
    address_id bigint NOT NULL,
    userprofile_id bigint NOT NULL,
    client_id bigint NOT NULL,
    firstlogin boolean NOT NULL
);


ALTER TABLE public.tdm_user OWNER TO tdm;

--
-- TOC entry 275 (class 1259 OID 310042)
-- Dependencies: 6
-- Name: tdm_user_roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_user_roles (
    tdm_user_id bigint NOT NULL,
    element character varying(255)
);


ALTER TABLE public.tdm_user_roles OWNER TO tdm;

--
-- TOC entry 276 (class 1259 OID 310045)
-- Dependencies: 6
-- Name: tdm_usermessage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_usermessage (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    messagekey character varying(255) NOT NULL,
    shortmessagekey character varying(255) NOT NULL,
    priority integer NOT NULL,
    read boolean NOT NULL,
    relating integer NOT NULL,
    recipient_id bigint,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_usermessage OWNER TO tdm;

--
-- TOC entry 277 (class 1259 OID 310051)
-- Dependencies: 6
-- Name: tdm_usermessage_tdm_messageparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_usermessage_tdm_messageparameter (
    tdm_usermessage_id bigint NOT NULL,
    messageparameter_id bigint NOT NULL
);


ALTER TABLE public.tdm_usermessage_tdm_messageparameter OWNER TO tdm;

--
-- TOC entry 278 (class 1259 OID 310054)
-- Dependencies: 6
-- Name: tdm_userprofile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_userprofile (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    locale character varying(255)
);


ALTER TABLE public.tdm_userprofile OWNER TO tdm;

--
-- TOC entry 279 (class 1259 OID 310057)
-- Dependencies: 2530 6
-- Name: tdm_vehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicle (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255) NOT NULL,
    inventorynumber character varying(255),
    info character varying(255),
    serialnumber character varying(12) NOT NULL,
    localidentifier integer NOT NULL,
    watingforrelease timestamp without time zone,
    organisationalunit_id bigint NOT NULL,
    vehiclemodel_id bigint NOT NULL,
    client_id bigint NOT NULL,
    vehicledataunit_id bigint,
    vehicleconfiguration_id bigint NOT NULL,
    CONSTRAINT tdm_vehicle_localidentifier_check CHECK (((localidentifier >= 1) AND (localidentifier <= 255)))
);


ALTER TABLE public.tdm_vehicle OWNER TO tdm;

--
-- TOC entry 280 (class 1259 OID 310064)
-- Dependencies: 6
-- Name: tdm_vehicleaccident; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicleaccident (
    id bigint NOT NULL,
    silentrunning boolean NOT NULL,
    sendimmediately boolean NOT NULL
);


ALTER TABLE public.tdm_vehicleaccident OWNER TO tdm;

--
-- TOC entry 281 (class 1259 OID 310067)
-- Dependencies: 2531 6
-- Name: tdm_vehiclebasedata; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehiclebasedata (
    id bigint NOT NULL,
    yearofconstruction bigint NOT NULL,
    bringingintoservicedate date,
    bringingintoserviceoperatinghours bigint,
    evaluation_id bigint,
    CONSTRAINT tdm_vehiclebasedata_yearofconstruction_check CHECK (((yearofconstruction >= 0) AND (yearofconstruction <= 9999)))
);


ALTER TABLE public.tdm_vehiclebasedata OWNER TO tdm;

--
-- TOC entry 282 (class 1259 OID 310071)
-- Dependencies: 6
-- Name: tdm_vehiclecategory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehiclecategory (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_vehiclecategory OWNER TO tdm;

--
-- TOC entry 283 (class 1259 OID 310074)
-- Dependencies: 6
-- Name: tdm_vehicleclass; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicleclass (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_vehicleclass OWNER TO tdm;

--
-- TOC entry 284 (class 1259 OID 310080)
-- Dependencies: 6
-- Name: tdm_vehicleconfiguration; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicleconfiguration (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255) NOT NULL,
    uccinterval integer NOT NULL,
    pinlength integer NOT NULL,
    enterkey boolean NOT NULL,
    preshiftcheckactive boolean NOT NULL,
    autologoff integer,
    cominghome integer,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_vehicleconfiguration OWNER TO tdm;

--
-- TOC entry 285 (class 1259 OID 310083)
-- Dependencies: 6
-- Name: tdm_vehicledata; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicledata (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    discriminator character varying(255),
    vehicle_id bigint,
    vehiclemodel_id bigint
);


ALTER TABLE public.tdm_vehicledata OWNER TO tdm;

--
-- TOC entry 286 (class 1259 OID 310086)
-- Dependencies: 6
-- Name: tdm_vehicledataunit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicledataunit (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    active boolean NOT NULL,
    dataunittype character varying(255) NOT NULL,
    vehicleidentifiertype character varying(255) NOT NULL,
    identifier character varying(255) NOT NULL,
    dateofinstallation date,
    communicationchannel character varying(255),
    phone character varying(255),
    vehiclestatus character varying(255) NOT NULL,
    errorcloudactive boolean NOT NULL,
    deletedsince bigint NOT NULL
);


ALTER TABLE public.tdm_vehicledataunit OWNER TO tdm;

--
-- TOC entry 287 (class 1259 OID 310092)
-- Dependencies: 6
-- Name: tdm_vehicleenvironment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicleenvironment (
    id bigint NOT NULL,
    lightingsystem character varying(255),
    searchlight character varying(255),
    allaroundlight character varying(255),
    ovenprotectionshed character varying(255),
    seat character varying(255)
);


ALTER TABLE public.tdm_vehicleenvironment OWNER TO tdm;

--
-- TOC entry 288 (class 1259 OID 310098)
-- Dependencies: 6
-- Name: tdm_vehicleerror; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicleerror (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    "timestamp" timestamp without time zone NOT NULL,
    errorcode character varying(10) NOT NULL,
    errorocurrencetime timestamp without time zone NOT NULL,
    errormessage character varying(100) NOT NULL,
    vehicle_id bigint NOT NULL
);


ALTER TABLE public.tdm_vehicleerror OWNER TO tdm;

--
-- TOC entry 289 (class 1259 OID 310101)
-- Dependencies: 6
-- Name: tdm_vehicleevaluation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicleevaluation (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_vehicleevaluation OWNER TO tdm;

--
-- TOC entry 290 (class 1259 OID 310107)
-- Dependencies: 2532 2533 6
-- Name: tdm_vehiclelocation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehiclelocation (
    id bigint NOT NULL,
    version bigint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    latitude double precision,
    longitude double precision,
    vehicle_id bigint,
    CONSTRAINT tdm_vehiclelocation_latitude_check CHECK (((latitude >= ((-90))::double precision) AND (latitude <= (90)::double precision))),
    CONSTRAINT tdm_vehiclelocation_longitude_check CHECK (((longitude >= ((-180))::double precision) AND (longitude <= (180)::double precision)))
);


ALTER TABLE public.tdm_vehiclelocation OWNER TO tdm;

--
-- TOC entry 291 (class 1259 OID 310112)
-- Dependencies: 6
-- Name: tdm_vehiclelogbookreportparameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehiclelogbookreportparameter (
    id bigint NOT NULL
);


ALTER TABLE public.tdm_vehiclelogbookreportparameter OWNER TO tdm;

--
-- TOC entry 292 (class 1259 OID 310115)
-- Dependencies: 6
-- Name: tdm_vehiclelogbookreportparameter_tdm_vehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehiclelogbookreportparameter_tdm_vehicle (
    tdm_vehiclelogbookreportparameter_id bigint NOT NULL,
    vehicles_id bigint NOT NULL
);


ALTER TABLE public.tdm_vehiclelogbookreportparameter_tdm_vehicle OWNER TO tdm;

--
-- TOC entry 293 (class 1259 OID 310118)
-- Dependencies: 6
-- Name: tdm_vehiclemaintenance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehiclemaintenance (
    id bigint NOT NULL,
    exhaustservice_id bigint,
    maintenanceservice_id bigint NOT NULL,
    uvvservice_id bigint NOT NULL,
    guarantee_id bigint NOT NULL
);


ALTER TABLE public.tdm_vehiclemaintenance OWNER TO tdm;

--
-- TOC entry 294 (class 1259 OID 310121)
-- Dependencies: 6
-- Name: tdm_vehiclemanufacturer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehiclemanufacturer (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    name character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_vehiclemanufacturer OWNER TO tdm;

--
-- TOC entry 295 (class 1259 OID 310124)
-- Dependencies: 6
-- Name: tdm_vehiclemodel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehiclemodel (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255) NOT NULL,
    vehicledrive character varying(255),
    load integer,
    speed integer,
    vehicleseries_id bigint,
    vehiclecategory_id bigint,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_vehiclemodel OWNER TO tdm;

--
-- TOC entry 296 (class 1259 OID 310130)
-- Dependencies: 6
-- Name: tdm_vehiclemodeldata; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehiclemodeldata (
    id bigint NOT NULL,
    manufacturer_id bigint,
    vehicleclass_id bigint
);


ALTER TABLE public.tdm_vehiclemodeldata OWNER TO tdm;

--
-- TOC entry 297 (class 1259 OID 310133)
-- Dependencies: 6
-- Name: tdm_vehicleprofile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicleprofile (
    id bigint NOT NULL,
    contracttype character varying(255),
    termofcontract double precision,
    contractstartdate date,
    contractenddate date,
    purchaseprice double precision,
    ordernumber character varying(255),
    typeofbusiness character varying(255),
    distributor character varying(255),
    batteryrate double precision,
    chargerrate double precision,
    attachmentrate double precision
);


ALTER TABLE public.tdm_vehicleprofile OWNER TO tdm;

--
-- TOC entry 298 (class 1259 OID 310139)
-- Dependencies: 6
-- Name: tdm_vehicleseries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicleseries (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    deletedsince bigint NOT NULL,
    name character varying(255) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.tdm_vehicleseries OWNER TO tdm;

--
-- TOC entry 299 (class 1259 OID 310142)
-- Dependencies: 2534 2535 2536 6
-- Name: tdm_vehicleservice; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicleservice (
    id bigint NOT NULL,
    serviceintervalactive boolean NOT NULL,
    dateoflastservice date NOT NULL,
    monthstonextservice integer,
    operatinghoursoflastservice integer NOT NULL,
    operatinghourstonextservice integer,
    dateofmovedservice date,
    moved boolean NOT NULL,
    dateofoperatinghoursservice date,
    CONSTRAINT tdm_vehicleservice_monthstonextservice_check CHECK (((monthstonextservice >= 1) AND (monthstonextservice <= 99))),
    CONSTRAINT tdm_vehicleservice_operatinghoursoflastservice_check CHECK ((operatinghoursoflastservice >= 0)),
    CONSTRAINT tdm_vehicleservice_operatinghourstonextservice_check CHECK ((operatinghourstonextservice >= 0))
);


ALTER TABLE public.tdm_vehicleservice OWNER TO tdm;

--
-- TOC entry 300 (class 1259 OID 310148)
-- Dependencies: 6
-- Name: tdm_vehicleshock; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicleshock (
    id bigint NOT NULL,
    active boolean NOT NULL,
    boundary bigint,
    reduceactive boolean NOT NULL,
    reduceboundary bigint,
    velocity bigint,
    sendimmediately boolean NOT NULL
);


ALTER TABLE public.tdm_vehicleshock OWNER TO tdm;

--
-- TOC entry 301 (class 1259 OID 310151)
-- Dependencies: 6
-- Name: tdm_vehicleswitchtimes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicleswitchtimes (
    id bigint NOT NULL,
    version bigint NOT NULL,
    createdtimestamp timestamp without time zone NOT NULL,
    updatedtimestamp timestamp without time zone,
    "timestamp" timestamp without time zone NOT NULL,
    readouttime timestamp without time zone NOT NULL,
    readoutduration bigint NOT NULL,
    keyswitchtime integer,
    accesstime integer,
    seatswitchtime integer,
    vehicle_id bigint NOT NULL
);


ALTER TABLE public.tdm_vehicleswitchtimes OWNER TO tdm;

--
-- TOC entry 302 (class 1259 OID 310154)
-- Dependencies: 6
-- Name: tdm_vehicletechnology; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicletechnology (
    id bigint NOT NULL,
    height double precision,
    emptyweight double precision,
    totalweight double precision,
    fronttrack double precision,
    reartrack double precision,
    drivecontrol character varying(255),
    combustionengine character varying(255),
    exhaustsystem character varying(255),
    aircleaner character varying(255),
    batteryvoltage character varying(255)
);


ALTER TABLE public.tdm_vehicletechnology OWNER TO tdm;

--
-- TOC entry 303 (class 1259 OID 310160)
-- Dependencies: 6
-- Name: tdm_vehicletire; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vehicletire (
    id bigint NOT NULL,
    typefront character varying(255),
    sizefront character varying(255),
    typerear character varying(255),
    sizerear character varying(255)
);


ALTER TABLE public.tdm_vehicletire OWNER TO tdm;

--
-- TOC entry 304 (class 1259 OID 310166)
-- Dependencies: 6
-- Name: tdm_vendor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tdm_vendor (
    id bigint NOT NULL
);


ALTER TABLE public.tdm_vendor OWNER TO tdm;

--
-- TOC entry 2538 (class 2606 OID 310202)
-- Dependencies: 174 174
-- Name: tdm_abstractreportparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_abstractreportparameter
    ADD CONSTRAINT tdm_abstractreportparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 310204)
-- Dependencies: 177 177
-- Name: tdm_access_collection_card_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT tdm_access_collection_card_id_key UNIQUE (card_id);


--
-- TOC entry 2542 (class 2606 OID 310206)
-- Dependencies: 177 177
-- Name: tdm_access_collection_driver_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT tdm_access_collection_driver_id_key UNIQUE (driver_id);


--
-- TOC entry 2544 (class 2606 OID 310208)
-- Dependencies: 177 177
-- Name: tdm_access_collection_lightfeatures_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT tdm_access_collection_lightfeatures_id_key UNIQUE (lightfeatures_id);


--
-- TOC entry 2546 (class 2606 OID 310210)
-- Dependencies: 177 177 177 177
-- Name: tdm_access_collection_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT tdm_access_collection_name_key UNIQUE (name, client_id, deletedsince);


--
-- TOC entry 2548 (class 2606 OID 310212)
-- Dependencies: 177 177
-- Name: tdm_access_collection_pin_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT tdm_access_collection_pin_id_key UNIQUE (pin_id);


--
-- TOC entry 2550 (class 2606 OID 310214)
-- Dependencies: 177 177
-- Name: tdm_access_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT tdm_access_collection_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 310216)
-- Dependencies: 177 177
-- Name: tdm_access_collection_reduction_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT tdm_access_collection_reduction_id_key UNIQUE (reduction_id);


--
-- TOC entry 2554 (class 2606 OID 310218)
-- Dependencies: 177 177
-- Name: tdm_access_collection_rfid_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT tdm_access_collection_rfid_id_key UNIQUE (rfid_id);


--
-- TOC entry 2556 (class 2606 OID 310220)
-- Dependencies: 178 178
-- Name: tdm_access_id_generator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_access_id_generator
    ADD CONSTRAINT tdm_access_id_generator_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 310222)
-- Dependencies: 181 181 181
-- Name: tdm_access_token_assignment_accesstoken_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_access_token_assignment
    ADD CONSTRAINT tdm_access_token_assignment_accesstoken_id_key UNIQUE (accesstoken_id, vehicle_id);


--
-- TOC entry 2565 (class 2606 OID 310224)
-- Dependencies: 181 181
-- Name: tdm_access_token_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_access_token_assignment
    ADD CONSTRAINT tdm_access_token_assignment_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 310226)
-- Dependencies: 180 180
-- Name: tdm_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_access_token
    ADD CONSTRAINT tdm_access_token_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 310228)
-- Dependencies: 180 180
-- Name: tdm_access_token_tdmaccessid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_access_token
    ADD CONSTRAINT tdm_access_token_tdmaccessid_key UNIQUE (tdmaccessid);


--
-- TOC entry 2567 (class 2606 OID 310230)
-- Dependencies: 182 182
-- Name: tdm_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_address
    ADD CONSTRAINT tdm_address_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 310232)
-- Dependencies: 183 183
-- Name: tdm_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_attachment
    ADD CONSTRAINT tdm_attachment_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 310234)
-- Dependencies: 183 183 183 183
-- Name: tdm_attachment_serialnumber_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_attachment
    ADD CONSTRAINT tdm_attachment_serialnumber_key UNIQUE (serialnumber, client_id, deletedsince);


--
-- TOC entry 2573 (class 2606 OID 310236)
-- Dependencies: 184 184 184
-- Name: tdm_attachmentmanufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_attachmentmanufacturer
    ADD CONSTRAINT tdm_attachmentmanufacturer_name_key UNIQUE (name, client_id);


--
-- TOC entry 2575 (class 2606 OID 310238)
-- Dependencies: 184 184
-- Name: tdm_attachmentmanufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_attachmentmanufacturer
    ADD CONSTRAINT tdm_attachmentmanufacturer_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 310240)
-- Dependencies: 185 185 185
-- Name: tdm_attachmentmodel_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_attachmentmodel
    ADD CONSTRAINT tdm_attachmentmodel_name_key UNIQUE (name, client_id);


--
-- TOC entry 2579 (class 2606 OID 310242)
-- Dependencies: 185 185
-- Name: tdm_attachmentmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_attachmentmodel
    ADD CONSTRAINT tdm_attachmentmodel_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 310244)
-- Dependencies: 186 186
-- Name: tdm_attachmenttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_attachmenttemplate
    ADD CONSTRAINT tdm_attachmenttemplate_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 310246)
-- Dependencies: 186 186 186 186
-- Name: tdm_attachmenttemplate_templatename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_attachmenttemplate
    ADD CONSTRAINT tdm_attachmenttemplate_templatename_key UNIQUE (templatename, client_id, deletedsince);


--
-- TOC entry 2585 (class 2606 OID 310248)
-- Dependencies: 187 187
-- Name: tdm_battery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_battery
    ADD CONSTRAINT tdm_battery_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 310250)
-- Dependencies: 187 187 187 187
-- Name: tdm_battery_serialnumber_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_battery
    ADD CONSTRAINT tdm_battery_serialnumber_key UNIQUE (serialnumber, client_id, deletedsince);


--
-- TOC entry 2589 (class 2606 OID 310252)
-- Dependencies: 188 188 188
-- Name: tdm_batterymanufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_batterymanufacturer
    ADD CONSTRAINT tdm_batterymanufacturer_name_key UNIQUE (name, client_id);


--
-- TOC entry 2591 (class 2606 OID 310254)
-- Dependencies: 188 188
-- Name: tdm_batterymanufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_batterymanufacturer
    ADD CONSTRAINT tdm_batterymanufacturer_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 310256)
-- Dependencies: 189 189 189
-- Name: tdm_batterymodel_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_batterymodel
    ADD CONSTRAINT tdm_batterymodel_name_key UNIQUE (name, client_id);


--
-- TOC entry 2595 (class 2606 OID 310258)
-- Dependencies: 189 189
-- Name: tdm_batterymodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_batterymodel
    ADD CONSTRAINT tdm_batterymodel_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 310260)
-- Dependencies: 190 190
-- Name: tdm_card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_card
    ADD CONSTRAINT tdm_card_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 310262)
-- Dependencies: 191 191
-- Name: tdm_charger_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_charger
    ADD CONSTRAINT tdm_charger_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 310264)
-- Dependencies: 191 191 191 191
-- Name: tdm_charger_serialnumber_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_charger
    ADD CONSTRAINT tdm_charger_serialnumber_key UNIQUE (serialnumber, client_id, deletedsince);


--
-- TOC entry 2603 (class 2606 OID 310266)
-- Dependencies: 192 192 192
-- Name: tdm_chargermanufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_chargermanufacturer
    ADD CONSTRAINT tdm_chargermanufacturer_name_key UNIQUE (name, client_id);


--
-- TOC entry 2605 (class 2606 OID 310268)
-- Dependencies: 192 192
-- Name: tdm_chargermanufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_chargermanufacturer
    ADD CONSTRAINT tdm_chargermanufacturer_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 310270)
-- Dependencies: 193 193 193
-- Name: tdm_chargermodel_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_chargermodel
    ADD CONSTRAINT tdm_chargermodel_name_key UNIQUE (name, client_id);


--
-- TOC entry 2609 (class 2606 OID 310272)
-- Dependencies: 193 193
-- Name: tdm_chargermodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_chargermodel
    ADD CONSTRAINT tdm_chargermodel_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 310274)
-- Dependencies: 194 194
-- Name: tdm_chargertemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_chargertemplate
    ADD CONSTRAINT tdm_chargertemplate_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 310276)
-- Dependencies: 194 194 194 194
-- Name: tdm_chargertemplate_templatename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_chargertemplate
    ADD CONSTRAINT tdm_chargertemplate_templatename_key UNIQUE (templatename, client_id, deletedsince);


--
-- TOC entry 2617 (class 2606 OID 310278)
-- Dependencies: 195 195
-- Name: tdm_client_clientid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_client
    ADD CONSTRAINT tdm_client_clientid_key UNIQUE (clientid);


--
-- TOC entry 2619 (class 2606 OID 310280)
-- Dependencies: 195 195
-- Name: tdm_client_clientname_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_client
    ADD CONSTRAINT tdm_client_clientname_key UNIQUE (clientname);


--
-- TOC entry 2621 (class 2606 OID 310282)
-- Dependencies: 195 195
-- Name: tdm_client_clientprofile_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_client
    ADD CONSTRAINT tdm_client_clientprofile_id_key UNIQUE (clientprofile_id);


--
-- TOC entry 2623 (class 2606 OID 310284)
-- Dependencies: 195 195
-- Name: tdm_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_client
    ADD CONSTRAINT tdm_client_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 310286)
-- Dependencies: 196 196
-- Name: tdm_clientprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_clientprofile
    ADD CONSTRAINT tdm_clientprofile_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 310288)
-- Dependencies: 198 198 198
-- Name: tdm_crash_brakeactuation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_crash_brakeactuation
    ADD CONSTRAINT tdm_crash_brakeactuation_pkey PRIMARY KEY (tdm_crash_id, mapkey);


--
-- TOC entry 2631 (class 2606 OID 310290)
-- Dependencies: 199 199 199
-- Name: tdm_crash_drivingspeed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_crash_drivingspeed
    ADD CONSTRAINT tdm_crash_drivingspeed_pkey PRIMARY KEY (tdm_crash_id, mapkey);


--
-- TOC entry 2633 (class 2606 OID 310292)
-- Dependencies: 200 200 200
-- Name: tdm_crash_features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_crash_features
    ADD CONSTRAINT tdm_crash_features_pkey PRIMARY KEY (tdm_crash_id, mapkey);


--
-- TOC entry 2627 (class 2606 OID 310294)
-- Dependencies: 197 197
-- Name: tdm_crash_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_crash
    ADD CONSTRAINT tdm_crash_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 310296)
-- Dependencies: 201 201 201
-- Name: tdm_crash_steeringangle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_crash_steeringangle
    ADD CONSTRAINT tdm_crash_steeringangle_pkey PRIMARY KEY (tdm_crash_id, mapkey);


--
-- TOC entry 2637 (class 2606 OID 310298)
-- Dependencies: 202 202
-- Name: tdm_crashdetailsreportparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_crashdetailsreportparameter
    ADD CONSTRAINT tdm_crashdetailsreportparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 310300)
-- Dependencies: 204 204
-- Name: tdm_customer_address_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_customer
    ADD CONSTRAINT tdm_customer_address_id_key UNIQUE (address_id);


--
-- TOC entry 2641 (class 2606 OID 310302)
-- Dependencies: 204 204
-- Name: tdm_customer_fleetid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_customer
    ADD CONSTRAINT tdm_customer_fleetid_key UNIQUE (fleetid);


--
-- TOC entry 2643 (class 2606 OID 310304)
-- Dependencies: 204 204
-- Name: tdm_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_customer
    ADD CONSTRAINT tdm_customer_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 310306)
-- Dependencies: 207 207 207 207
-- Name: tdm_driver_personnelnumber_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_driver
    ADD CONSTRAINT tdm_driver_personnelnumber_key UNIQUE (personnelnumber, client_id, deletedsince);


--
-- TOC entry 2647 (class 2606 OID 310308)
-- Dependencies: 207 207
-- Name: tdm_driver_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_driver
    ADD CONSTRAINT tdm_driver_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 310310)
-- Dependencies: 208 208
-- Name: tdm_driveraccesslistreportparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_driveraccesslistreportparameter
    ADD CONSTRAINT tdm_driveraccesslistreportparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 310312)
-- Dependencies: 210 210 210 210
-- Name: tdm_drivergroup_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_drivergroup
    ADD CONSTRAINT tdm_drivergroup_name_key UNIQUE (name, client_id, deletedsince);


--
-- TOC entry 2653 (class 2606 OID 310314)
-- Dependencies: 210 210
-- Name: tdm_drivergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_drivergroup
    ADD CONSTRAINT tdm_drivergroup_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 310316)
-- Dependencies: 211 211
-- Name: tdm_driverlicence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_driverlicence
    ADD CONSTRAINT tdm_driverlicence_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 310318)
-- Dependencies: 212 212 212 212
-- Name: tdm_driverlicenceclass_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_driverlicenceclass
    ADD CONSTRAINT tdm_driverlicenceclass_name_key UNIQUE (name, client_id, deletedsince);


--
-- TOC entry 2659 (class 2606 OID 310320)
-- Dependencies: 212 212
-- Name: tdm_driverlicenceclass_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_driverlicenceclass
    ADD CONSTRAINT tdm_driverlicenceclass_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 310322)
-- Dependencies: 214 214
-- Name: tdm_driverlogbookreportparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_driverlogbookreportparameter
    ADD CONSTRAINT tdm_driverlogbookreportparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 310324)
-- Dependencies: 216 216
-- Name: tdm_driverlogin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_driverlogin
    ADD CONSTRAINT tdm_driverlogin_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 310326)
-- Dependencies: 217 217
-- Name: tdm_driverlogout_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_driverlogout
    ADD CONSTRAINT tdm_driverlogout_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 310328)
-- Dependencies: 218 218
-- Name: tdm_drivertemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_drivertemplate
    ADD CONSTRAINT tdm_drivertemplate_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 310330)
-- Dependencies: 218 218 218 218
-- Name: tdm_drivertemplate_templatename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_drivertemplate
    ADD CONSTRAINT tdm_drivertemplate_templatename_key UNIQUE (templatename, client_id, deletedsince);


--
-- TOC entry 2674 (class 2606 OID 310332)
-- Dependencies: 219 219
-- Name: tdm_energyconsumption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_energyconsumption
    ADD CONSTRAINT tdm_energyconsumption_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 310336)
-- Dependencies: 220 220
-- Name: tdm_evaluation_dynamicdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_evaluation_dynamicdata
    ADD CONSTRAINT tdm_evaluation_dynamicdata_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 310338)
-- Dependencies: 221 221
-- Name: tdm_fleetusagereportparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_fleetusagereportparameter
    ADD CONSTRAINT tdm_fleetusagereportparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 310340)
-- Dependencies: 223 223
-- Name: tdm_frontend_frontendid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_frontend
    ADD CONSTRAINT tdm_frontend_frontendid_key UNIQUE (frontendid);


--
-- TOC entry 2682 (class 2606 OID 310342)
-- Dependencies: 223 223 223
-- Name: tdm_frontend_frontendkey_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_frontend
    ADD CONSTRAINT tdm_frontend_frontendkey_key UNIQUE (frontendkey, client_id);


--
-- TOC entry 2684 (class 2606 OID 310344)
-- Dependencies: 223 223
-- Name: tdm_frontend_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_frontend
    ADD CONSTRAINT tdm_frontend_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 310346)
-- Dependencies: 224 224
-- Name: tdm_guarantee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_guarantee
    ADD CONSTRAINT tdm_guarantee_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 310348)
-- Dependencies: 225 225
-- Name: tdm_licence_licencekey_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_licence
    ADD CONSTRAINT tdm_licence_licencekey_key UNIQUE (licencekey);


--
-- TOC entry 2690 (class 2606 OID 310350)
-- Dependencies: 225 225
-- Name: tdm_licence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_licence
    ADD CONSTRAINT tdm_licence_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 310352)
-- Dependencies: 226 226
-- Name: tdm_liftanddrivereportparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_liftanddrivereportparameter
    ADD CONSTRAINT tdm_liftanddrivereportparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 310354)
-- Dependencies: 228 228
-- Name: tdm_liftanddrivetimes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_liftanddrivetimes
    ADD CONSTRAINT tdm_liftanddrivetimes_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 310360)
-- Dependencies: 229 229
-- Name: tdm_lightfeatures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_lightfeatures
    ADD CONSTRAINT tdm_lightfeatures_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 310362)
-- Dependencies: 230 230
-- Name: tdm_loadtransportation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_loadtransportation
    ADD CONSTRAINT tdm_loadtransportation_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 310364)
-- Dependencies: 232 232 232
-- Name: tdm_loadtransportationhistogram_addeddistances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_loadtransportationhistogram_addeddistances
    ADD CONSTRAINT tdm_loadtransportationhistogram_addeddistances_pkey PRIMARY KEY (tdm_loadtransportationhistogram_id, mapkey);


--
-- TOC entry 2707 (class 2606 OID 310367)
-- Dependencies: 233 233 233
-- Name: tdm_loadtransportationhistogram_distanceswithload_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_loadtransportationhistogram_distanceswithload
    ADD CONSTRAINT tdm_loadtransportationhistogram_distanceswithload_pkey PRIMARY KEY (tdm_loadtransportationhistogram_id, mapkey);


--
-- TOC entry 2703 (class 2606 OID 310369)
-- Dependencies: 231 231
-- Name: tdm_loadtransportationhistogram_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_loadtransportationhistogram
    ADD CONSTRAINT tdm_loadtransportationhistogram_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 310371)
-- Dependencies: 234 234
-- Name: tdm_logbook_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_logbook
    ADD CONSTRAINT tdm_logbook_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 310373)
-- Dependencies: 235 235
-- Name: tdm_loggedin_dynamicdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_loggedin_dynamicdata
    ADD CONSTRAINT tdm_loggedin_dynamicdata_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 310375)
-- Dependencies: 236 236
-- Name: tdm_logmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_logmessage
    ADD CONSTRAINT tdm_logmessage_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 310377)
-- Dependencies: 237 237
-- Name: tdm_logmessage_tdm_messageparameter_parameters_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_logmessage_tdm_messageparameter
    ADD CONSTRAINT tdm_logmessage_tdm_messageparameter_parameters_id_key UNIQUE (parameters_id);


--
-- TOC entry 2720 (class 2606 OID 310379)
-- Dependencies: 237 237 237
-- Name: tdm_logmessage_tdm_messageparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_logmessage_tdm_messageparameter
    ADD CONSTRAINT tdm_logmessage_tdm_messageparameter_pkey PRIMARY KEY (tdm_logmessage_id, parameters_id);


--
-- TOC entry 2722 (class 2606 OID 310381)
-- Dependencies: 238 238
-- Name: tdm_mast_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_mast
    ADD CONSTRAINT tdm_mast_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 310383)
-- Dependencies: 239 239
-- Name: tdm_maxloadreportparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_maxloadreportparameter
    ADD CONSTRAINT tdm_maxloadreportparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 310385)
-- Dependencies: 241 241
-- Name: tdm_messageparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_messageparameter
    ADD CONSTRAINT tdm_messageparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 310387)
-- Dependencies: 242 242 242
-- Name: tdm_nonusermessagerecipient_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_nonusermessagerecipient
    ADD CONSTRAINT tdm_nonusermessagerecipient_name_key UNIQUE (name, client_id);


--
-- TOC entry 2730 (class 2606 OID 310389)
-- Dependencies: 242 242
-- Name: tdm_nonusermessagerecipient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_nonusermessagerecipient
    ADD CONSTRAINT tdm_nonusermessagerecipient_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 310391)
-- Dependencies: 243 243
-- Name: tdm_operatinghour_dynamicdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_operatinghour_dynamicdata
    ADD CONSTRAINT tdm_operatinghour_dynamicdata_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 310393)
-- Dependencies: 244 244
-- Name: tdm_operatinghours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_operatinghours
    ADD CONSTRAINT tdm_operatinghours_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 310395)
-- Dependencies: 245 245 245 245 245
-- Name: tdm_organisationalunit_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_organisationalunit
    ADD CONSTRAINT tdm_organisationalunit_name_key UNIQUE (name, organisationalunit_id, client_id, deletedsince);


--
-- TOC entry 2738 (class 2606 OID 310397)
-- Dependencies: 245 245
-- Name: tdm_organisationalunit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_organisationalunit
    ADD CONSTRAINT tdm_organisationalunit_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 310399)
-- Dependencies: 247 247
-- Name: tdm_outstandingmaintenanceparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_outstandingmaintenanceparameter
    ADD CONSTRAINT tdm_outstandingmaintenanceparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 310401)
-- Dependencies: 249 249
-- Name: tdm_overviewsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_overviewsettings
    ADD CONSTRAINT tdm_overviewsettings_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 310403)
-- Dependencies: 251 251
-- Name: tdm_performedmaintenance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_performedmaintenance
    ADD CONSTRAINT tdm_performedmaintenance_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 310405)
-- Dependencies: 252 252
-- Name: tdm_performedmaintenanceparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_performedmaintenanceparameter
    ADD CONSTRAINT tdm_performedmaintenanceparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 310407)
-- Dependencies: 254 254
-- Name: tdm_pin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_pin
    ADD CONSTRAINT tdm_pin_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 310409)
-- Dependencies: 255 255
-- Name: tdm_preshiftcheck_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_preshiftcheck
    ADD CONSTRAINT tdm_preshiftcheck_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 310411)
-- Dependencies: 256 256
-- Name: tdm_preshiftcheckreportparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_preshiftcheckreportparameter
    ADD CONSTRAINT tdm_preshiftcheckreportparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 310413)
-- Dependencies: 258 258 258
-- Name: tdm_profiletype_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_profiletype
    ADD CONSTRAINT tdm_profiletype_name_key UNIQUE (name, client_id);


--
-- TOC entry 2757 (class 2606 OID 310415)
-- Dependencies: 258 258
-- Name: tdm_profiletype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_profiletype
    ADD CONSTRAINT tdm_profiletype_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 310417)
-- Dependencies: 259 259
-- Name: tdm_reduction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_reduction
    ADD CONSTRAINT tdm_reduction_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 310419)
-- Dependencies: 260 260
-- Name: tdm_rfid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_rfid
    ADD CONSTRAINT tdm_rfid_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 310421)
-- Dependencies: 261 261
-- Name: tdm_sessioncorrelation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_sessioncorrelation
    ADD CONSTRAINT tdm_sessioncorrelation_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 310423)
-- Dependencies: 262 262
-- Name: tdm_shift_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_shift
    ADD CONSTRAINT tdm_shift_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 310425)
-- Dependencies: 263 263 263 263
-- Name: tdm_shiftmodel_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_shiftmodel
    ADD CONSTRAINT tdm_shiftmodel_name_key UNIQUE (name, client_id, deletedsince);


--
-- TOC entry 2772 (class 2606 OID 310427)
-- Dependencies: 263 263
-- Name: tdm_shiftmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_shiftmodel
    ADD CONSTRAINT tdm_shiftmodel_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 310429)
-- Dependencies: 264 264
-- Name: tdm_shiftmodel_tdm_shift_shifts_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_shiftmodel_tdm_shift
    ADD CONSTRAINT tdm_shiftmodel_tdm_shift_shifts_id_key UNIQUE (shifts_id);


--
-- TOC entry 2776 (class 2606 OID 310431)
-- Dependencies: 265 265
-- Name: tdm_shock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_shock
    ADD CONSTRAINT tdm_shock_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 310433)
-- Dependencies: 266 266
-- Name: tdm_shockanalysisreportparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_shockanalysisreportparameter
    ADD CONSTRAINT tdm_shockanalysisreportparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 310435)
-- Dependencies: 268 268
-- Name: tdm_simultaneouslyusedvehiclesreportparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_simultaneouslyusedvehiclesreportparameter
    ADD CONSTRAINT tdm_simultaneouslyusedvehiclesreportparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 310437)
-- Dependencies: 270 270
-- Name: tdm_synchronisationdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_synchronisationdata
    ADD CONSTRAINT tdm_synchronisationdata_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 310439)
-- Dependencies: 271 271
-- Name: tdm_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_templates
    ADD CONSTRAINT tdm_templates_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 310441)
-- Dependencies: 272 272
-- Name: tdm_templates_property_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_templates_property
    ADD CONSTRAINT tdm_templates_property_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 310443)
-- Dependencies: 271 271 271 271
-- Name: tdm_templates_templatename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_templates
    ADD CONSTRAINT tdm_templates_templatename_key UNIQUE (templatename, entityname, client_id);


--
-- TOC entry 2790 (class 2606 OID 310445)
-- Dependencies: 273 273
-- Name: tdm_unknownvehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_unknownvehicle
    ADD CONSTRAINT tdm_unknownvehicle_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 310447)
-- Dependencies: 273 273
-- Name: tdm_unknownvehicle_serialnumber_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_unknownvehicle
    ADD CONSTRAINT tdm_unknownvehicle_serialnumber_key UNIQUE (serialnumber);


--
-- TOC entry 2798 (class 2606 OID 310449)
-- Dependencies: 274 274
-- Name: tdm_user_address_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_user
    ADD CONSTRAINT tdm_user_address_id_key UNIQUE (address_id);


--
-- TOC entry 2800 (class 2606 OID 310451)
-- Dependencies: 274 274 274
-- Name: tdm_user_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_user
    ADD CONSTRAINT tdm_user_client_id_key UNIQUE (client_id, username);


--
-- TOC entry 2802 (class 2606 OID 310453)
-- Dependencies: 274 274 274
-- Name: tdm_user_client_id_key1; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_user
    ADD CONSTRAINT tdm_user_client_id_key1 UNIQUE (client_id, personnelnumber);


--
-- TOC entry 2804 (class 2606 OID 310455)
-- Dependencies: 274 274
-- Name: tdm_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_user
    ADD CONSTRAINT tdm_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 310457)
-- Dependencies: 274 274
-- Name: tdm_user_userprofile_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_user
    ADD CONSTRAINT tdm_user_userprofile_id_key UNIQUE (userprofile_id);


--
-- TOC entry 2809 (class 2606 OID 310459)
-- Dependencies: 276 276
-- Name: tdm_usermessage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_usermessage
    ADD CONSTRAINT tdm_usermessage_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 310461)
-- Dependencies: 277 277
-- Name: tdm_usermessage_tdm_messageparameter_messageparameter_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_usermessage_tdm_messageparameter
    ADD CONSTRAINT tdm_usermessage_tdm_messageparameter_messageparameter_id_key UNIQUE (messageparameter_id);


--
-- TOC entry 2813 (class 2606 OID 310463)
-- Dependencies: 278 278
-- Name: tdm_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_userprofile
    ADD CONSTRAINT tdm_userprofile_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 310465)
-- Dependencies: 279 279 279 279
-- Name: tdm_vehicle_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicle
    ADD CONSTRAINT tdm_vehicle_name_key UNIQUE (name, client_id, deletedsince);


--
-- TOC entry 2817 (class 2606 OID 310467)
-- Dependencies: 279 279
-- Name: tdm_vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicle
    ADD CONSTRAINT tdm_vehicle_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 310469)
-- Dependencies: 279 279 279
-- Name: tdm_vehicle_serialnumber_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicle
    ADD CONSTRAINT tdm_vehicle_serialnumber_key UNIQUE (serialnumber, deletedsince);


--
-- TOC entry 2822 (class 2606 OID 310471)
-- Dependencies: 280 280
-- Name: tdm_vehicleaccident_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleaccident
    ADD CONSTRAINT tdm_vehicleaccident_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 310473)
-- Dependencies: 281 281
-- Name: tdm_vehiclebasedata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehiclebasedata
    ADD CONSTRAINT tdm_vehiclebasedata_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 310475)
-- Dependencies: 282 282 282 282
-- Name: tdm_vehiclecategory_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehiclecategory
    ADD CONSTRAINT tdm_vehiclecategory_name_key UNIQUE (name, client_id, deletedsince);


--
-- TOC entry 2828 (class 2606 OID 310477)
-- Dependencies: 282 282
-- Name: tdm_vehiclecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehiclecategory
    ADD CONSTRAINT tdm_vehiclecategory_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 310479)
-- Dependencies: 283 283 283 283
-- Name: tdm_vehicleclass_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleclass
    ADD CONSTRAINT tdm_vehicleclass_name_key UNIQUE (name, client_id, deletedsince);


--
-- TOC entry 2832 (class 2606 OID 310481)
-- Dependencies: 283 283
-- Name: tdm_vehicleclass_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleclass
    ADD CONSTRAINT tdm_vehicleclass_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 310483)
-- Dependencies: 284 284 284 284
-- Name: tdm_vehicleconfiguration_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleconfiguration
    ADD CONSTRAINT tdm_vehicleconfiguration_name_key UNIQUE (name, client_id, deletedsince);


--
-- TOC entry 2836 (class 2606 OID 310485)
-- Dependencies: 284 284
-- Name: tdm_vehicleconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleconfiguration
    ADD CONSTRAINT tdm_vehicleconfiguration_pkey PRIMARY KEY (id);


--
-- TOC entry 2838 (class 2606 OID 310487)
-- Dependencies: 285 285
-- Name: tdm_vehicledata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicledata
    ADD CONSTRAINT tdm_vehicledata_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 310489)
-- Dependencies: 286 286 286 286
-- Name: tdm_vehicledataunit_dataunittype_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicledataunit
    ADD CONSTRAINT tdm_vehicledataunit_dataunittype_key UNIQUE (dataunittype, identifier, deletedsince);


--
-- TOC entry 2842 (class 2606 OID 310491)
-- Dependencies: 286 286
-- Name: tdm_vehicledataunit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicledataunit
    ADD CONSTRAINT tdm_vehicledataunit_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 310493)
-- Dependencies: 287 287
-- Name: tdm_vehicleenvironment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleenvironment
    ADD CONSTRAINT tdm_vehicleenvironment_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 310495)
-- Dependencies: 288 288
-- Name: tdm_vehicleerror_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleerror
    ADD CONSTRAINT tdm_vehicleerror_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 310497)
-- Dependencies: 289 289 289
-- Name: tdm_vehicleevaluation_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleevaluation
    ADD CONSTRAINT tdm_vehicleevaluation_name_key UNIQUE (name, client_id);


--
-- TOC entry 2850 (class 2606 OID 310499)
-- Dependencies: 289 289
-- Name: tdm_vehicleevaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleevaluation
    ADD CONSTRAINT tdm_vehicleevaluation_pkey PRIMARY KEY (id);


--
-- TOC entry 2852 (class 2606 OID 310501)
-- Dependencies: 290 290
-- Name: tdm_vehiclelocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehiclelocation
    ADD CONSTRAINT tdm_vehiclelocation_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 310503)
-- Dependencies: 291 291
-- Name: tdm_vehiclelogbookreportparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehiclelogbookreportparameter
    ADD CONSTRAINT tdm_vehiclelogbookreportparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 310505)
-- Dependencies: 293 293
-- Name: tdm_vehiclemaintenance_guarantee_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehiclemaintenance
    ADD CONSTRAINT tdm_vehiclemaintenance_guarantee_id_key UNIQUE (guarantee_id);


--
-- TOC entry 2858 (class 2606 OID 310507)
-- Dependencies: 293 293
-- Name: tdm_vehiclemaintenance_maintenanceservice_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehiclemaintenance
    ADD CONSTRAINT tdm_vehiclemaintenance_maintenanceservice_id_key UNIQUE (maintenanceservice_id);


--
-- TOC entry 2860 (class 2606 OID 310509)
-- Dependencies: 293 293
-- Name: tdm_vehiclemaintenance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehiclemaintenance
    ADD CONSTRAINT tdm_vehiclemaintenance_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 310511)
-- Dependencies: 293 293
-- Name: tdm_vehiclemaintenance_uvvservice_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehiclemaintenance
    ADD CONSTRAINT tdm_vehiclemaintenance_uvvservice_id_key UNIQUE (uvvservice_id);


--
-- TOC entry 2864 (class 2606 OID 310513)
-- Dependencies: 294 294 294
-- Name: tdm_vehiclemanufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehiclemanufacturer
    ADD CONSTRAINT tdm_vehiclemanufacturer_name_key UNIQUE (name, client_id);


--
-- TOC entry 2866 (class 2606 OID 310515)
-- Dependencies: 294 294
-- Name: tdm_vehiclemanufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehiclemanufacturer
    ADD CONSTRAINT tdm_vehiclemanufacturer_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 310517)
-- Dependencies: 295 295 295 295
-- Name: tdm_vehiclemodel_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehiclemodel
    ADD CONSTRAINT tdm_vehiclemodel_name_key UNIQUE (name, client_id, deletedsince);


--
-- TOC entry 2870 (class 2606 OID 310519)
-- Dependencies: 295 295
-- Name: tdm_vehiclemodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehiclemodel
    ADD CONSTRAINT tdm_vehiclemodel_pkey PRIMARY KEY (id);


--
-- TOC entry 2872 (class 2606 OID 310521)
-- Dependencies: 296 296
-- Name: tdm_vehiclemodeldata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehiclemodeldata
    ADD CONSTRAINT tdm_vehiclemodeldata_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 310523)
-- Dependencies: 297 297
-- Name: tdm_vehicleprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleprofile
    ADD CONSTRAINT tdm_vehicleprofile_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 310525)
-- Dependencies: 298 298 298 298
-- Name: tdm_vehicleseries_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleseries
    ADD CONSTRAINT tdm_vehicleseries_name_key UNIQUE (name, client_id, deletedsince);


--
-- TOC entry 2878 (class 2606 OID 310527)
-- Dependencies: 298 298
-- Name: tdm_vehicleseries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleseries
    ADD CONSTRAINT tdm_vehicleseries_pkey PRIMARY KEY (id);


--
-- TOC entry 2880 (class 2606 OID 310529)
-- Dependencies: 299 299
-- Name: tdm_vehicleservice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleservice
    ADD CONSTRAINT tdm_vehicleservice_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 310531)
-- Dependencies: 300 300
-- Name: tdm_vehicleshock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleshock
    ADD CONSTRAINT tdm_vehicleshock_pkey PRIMARY KEY (id);


--
-- TOC entry 2884 (class 2606 OID 310533)
-- Dependencies: 301 301
-- Name: tdm_vehicleswitchtimes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicleswitchtimes
    ADD CONSTRAINT tdm_vehicleswitchtimes_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 310535)
-- Dependencies: 302 302
-- Name: tdm_vehicletechnology_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicletechnology
    ADD CONSTRAINT tdm_vehicletechnology_pkey PRIMARY KEY (id);


--
-- TOC entry 2888 (class 2606 OID 310537)
-- Dependencies: 303 303
-- Name: tdm_vehicletire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vehicletire
    ADD CONSTRAINT tdm_vehicletire_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 310539)
-- Dependencies: 304 304
-- Name: tdm_vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tdm_vendor
    ADD CONSTRAINT tdm_vendor_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 1259 OID 310540)
-- Dependencies: 180
-- Name: idx_accesstoken_deleted; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_accesstoken_deleted ON tdm_access_token USING btree (deletedsince);


--
-- TOC entry 2662 (class 1259 OID 310541)
-- Dependencies: 216
-- Name: idx_dl_aggregatesince; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_dl_aggregatesince ON tdm_driverlogin USING btree (aggregatesince);


--
-- TOC entry 2663 (class 1259 OID 310542)
-- Dependencies: 216
-- Name: idx_dl_logintime; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_dl_logintime ON tdm_driverlogin USING btree (logintime);


--
-- TOC entry 2664 (class 1259 OID 310543)
-- Dependencies: 216
-- Name: idx_dl_sessionid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_dl_sessionid ON tdm_driverlogin USING btree (sessionid);


--
-- TOC entry 2693 (class 1259 OID 310544)
-- Dependencies: 228
-- Name: idx_ladt_aggregatesince; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_ladt_aggregatesince ON tdm_liftanddrivetimes USING btree (aggregatesince);


--
-- TOC entry 2694 (class 1259 OID 310545)
-- Dependencies: 228
-- Name: idx_ladt_readouttime; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_ladt_readouttime ON tdm_liftanddrivetimes USING btree (readouttime);


--
-- TOC entry 2695 (class 1259 OID 310546)
-- Dependencies: 228
-- Name: idx_ladt_sessionid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_ladt_sessionid ON tdm_liftanddrivetimes USING btree (sessionid);


--
-- TOC entry 2760 (class 1259 OID 310556)
-- Dependencies: 260
-- Name: idx_rfid_identity; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_rfid_identity ON tdm_rfid USING btree (rfid_identity);


--
-- TOC entry 2764 (class 1259 OID 310557)
-- Dependencies: 261
-- Name: idx_sesscorrelation_sessionid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_sesscorrelation_sessionid ON tdm_sessioncorrelation USING btree (sessid);


--
-- TOC entry 2761 (class 1259 OID 310558)
-- Dependencies: 260
-- Name: idx_tdm_rfid_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_tdm_rfid_type ON tdm_rfid USING btree (rfid_type);


--
-- TOC entry 2807 (class 1259 OID 310559)
-- Dependencies: 276
-- Name: idx_usermessage_read; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_usermessage_read ON tdm_usermessage USING btree (read);


--
-- TOC entry 2614 (class 1259 OID 310560)
-- Dependencies: 195
-- Name: idxclientclientid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idxclientclientid ON tdm_client USING btree (clientid);


--
-- TOC entry 2615 (class 1259 OID 310561)
-- Dependencies: 195
-- Name: idxclientclientname; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idxclientclientname ON tdm_client USING btree (clientname);


--
-- TOC entry 2708 (class 1259 OID 310562)
-- Dependencies: 234
-- Name: idxlogbookaccesstoken; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idxlogbookaccesstoken ON tdm_logbook USING btree (accesstoken_id);


--
-- TOC entry 2709 (class 1259 OID 310563)
-- Dependencies: 234
-- Name: idxlogbookontime; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idxlogbookontime ON tdm_logbook USING btree (ontime);


--
-- TOC entry 2710 (class 1259 OID 310564)
-- Dependencies: 234
-- Name: idxlogbookvehicle; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idxlogbookvehicle ON tdm_logbook USING btree (vehicle_id);


--
-- TOC entry 2793 (class 1259 OID 310565)
-- Dependencies: 274
-- Name: idxuserfirstname; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idxuserfirstname ON tdm_user USING btree (firstname);


--
-- TOC entry 2794 (class 1259 OID 310566)
-- Dependencies: 274
-- Name: idxuserlastname; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idxuserlastname ON tdm_user USING btree (lastname);


--
-- TOC entry 2795 (class 1259 OID 310567)
-- Dependencies: 274
-- Name: idxuserpersonellnumber; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idxuserpersonellnumber ON tdm_user USING btree (personnelnumber);


--
-- TOC entry 2796 (class 1259 OID 310568)
-- Dependencies: 274
-- Name: idxusershortmark; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idxusershortmark ON tdm_user USING btree (shortmark);


--
-- TOC entry 2743 (class 1259 OID 310569)
-- Dependencies: 250
-- Name: tdm_overviewsettings_tdm_vehicle_vehicleselection_id_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX tdm_overviewsettings_tdm_vehicle_vehicleselection_id_key ON tdm_overviewsettings_tdm_vehicle USING btree (vehicleselection_id);


--
-- TOC entry 2818 (class 1259 OID 310570)
-- Dependencies: 279
-- Name: tdm_vehicle_serial_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tdm_vehicle_serial_index ON tdm_vehicle USING btree (serialnumber);


--
-- TOC entry 3066 (class 2606 OID 310571)
-- Dependencies: 2537 291 174
-- Name: fk11309a92fc636eee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclelogbookreportparameter
    ADD CONSTRAINT fk11309a92fc636eee FOREIGN KEY (id) REFERENCES tdm_abstractreportparameter(id);


--
-- TOC entry 2982 (class 2606 OID 310576)
-- Dependencies: 2691 227 226
-- Name: fk12a55805dd8841c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_liftanddrivereportparameter_tdm_vehicle
    ADD CONSTRAINT fk12a55805dd8841c FOREIGN KEY (tdm_liftanddrivereportparameter_id) REFERENCES tdm_liftanddrivereportparameter(id);


--
-- TOC entry 2983 (class 2606 OID 310581)
-- Dependencies: 279 227 2816
-- Name: fk12a558062a6834c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_liftanddrivereportparameter_tdm_vehicle
    ADD CONSTRAINT fk12a558062a6834c FOREIGN KEY (vehicles_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3037 (class 2606 OID 310586)
-- Dependencies: 270 195 2622
-- Name: fk1ac06ef697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_synchronisationdata
    ADD CONSTRAINT fk1ac06ef697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2944 (class 2606 OID 310591)
-- Dependencies: 203 2636 202
-- Name: fk1de848c35de3695c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_crashdetailsreportparameter_tdm_vehicle
    ADD CONSTRAINT fk1de848c35de3695c FOREIGN KEY (tdm_crashdetailsreportparameter_id) REFERENCES tdm_crashdetailsreportparameter(id);


--
-- TOC entry 2945 (class 2606 OID 310596)
-- Dependencies: 203 279 2816
-- Name: fk1de848c362a6834c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_crashdetailsreportparameter_tdm_vehicle
    ADD CONSTRAINT fk1de848c362a6834c FOREIGN KEY (vehicles_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3045 (class 2606 OID 310601)
-- Dependencies: 274 2803 276
-- Name: fk1e79549a2077cafc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_usermessage
    ADD CONSTRAINT fk1e79549a2077cafc FOREIGN KEY (recipient_id) REFERENCES tdm_user(id);


--
-- TOC entry 3046 (class 2606 OID 310606)
-- Dependencies: 2622 276 195
-- Name: fk1e79549a697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_usermessage
    ADD CONSTRAINT fk1e79549a697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2970 (class 2606 OID 310611)
-- Dependencies: 217 279 2816
-- Name: fk1fb83cb43d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driverlogout
    ADD CONSTRAINT fk1fb83cb43d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2971 (class 2606 OID 310616)
-- Dependencies: 217 180 2558
-- Name: fk1fb83cb4adc41e21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driverlogout
    ADD CONSTRAINT fk1fb83cb4adc41e21 FOREIGN KEY (accesstoken_id) REFERENCES tdm_access_token(id);


--
-- TOC entry 2965 (class 2606 OID 310621)
-- Dependencies: 214 174 2537
-- Name: fk21f17052fc636eee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driverlogbookreportparameter
    ADD CONSTRAINT fk21f17052fc636eee FOREIGN KEY (id) REFERENCES tdm_abstractreportparameter(id);


--
-- TOC entry 3067 (class 2606 OID 310626)
-- Dependencies: 292 279 2816
-- Name: fk232756bd62a6834c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclelogbookreportparameter_tdm_vehicle
    ADD CONSTRAINT fk232756bd62a6834c FOREIGN KEY (vehicles_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3068 (class 2606 OID 310631)
-- Dependencies: 292 291 2853
-- Name: fk232756bdc5b4e69c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclelogbookreportparameter_tdm_vehicle
    ADD CONSTRAINT fk232756bdc5b4e69c FOREIGN KEY (tdm_vehiclelogbookreportparameter_id) REFERENCES tdm_vehiclelogbookreportparameter(id);


--
-- TOC entry 2976 (class 2606 OID 310636)
-- Dependencies: 222 221 2677
-- Name: fk23897ceb5b87e8dc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_fleetusagereportparameter_tdm_vehicle
    ADD CONSTRAINT fk23897ceb5b87e8dc FOREIGN KEY (tdm_fleetusagereportparameter_id) REFERENCES tdm_fleetusagereportparameter(id);


--
-- TOC entry 2977 (class 2606 OID 310641)
-- Dependencies: 222 279 2816
-- Name: fk23897ceb62a6834c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_fleetusagereportparameter_tdm_vehicle
    ADD CONSTRAINT fk23897ceb62a6834c FOREIGN KEY (vehicles_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2936 (class 2606 OID 310646)
-- Dependencies: 195 196 2624
-- Name: fk2765aa4d1b65420a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_client
    ADD CONSTRAINT fk2765aa4d1b65420a FOREIGN KEY (clientprofile_id) REFERENCES tdm_clientprofile(id);


--
-- TOC entry 2954 (class 2606 OID 310651)
-- Dependencies: 207 245 2737
-- Name: fk296f4eaa5e5c8fbd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driver
    ADD CONSTRAINT fk296f4eaa5e5c8fbd FOREIGN KEY (organisationalunit_id) REFERENCES tdm_organisationalunit(id);


--
-- TOC entry 2955 (class 2606 OID 310656)
-- Dependencies: 207 195 2622
-- Name: fk296f4eaa697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driver
    ADD CONSTRAINT fk296f4eaa697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2956 (class 2606 OID 310661)
-- Dependencies: 207 210 2652
-- Name: fk296f4eaaea340627; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driver
    ADD CONSTRAINT fk296f4eaaea340627 FOREIGN KEY (drivergroup_id) REFERENCES tdm_drivergroup(id);


--
-- TOC entry 3065 (class 2606 OID 310666)
-- Dependencies: 290 279 2816
-- Name: fk301cbe9f3d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclelocation
    ADD CONSTRAINT fk301cbe9f3d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3009 (class 2606 OID 310671)
-- Dependencies: 248 279 2816
-- Name: fk3080b89962a6834c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_outstandingmaintenanceparameter_tdm_vehicle
    ADD CONSTRAINT fk3080b89962a6834c FOREIGN KEY (vehicles_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3010 (class 2606 OID 310676)
-- Dependencies: 248 247 2739
-- Name: fk3080b899a7ba80a8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_outstandingmaintenanceparameter_tdm_vehicle
    ADD CONSTRAINT fk3080b899a7ba80a8 FOREIGN KEY (tdm_outstandingmaintenanceparameter_id) REFERENCES tdm_outstandingmaintenanceparameter(id);


--
-- TOC entry 2916 (class 2606 OID 310681)
-- Dependencies: 186 185 2578
-- Name: fk379f561f3b964c9f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_attachmenttemplate
    ADD CONSTRAINT fk379f561f3b964c9f FOREIGN KEY (model_id) REFERENCES tdm_attachmentmodel(id);


--
-- TOC entry 2917 (class 2606 OID 310686)
-- Dependencies: 186 195 2622
-- Name: fk379f561f697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_attachmenttemplate
    ADD CONSTRAINT fk379f561f697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2918 (class 2606 OID 310691)
-- Dependencies: 186 184 2574
-- Name: fk379f561fdb45ecf5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_attachmenttemplate
    ADD CONSTRAINT fk379f561fdb45ecf5 FOREIGN KEY (manufacturer_id) REFERENCES tdm_attachmentmanufacturer(id);


--
-- TOC entry 3082 (class 2606 OID 310696)
-- Dependencies: 195 298 2622
-- Name: fk387dcfe1697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicleseries
    ADD CONSTRAINT fk387dcfe1697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3035 (class 2606 OID 310701)
-- Dependencies: 2779 269 268
-- Name: fk3dbea39246b7cb1c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_simultaneouslyusedvehiclesreportparameter_tdm_vehicle
    ADD CONSTRAINT fk3dbea39246b7cb1c FOREIGN KEY (tdm_simultaneouslyusedvehiclesreportparameter_id) REFERENCES tdm_simultaneouslyusedvehiclesreportparameter(id);


--
-- TOC entry 3036 (class 2606 OID 310706)
-- Dependencies: 279 2816 269
-- Name: fk3dbea39262a6834c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_simultaneouslyusedvehiclesreportparameter_tdm_vehicle
    ADD CONSTRAINT fk3dbea39262a6834c FOREIGN KEY (vehicles_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3054 (class 2606 OID 310711)
-- Dependencies: 285 280 2837
-- Name: fk3f0e70f9e4d6ef9c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicleaccident
    ADD CONSTRAINT fk3f0e70f9e4d6ef9c FOREIGN KEY (id) REFERENCES tdm_vehicledata(id);


--
-- TOC entry 3088 (class 2606 OID 310716)
-- Dependencies: 304 195 2622
-- Name: fk47715bca78154a98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vendor
    ADD CONSTRAINT fk47715bca78154a98 FOREIGN KEY (id) REFERENCES tdm_client(id);


--
-- TOC entry 2972 (class 2606 OID 310721)
-- Dependencies: 2622 195 218
-- Name: fk4aedd124697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_drivertemplate
    ADD CONSTRAINT fk4aedd124697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3081 (class 2606 OID 310726)
-- Dependencies: 297 285 2837
-- Name: fk4e8ce57fe4d6ef9c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicleprofile
    ADD CONSTRAINT fk4e8ce57fe4d6ef9c FOREIGN KEY (id) REFERENCES tdm_vehicledata(id);


--
-- TOC entry 2988 (class 2606 OID 310731)
-- Dependencies: 233 2702 231
-- Name: fk502cc9db3e9fda3c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_loadtransportationhistogram_distanceswithload
    ADD CONSTRAINT fk502cc9db3e9fda3c FOREIGN KEY (tdm_loadtransportationhistogram_id) REFERENCES tdm_loadtransportationhistogram(id);


--
-- TOC entry 2933 (class 2606 OID 310736)
-- Dependencies: 192 2604 194
-- Name: fk570c5e761ef80635; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_chargertemplate
    ADD CONSTRAINT fk570c5e761ef80635 FOREIGN KEY (manufacturer_id) REFERENCES tdm_chargermanufacturer(id);


--
-- TOC entry 2934 (class 2606 OID 310741)
-- Dependencies: 193 2608 194
-- Name: fk570c5e7644821b5f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_chargertemplate
    ADD CONSTRAINT fk570c5e7644821b5f FOREIGN KEY (model_id) REFERENCES tdm_chargermodel(id);


--
-- TOC entry 2935 (class 2606 OID 310746)
-- Dependencies: 194 195 2622
-- Name: fk570c5e76697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_chargertemplate
    ADD CONSTRAINT fk570c5e76697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3055 (class 2606 OID 310751)
-- Dependencies: 2849 289 281
-- Name: fk583844e5c71af528; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclebasedata
    ADD CONSTRAINT fk583844e5c71af528 FOREIGN KEY (evaluation_id) REFERENCES tdm_vehicleevaluation(id);


--
-- TOC entry 3056 (class 2606 OID 310756)
-- Dependencies: 2837 281 285
-- Name: fk583844e5e4d6ef9c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclebasedata
    ADD CONSTRAINT fk583844e5e4d6ef9c FOREIGN KEY (id) REFERENCES tdm_vehicledata(id);


--
-- TOC entry 3020 (class 2606 OID 310761)
-- Dependencies: 256 2537 174
-- Name: fk5b5fe2efc636eee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_preshiftcheckreportparameter
    ADD CONSTRAINT fk5b5fe2efc636eee FOREIGN KEY (id) REFERENCES tdm_abstractreportparameter(id);


--
-- TOC entry 2975 (class 2606 OID 310766)
-- Dependencies: 221 2537 174
-- Name: fk5c6815c0fc636eee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_fleetusagereportparameter
    ADD CONSTRAINT fk5c6815c0fc636eee FOREIGN KEY (id) REFERENCES tdm_abstractreportparameter(id);


--
-- TOC entry 3001 (class 2606 OID 310771)
-- Dependencies: 2816 244 279
-- Name: fk607536d03d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_operatinghours
    ADD CONSTRAINT fk607536d03d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2984 (class 2606 OID 310776)
-- Dependencies: 279 2816 228
-- Name: fk62f28063d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_liftanddrivetimes
    ADD CONSTRAINT fk62f28063d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2978 (class 2606 OID 310781)
-- Dependencies: 223 2642 204
-- Name: fk646bac142d68e8dd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_frontend
    ADD CONSTRAINT fk646bac142d68e8dd FOREIGN KEY (client_id) REFERENCES tdm_customer(id);


--
-- TOC entry 2979 (class 2606 OID 310786)
-- Dependencies: 2622 195 223
-- Name: fk646bac14697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_frontend
    ADD CONSTRAINT fk646bac14697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3023 (class 2606 OID 310791)
-- Dependencies: 258 2622 195
-- Name: fk656b2721697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_profiletype
    ADD CONSTRAINT fk656b2721697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2997 (class 2606 OID 310796)
-- Dependencies: 2816 240 279
-- Name: fk666c019862a6834c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_maxloadreportparameter_tdm_vehicle
    ADD CONSTRAINT fk666c019862a6834c FOREIGN KEY (vehicles_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2998 (class 2606 OID 310801)
-- Dependencies: 239 240 2723
-- Name: fk666c01988e4b0238; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_maxloadreportparameter_tdm_vehicle
    ADD CONSTRAINT fk666c01988e4b0238 FOREIGN KEY (tdm_maxloadreportparameter_id) REFERENCES tdm_maxloadreportparameter(id);


--
-- TOC entry 2974 (class 2606 OID 310806)
-- Dependencies: 2816 279 220
-- Name: fk6700f6683d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_evaluation_dynamicdata
    ADD CONSTRAINT fk6700f6683d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3060 (class 2606 OID 310811)
-- Dependencies: 279 285 2816
-- Name: fk676413943d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicledata
    ADD CONSTRAINT fk676413943d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3061 (class 2606 OID 310816)
-- Dependencies: 295 2869 285
-- Name: fk676413944629620d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicledata
    ADD CONSTRAINT fk676413944629620d FOREIGN KEY (vehiclemodel_id) REFERENCES tdm_vehiclemodel(id);


--
-- TOC entry 3087 (class 2606 OID 310821)
-- Dependencies: 303 2837 285
-- Name: fk676b7752e4d6ef9c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicletire
    ADD CONSTRAINT fk676b7752e4d6ef9c FOREIGN KEY (id) REFERENCES tdm_vehicledata(id);


--
-- TOC entry 2952 (class 2606 OID 310826)
-- Dependencies: 206 2803 274
-- Name: fk6cd18a4c3005fa10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_customer_tdm_user
    ADD CONSTRAINT fk6cd18a4c3005fa10 FOREIGN KEY (userrecipients_id) REFERENCES tdm_user(id);


--
-- TOC entry 2953 (class 2606 OID 310831)
-- Dependencies: 206 204 2642
-- Name: fk6cd18a4c900c8aa8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_customer_tdm_user
    ADD CONSTRAINT fk6cd18a4c900c8aa8 FOREIGN KEY (tdm_customer_id) REFERENCES tdm_customer(id);


--
-- TOC entry 3034 (class 2606 OID 310836)
-- Dependencies: 268 174 2537
-- Name: fk6f5cbee7fc636eee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_simultaneouslyusedvehiclesreportparameter
    ADD CONSTRAINT fk6f5cbee7fc636eee FOREIGN KEY (id) REFERENCES tdm_abstractreportparameter(id);


--
-- TOC entry 3013 (class 2606 OID 310841)
-- Dependencies: 251 279 2816
-- Name: fk72dc26553d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_performedmaintenance
    ADD CONSTRAINT fk72dc26553d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3064 (class 2606 OID 310846)
-- Dependencies: 289 195 2622
-- Name: fk732d13a6697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicleevaluation
    ADD CONSTRAINT fk732d13a6697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2981 (class 2606 OID 310851)
-- Dependencies: 226 174 2537
-- Name: fk74c165d5fc636eee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_liftanddrivereportparameter
    ADD CONSTRAINT fk74c165d5fc636eee FOREIGN KEY (id) REFERENCES tdm_abstractreportparameter(id);


--
-- TOC entry 2891 (class 2606 OID 310856)
-- Dependencies: 2622 174 195
-- Name: fk74e95e51697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_abstractreportparameter
    ADD CONSTRAINT fk74e95e51697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3000 (class 2606 OID 310861)
-- Dependencies: 2816 279 243
-- Name: fk769a500d3d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_operatinghour_dynamicdata
    ADD CONSTRAINT fk769a500d3d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2993 (class 2606 OID 310866)
-- Dependencies: 237 236 2715
-- Name: fk76fa11be7b2db404; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_logmessage_tdm_messageparameter
    ADD CONSTRAINT fk76fa11be7b2db404 FOREIGN KEY (tdm_logmessage_id) REFERENCES tdm_logmessage(id);


--
-- TOC entry 2994 (class 2606 OID 310871)
-- Dependencies: 237 241 2725
-- Name: fk76fa11becf3c6840; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_logmessage_tdm_messageparameter
    ADD CONSTRAINT fk76fa11becf3c6840 FOREIGN KEY (parameters_id) REFERENCES tdm_messageparameter(id);


--
-- TOC entry 3002 (class 2606 OID 310876)
-- Dependencies: 245 245 2737
-- Name: fk7a4b510b5e5c8fbd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_organisationalunit
    ADD CONSTRAINT fk7a4b510b5e5c8fbd FOREIGN KEY (organisationalunit_id) REFERENCES tdm_organisationalunit(id);


--
-- TOC entry 3003 (class 2606 OID 310881)
-- Dependencies: 2622 245 195
-- Name: fk7a4b510b697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_organisationalunit
    ADD CONSTRAINT fk7a4b510b697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3004 (class 2606 OID 310886)
-- Dependencies: 245 229 2698
-- Name: fk7a4b510b9991c1a7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_organisationalunit
    ADD CONSTRAINT fk7a4b510b9991c1a7 FOREIGN KEY (lightfeatures_id) REFERENCES tdm_lightfeatures(id);


--
-- TOC entry 3005 (class 2606 OID 310891)
-- Dependencies: 259 245 2758
-- Name: fk7a4b510bf50ce807; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_organisationalunit
    ADD CONSTRAINT fk7a4b510bf50ce807 FOREIGN KEY (reduction_id) REFERENCES tdm_reduction(id);


--
-- TOC entry 2926 (class 2606 OID 310896)
-- Dependencies: 190 180 2558
-- Name: fk7b60ea12e30d0b7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_card
    ADD CONSTRAINT fk7b60ea12e30d0b7 FOREIGN KEY (id) REFERENCES tdm_access_token(id);


--
-- TOC entry 2995 (class 2606 OID 310901)
-- Dependencies: 2837 238 285
-- Name: fk7b6575f7e4d6ef9c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_mast
    ADD CONSTRAINT fk7b6575f7e4d6ef9c FOREIGN KEY (id) REFERENCES tdm_vehicledata(id);


--
-- TOC entry 3025 (class 2606 OID 310906)
-- Dependencies: 180 260 2558
-- Name: fk7b67cd51e30d0b7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_rfid
    ADD CONSTRAINT fk7b67cd51e30d0b7 FOREIGN KEY (id) REFERENCES tdm_access_token(id);


--
-- TOC entry 3040 (class 2606 OID 310911)
-- Dependencies: 182 274 2566
-- Name: fk7b695acd5db0f26a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_user
    ADD CONSTRAINT fk7b695acd5db0f26a FOREIGN KEY (address_id) REFERENCES tdm_address(id);


--
-- TOC entry 3041 (class 2606 OID 310916)
-- Dependencies: 245 274 2737
-- Name: fk7b695acd5e5c8fbd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_user
    ADD CONSTRAINT fk7b695acd5e5c8fbd FOREIGN KEY (organisationalunit_id) REFERENCES tdm_organisationalunit(id);


--
-- TOC entry 3042 (class 2606 OID 310921)
-- Dependencies: 195 274 2622
-- Name: fk7b695acd697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_user
    ADD CONSTRAINT fk7b695acd697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3043 (class 2606 OID 310926)
-- Dependencies: 2812 278 274
-- Name: fk7b695acdb715d8aa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_user
    ADD CONSTRAINT fk7b695acdb715d8aa FOREIGN KEY (userprofile_id) REFERENCES tdm_userprofile(id);


--
-- TOC entry 3021 (class 2606 OID 310931)
-- Dependencies: 257 256 2752
-- Name: fk7b88305924518458; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_preshiftcheckreportparameter_tdm_vehicle
    ADD CONSTRAINT fk7b88305924518458 FOREIGN KEY (tdm_preshiftcheckreportparameter_id) REFERENCES tdm_preshiftcheckreportparameter(id);


--
-- TOC entry 3022 (class 2606 OID 310936)
-- Dependencies: 2816 257 279
-- Name: fk7b88305962a6834c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_preshiftcheckreportparameter_tdm_vehicle
    ADD CONSTRAINT fk7b88305962a6834c FOREIGN KEY (vehicles_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3039 (class 2606 OID 310941)
-- Dependencies: 271 272 2783
-- Name: fk7dd4df9dc828e782; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_templates_property
    ADD CONSTRAINT fk7dd4df9dc828e782 FOREIGN KEY (template_id) REFERENCES tdm_templates(id);


--
-- TOC entry 2986 (class 2606 OID 310946)
-- Dependencies: 231 279 2816
-- Name: fk7dd5e4503d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_loadtransportationhistogram
    ADD CONSTRAINT fk7dd5e4503d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2932 (class 2606 OID 310951)
-- Dependencies: 193 195 2622
-- Name: fk7df00aad697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_chargermodel
    ADD CONSTRAINT fk7df00aad697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2919 (class 2606 OID 310956)
-- Dependencies: 2594 187 189
-- Name: fk7e45c7cb3187ea8e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_battery
    ADD CONSTRAINT fk7e45c7cb3187ea8e FOREIGN KEY (batterymodel_id) REFERENCES tdm_batterymodel(id);


--
-- TOC entry 2920 (class 2606 OID 310961)
-- Dependencies: 279 2816 187
-- Name: fk7e45c7cb3d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_battery
    ADD CONSTRAINT fk7e45c7cb3d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2921 (class 2606 OID 310966)
-- Dependencies: 245 187 2737
-- Name: fk7e45c7cb5e5c8fbd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_battery
    ADD CONSTRAINT fk7e45c7cb5e5c8fbd FOREIGN KEY (organisationalunit_id) REFERENCES tdm_organisationalunit(id);


--
-- TOC entry 2922 (class 2606 OID 310971)
-- Dependencies: 2622 195 187
-- Name: fk7e45c7cb697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_battery
    ADD CONSTRAINT fk7e45c7cb697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2923 (class 2606 OID 310976)
-- Dependencies: 2590 188 187
-- Name: fk7e45c7cb97f29426; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_battery
    ADD CONSTRAINT fk7e45c7cb97f29426 FOREIGN KEY (batterymanufacturer_id) REFERENCES tdm_batterymanufacturer(id);


--
-- TOC entry 3044 (class 2606 OID 310981)
-- Dependencies: 275 274 2803
-- Name: fk7e723ecb5e58b5c8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_user_roles
    ADD CONSTRAINT fk7e723ecb5e58b5c8 FOREIGN KEY (tdm_user_id) REFERENCES tdm_user(id);


--
-- TOC entry 3027 (class 2606 OID 310986)
-- Dependencies: 263 195 2622
-- Name: fk7f37b569697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_shiftmodel
    ADD CONSTRAINT fk7f37b569697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2985 (class 2606 OID 310991)
-- Dependencies: 2816 279 230
-- Name: fk82f25f743d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_loadtransportation
    ADD CONSTRAINT fk82f25f743d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3028 (class 2606 OID 310996)
-- Dependencies: 2767 262 264
-- Name: fk83889e6aa8d64f0a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_shiftmodel_tdm_shift
    ADD CONSTRAINT fk83889e6aa8d64f0a FOREIGN KEY (shifts_id) REFERENCES tdm_shift(id);


--
-- TOC entry 3029 (class 2606 OID 311001)
-- Dependencies: 264 263 2771
-- Name: fk83889e6ab8a5f439; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_shiftmodel_tdm_shift
    ADD CONSTRAINT fk83889e6ab8a5f439 FOREIGN KEY (tdm_shiftmodel_id) REFERENCES tdm_shiftmodel(id);


--
-- TOC entry 3058 (class 2606 OID 311006)
-- Dependencies: 2622 283 195
-- Name: fk851502ce697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicleclass
    ADD CONSTRAINT fk851502ce697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3063 (class 2606 OID 311011)
-- Dependencies: 279 2816 288
-- Name: fk85342b5e3d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicleerror
    ADD CONSTRAINT fk85342b5e3d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3075 (class 2606 OID 311016)
-- Dependencies: 295 2827 282
-- Name: fk85a3547f1c5f3327; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclemodel
    ADD CONSTRAINT fk85a3547f1c5f3327 FOREIGN KEY (vehiclecategory_id) REFERENCES tdm_vehiclecategory(id);


--
-- TOC entry 3076 (class 2606 OID 311021)
-- Dependencies: 195 295 2622
-- Name: fk85a3547f697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclemodel
    ADD CONSTRAINT fk85a3547f697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3077 (class 2606 OID 311026)
-- Dependencies: 298 295 2877
-- Name: fk85a3547fde993bc7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclemodel
    ADD CONSTRAINT fk85a3547fde993bc7 FOREIGN KEY (vehicleseries_id) REFERENCES tdm_vehicleseries(id);


--
-- TOC entry 3084 (class 2606 OID 311031)
-- Dependencies: 2837 285 300
-- Name: fk85f4dbf8e4d6ef9c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicleshock
    ADD CONSTRAINT fk85f4dbf8e4d6ef9c FOREIGN KEY (id) REFERENCES tdm_vehicledata(id);


--
-- TOC entry 2941 (class 2606 OID 311036)
-- Dependencies: 2626 200 197
-- Name: fk860ef257b7ff03dc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_crash_features
    ADD CONSTRAINT fk860ef257b7ff03dc FOREIGN KEY (tdm_crash_id) REFERENCES tdm_crash(id);


--
-- TOC entry 3014 (class 2606 OID 311041)
-- Dependencies: 252 174 2537
-- Name: fk88151114fc636eee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_performedmaintenanceparameter
    ADD CONSTRAINT fk88151114fc636eee FOREIGN KEY (id) REFERENCES tdm_abstractreportparameter(id);


--
-- TOC entry 2905 (class 2606 OID 311046)
-- Dependencies: 180 2549 177
-- Name: fk8a4a846021fded11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_access_token
    ADD CONSTRAINT fk8a4a846021fded11 FOREIGN KEY (accesscollection_id) REFERENCES tdm_access_collection(id);


--
-- TOC entry 2906 (class 2606 OID 311051)
-- Dependencies: 180 2622 195
-- Name: fk8a4a8460697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_access_token
    ADD CONSTRAINT fk8a4a8460697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2992 (class 2606 OID 311056)
-- Dependencies: 235 279 2816
-- Name: fk940849533d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_loggedin_dynamicdata
    ADD CONSTRAINT fk940849533d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2909 (class 2606 OID 311061)
-- Dependencies: 183 2816 279
-- Name: fk9626fea53d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_attachment
    ADD CONSTRAINT fk9626fea53d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2910 (class 2606 OID 311066)
-- Dependencies: 245 2737 183
-- Name: fk9626fea55e5c8fbd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_attachment
    ADD CONSTRAINT fk9626fea55e5c8fbd FOREIGN KEY (organisationalunit_id) REFERENCES tdm_organisationalunit(id);


--
-- TOC entry 2911 (class 2606 OID 311071)
-- Dependencies: 2622 183 195
-- Name: fk9626fea5697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_attachment
    ADD CONSTRAINT fk9626fea5697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2912 (class 2606 OID 311076)
-- Dependencies: 184 183 2574
-- Name: fk9626fea5b082c972; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_attachment
    ADD CONSTRAINT fk9626fea5b082c972 FOREIGN KEY (attachmentmanufacturer_id) REFERENCES tdm_attachmentmanufacturer(id);


--
-- TOC entry 2913 (class 2606 OID 311081)
-- Dependencies: 185 183 2578
-- Name: fk9626fea5ef7fd2c2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_attachment
    ADD CONSTRAINT fk9626fea5ef7fd2c2 FOREIGN KEY (attachmentmodel_id) REFERENCES tdm_attachmentmodel(id);


--
-- TOC entry 2942 (class 2606 OID 311086)
-- Dependencies: 2626 197 201
-- Name: fk96f0b108b7ff03dc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_crash_steeringangle
    ADD CONSTRAINT fk96f0b108b7ff03dc FOREIGN KEY (tdm_crash_id) REFERENCES tdm_crash(id);


--
-- TOC entry 3038 (class 2606 OID 311091)
-- Dependencies: 271 195 2622
-- Name: fk97836577697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_templates
    ADD CONSTRAINT fk97836577697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3047 (class 2606 OID 311096)
-- Dependencies: 241 277 2725
-- Name: fk985209403ad7a8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_usermessage_tdm_messageparameter
    ADD CONSTRAINT fk985209403ad7a8 FOREIGN KEY (messageparameter_id) REFERENCES tdm_messageparameter(id);


--
-- TOC entry 3048 (class 2606 OID 311101)
-- Dependencies: 277 276 2808
-- Name: fk9852097dd5e010; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_usermessage_tdm_messageparameter
    ADD CONSTRAINT fk9852097dd5e010 FOREIGN KEY (tdm_usermessage_id) REFERENCES tdm_usermessage(id);


--
-- TOC entry 2925 (class 2606 OID 311106)
-- Dependencies: 195 189 2622
-- Name: fk99da5a3e697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_batterymodel
    ADD CONSTRAINT fk99da5a3e697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3024 (class 2606 OID 311111)
-- Dependencies: 259 258 2756
-- Name: fk9af454b17e48f419; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_reduction
    ADD CONSTRAINT fk9af454b17e48f419 FOREIGN KEY (profiletype_id) REFERENCES tdm_profiletype(id);


--
-- TOC entry 2980 (class 2606 OID 311116)
-- Dependencies: 225 204 2642
-- Name: fk9bf49c0f35477fea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_licence
    ADD CONSTRAINT fk9bf49c0f35477fea FOREIGN KEY (customer_id) REFERENCES tdm_customer(id);


--
-- TOC entry 3085 (class 2606 OID 311121)
-- Dependencies: 2816 301 279
-- Name: fka1d5e9283d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicleswitchtimes
    ADD CONSTRAINT fka1d5e9283d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3078 (class 2606 OID 311126)
-- Dependencies: 283 296 2831
-- Name: fka305eca974b48838; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclemodeldata
    ADD CONSTRAINT fka305eca974b48838 FOREIGN KEY (vehicleclass_id) REFERENCES tdm_vehicleclass(id);


--
-- TOC entry 3079 (class 2606 OID 311131)
-- Dependencies: 294 296 2865
-- Name: fka305eca9b165ad88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclemodeldata
    ADD CONSTRAINT fka305eca9b165ad88 FOREIGN KEY (manufacturer_id) REFERENCES tdm_vehiclemanufacturer(id);


--
-- TOC entry 3080 (class 2606 OID 311136)
-- Dependencies: 285 296 2837
-- Name: fka305eca9e4d6ef9c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclemodeldata
    ADD CONSTRAINT fka305eca9e4d6ef9c FOREIGN KEY (id) REFERENCES tdm_vehicledata(id);


--
-- TOC entry 2957 (class 2606 OID 311141)
-- Dependencies: 210 2622 195
-- Name: fka5ea4215697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_drivergroup
    ADD CONSTRAINT fka5ea4215697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2958 (class 2606 OID 311146)
-- Dependencies: 2698 210 229
-- Name: fka5ea42159991c1a7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_drivergroup
    ADD CONSTRAINT fka5ea42159991c1a7 FOREIGN KEY (lightfeatures_id) REFERENCES tdm_lightfeatures(id);


--
-- TOC entry 2959 (class 2606 OID 311151)
-- Dependencies: 2758 210 259
-- Name: fka5ea4215f50ce807; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_drivergroup
    ADD CONSTRAINT fka5ea4215f50ce807 FOREIGN KEY (reduction_id) REFERENCES tdm_reduction(id);


--
-- TOC entry 2968 (class 2606 OID 311156)
-- Dependencies: 2816 216 279
-- Name: fka62f3aff3d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driverlogin
    ADD CONSTRAINT fka62f3aff3d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2969 (class 2606 OID 311161)
-- Dependencies: 2558 180 216
-- Name: fka62f3affadc41e21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driverlogin
    ADD CONSTRAINT fka62f3affadc41e21 FOREIGN KEY (accesstoken_id) REFERENCES tdm_access_token(id);


--
-- TOC entry 3049 (class 2606 OID 311166)
-- Dependencies: 2869 279 295
-- Name: fka667a8ea4629620d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicle
    ADD CONSTRAINT fka667a8ea4629620d FOREIGN KEY (vehiclemodel_id) REFERENCES tdm_vehiclemodel(id);


--
-- TOC entry 3050 (class 2606 OID 311171)
-- Dependencies: 279 286 2841
-- Name: fka667a8ea5bc11947; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicle
    ADD CONSTRAINT fka667a8ea5bc11947 FOREIGN KEY (vehicledataunit_id) REFERENCES tdm_vehicledataunit(id);


--
-- TOC entry 3051 (class 2606 OID 311176)
-- Dependencies: 284 2835 279
-- Name: fka667a8ea5e314fed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicle
    ADD CONSTRAINT fka667a8ea5e314fed FOREIGN KEY (vehicleconfiguration_id) REFERENCES tdm_vehicleconfiguration(id);


--
-- TOC entry 3052 (class 2606 OID 311181)
-- Dependencies: 279 2737 245
-- Name: fka667a8ea5e5c8fbd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicle
    ADD CONSTRAINT fka667a8ea5e5c8fbd FOREIGN KEY (organisationalunit_id) REFERENCES tdm_organisationalunit(id);


--
-- TOC entry 3053 (class 2606 OID 311186)
-- Dependencies: 2622 279 195
-- Name: fka667a8ea697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicle
    ADD CONSTRAINT fka667a8ea697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2989 (class 2606 OID 311191)
-- Dependencies: 279 2816 234
-- Name: fka668b5eb3d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_logbook
    ADD CONSTRAINT fka668b5eb3d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2990 (class 2606 OID 311196)
-- Dependencies: 180 2558 234
-- Name: fka668b5ebadc41e21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_logbook
    ADD CONSTRAINT fka668b5ebadc41e21 FOREIGN KEY (accesstoken_id) REFERENCES tdm_access_token(id);


--
-- TOC entry 2991 (class 2606 OID 311201)
-- Dependencies: 2750 234 255
-- Name: fka668b5ebd09be7a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_logbook
    ADD CONSTRAINT fka668b5ebd09be7a FOREIGN KEY (preshiftcheck_id) REFERENCES tdm_preshiftcheck(id);


--
-- TOC entry 3032 (class 2606 OID 311206)
-- Dependencies: 267 279 2816
-- Name: fka6889c6462a6834c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_shockanalysisreportparameter_tdm_vehicle
    ADD CONSTRAINT fka6889c6462a6834c FOREIGN KEY (vehicles_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3033 (class 2606 OID 311211)
-- Dependencies: 2777 267 266
-- Name: fka6889c64849dd838; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_shockanalysisreportparameter_tdm_vehicle
    ADD CONSTRAINT fka6889c64849dd838 FOREIGN KEY (tdm_shockanalysisreportparameter_id) REFERENCES tdm_shockanalysisreportparameter(id);


--
-- TOC entry 2999 (class 2606 OID 311216)
-- Dependencies: 2622 242 195
-- Name: fka6d237e8697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_nonusermessagerecipient
    ADD CONSTRAINT fka6d237e8697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3017 (class 2606 OID 311221)
-- Dependencies: 2558 254 180
-- Name: fka9245a53e30d0b7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_pin
    ADD CONSTRAINT fka9245a53e30d0b7 FOREIGN KEY (id) REFERENCES tdm_access_token(id);


--
-- TOC entry 3059 (class 2606 OID 311226)
-- Dependencies: 195 284 2622
-- Name: fkad37184c697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicleconfiguration
    ADD CONSTRAINT fkad37184c697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3018 (class 2606 OID 311231)
-- Dependencies: 2816 255 279
-- Name: fkb5ce4fe73d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_preshiftcheck
    ADD CONSTRAINT fkb5ce4fe73d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3019 (class 2606 OID 311236)
-- Dependencies: 255 2558 180
-- Name: fkb5ce4fe7adc41e21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_preshiftcheck
    ADD CONSTRAINT fkb5ce4fe7adc41e21 FOREIGN KEY (accesstoken_id) REFERENCES tdm_access_token(id);


--
-- TOC entry 2987 (class 2606 OID 311241)
-- Dependencies: 231 2702 232
-- Name: fkb620b1cd3e9fda3c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_loadtransportationhistogram_addeddistances
    ADD CONSTRAINT fkb620b1cd3e9fda3c FOREIGN KEY (tdm_loadtransportationhistogram_id) REFERENCES tdm_loadtransportationhistogram(id);


--
-- TOC entry 3062 (class 2606 OID 311246)
-- Dependencies: 285 2837 287
-- Name: fkbb01b2e9e4d6ef9c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicleenvironment
    ADD CONSTRAINT fkbb01b2e9e4d6ef9c FOREIGN KEY (id) REFERENCES tdm_vehicledata(id);


--
-- TOC entry 2927 (class 2606 OID 311251)
-- Dependencies: 245 191 2737
-- Name: fkbe114dfc5e5c8fbd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_charger
    ADD CONSTRAINT fkbe114dfc5e5c8fbd FOREIGN KEY (organisationalunit_id) REFERENCES tdm_organisationalunit(id);


--
-- TOC entry 2928 (class 2606 OID 311256)
-- Dependencies: 195 191 2622
-- Name: fkbe114dfc697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_charger
    ADD CONSTRAINT fkbe114dfc697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2929 (class 2606 OID 311261)
-- Dependencies: 2608 193 191
-- Name: fkbe114dfce2ae319d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_charger
    ADD CONSTRAINT fkbe114dfce2ae319d FOREIGN KEY (chargermodel_id) REFERENCES tdm_chargermodel(id);


--
-- TOC entry 2930 (class 2606 OID 311266)
-- Dependencies: 192 191 2604
-- Name: fkbe114dfcf9b00e37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_charger
    ADD CONSTRAINT fkbe114dfcf9b00e37 FOREIGN KEY (chargermanufacturer_id) REFERENCES tdm_chargermanufacturer(id);


--
-- TOC entry 2940 (class 2606 OID 311271)
-- Dependencies: 197 199 2626
-- Name: fkc0d249dab7ff03dc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_crash_drivingspeed
    ADD CONSTRAINT fkc0d249dab7ff03dc FOREIGN KEY (tdm_crash_id) REFERENCES tdm_crash(id);


--
-- TOC entry 3057 (class 2606 OID 311276)
-- Dependencies: 195 282 2622
-- Name: fkc1cfdbe8697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclecategory
    ADD CONSTRAINT fkc1cfdbe8697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2943 (class 2606 OID 311281)
-- Dependencies: 174 202 2537
-- Name: fkc477e598fc636eee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_crashdetailsreportparameter
    ADD CONSTRAINT fkc477e598fc636eee FOREIGN KEY (id) REFERENCES tdm_abstractreportparameter(id);


--
-- TOC entry 2894 (class 2606 OID 311286)
-- Dependencies: 176 2537 174
-- Name: fkc4cbb8fb1dbb879c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_abstractreportparameter_tdm_user
    ADD CONSTRAINT fkc4cbb8fb1dbb879c FOREIGN KEY (tdm_abstractreportparameter_id) REFERENCES tdm_abstractreportparameter(id);


--
-- TOC entry 2895 (class 2606 OID 311291)
-- Dependencies: 2803 274 176
-- Name: fkc4cbb8fb3005fa10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_abstractreportparameter_tdm_user
    ADD CONSTRAINT fkc4cbb8fb3005fa10 FOREIGN KEY (userrecipients_id) REFERENCES tdm_user(id);


--
-- TOC entry 2924 (class 2606 OID 311296)
-- Dependencies: 188 195 2622
-- Name: fkc557931c697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_batterymanufacturer
    ADD CONSTRAINT fkc557931c697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3008 (class 2606 OID 311301)
-- Dependencies: 247 174 2537
-- Name: fkc708e66efc636eee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_outstandingmaintenanceparameter
    ADD CONSTRAINT fkc708e66efc636eee FOREIGN KEY (id) REFERENCES tdm_abstractreportparameter(id);


--
-- TOC entry 2939 (class 2606 OID 311306)
-- Dependencies: 2626 198 197
-- Name: fkc79d4661b7ff03dc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_crash_brakeactuation
    ADD CONSTRAINT fkc79d4661b7ff03dc FOREIGN KEY (tdm_crash_id) REFERENCES tdm_crash(id);


--
-- TOC entry 2950 (class 2606 OID 311311)
-- Dependencies: 205 2729 242
-- Name: fkcc0f02094104045c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_customer_tdm_nonusermessagerecipient
    ADD CONSTRAINT fkcc0f02094104045c FOREIGN KEY (nonuserrecipients_id) REFERENCES tdm_nonusermessagerecipient(id);


--
-- TOC entry 2951 (class 2606 OID 311316)
-- Dependencies: 204 205 2642
-- Name: fkcc0f0209900c8aa8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_customer_tdm_nonusermessagerecipient
    ADD CONSTRAINT fkcc0f0209900c8aa8 FOREIGN KEY (tdm_customer_id) REFERENCES tdm_customer(id);


--
-- TOC entry 2960 (class 2606 OID 311321)
-- Dependencies: 211 2646 207
-- Name: fkccd540674e3948ad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driverlicence
    ADD CONSTRAINT fkccd540674e3948ad FOREIGN KEY (driver_id) REFERENCES tdm_driver(id);


--
-- TOC entry 2961 (class 2606 OID 311326)
-- Dependencies: 2658 212 211
-- Name: fkccd54067a8b8aecd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driverlicence
    ADD CONSTRAINT fkccd54067a8b8aecd FOREIGN KEY (driverlicenceclass_id) REFERENCES tdm_driverlicenceclass(id);


--
-- TOC entry 3074 (class 2606 OID 311331)
-- Dependencies: 294 2622 195
-- Name: fkce8dbdbb697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclemanufacturer
    ADD CONSTRAINT fkce8dbdbb697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2896 (class 2606 OID 311336)
-- Dependencies: 254 2748 177
-- Name: fkcf134c97310441c3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT fkcf134c97310441c3 FOREIGN KEY (pin_id) REFERENCES tdm_pin(id);


--
-- TOC entry 2897 (class 2606 OID 311341)
-- Dependencies: 2596 177 190
-- Name: fkcf134c973260a8b1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT fkcf134c973260a8b1 FOREIGN KEY (card_id) REFERENCES tdm_card(id);


--
-- TOC entry 2898 (class 2606 OID 311346)
-- Dependencies: 207 177 2646
-- Name: fkcf134c974e3948ad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT fkcf134c974e3948ad FOREIGN KEY (driver_id) REFERENCES tdm_driver(id);


--
-- TOC entry 2899 (class 2606 OID 311351)
-- Dependencies: 260 2762 177
-- Name: fkcf134c9753ee6c51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT fkcf134c9753ee6c51 FOREIGN KEY (rfid_id) REFERENCES tdm_rfid(id);


--
-- TOC entry 2900 (class 2606 OID 311356)
-- Dependencies: 177 2737 245
-- Name: fkcf134c975e5c8fbd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT fkcf134c975e5c8fbd FOREIGN KEY (organisationalunit_id) REFERENCES tdm_organisationalunit(id);


--
-- TOC entry 2901 (class 2606 OID 311361)
-- Dependencies: 177 2622 195
-- Name: fkcf134c97697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT fkcf134c97697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2902 (class 2606 OID 311366)
-- Dependencies: 177 229 2698
-- Name: fkcf134c979991c1a7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT fkcf134c979991c1a7 FOREIGN KEY (lightfeatures_id) REFERENCES tdm_lightfeatures(id);


--
-- TOC entry 2903 (class 2606 OID 311371)
-- Dependencies: 2652 177 210
-- Name: fkcf134c97ea340627; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT fkcf134c97ea340627 FOREIGN KEY (drivergroup_id) REFERENCES tdm_drivergroup(id);


--
-- TOC entry 2904 (class 2606 OID 311376)
-- Dependencies: 2758 259 177
-- Name: fkcf134c97f50ce807; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_access_collection
    ADD CONSTRAINT fkcf134c97f50ce807 FOREIGN KEY (reduction_id) REFERENCES tdm_reduction(id);


--
-- TOC entry 2963 (class 2606 OID 311381)
-- Dependencies: 2658 212 213
-- Name: fkcf1bc3dc81f5e40b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driverlicenceclass_tdm_vehicleclass
    ADD CONSTRAINT fkcf1bc3dc81f5e40b FOREIGN KEY (tdm_driverlicenceclass_id) REFERENCES tdm_driverlicenceclass(id);


--
-- TOC entry 2964 (class 2606 OID 311386)
-- Dependencies: 2831 283 213
-- Name: fkcf1bc3dcf1937ca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driverlicenceclass_tdm_vehicleclass
    ADD CONSTRAINT fkcf1bc3dcf1937ca FOREIGN KEY (vehicleclasses_id) REFERENCES tdm_vehicleclass(id);


--
-- TOC entry 3031 (class 2606 OID 311391)
-- Dependencies: 174 266 2537
-- Name: fkcf47e2b9fc636eee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_shockanalysisreportparameter
    ADD CONSTRAINT fkcf47e2b9fc636eee FOREIGN KEY (id) REFERENCES tdm_abstractreportparameter(id);


--
-- TOC entry 2946 (class 2606 OID 311396)
-- Dependencies: 204 2889 304
-- Name: fkd2a09de02d8d8baa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_customer
    ADD CONSTRAINT fkd2a09de02d8d8baa FOREIGN KEY (vendor_id) REFERENCES tdm_vendor(id);


--
-- TOC entry 2947 (class 2606 OID 311401)
-- Dependencies: 204 2741 249
-- Name: fkd2a09de0399a534a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_customer
    ADD CONSTRAINT fkd2a09de0399a534a FOREIGN KEY (overviewsettings_id) REFERENCES tdm_overviewsettings(id);


--
-- TOC entry 2948 (class 2606 OID 311406)
-- Dependencies: 2566 182 204
-- Name: fkd2a09de05db0f26a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_customer
    ADD CONSTRAINT fkd2a09de05db0f26a FOREIGN KEY (address_id) REFERENCES tdm_address(id);


--
-- TOC entry 2949 (class 2606 OID 311411)
-- Dependencies: 195 2622 204
-- Name: fkd2a09de078154a98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_customer
    ADD CONSTRAINT fkd2a09de078154a98 FOREIGN KEY (id) REFERENCES tdm_client(id);


--
-- TOC entry 2914 (class 2606 OID 311416)
-- Dependencies: 195 2622 184
-- Name: fkd2ab52f6697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_attachmentmanufacturer
    ADD CONSTRAINT fkd2ab52f6697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3069 (class 2606 OID 311421)
-- Dependencies: 293 2879 299
-- Name: fkd30f73e919e4f404; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclemaintenance
    ADD CONSTRAINT fkd30f73e919e4f404 FOREIGN KEY (uvvservice_id) REFERENCES tdm_vehicleservice(id);


--
-- TOC entry 3070 (class 2606 OID 311426)
-- Dependencies: 2685 224 293
-- Name: fkd30f73e94606dea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclemaintenance
    ADD CONSTRAINT fkd30f73e94606dea FOREIGN KEY (guarantee_id) REFERENCES tdm_guarantee(id);


--
-- TOC entry 3071 (class 2606 OID 311431)
-- Dependencies: 293 2879 299
-- Name: fkd30f73e97e97c4f9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclemaintenance
    ADD CONSTRAINT fkd30f73e97e97c4f9 FOREIGN KEY (exhaustservice_id) REFERENCES tdm_vehicleservice(id);


--
-- TOC entry 3072 (class 2606 OID 311436)
-- Dependencies: 299 2879 293
-- Name: fkd30f73e9cecad3a2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclemaintenance
    ADD CONSTRAINT fkd30f73e9cecad3a2 FOREIGN KEY (maintenanceservice_id) REFERENCES tdm_vehicleservice(id);


--
-- TOC entry 3073 (class 2606 OID 311441)
-- Dependencies: 285 2837 293
-- Name: fkd30f73e9e4d6ef9c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehiclemaintenance
    ADD CONSTRAINT fkd30f73e9e4d6ef9c FOREIGN KEY (id) REFERENCES tdm_vehicledata(id);


--
-- TOC entry 3083 (class 2606 OID 311446)
-- Dependencies: 285 2837 299
-- Name: fkd742228be4d6ef9c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicleservice
    ADD CONSTRAINT fkd742228be4d6ef9c FOREIGN KEY (id) REFERENCES tdm_vehicledata(id);


--
-- TOC entry 2966 (class 2606 OID 311451)
-- Dependencies: 215 177 2549
-- Name: fkd8d4146a45db4802; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driverlogbookreportparameter_tdm_access_collection
    ADD CONSTRAINT fkd8d4146a45db4802 FOREIGN KEY (accesscollections_id) REFERENCES tdm_access_collection(id);


--
-- TOC entry 2967 (class 2606 OID 311456)
-- Dependencies: 214 215 2660
-- Name: fkd8d4146acdd819d8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driverlogbookreportparameter_tdm_access_collection
    ADD CONSTRAINT fkd8d4146acdd819d8 FOREIGN KEY (tdm_driverlogbookreportparameter_id) REFERENCES tdm_driverlogbookreportparameter(id);


--
-- TOC entry 2892 (class 2606 OID 311461)
-- Dependencies: 175 2537 174
-- Name: fkd9fb9efa1dbb879c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_abstractreportparameter_tdm_nonusermessagerecipient
    ADD CONSTRAINT fkd9fb9efa1dbb879c FOREIGN KEY (tdm_abstractreportparameter_id) REFERENCES tdm_abstractreportparameter(id);


--
-- TOC entry 2893 (class 2606 OID 311466)
-- Dependencies: 2729 242 175
-- Name: fkd9fb9efad7d253f1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_abstractreportparameter_tdm_nonusermessagerecipient
    ADD CONSTRAINT fkd9fb9efad7d253f1 FOREIGN KEY (nonuserrecipients_id) REFERENCES tdm_nonusermessagerecipient(id);


--
-- TOC entry 2962 (class 2606 OID 311471)
-- Dependencies: 212 2622 195
-- Name: fkdbdb9171697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_driverlicenceclass
    ADD CONSTRAINT fkdbdb9171697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3086 (class 2606 OID 311476)
-- Dependencies: 285 2837 302
-- Name: fkdbe89176e4d6ef9c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_vehicletechnology
    ADD CONSTRAINT fkdbe89176e4d6ef9c FOREIGN KEY (id) REFERENCES tdm_vehicledata(id);


--
-- TOC entry 2996 (class 2606 OID 311481)
-- Dependencies: 174 2537 239
-- Name: fkded275edfc636eee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_maxloadreportparameter
    ADD CONSTRAINT fkded275edfc636eee FOREIGN KEY (id) REFERENCES tdm_abstractreportparameter(id);


--
-- TOC entry 2915 (class 2606 OID 311486)
-- Dependencies: 185 195 2622
-- Name: fke04b5ba4697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_attachmentmodel
    ADD CONSTRAINT fke04b5ba4697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 2973 (class 2606 OID 311491)
-- Dependencies: 219 2816 279
-- Name: fke35ce0513d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_energyconsumption
    ADD CONSTRAINT fke35ce0513d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3015 (class 2606 OID 311496)
-- Dependencies: 253 279 2816
-- Name: fke7941a3f62a6834c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_performedmaintenanceparameter_tdm_vehicle
    ADD CONSTRAINT fke7941a3f62a6834c FOREIGN KEY (vehicles_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3016 (class 2606 OID 311501)
-- Dependencies: 253 2746 252
-- Name: fke7941a3fa123cae8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_performedmaintenanceparameter_tdm_vehicle
    ADD CONSTRAINT fke7941a3fa123cae8 FOREIGN KEY (tdm_performedmaintenanceparameter_id) REFERENCES tdm_performedmaintenanceparameter(id);


--
-- TOC entry 2931 (class 2606 OID 311506)
-- Dependencies: 2622 195 192
-- Name: fke91e57cd697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_chargermanufacturer
    ADD CONSTRAINT fke91e57cd697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3011 (class 2606 OID 311511)
-- Dependencies: 249 250 2741
-- Name: fkeaa926c9b67fc008; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_overviewsettings_tdm_vehicle
    ADD CONSTRAINT fkeaa926c9b67fc008 FOREIGN KEY (tdm_overviewsettings_id) REFERENCES tdm_overviewsettings(id);


--
-- TOC entry 3012 (class 2606 OID 311516)
-- Dependencies: 2816 279 250
-- Name: fkeaa926c9bbf1e393; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_overviewsettings_tdm_vehicle
    ADD CONSTRAINT fkeaa926c9bbf1e393 FOREIGN KEY (vehicleselection_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2937 (class 2606 OID 311521)
-- Dependencies: 279 197 2816
-- Name: fkf0c3d4e53d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_crash
    ADD CONSTRAINT fkf0c3d4e53d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2938 (class 2606 OID 311526)
-- Dependencies: 197 2558 180
-- Name: fkf0c3d4e5adc41e21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_crash
    ADD CONSTRAINT fkf0c3d4e5adc41e21 FOREIGN KEY (accesstoken_id) REFERENCES tdm_access_token(id);


--
-- TOC entry 3026 (class 2606 OID 311531)
-- Dependencies: 2622 262 195
-- Name: fkf1a0ddc0697238c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_shift
    ADD CONSTRAINT fkf1a0ddc0697238c FOREIGN KEY (client_id) REFERENCES tdm_client(id);


--
-- TOC entry 3030 (class 2606 OID 311536)
-- Dependencies: 265 2816 279
-- Name: fkf1a0f3e03d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_shock
    ADD CONSTRAINT fkf1a0f3e03d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 3006 (class 2606 OID 311541)
-- Dependencies: 245 246 2737
-- Name: fkf6713b1d3799c4fb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_organisationalunit_tdm_shiftmodel
    ADD CONSTRAINT fkf6713b1d3799c4fb FOREIGN KEY (tdm_organisationalunit_id) REFERENCES tdm_organisationalunit(id);


--
-- TOC entry 3007 (class 2606 OID 311546)
-- Dependencies: 246 263 2771
-- Name: fkf6713b1d551a1956; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_organisationalunit_tdm_shiftmodel
    ADD CONSTRAINT fkf6713b1d551a1956 FOREIGN KEY (shiftmodels_id) REFERENCES tdm_shiftmodel(id);


--
-- TOC entry 2907 (class 2606 OID 311551)
-- Dependencies: 279 181 2816
-- Name: fkfd62dc0c3d434c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_access_token_assignment
    ADD CONSTRAINT fkfd62dc0c3d434c7 FOREIGN KEY (vehicle_id) REFERENCES tdm_vehicle(id);


--
-- TOC entry 2908 (class 2606 OID 311556)
-- Dependencies: 180 181 2558
-- Name: fkfd62dc0cadc41e21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdm_access_token_assignment
    ADD CONSTRAINT fkfd62dc0cadc41e21 FOREIGN KEY (accesstoken_id) REFERENCES tdm_access_token(id);


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-04-25 17:20:00 CEST

--
-- PostgreSQL database dump complete
--

