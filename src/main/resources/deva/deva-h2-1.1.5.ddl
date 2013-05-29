CREATE TABLE deva_angemeldeter_benutzer
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   datum timestamp NOT NULL,
   remotehost varchar(100) NOT NULL,
   session_id varchar(100) NOT NULL,
   benutzer bigint NOT NULL,
   benutzer_liste bigint
)
;
CREATE TABLE deva_artikel
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   ampel_status varchar(255) NOT NULL,
   artikelprozess_status varchar(255) NOT NULL,
   beim_lieferanten_vorhanden char(1),
   einbauseite_aussen char(1),
   einbauseite_hinten char(1),
   einbauseite_hinterachse char(1),
   einbauseite_innen char(1),
   einbauseite_links char(1),
   einbauseite_oben char(1),
   einbauseite_rechts char(1),
   einbauseite_unten char(1),
   einbauseite_vorderachse char(1),
   einbauseite_vorne char(1),
   klassifikation varchar(255) NOT NULL,
   orig_lieferantennummer varchar(50),
   raw_lieferantennummer varchar(255),
   orig_meylenummer varchar(255) NOT NULL,
   raw_meylenummer varchar(255) NOT NULL,
   orig_oenummer varchar(50) NOT NULL,
   raw_oenummer varchar(255) NOT NULL,
   angelegt_von bigint NOT NULL,
   artikelbild bigint,
   artikelprozess bigint,
   artikelbezeichnung bigint NOT NULL,
   kunde bigint,
   lieferant bigint,
   paarbeziehung bigint
)
;
CREATE TABLE deva_artikel_bestandteil
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   anzahl bigint NOT NULL,
   hinweis varchar(100) NOT NULL,
   artikel bigint NOT NULL,
   artikel_bestandteil bigint NOT NULL
)
;
CREATE TABLE deva_artikel_dokumente
(
   artikel_id bigint NOT NULL,
   dokument_id bigint NOT NULL
)
;
CREATE TABLE deva_artikel_fahrzeuge
(
   artikel_id bigint NOT NULL,
   fahrzeug_id bigint NOT NULL,
   sort_order int NOT NULL,
   CONSTRAINT deva_artikel_fahrzeuge_pkey PRIMARY KEY (artikel_id,sort_order)
)
;
CREATE TABLE deva_artikel_kommentar
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   datum timestamp NOT NULL,
   text varchar(1024) NOT NULL,
   benutzer bigint NOT NULL,
   artikel_id bigint
)
;
CREATE TABLE deva_artikel_komponente
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   anzahl bigint NOT NULL,
   hinweis varchar(100) NOT NULL,
   artikel bigint NOT NULL,
   komponente bigint NOT NULL
)
;
CREATE TABLE deva_artikel_logbuch
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   aktion varchar(255) NOT NULL,
   bezugsobjekt_text varchar(100) NOT NULL,
   datum timestamp NOT NULL,
   benutzer bigint NOT NULL,
   artikel_id bigint
)
;
CREATE TABLE deva_artikel_verantwortliche
(
   artikel_id bigint NOT NULL,
   verantwortlicher_id bigint NOT NULL
)
;
CREATE TABLE deva_artikel_zubehoer
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   anzahl bigint NOT NULL,
   hinweis varchar(100) NOT NULL,
   artikel bigint NOT NULL,
   zubehoer bigint NOT NULL
)
;
CREATE TABLE deva_artikel_zusatzinformationen
(
   artikel_id bigint NOT NULL,
   zusatzinfo_id bigint NOT NULL
)
;
CREATE TABLE deva_benutzer
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   email varchar(255) NOT NULL,
   username varchar(100) NOT NULL,
   name varchar(100) NOT NULL,
   password varchar(255) NOT NULL,
   firma bigint NOT NULL
)
;
CREATE TABLE deva_benutzer_firma
(
   benutzer bigint NOT NULL,
   zugeordnete_firma bigint NOT NULL,
   CONSTRAINT deva_benutzer_firma_pkey PRIMARY KEY (benutzer,zugeordnete_firma)
)
;
CREATE TABLE deva_benutzer_liste
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   singleton varchar(255) NOT NULL
)
;
CREATE TABLE deva_benutzer_produktgruppe
(
   benutzer bigint NOT NULL,
   produktgruppe bigint NOT NULL,
   CONSTRAINT deva_benutzer_produktgruppe_pkey PRIMARY KEY (benutzer,produktgruppe)
)
;
CREATE TABLE deva_benutzer_rollen
(
   benutzer bigint NOT NULL,
   rolle bigint NOT NULL,
   CONSTRAINT deva_benutzer_rollen_pkey PRIMARY KEY (benutzer,rolle)
)
;
CREATE TABLE deva_bezeichnung_artikel
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   klassifikation varchar(255) NOT NULL,
   produktgruppe bigint NOT NULL
)
;
CREATE TABLE deva_bezeichnung_komponente
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   klassifikation varchar(255) NOT NULL
)
;
CREATE TABLE deva_bezeichnung_produktgruppe
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint
)
;
CREATE TABLE deva_bezeichnung_zubehoer
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   klassifikation varchar(255) NOT NULL
)
;
CREATE TABLE deva_bezeichnung_zusatzinformation
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   typ varchar(255) NOT NULL
)
;
CREATE TABLE deva_bezeichung_prozess_schritt
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   artikel_schritt char(1),
   identifier varchar(100) NOT NULL,
   komponenten_schritt char(1),
   meilenstein char(1),
   schritt_aktion varchar(255),
   schritt_typ varchar(255) NOT NULL,
   stand_typ varchar(255) NOT NULL
)
;
CREATE TABLE deva_bonuszeit
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   bonus_tage int NOT NULL,
   gewaehrt_am date,
   kommentar varchar(1024) NOT NULL,
   gewaehrt_von bigint NOT NULL,
   prozess_schritt bigint
)
;
CREATE TABLE deva_bpmn_definition_task_handler_names
(
   bpmn_definition_id bigint NOT NULL,
   taskhandlernames varchar(255)
)
;
CREATE TABLE deva_bpmndefinition
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   bpmn longblob NOT NULL,
   bpmn_process_id varchar(100) NOT NULL,
   bpmn_version int NOT NULL,
   datum timestamp NOT NULL,
   name varchar(100) NOT NULL,
   prozessdefinition_id bigint
)
;
CREATE TABLE deva_dokument
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   image_height bigint NOT NULL,
   image_width bigint NOT NULL,
   mime_type varchar(100) NOT NULL,
   name varchar(100) NOT NULL,
   data_id bigint NOT NULL,
   thumbnail_id bigint NOT NULL
)
;
CREATE TABLE deva_dokument_binaerdaten
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   data longblob NOT NULL
)
;
CREATE TABLE deva_faelligkeiten
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   faelligkeit_nachher bigint NOT NULL,
   singleton varchar(255) NOT NULL,
   faelligkeit_vorher bigint NOT NULL
)
;
CREATE TABLE deva_fahrzeug_bezeichnung
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   bezeichnung varchar(100) NOT NULL,
   fahrzeug_typ varchar(100) NOT NULL,
   hersteller varchar(30) NOT NULL
)
;
CREATE TABLE deva_firma
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   arbeitet_mit_deva char(1),
   lieferant char(1),
   name varchar(100) NOT NULL
)
;
CREATE TABLE deva_firma_ansprechpartner
(
   firma_id bigint NOT NULL,
   benutzer_id bigint NOT NULL
)
;
CREATE TABLE deva_firma_lieferanten
(
   lieferant_id bigint NOT NULL,
   lieferant_fuer_firma_id bigint NOT NULL
)
;
CREATE TABLE deva_firma_sollzeiten_artikel
(
   firma_id bigint NOT NULL,
   sollzeiten_artikel_id bigint NOT NULL
)
;
CREATE TABLE deva_firma_sollzeiten_komponente
(
   firma_id bigint NOT NULL,
   sollzeiten_komponente_id bigint NOT NULL
)
;
CREATE TABLE deva_komponente
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   beim_lieferanten_vorhanden char(1),
   klassifikation varchar(255) NOT NULL,
   komponente_prozess_status varchar(255) NOT NULL,
   orig_lieferantennummer varchar(50) NOT NULL,
   raw_lieferantennummer varchar(255) NOT NULL,
   angelegt_von bigint NOT NULL,
   artikelbild bigint,
   komponente_prozess bigint,
   komponentenbezeichnung bigint NOT NULL,
   kunde bigint NOT NULL,
   lieferant bigint,
   ampel_status varchar(255) DEFAULT 'GRAU'::character varying NOT NULL
)
;
CREATE TABLE deva_komponente_bestandteil
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   anzahl bigint NOT NULL,
   hinweis varchar(100) NOT NULL,
   komponente bigint NOT NULL,
   komponente_bestandteil bigint NOT NULL
)
;
CREATE TABLE deva_komponente_dokumente
(
   komponente_id bigint NOT NULL,
   dokument_id bigint NOT NULL
)
;
CREATE TABLE deva_komponente_kommentar
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   datum timestamp NOT NULL,
   text varchar(1024) NOT NULL,
   benutzer bigint NOT NULL,
   komponente_id bigint
)
;
CREATE TABLE deva_komponente_logbuch
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   aktion varchar(255) NOT NULL,
   bezugsobjekt_text varchar(100) NOT NULL,
   datum timestamp NOT NULL,
   benutzer bigint NOT NULL,
   komponente_id bigint
)
;
CREATE TABLE deva_komponente_verantwortliche
(
   komponente_id bigint NOT NULL,
   verantwortlicher_id bigint NOT NULL
)
;
CREATE TABLE deva_komponente_zusatzinformationen
(
   komponente_id bigint NOT NULL,
   zusatzinfo_id bigint NOT NULL
)
;
CREATE TABLE deva_produktgruppe
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   bezeichnung bigint NOT NULL,
   obergruppe bigint
)
;
CREATE TABLE deva_prozess
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   soll_datum date NOT NULL,
   ampel_status varchar(255) NOT NULL,
   ksession_id bigint,
   process_id bigint NOT NULL,
   workitem_id bigint,
   bpmn_definition bigint NOT NULL,
   naechster_meilenstein bigint NOT NULL,
   prozess_definition bigint NOT NULL
)
;
CREATE TABLE deva_prozess_schritt
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   ist_datum date,
   soll_datum date,
   typ varchar(100),
   zaehler int,
   zuletzt_bestaetigt char(1),
   weitergeschaltet_datum date,
   prozess_schritt_definition bigint NOT NULL,
   aktueller_schritt bigint,
   index_aktueller_schritt int,
   abgeschlossener_schritt bigint,
   index_abgeschlossener_schritt int
)
;
CREATE TABLE deva_prozessdefinition
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   prozessart varchar(255) NOT NULL,
   kunde bigint NOT NULL,
   lieferant bigint NOT NULL
)
;
CREATE TABLE deva_rolle
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   feste_rolle char(1),
   rolle varchar(100) NOT NULL
)
;
CREATE TABLE deva_rolle_aktions_berechtigungen
(
   berechtigung_id bigint NOT NULL,
   aktion_berechtigungen varchar(255)
)
;
CREATE TABLE deva_rolle_ampelstatus
(
   ampelstatus_id bigint NOT NULL,
   ampelstatus varchar(255)
)
;
CREATE TABLE deva_rolle_prozess_schritt
(
   rolle bigint NOT NULL,
   prozess_schritt_definition bigint NOT NULL,
   CONSTRAINT deva_rolle_prozess_schritt_pkey PRIMARY KEY (rolle,prozess_schritt_definition)
)
;
CREATE TABLE deva_rolle_sicht_berechtigungen
(
   berechtigung_id bigint NOT NULL,
   sicht_berechtigungen varchar(255)
)
;
CREATE TABLE deva_sollzeit_wdh_klassifikation
(
   sollzeiten_id bigint NOT NULL,
   sollzeit bigint,
   klassifikation varchar(255) NOT NULL,
   CONSTRAINT deva_sollzeit_wdh_klassifikation_pkey PRIMARY KEY (sollzeiten_id,klassifikation)
)
;
CREATE TABLE deva_sollzeiten
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   sollzeit_bereits_vorhanden bigint,
   sollzeit_bereits_vorhanden_wdh bigint,
   meilenstein_definition bigint NOT NULL
)
;
CREATE TABLE deva_sollzeiten_klassifikation
(
   sollzeiten_id bigint NOT NULL,
   sollzeit bigint,
   klassifikation varchar(255) NOT NULL,
   CONSTRAINT deva_sollzeiten_klassifikation_pkey PRIMARY KEY (sollzeiten_id,klassifikation)
)
;
CREATE TABLE deva_uebersetzung_artikel
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   locale varchar(2) NOT NULL,
   wort varchar(100) NOT NULL,
   bezeichnung bigint
)
;
CREATE TABLE deva_uebersetzung_komponente
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   locale varchar(2) NOT NULL,
   wort varchar(100) NOT NULL,
   bezeichnung bigint
)
;
CREATE TABLE deva_uebersetzung_produktgruppe
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   locale varchar(2) NOT NULL,
   wort varchar(100) NOT NULL,
   bezeichnung bigint
)
;
CREATE TABLE deva_uebersetzung_prozess_schritt
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   locale varchar(2) NOT NULL,
   wort varchar(100) NOT NULL,
   bezeichnung bigint
)
;
CREATE TABLE deva_uebersetzung_zubehoer
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   locale varchar(2) NOT NULL,
   wort varchar(100) NOT NULL,
   bezeichnung bigint
)
;
CREATE TABLE deva_uebersetzung_zusatzinformation
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   locale varchar(2) NOT NULL,
   wort varchar(100) NOT NULL,
   bezeichnung bigint
)
;
CREATE TABLE deva_zubehoer
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   klassifikation varchar(255) NOT NULL,
   orig_oenummer varchar(50) NOT NULL,
   raw_oenummer varchar(255) NOT NULL,
   zubehoerbezeichnung bigint NOT NULL
)
;
CREATE TABLE deva_zusatzinformation
(
   id bigint PRIMARY KEY NOT NULL,
   version bigint,
   wert varchar(1024) NOT NULL,
   zusatzinformationbezeichnung bigint NOT NULL
)
;
CREATE TABLE drools_sessioninfo
(
   id int PRIMARY KEY NOT NULL,
   lastmodificationdate timestamp,
   rulesbytearray longblob,
   startdate timestamp,
   optlock int
)
;
CREATE TABLE drools_workiteminfo
(
   workitemid bigint PRIMARY KEY NOT NULL,
   creationdate timestamp,
   name varchar(255),
   processinstanceid bigint NOT NULL,
   state bigint NOT NULL,
   optlock int,
   workitembytearray longblob
)
;
CREATE TABLE jbpm_attachment
(
   id bigint PRIMARY KEY NOT NULL,
   accesstype int,
   attachedat timestamp,
   attachmentcontentid bigint NOT NULL,
   contenttype varchar(255),
   name varchar(255),
   attachment_size int,
   attachedby_id varchar(255),
   taskdata_attachments_id bigint
)
;
CREATE TABLE jbpm_boolean_expression
(
   id bigint PRIMARY KEY NOT NULL,
   expression text,
   type varchar(255),
   escalation_constraints_id bigint
)
;
CREATE TABLE jbpm_content
(
   id bigint PRIMARY KEY NOT NULL,
   content bigint
)
;
CREATE TABLE jbpm_deadline
(
   id bigint PRIMARY KEY NOT NULL,
   deadline_date date,
   escalated int NOT NULL,
   deadlines_startdeadline_id bigint,
   deadlines_enddeadline_id bigint
)
;
CREATE TABLE jbpm_delegation_delegates
(
   task_id bigint NOT NULL,
   entity_id varchar(255) NOT NULL
)
;
CREATE TABLE jbpm_email_header
(
   id bigint PRIMARY KEY NOT NULL,
   body text,
   fromaddress varchar(255),
   language varchar(255),
   replytoaddress varchar(255),
   subject varchar(255)
)
;
CREATE TABLE jbpm_email_notification
(
   id bigint PRIMARY KEY NOT NULL,
   priority int NOT NULL,
   escalation_notifications_id bigint
)
;
CREATE TABLE jbpm_email_notification_jbpm_email_header
(
   jbpm_email_notification_id bigint NOT NULL,
   emailheaders_id bigint NOT NULL,
   emailheaders_key varchar(255) NOT NULL,
   CONSTRAINT jbpm_email_notification_jbpm_email_header_pkey PRIMARY KEY (jbpm_email_notification_id,emailheaders_key)
)
;
CREATE TABLE jbpm_escalation
(
   id bigint PRIMARY KEY NOT NULL,
   name varchar(255),
   deadline_escalation_id bigint
)
;
CREATE TABLE jbpm_group
(
   id varchar(255) PRIMARY KEY NOT NULL
)
;
CREATE TABLE jbpm_i18ntext
(
   id bigint PRIMARY KEY NOT NULL,
   language varchar(255),
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
)
;
CREATE TABLE jbpm_notification
(
   id bigint PRIMARY KEY NOT NULL,
   priority int NOT NULL,
   escalation_notifications_id bigint
)
;
CREATE TABLE jbpm_notification_bas
(
   task_id bigint NOT NULL,
   entity_id varchar(255) NOT NULL
)
;
CREATE TABLE jbpm_notification_recipients
(
   task_id bigint NOT NULL,
   entity_id varchar(255) NOT NULL
)
;
CREATE TABLE jbpm_peopleassignments_bas
(
   task_id bigint NOT NULL,
   entity_id varchar(255) NOT NULL
)
;
CREATE TABLE jbpm_peopleassignments_exclowners
(
   task_id bigint NOT NULL,
   entity_id varchar(255) NOT NULL
)
;
CREATE TABLE jbpm_peopleassignments_potowners
(
   task_id bigint NOT NULL,
   entity_id varchar(255) NOT NULL
)
;
CREATE TABLE jbpm_peopleassignments_recipients
(
   task_id bigint NOT NULL,
   entity_id varchar(255) NOT NULL
)
;
CREATE TABLE jbpm_peopleassignments_stakeholders
(
   task_id bigint NOT NULL,
   entity_id varchar(255) NOT NULL
)
;
CREATE TABLE jbpm_processinstance_eventinfo
(
   id bigint PRIMARY KEY NOT NULL,
   eventtype varchar(255),
   processinstanceid bigint NOT NULL,
   optlock int
)
;
CREATE TABLE jbpm_processinstance_info
(
   instanceid bigint PRIMARY KEY NOT NULL,
   lastmodificationdate timestamp,
   lastreaddate timestamp,
   processid varchar(255),
   processinstancebytearray longblob,
   startdate timestamp,
   state int NOT NULL,
   optlock int
)
;
CREATE TABLE jbpm_processinstance_info_eventtypes
(
   jbpm_processinstance_info_id bigint NOT NULL,
   eventtypes varchar(255)
)
;
CREATE TABLE jbpm_reassignment
(
   id bigint PRIMARY KEY NOT NULL,
   escalation_reassignments_id bigint
)
;
CREATE TABLE jbpm_reassignment_potentialowners
(
   task_id bigint NOT NULL,
   entity_id varchar(255) NOT NULL
)
;
CREATE TABLE jbpm_subtasksstrategy
(
   dtype varchar(100) NOT NULL,
   id bigint PRIMARY KEY NOT NULL,
   name varchar(255),
   task_id bigint
)
;
CREATE TABLE jbpm_task
(
   id bigint PRIMARY KEY NOT NULL,
   allowedtodelegate varchar(255),
   priority int NOT NULL,
   activationtime timestamp,
   createdon date,
   documentaccesstype varchar(255),
   documentcontentid bigint NOT NULL,
   documenttype varchar(255),
   expirationtime timestamp,
   faultaccesstype varchar(255),
   faultcontentid bigint NOT NULL,
   faultname varchar(255),
   faulttype varchar(255),
   outputaccesstype varchar(255),
   outputcontentid bigint NOT NULL,
   outputtype varchar(255),
   parentid bigint NOT NULL,
   previousstatus int,
   processinstanceid bigint NOT NULL,
   skipable int NOT NULL,
   status varchar(255),
   workitemid bigint NOT NULL,
   taskinitiator_id varchar(255),
   actualowner_id varchar(255),
   createdby_id varchar(255)
)
;
CREATE TABLE jbpm_task_comment
(
   id bigint PRIMARY KEY NOT NULL,
   addedat timestamp,
   text text,
   addedby_id varchar(255),
   taskdata_comments_id bigint
)
;
CREATE TABLE jbpm_user
(
   id varchar(255) PRIMARY KEY NOT NULL
)
;
ALTER TABLE deva_angemeldeter_benutzer
ADD CONSTRAINT fkdae0e2b2dc74f062
FOREIGN KEY (benutzer)
REFERENCES deva_benutzer(id)
;
ALTER TABLE deva_angemeldeter_benutzer
ADD CONSTRAINT fkdae0e2b231ed32e7
FOREIGN KEY (benutzer_liste)
REFERENCES deva_benutzer_liste(id)
;
CREATE UNIQUE INDEX deva_angemeldeter_benutzer_pkey ON deva_angemeldeter_benutzer(id)
;
ALTER TABLE deva_artikel
ADD CONSTRAINT fk6e9467b96b6c33bf
FOREIGN KEY (artikelprozess)
REFERENCES deva_prozess(id)
;
ALTER TABLE deva_artikel
ADD CONSTRAINT fk6e9467b98c57da6c
FOREIGN KEY (angelegt_von)
REFERENCES deva_benutzer(id)
;
ALTER TABLE deva_artikel
ADD CONSTRAINT fk6e9467b9a1cbfc4
FOREIGN KEY (artikelbild)
REFERENCES deva_dokument(id)
;
ALTER TABLE deva_artikel
ADD CONSTRAINT fk6e9467b938fd1c19
FOREIGN KEY (lieferant)
REFERENCES deva_firma(id)
;
ALTER TABLE deva_artikel
ADD CONSTRAINT fk6e9467b98c8fc63d
FOREIGN KEY (paarbeziehung)
REFERENCES deva_artikel(id)
;
ALTER TABLE deva_artikel
ADD CONSTRAINT fk6e9467b92325ac4e
FOREIGN KEY (artikelbezeichnung)
REFERENCES deva_bezeichnung_artikel(id)
;
ALTER TABLE deva_artikel
ADD CONSTRAINT fk6e9467b9843549e2
FOREIGN KEY (kunde)
REFERENCES deva_firma(id)
;
CREATE UNIQUE INDEX deva_artikel_pkey ON deva_artikel(id)
;
CREATE INDEX artikelprozess_status_idx ON deva_artikel(artikelprozess_status)
;
CREATE INDEX artikel_filter_idx ON deva_artikel
(
  lieferant,
  kunde,
  ampel_status,
  artikelbezeichnung
)
;
CREATE INDEX raw_meylenummer_idx ON deva_artikel(raw_meylenummer)
;
CREATE INDEX raw_oenummer_idx ON deva_artikel(raw_oenummer)
;
CREATE INDEX ampel_status_idx ON deva_artikel(ampel_status)
;
CREATE INDEX lieferant_idx ON deva_artikel(lieferant)
;
CREATE INDEX kunde_idx ON deva_artikel(kunde)
;
CREATE INDEX raw_lieferantennummer_idx ON deva_artikel(raw_lieferantennummer)
;
ALTER TABLE deva_artikel_bestandteil
ADD CONSTRAINT fk7a16c7a1f093319a
FOREIGN KEY (artikel_bestandteil)
REFERENCES deva_artikel(id)
;
ALTER TABLE deva_artikel_bestandteil
ADD CONSTRAINT fk7a16c7a13d3b7a12
FOREIGN KEY (artikel)
REFERENCES deva_artikel(id)
;
CREATE UNIQUE INDEX deva_artikel_bestandteil_pkey ON deva_artikel_bestandteil(id)
;
ALTER TABLE deva_artikel_dokumente
ADD CONSTRAINT fkf8d0b8c7ffed7f4
FOREIGN KEY (artikel_id)
REFERENCES deva_artikel(id)
;
ALTER TABLE deva_artikel_dokumente
ADD CONSTRAINT fkf8d0b8cfe056660
FOREIGN KEY (dokument_id)
REFERENCES deva_dokument(id)
;
CREATE UNIQUE INDEX deva_artikel_dokumente_dokument_id_key ON deva_artikel_dokumente(dokument_id)
;
ALTER TABLE deva_artikel_fahrzeuge
ADD CONSTRAINT fke6ab83fd7ffed7f4
FOREIGN KEY (artikel_id)
REFERENCES deva_artikel(id)
;
ALTER TABLE deva_artikel_fahrzeuge
ADD CONSTRAINT fke6ab83fd2bf81bd0
FOREIGN KEY (fahrzeug_id)
REFERENCES deva_fahrzeug_bezeichnung(id)
;
CREATE UNIQUE INDEX deva_artikel_fahrzeuge_pkey ON deva_artikel_fahrzeuge
(
  artikel_id,
  sort_order
)
;
ALTER TABLE deva_artikel_kommentar
ADD CONSTRAINT fk792535b27ffed7f4
FOREIGN KEY (artikel_id)
REFERENCES deva_artikel(id)
;
ALTER TABLE deva_artikel_kommentar
ADD CONSTRAINT fk792535b2dc74f062
FOREIGN KEY (benutzer)
REFERENCES deva_benutzer(id)
;
CREATE UNIQUE INDEX deva_artikel_kommentar_pkey ON deva_artikel_kommentar(id)
;
ALTER TABLE deva_artikel_komponente
ADD CONSTRAINT fk5b3e08468d6ce006
FOREIGN KEY (komponente)
REFERENCES deva_komponente(id)
;
ALTER TABLE deva_artikel_komponente
ADD CONSTRAINT fk5b3e08463d3b7a12
FOREIGN KEY (artikel)
REFERENCES deva_artikel(id)
;
CREATE UNIQUE INDEX deva_artikel_komponente_pkey ON deva_artikel_komponente(id)
;
ALTER TABLE deva_artikel_logbuch
ADD CONSTRAINT fk147182967ffed7f4
FOREIGN KEY (artikel_id)
REFERENCES deva_artikel(id)
;
ALTER TABLE deva_artikel_logbuch
ADD CONSTRAINT fk14718296dc74f062
FOREIGN KEY (benutzer)
REFERENCES deva_benutzer(id)
;
CREATE UNIQUE INDEX deva_artikel_logbuch_pkey ON deva_artikel_logbuch(id)
;
ALTER TABLE deva_artikel_verantwortliche
ADD CONSTRAINT fk646ab9f7ffed7f4
FOREIGN KEY (artikel_id)
REFERENCES deva_artikel(id)
;
ALTER TABLE deva_artikel_verantwortliche
ADD CONSTRAINT fk646ab9fb2657c32
FOREIGN KEY (verantwortlicher_id)
REFERENCES deva_benutzer(id)
;
ALTER TABLE deva_artikel_zubehoer
ADD CONSTRAINT fk5d10f7783d3b7a12
FOREIGN KEY (artikel)
REFERENCES deva_artikel(id)
;
ALTER TABLE deva_artikel_zubehoer
ADD CONSTRAINT fk5d10f778b3b24cea
FOREIGN KEY (zubehoer)
REFERENCES deva_zubehoer(id)
;
CREATE UNIQUE INDEX deva_artikel_zubehoer_pkey ON deva_artikel_zubehoer(id)
;
ALTER TABLE deva_artikel_zusatzinformationen
ADD CONSTRAINT fkda95e8046b7fc54
FOREIGN KEY (zusatzinfo_id)
REFERENCES deva_zusatzinformation(id)
;
ALTER TABLE deva_artikel_zusatzinformationen
ADD CONSTRAINT fkda95e807ffed7f4
FOREIGN KEY (artikel_id)
REFERENCES deva_artikel(id)
;
ALTER TABLE deva_benutzer
ADD CONSTRAINT fk129925f083e97000
FOREIGN KEY (firma)
REFERENCES deva_firma(id)
;
CREATE UNIQUE INDEX deva_benutzer_username_key ON deva_benutzer(username)
;
CREATE UNIQUE INDEX deva_benutzer_name_key ON deva_benutzer(name)
;
CREATE INDEX firma_idx ON deva_benutzer(firma)
;
CREATE UNIQUE INDEX deva_benutzer_pkey ON deva_benutzer(id)
;
ALTER TABLE deva_benutzer_firma
ADD CONSTRAINT fk805a2eb4dc74f062
FOREIGN KEY (benutzer)
REFERENCES deva_benutzer(id)
;
ALTER TABLE deva_benutzer_firma
ADD CONSTRAINT fk805a2eb45b19b851
FOREIGN KEY (zugeordnete_firma)
REFERENCES deva_firma(id)
;
CREATE UNIQUE INDEX deva_benutzer_firma_pkey ON deva_benutzer_firma
(
  benutzer,
  zugeordnete_firma
)
;
CREATE UNIQUE INDEX deva_benutzer_liste_singleton_key ON deva_benutzer_liste(singleton)
;
CREATE UNIQUE INDEX deva_benutzer_liste_pkey ON deva_benutzer_liste(id)
;
ALTER TABLE deva_benutzer_produktgruppe
ADD CONSTRAINT fk3133f1b32525ea1e
FOREIGN KEY (produktgruppe)
REFERENCES deva_produktgruppe(id)
;
ALTER TABLE deva_benutzer_produktgruppe
ADD CONSTRAINT fk3133f1b3dc74f062
FOREIGN KEY (benutzer)
REFERENCES deva_benutzer(id)
;
CREATE UNIQUE INDEX deva_benutzer_produktgruppe_pkey ON deva_benutzer_produktgruppe
(
  benutzer,
  produktgruppe
)
;
ALTER TABLE deva_benutzer_rollen
ADD CONSTRAINT fk9fb79f15dc74f062
FOREIGN KEY (benutzer)
REFERENCES deva_benutzer(id)
;
ALTER TABLE deva_benutzer_rollen
ADD CONSTRAINT fk9fb79f156273aba8
FOREIGN KEY (rolle)
REFERENCES deva_rolle(id)
;
CREATE UNIQUE INDEX deva_benutzer_rollen_pkey ON deva_benutzer_rollen
(
  benutzer,
  rolle
)
;
ALTER TABLE deva_bezeichnung_artikel
ADD CONSTRAINT fk2477d5ba2525ea1e
FOREIGN KEY (produktgruppe)
REFERENCES deva_produktgruppe(id)
;
CREATE UNIQUE INDEX deva_bezeichnung_artikel_pkey ON deva_bezeichnung_artikel(id)
;
CREATE INDEX produktgruppe_idx ON deva_bezeichnung_artikel(produktgruppe)
;
CREATE UNIQUE INDEX deva_bezeichnung_komponente_pkey ON deva_bezeichnung_komponente(id)
;
CREATE UNIQUE INDEX deva_bezeichnung_produktgruppe_pkey ON deva_bezeichnung_produktgruppe(id)
;
CREATE UNIQUE INDEX deva_bezeichnung_zubehoer_pkey ON deva_bezeichnung_zubehoer(id)
;
CREATE UNIQUE INDEX deva_bezeichnung_zusatzinformation_pkey ON deva_bezeichnung_zusatzinformation(id)
;
CREATE UNIQUE INDEX deva_bezeichung_prozess_schritt_pkey ON deva_bezeichung_prozess_schritt(id)
;
CREATE UNIQUE INDEX deva_bezeichung_prozess_schritt_identifier_key ON deva_bezeichung_prozess_schritt(identifier)
;
ALTER TABLE deva_bonuszeit
ADD CONSTRAINT fk4f4940824c4c8e48
FOREIGN KEY (gewaehrt_von)
REFERENCES deva_benutzer(id)
;
ALTER TABLE deva_bonuszeit
ADD CONSTRAINT fk4f4940821123a3e4
FOREIGN KEY (prozess_schritt)
REFERENCES deva_prozess_schritt(id)
;
CREATE UNIQUE INDEX deva_bonuszeit_pkey ON deva_bonuszeit(id)
;
ALTER TABLE deva_bpmn_definition_task_handler_names
ADD CONSTRAINT fk70d1bb683ebdb8fe
FOREIGN KEY (bpmn_definition_id)
REFERENCES deva_bpmndefinition(id)
;
ALTER TABLE deva_bpmndefinition
ADD CONSTRAINT fka6ca9ab5cbfa49b5
FOREIGN KEY (prozessdefinition_id)
REFERENCES deva_prozessdefinition(id)
;
CREATE UNIQUE INDEX deva_bpmndefinition_pkey ON deva_bpmndefinition(id)
;
ALTER TABLE deva_dokument
ADD CONSTRAINT fkee37ca06862116e3
FOREIGN KEY (data_id)
REFERENCES deva_dokument_binaerdaten(id)
;
ALTER TABLE deva_dokument
ADD CONSTRAINT fkee37ca061ad81661
FOREIGN KEY (thumbnail_id)
REFERENCES deva_dokument_binaerdaten(id)
;
CREATE UNIQUE INDEX deva_dokument_pkey ON deva_dokument(id)
;
CREATE UNIQUE INDEX deva_dokument_binaerdaten_pkey ON deva_dokument_binaerdaten(id)
;
CREATE UNIQUE INDEX deva_faelligkeiten_singleton_key ON deva_faelligkeiten(singleton)
;
CREATE UNIQUE INDEX deva_faelligkeiten_pkey ON deva_faelligkeiten(id)
;
CREATE UNIQUE INDEX deva_fahrzeug_bezeichnung_pkey ON deva_fahrzeug_bezeichnung(id)
;
CREATE UNIQUE INDEX deva_fahrzeug_bezeichnung_fahrzeug_typ_hersteller_key ON deva_fahrzeug_bezeichnung
(
  fahrzeug_typ,
  hersteller
)
;
CREATE INDEX bezeichnung_idx ON deva_fahrzeug_bezeichnung(bezeichnung)
;
CREATE UNIQUE INDEX deva_fahrzeug_bezeichnung_bezeichnung_key ON deva_fahrzeug_bezeichnung(bezeichnung)
;
CREATE UNIQUE INDEX deva_firma_pkey ON deva_firma(id)
;
CREATE UNIQUE INDEX deva_firma_name_key ON deva_firma(name)
;
ALTER TABLE deva_firma_ansprechpartner
ADD CONSTRAINT fk21484eb7d52de102
FOREIGN KEY (benutzer_id)
REFERENCES deva_benutzer(id)
;
ALTER TABLE deva_firma_ansprechpartner
ADD CONSTRAINT fk21484eb75cf6cf14
FOREIGN KEY (firma_id)
REFERENCES deva_firma(id)
;
CREATE UNIQUE INDEX deva_firma_ansprechpartner_benutzer_id_key ON deva_firma_ansprechpartner(benutzer_id)
;
ALTER TABLE deva_firma_lieferanten
ADD CONSTRAINT fkab4bb876e53e3934
FOREIGN KEY (lieferant_fuer_firma_id)
REFERENCES deva_firma(id)
;
ALTER TABLE deva_firma_lieferanten
ADD CONSTRAINT fkab4bb876793f005b
FOREIGN KEY (lieferant_id)
REFERENCES deva_firma(id)
;
ALTER TABLE deva_firma_sollzeiten_artikel
ADD CONSTRAINT fk4f2030575cf6cf14
FOREIGN KEY (firma_id)
REFERENCES deva_firma(id)
;
ALTER TABLE deva_firma_sollzeiten_artikel
ADD CONSTRAINT fk4f20305774e70772
FOREIGN KEY (sollzeiten_artikel_id)
REFERENCES deva_sollzeiten(id)
;
CREATE UNIQUE INDEX deva_firma_sollzeiten_artikel_sollzeiten_artikel_id_key ON deva_firma_sollzeiten_artikel(sollzeiten_artikel_id)
;
ALTER TABLE deva_firma_sollzeiten_komponente
ADD CONSTRAINT fk635e15d5b3de8e56
FOREIGN KEY (sollzeiten_komponente_id)
REFERENCES deva_sollzeiten(id)
;
ALTER TABLE deva_firma_sollzeiten_komponente
ADD CONSTRAINT fk635e15d55cf6cf14
FOREIGN KEY (firma_id)
REFERENCES deva_firma(id)
;
CREATE UNIQUE INDEX deva_firma_sollzeiten_komponente_sollzeiten_komponente_id_key ON deva_firma_sollzeiten_komponente(sollzeiten_komponente_id)
;
ALTER TABLE deva_komponente
ADD CONSTRAINT fkb8970b338c57da6c
FOREIGN KEY (angelegt_von)
REFERENCES deva_benutzer(id)
;
ALTER TABLE deva_komponente
ADD CONSTRAINT fkb8970b33a1cbfc4
FOREIGN KEY (artikelbild)
REFERENCES deva_dokument(id)
;
ALTER TABLE deva_komponente
ADD CONSTRAINT fkb8970b33843549e2
FOREIGN KEY (kunde)
REFERENCES deva_firma(id)
;
ALTER TABLE deva_komponente
ADD CONSTRAINT fkb8970b3338fd1c19
FOREIGN KEY (lieferant)
REFERENCES deva_firma(id)
;
ALTER TABLE deva_komponente
ADD CONSTRAINT fkb8970b334e705a2c
FOREIGN KEY (komponente_prozess)
REFERENCES deva_prozess(id)
;
ALTER TABLE deva_komponente
ADD CONSTRAINT fkb8970b33a8076cac
FOREIGN KEY (komponentenbezeichnung)
REFERENCES deva_bezeichnung_komponente(id)
;
CREATE UNIQUE INDEX deva_komponente_pkey ON deva_komponente(id)
;
CREATE INDEX komponente_filter_idx ON deva_komponente
(
  lieferant,
  kunde,
  komponentenbezeichnung
)
;
ALTER TABLE deva_komponente_bestandteil
ADD CONSTRAINT fke8ae041bf69c798e
FOREIGN KEY (komponente_bestandteil)
REFERENCES deva_komponente(id)
;
ALTER TABLE deva_komponente_bestandteil
ADD CONSTRAINT fke8ae041b8d6ce006
FOREIGN KEY (komponente)
REFERENCES deva_komponente(id)
;
CREATE UNIQUE INDEX deva_komponente_bestandteil_pkey ON deva_komponente_bestandteil(id)
;
ALTER TABLE deva_komponente_dokumente
ADD CONSTRAINT fkd1dd1e86fe056660
FOREIGN KEY (dokument_id)
REFERENCES deva_dokument(id)
;
ALTER TABLE deva_komponente_dokumente
ADD CONSTRAINT fkd1dd1e86dfa2b9c0
FOREIGN KEY (komponente_id)
REFERENCES deva_komponente(id)
;
CREATE UNIQUE INDEX deva_komponente_dokumente_dokument_id_key ON deva_komponente_dokumente(dokument_id)
;
ALTER TABLE deva_komponente_kommentar
ADD CONSTRAINT fk3b7548acdfa2b9c0
FOREIGN KEY (komponente_id)
REFERENCES deva_komponente(id)
;
ALTER TABLE deva_komponente_kommentar
ADD CONSTRAINT fk3b7548acdc74f062
FOREIGN KEY (benutzer)
REFERENCES deva_benutzer(id)
;
CREATE UNIQUE INDEX deva_komponente_kommentar_pkey ON deva_komponente_kommentar(id)
;
ALTER TABLE deva_komponente_logbuch
ADD CONSTRAINT fk77be0c10dfa2b9c0
FOREIGN KEY (komponente_id)
REFERENCES deva_komponente(id)
;
ALTER TABLE deva_komponente_logbuch
ADD CONSTRAINT fk77be0c10dc74f062
FOREIGN KEY (benutzer)
REFERENCES deva_benutzer(id)
;
CREATE UNIQUE INDEX deva_komponente_logbuch_pkey ON deva_komponente_logbuch(id)
;
ALTER TABLE deva_komponente_verantwortliche
ADD CONSTRAINT fka5971b19b2657c32
FOREIGN KEY (verantwortlicher_id)
REFERENCES deva_benutzer(id)
;
ALTER TABLE deva_komponente_verantwortliche
ADD CONSTRAINT fka5971b19dfa2b9c0
FOREIGN KEY (komponente_id)
REFERENCES deva_komponente(id)
;
ALTER TABLE deva_komponente_zusatzinformationen
ADD CONSTRAINT fka7e180fadfa2b9c0
FOREIGN KEY (komponente_id)
REFERENCES deva_komponente(id)
;
ALTER TABLE deva_komponente_zusatzinformationen
ADD CONSTRAINT fka7e180fa46b7fc54
FOREIGN KEY (zusatzinfo_id)
REFERENCES deva_zusatzinformation(id)
;
CREATE UNIQUE INDEX deva_komponente_zusatzinformationen_zusatzinfo_id_key ON deva_komponente_zusatzinformationen(zusatzinfo_id)
;
ALTER TABLE deva_produktgruppe
ADD CONSTRAINT fkb68b59af748e0737
FOREIGN KEY (obergruppe)
REFERENCES deva_produktgruppe(id)
;
ALTER TABLE deva_produktgruppe
ADD CONSTRAINT fkb68b59af9315e404
FOREIGN KEY (bezeichnung)
REFERENCES deva_bezeichnung_produktgruppe(id)
;
CREATE UNIQUE INDEX deva_produktgruppe_pkey ON deva_produktgruppe(id)
;
ALTER TABLE deva_prozess
ADD CONSTRAINT fk87d31085eb1c5f20
FOREIGN KEY (prozess_definition)
REFERENCES deva_prozessdefinition(id)
;
ALTER TABLE deva_prozess
ADD CONSTRAINT fk87d31085975a806a
FOREIGN KEY (bpmn_definition)
REFERENCES deva_bpmndefinition(id)
;
ALTER TABLE deva_prozess
ADD CONSTRAINT fk87d3108562008c47
FOREIGN KEY (naechster_meilenstein)
REFERENCES deva_prozess_schritt(id)
;
CREATE UNIQUE INDEX deva_prozess_pkey ON deva_prozess(id)
;
CREATE UNIQUE INDEX deva_prozess_process_id_key ON deva_prozess(process_id)
;
ALTER TABLE deva_prozess_schritt
ADD CONSTRAINT fk7cf7493575b486b9
FOREIGN KEY (prozess_schritt_definition)
REFERENCES deva_bezeichung_prozess_schritt(id)
;
ALTER TABLE deva_prozess_schritt
ADD CONSTRAINT fk7cf74935199fc6f5
FOREIGN KEY (abgeschlossener_schritt)
REFERENCES deva_prozess(id)
;
ALTER TABLE deva_prozess_schritt
ADD CONSTRAINT fk7cf7493511000a0a
FOREIGN KEY (aktueller_schritt)
REFERENCES deva_prozess(id)
;
CREATE UNIQUE INDEX deva_prozess_schritt_pkey ON deva_prozess_schritt(id)
;
ALTER TABLE deva_prozessdefinition
ADD CONSTRAINT fka2830f9838fd1c19
FOREIGN KEY (lieferant)
REFERENCES deva_firma(id)
;
ALTER TABLE deva_prozessdefinition
ADD CONSTRAINT fka2830f98843549e2
FOREIGN KEY (kunde)
REFERENCES deva_firma(id)
;
CREATE UNIQUE INDEX deva_prozessdefinition_pkey ON deva_prozessdefinition(id)
;
CREATE UNIQUE INDEX deva_rolle_rolle_key ON deva_rolle(rolle)
;
CREATE UNIQUE INDEX deva_rolle_pkey ON deva_rolle(id)
;
ALTER TABLE deva_rolle_aktions_berechtigungen
ADD CONSTRAINT fk5b9f4d34d1137703
FOREIGN KEY (berechtigung_id)
REFERENCES deva_rolle(id)
;
ALTER TABLE deva_rolle_ampelstatus
ADD CONSTRAINT fk511f24132e56239d
FOREIGN KEY (ampelstatus_id)
REFERENCES deva_rolle(id)
;
ALTER TABLE deva_rolle_prozess_schritt
ADD CONSTRAINT fk3804709e6273aba8
FOREIGN KEY (rolle)
REFERENCES deva_rolle(id)
;
ALTER TABLE deva_rolle_prozess_schritt
ADD CONSTRAINT fk3804709e75b486b9
FOREIGN KEY (prozess_schritt_definition)
REFERENCES deva_bezeichung_prozess_schritt(id)
;
CREATE UNIQUE INDEX deva_rolle_prozess_schritt_pkey ON deva_rolle_prozess_schritt
(
  rolle,
  prozess_schritt_definition
)
;
ALTER TABLE deva_rolle_sicht_berechtigungen
ADD CONSTRAINT fkd632fa90d1137703
FOREIGN KEY (berechtigung_id)
REFERENCES deva_rolle(id)
;
ALTER TABLE deva_sollzeit_wdh_klassifikation
ADD CONSTRAINT fk12895194c589307f
FOREIGN KEY (sollzeiten_id)
REFERENCES deva_sollzeiten(id)
;
CREATE UNIQUE INDEX deva_sollzeit_wdh_klassifikation_pkey ON deva_sollzeit_wdh_klassifikation
(
  sollzeiten_id,
  klassifikation
)
;
ALTER TABLE deva_sollzeiten
ADD CONSTRAINT fk31b0dbce38fe1d3c
FOREIGN KEY (meilenstein_definition)
REFERENCES deva_bezeichung_prozess_schritt(id)
;
CREATE UNIQUE INDEX deva_sollzeiten_pkey ON deva_sollzeiten(id)
;
ALTER TABLE deva_sollzeiten_klassifikation
ADD CONSTRAINT fk8e4ee667c589307f
FOREIGN KEY (sollzeiten_id)
REFERENCES deva_sollzeiten(id)
;
CREATE UNIQUE INDEX deva_sollzeiten_klassifikation_pkey ON deva_sollzeiten_klassifikation
(
  sollzeiten_id,
  klassifikation
)
;
ALTER TABLE deva_uebersetzung_artikel
ADD CONSTRAINT fk51c371f7eacc69fa
FOREIGN KEY (bezeichnung)
REFERENCES deva_bezeichnung_artikel(id)
;
CREATE UNIQUE INDEX deva_uebersetzung_artikel_pkey ON deva_uebersetzung_artikel(id)
;
ALTER TABLE deva_uebersetzung_komponente
ADD CONSTRAINT fk57aff0351dc451da
FOREIGN KEY (bezeichnung)
REFERENCES deva_bezeichnung_komponente(id)
;
CREATE UNIQUE INDEX deva_uebersetzung_komponente_pkey ON deva_uebersetzung_komponente(id)
;
ALTER TABLE deva_uebersetzung_produktgruppe
ADD CONSTRAINT fk88d3d6d9315e404
FOREIGN KEY (bezeichnung)
REFERENCES deva_bezeichnung_produktgruppe(id)
;
CREATE UNIQUE INDEX deva_uebersetzung_produktgruppe_pkey ON deva_uebersetzung_produktgruppe(id)
;
ALTER TABLE deva_uebersetzung_prozess_schritt
ADD CONSTRAINT fk560f3573153e746f
FOREIGN KEY (bezeichnung)
REFERENCES deva_bezeichung_prozess_schritt(id)
;
CREATE UNIQUE INDEX deva_uebersetzung_prozess_schritt_pkey ON deva_uebersetzung_prozess_schritt(id)
;
ALTER TABLE deva_uebersetzung_zubehoer
ADD CONSTRAINT fk8b6a0f27adede368
FOREIGN KEY (bezeichnung)
REFERENCES deva_bezeichnung_zubehoer(id)
;
CREATE UNIQUE INDEX deva_uebersetzung_zubehoer_pkey ON deva_uebersetzung_zubehoer(id)
;
ALTER TABLE deva_uebersetzung_zusatzinformation
ADD CONSTRAINT fkb807fcc8d2732549
FOREIGN KEY (bezeichnung)
REFERENCES deva_bezeichnung_zusatzinformation(id)
;
CREATE UNIQUE INDEX deva_uebersetzung_zusatzinformation_pkey ON deva_uebersetzung_zusatzinformation(id)
;
ALTER TABLE deva_zubehoer
ADD CONSTRAINT fk8b7d1a55e7b2276
FOREIGN KEY (zubehoerbezeichnung)
REFERENCES deva_bezeichnung_zubehoer(id)
;
CREATE UNIQUE INDEX deva_zubehoer_pkey ON deva_zubehoer(id)
;
ALTER TABLE deva_zusatzinformation
ADD CONSTRAINT fkc53a280abb69726c
FOREIGN KEY (zusatzinformationbezeichnung)
REFERENCES deva_bezeichnung_zusatzinformation(id)
;
CREATE UNIQUE INDEX deva_zusatzinformation_pkey ON deva_zusatzinformation(id)
;
CREATE UNIQUE INDEX drools_sessioninfo_pkey ON drools_sessioninfo(id)
;
CREATE UNIQUE INDEX drools_workiteminfo_pkey ON drools_workiteminfo(workitemid)
;
ALTER TABLE jbpm_attachment
ADD CONSTRAINT fkf6bb126df21826d9
FOREIGN KEY (taskdata_attachments_id)
REFERENCES jbpm_task(id)
;
ALTER TABLE jbpm_attachment
ADD CONSTRAINT fkf6bb126d8ef5f064
FOREIGN KEY (attachedby_id)
REFERENCES jbpm_user(id)
;
CREATE UNIQUE INDEX jbpm_attachment_pkey ON jbpm_attachment(id)
;
ALTER TABLE jbpm_boolean_expression
ADD CONSTRAINT fka4a3ea79afb75f7d
FOREIGN KEY (escalation_constraints_id)
REFERENCES jbpm_escalation(id)
;
CREATE UNIQUE INDEX jbpm_boolean_expression_pkey ON jbpm_boolean_expression(id)
;
CREATE UNIQUE INDEX jbpm_content_pkey ON jbpm_content(id)
;
ALTER TABLE jbpm_deadline
ADD CONSTRAINT fk414b6222684baca3
FOREIGN KEY (deadlines_startdeadline_id)
REFERENCES jbpm_task(id)
;
ALTER TABLE jbpm_deadline
ADD CONSTRAINT fk414b622227abeb8a
FOREIGN KEY (deadlines_enddeadline_id)
REFERENCES jbpm_task(id)
;
CREATE UNIQUE INDEX jbpm_deadline_pkey ON jbpm_deadline(id)
;
ALTER TABLE jbpm_delegation_delegates
ADD CONSTRAINT fk4e75de136b2f154
FOREIGN KEY (task_id)
REFERENCES jbpm_task(id)
;
CREATE UNIQUE INDEX jbpm_email_header_pkey ON jbpm_email_header(id)
;
ALTER TABLE jbpm_email_notification
ADD CONSTRAINT fkad3513b53e0890b7099f418
FOREIGN KEY (escalation_notifications_id)
REFERENCES jbpm_escalation(id)
;
CREATE UNIQUE INDEX jbpm_email_notification_pkey ON jbpm_email_notification(id)
;
ALTER TABLE jbpm_email_notification_jbpm_email_header
ADD CONSTRAINT fk9c228713351621ef
FOREIGN KEY (jbpm_email_notification_id)
REFERENCES jbpm_email_notification(id)
;
ALTER TABLE jbpm_email_notification_jbpm_email_header
ADD CONSTRAINT fk9c2287131f7b912a
FOREIGN KEY (emailheaders_id)
REFERENCES jbpm_email_header(id)
;
CREATE UNIQUE INDEX jbpm_email_notification_jbpm_email_header_pkey ON jbpm_email_notification_jbpm_email_header
(
  jbpm_email_notification_id,
  emailheaders_key
)
;
CREATE UNIQUE INDEX jbpm_email_notification_jbpm_email_header_emailheaders_id_key ON jbpm_email_notification_jbpm_email_header(emailheaders_id)
;
ALTER TABLE jbpm_escalation
ADD CONSTRAINT fk5ca4a3dfc7a04c70
FOREIGN KEY (deadline_escalation_id)
REFERENCES jbpm_deadline(id)
;
CREATE UNIQUE INDEX jbpm_escalation_pkey ON jbpm_escalation(id)
;
CREATE UNIQUE INDEX jbpm_group_pkey ON jbpm_group(id)
;
ALTER TABLE jbpm_i18ntext
ADD CONSTRAINT fk17e9841598b62b
FOREIGN KEY (task_names_id)
REFERENCES jbpm_task(id)
;
ALTER TABLE jbpm_i18ntext
ADD CONSTRAINT fk17e9841569b21ee8
FOREIGN KEY (task_descriptions_id)
REFERENCES jbpm_task(id)
;
ALTER TABLE jbpm_i18ntext
ADD CONSTRAINT fk17e984155eebb6d9
FOREIGN KEY (reassignment_documentation_id)
REFERENCES jbpm_reassignment(id)
;
ALTER TABLE jbpm_i18ntext
ADD CONSTRAINT fk17e98415b2fa6b18
FOREIGN KEY (task_subjects_id)
REFERENCES jbpm_task(id)
;
ALTER TABLE jbpm_i18ntext
ADD CONSTRAINT fk17e984153330f6d9
FOREIGN KEY (deadline_documentation_id)
REFERENCES jbpm_deadline(id)
;
CREATE UNIQUE INDEX jbpm_i18ntext_pkey ON jbpm_i18ntext(id)
;
ALTER TABLE jbpm_notification
ADD CONSTRAINT fkad3513b53e0890b
FOREIGN KEY (escalation_notifications_id)
REFERENCES jbpm_escalation(id)
;
CREATE UNIQUE INDEX jbpm_notification_pkey ON jbpm_notification(id)
;
ALTER TABLE jbpm_peopleassignments_bas
ADD CONSTRAINT fk32b3fd6236b2f154
FOREIGN KEY (task_id)
REFERENCES jbpm_task(id)
;
ALTER TABLE jbpm_peopleassignments_exclowners
ADD CONSTRAINT fk2c7efe4e36b2f154
FOREIGN KEY (task_id)
REFERENCES jbpm_task(id)
;
ALTER TABLE jbpm_peopleassignments_potowners
ADD CONSTRAINT fk73d7058336b2f154
FOREIGN KEY (task_id)
REFERENCES jbpm_task(id)
;
ALTER TABLE jbpm_peopleassignments_recipients
ADD CONSTRAINT fkf55e684c36b2f154
FOREIGN KEY (task_id)
REFERENCES jbpm_task(id)
;
ALTER TABLE jbpm_peopleassignments_stakeholders
ADD CONSTRAINT fk7dcd4ddf36b2f154
FOREIGN KEY (task_id)
REFERENCES jbpm_task(id)
;
CREATE UNIQUE INDEX jbpm_processinstance_eventinfo_pkey ON jbpm_processinstance_eventinfo(id)
;
CREATE UNIQUE INDEX jbpm_processinstance_info_pkey ON jbpm_processinstance_info(instanceid)
;
ALTER TABLE jbpm_processinstance_info_eventtypes
ADD CONSTRAINT fk42e004eb2143f831
FOREIGN KEY (jbpm_processinstance_info_id)
REFERENCES jbpm_processinstance_info(instanceid)
;
ALTER TABLE jbpm_reassignment
ADD CONSTRAINT fkf23c3c0aa5c17ee0
FOREIGN KEY (escalation_reassignments_id)
REFERENCES jbpm_escalation(id)
;
CREATE UNIQUE INDEX jbpm_reassignment_pkey ON jbpm_reassignment(id)
;
ALTER TABLE jbpm_reassignment_potentialowners
ADD CONSTRAINT fk3178ef69e17e130f
FOREIGN KEY (task_id)
REFERENCES jbpm_reassignment(id)
;
ALTER TABLE jbpm_subtasksstrategy
ADD CONSTRAINT fk9d95288b36b2f154
FOREIGN KEY (task_id)
REFERENCES jbpm_task(id)
;
CREATE UNIQUE INDEX jbpm_subtasksstrategy_pkey ON jbpm_subtasksstrategy(id)
;
ALTER TABLE jbpm_task
ADD CONSTRAINT fkb48f3a4ff213f8b5
FOREIGN KEY (taskinitiator_id)
REFERENCES jbpm_user(id)
;
ALTER TABLE jbpm_task
ADD CONSTRAINT fkb48f3a4f9e619a0
FOREIGN KEY (createdby_id)
REFERENCES jbpm_user(id)
;
ALTER TABLE jbpm_task
ADD CONSTRAINT fkb48f3a4f6ce1ef3a
FOREIGN KEY (actualowner_id)
REFERENCES jbpm_user(id)
;
CREATE UNIQUE INDEX jbpm_task_pkey ON jbpm_task(id)
;
ALTER TABLE jbpm_task_comment
ADD CONSTRAINT fke7d49c4f2ff04688
FOREIGN KEY (addedby_id)
REFERENCES jbpm_user(id)
;
ALTER TABLE jbpm_task_comment
ADD CONSTRAINT fke7d49c4fb35e68f5
FOREIGN KEY (taskdata_comments_id)
REFERENCES jbpm_task(id)
;
CREATE UNIQUE INDEX jbpm_task_comment_pkey ON jbpm_task_comment(id)
;
CREATE UNIQUE INDEX jbpm_user_pkey ON jbpm_user(id)
;
