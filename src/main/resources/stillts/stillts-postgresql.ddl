CREATE TABLE AnbauTexte
(
   ID integer PRIMARY KEY,
   ANBAU1 varchar(12),
   ANBAU2 varchar(36),
   Anwender varchar(10)
);

CREATE TABLE Anbautexte vor Umstellung
(
   ID integer PRIMARY KEY,
   ANBAU1 varchar(255),
   ANBAU2 varchar(255),
   ANBAU1_NEU varchar(12),
   ANBAU2_NEU varchar(36)
);

CREATE TABLE EQUI_UPDATE
(
   EQUNR varchar(18),
   LeerGew varchar(5)
);

CREATE TABLE FLEXREGELUNG
(
 lfdn COUNTER PRIMARY KEY,
 Fabnr VARCHAR(12) ,
 SanrLayout VARCHAR(20) ,
 MZAEHL VARCHAR(8) ,
 MAXZAEHL VARCHAR(8) ,
 MSERIAL VARCHAR(25) ,
 Druckdatum DATETIME ,
 Druckzeit DATETIME ,
 ExecutionTime DOUBLE
);

CREATE TABLE Fabrikschilder
(
 lfdn PRIMARY KEY COUNTER PRIMARY KEY,
 Kont VARCHAR(8),
 Sanr VARCHAR(20),
 Fabnr VARCHAR(12),
 DatumAngelegt DATETIME,
 ZeitAngelegt DATETIME,
 Druckdatum DATETIME,
 Druckzeit DATETIME,
 ExecutionTime DOUBLE,
 Typ VARCHAR(12),
 BauJ VARCHAR(4),
 LeerGew VARCHAR(5),
 NutzL VARCHAR(5),
 GesGew VARCHAR(5),
 ZAchsLV VARCHAR(5),
 ZAchsLH VARCHAR(5),
 BatSp VARCHAR(5),
 BatGeMin VARCHAR(5),
 BatGeMax VARCHAR(5),
 ZGEW VARCHAR(5),
 NANLE VARCHAR(5),
 KZART VARCHAR(1),
 KZANBAU VARCHAR(2),
 GEWIBAT VARCHAR(5),
 GEWIANB VARCHAR(5),
 BatTyp VARCHAR(45),
 Nennhub VARCHAR(4),
 TSchild VARCHAR(20),
 GEWIANB_2 VARCHAR(5),
 ZUGKRAFT05 VARCHAR(8),
 ZUGKRAFT60 VARCHAR(8),
 RAHMENSCHILD VARCHAR(20)
);

CREATE TABLE Fabrikschildzusatzdaten
(
   lfdn PRIMARY KEY integer PRIMARY KEY,
   Sanr varchar(20),
   Fabnr varchar(12),
   DatumAngelegt timestamp,
   ZeitAngelegt timestamp,
   Anwender varchar(10),
   DZKR varchar(4),
   MZKR varchar(5),
   KHMM varchar(20),
   KHIN varchar(20)
);
CREATE TABLE GEWICHT
(
   EQUNR varchar(18),
   LeerGew varchar(7),
   PC varchar(20),
   ANWENDER varchar(15),
   WERK varchar(4),
   KZBAT varchar(1),
   KZKOMPLETT varchar(1),
   KZSTVZO varchar(1),
   TS timestamp
)
;

CREATE TABLE GEWICHTCONF
(
 lfdn COUNTER not null,
 EQUNR VARCHAR(18),
 TS DATETIME,
 ATINN VARCHAR(10),
 ATNAM VARCHAR(30),
 ATWRT VARCHAR(30),
 ATBEZ VARCHAR(30),
 ATWTB VARCHAR(30),
 ZKOMPGEW CURRENCY(13,3),
 ZWERKS_BATT_KZ VARCHAR(1)
);

CREATE TABLE Geraete
(
   lfdn integer PRIMARY KEY,
   KdAuftrag varchar(6),
   Kont varchar(8),
   Fabnr varchar(12),
   KND_BST_NR varchar(10),
   KND_BST_POS_NR varchar(6),
   EQUNR varchar(18),
   SEQNR varchar(14),
   DatumAngelegt timestamp,
   ZeitAngelegt timestamp,
   Druckdatum timestamp,
   Druckzeit timestamp
)
;

CREATE TABLE HinweisSchildArmy
(
 lfdn COUNTER not null,
 FABNR VARCHAR(12),
 VERNR VARCHAR(50),
 HERST VARCHAR(50),
 TYP VARCHAR(50),
 BAUJ VARCHAR(50),
 GERAET VARCHAR(50),
 AUFNR VARCHAR(50),
 SanrLayout VARCHAR(20),
 DatumAngelegt DATETIME,
 ZeitAngelegt DATETIME,
 Druckdatum DATETIME,
 Druckzeit DATETIME,
 ExecutionTime DOUBLE
);

CREATE TABLE KopieTELE211Upload
(
   Send varchar(4),
   Empf varchar(4),
   Telegramm varchar(4),
   Satzart varchar(3),
   Zeitstempel varchar(14),
   Lauf varchar(3),
   NutzLen varchar(5),
   Resp1 varchar(2),
   Resp2 varchar(2),
   Rcode varchar(2),
   Fabnr varchar(12),
   Kont varchar(8),
   OHAU varchar(9),
   AFO varchar(3)
);

CREATE TABLE Laermschilder
(
 lfdn COUNTER not null,
 lfdnDaten INTEGER,
 Kont VARCHAR(8),
 Fabnr VARCHAR(12),
 Sanr VARCHAR(20),
 DatumAngelegt DATETIME,
 ZeitAngelegt DATETIME,
 Druckdatum DATETIME,
 Druckzeit DATETIME,
 ExecutionTime DOUBLE
);

CREATE TABLE LaermschilderDaten
(
   lfdn integer PRIMARY KEY,
   Sanr varchar(20),
   SanrLayout varchar(20),
   Dezibel varchar(50),
   DatumAngelegt timestamp,
   ZeitAngelegt timestamp
);

CREATE TABLE LayoutAktionen
(
   Fabnr varchar(12),
   SanrLayout varchar(20)
);

CREATE TABLE Notfallgeraete
(
   Fabnr varchar(12)
);

CREATE TABLE STVZOSchild
(
 lfdn COUNTER not null,
 Fabnr VARCHAR(12),
 SanrLayout VARCHAR(20),
 LeerGew VARCHAR(5),
 GesGew VARCHAR(5),
 ZAchsLV VARCHAR(5),
 ZAchsLH VARCHAR(5),
 GEWIBAT VARCHAR(5),
 GEWIANB VARCHAR(5),
 Druckdatum DATETIME,
 Druckzeit DATETIME,
 ExecutionTime DOUBLE
);

CREATE TABLE SonstigeSchilder
(
 lfdn COUNTER not null,
 Kont VARCHAR(8),
 Fabnr VARCHAR(12),
 Sanr VARCHAR(20),
 SanrLayout VARCHAR(20),
 DatumAngelegt DATETIME,
 ZeitAngelegt DATETIME,
 Druckdatum DATETIME,
 Druckzeit DATETIME,
 ExecutionTime DOUBLE
);

CREATE TABLE TELE0207
(
   Send varchar(4),
   Empf varchar(4),
   Telegramm varchar(4),
   Satzart varchar(3),
   Zeitstempel varchar(14),
   Lauf varchar(3),
   NutzLen varchar(5),
   Resp1 varchar(2),
   Resp2 varchar(2),
   Rcode varchar(2),
   Fabnr varchar(12),
   KdAuftrag varchar(6),
   Typ varchar(12),
   BauJ varchar(4),
   LeerGew varchar(5),
   NutzL varchar(5),
   GesGew varchar(5),
   ZAchsLV varchar(5),
   ZAchsLH varchar(5),
   BatSp varchar(5),
   BatGeMin varchar(5),
   BatGeMax varchar(5),
   Sanr varchar(20),
   ZGEW varchar(5),
   NANLE varchar(5),
   KZART varchar(1),
   KZANBAU varchar(2),
   GEWIBAT varchar(5),
   GEWIANB varchar(5),
   BatTyp varchar(45),
   Nennhub varchar(4),
   TSchild varchar(20),
   GEWIANB_2 varchar(5),
   KND_BST_NR varchar(10),
   KND_BST_POS_NR varchar(6),
   EQUNR varchar(18),
   SEQNR varchar(14),
   ZUGKRAFT05 varchar(8),
   ZUGKRAFT60 varchar(8),
   MZAEHL varchar(8),
   MAXZAEHL varchar(8),
   MSERIAL varchar(25),
   SanrLayout varchar(20)
);

CREATE TABLE TELE0207_alt01
(
   Send varchar(4),
   Empf varchar(4),
   Telegramm varchar(4),
   Satzart varchar(3),
   Zeitstempel varchar(14),
   Lauf varchar(3),
   NutzLen varchar(5),
   Resp1 varchar(2),
   Resp2 varchar(2),
   Rcode varchar(2),
   Fabnr varchar(12),
   KdAuftrag varchar(6),
   Typ varchar(10),
   BauJ varchar(4),
   LeerGew varchar(5),
   NutzL varchar(5),
   GesGew varchar(5),
   ZAchsLV varchar(5),
   ZAchsLH varchar(5),
   BatSp varchar(5),
   BatGeMin varchar(5),
   BatGeMax varchar(5),
   Sanr varchar(20),
   ZGEW varchar(5),
   NANLE varchar(5)
);

CREATE TABLE TELE0207_alt02
(
   Send varchar(4),
   Empf varchar(4),
   Telegramm varchar(4),
   Satzart varchar(3),
   Zeitstempel varchar(14),
   Lauf varchar(3),
   NutzLen varchar(5),
   Resp1 varchar(2),
   Resp2 varchar(2),
   Rcode varchar(2),
   Fabnr varchar(12),
   KdAuftrag varchar(6),
   Typ varchar(12),
   BauJ varchar(4),
   LeerGew varchar(5),
   NutzL varchar(5),
   GesGew varchar(5),
   ZAchsLV varchar(5),
   ZAchsLH varchar(5),
   BatSp varchar(5),
   BatGeMin varchar(5),
   BatGeMax varchar(5),
   Sanr varchar(20),
   ZGEW varchar(5),
   NANLE varchar(5),
   KZART varchar(1),
   KZANBAU varchar(2),
   GEWIBAT varchar(5),
   GEWIANB varchar(5),
   BatTyp varchar(45),
   Nennhub varchar(4),
   TSchild varchar(20),
   GEWIANB_2 varchar(5)
);

CREATE TABLE TELE0208
(
   Send varchar(4),
   Empf varchar(4),
   Telegramm varchar(4),
   Satzart varchar(3),
   Zeitstempel varchar(14),
   Lauf varchar(3),
   NutzLen varchar(5),
   Resp1 varchar(2),
   Resp2 varchar(2),
   Rcode varchar(2),
   Fabnr varchar(12),
   KdAuftrag varchar(6),
   Sanr varchar(20),
   Layout varchar(20)
);

CREATE TABLE TELE0209
(
   ID integer PRIMARY KEY,
   Send varchar(4),
   Empf varchar(4),
   Telegramm varchar(4),
   Satzart varchar(3),
   Zeitstempel varchar(14),
   Lauf varchar(3),
   NutzLen varchar(5),
   Resp1 varchar(2),
   Resp2 varchar(2),
   Rcode varchar(2),
   Fabnr varchar(12),
   Filler varchar(12)
);

CREATE TABLE TELE0211
(
   Send varchar(4),
   Empf varchar(4),
   Telegramm varchar(4),
   Satzart varchar(3),
   Zeitstempel varchar(14),
   Lauf varchar(3),
   NutzLen varchar(5),
   Resp1 varchar(2),
   Resp2 varchar(2),
   Rcode varchar(2),
   Fabnr varchar(12),
   Kont varchar(8),
   OHAU varchar(9),
   AFO varchar(3)
);

CREATE TABLE TELE0616
(
   Send varchar(4),
   Empf varchar(4),
   Telegramm varchar(4),
   Satzart varchar(3),
   Zeitstempel varchar(14),
   Lauf varchar(3),
   NutzLen varchar(5),
   Resp1 varchar(2),
   Resp2 varchar(2),
   Rcode varchar(2),
   Leer varchar(2),
   Modus varchar(4),
   Fabnr varchar(12),
   Cffs varchar(3),
   Ohau varchar(9)
);

CREATE TABLE TELE207Upload
(
   Send varchar(4),
   Empf varchar(4),
   Telegramm varchar(4),
   Satzart varchar(3),
   Zeitstempel varchar(14),
   Lauf varchar(3),
   NutzLen varchar(5),
   Resp1 varchar(2),
   Resp2 varchar(2),
   Rcode varchar(2),
   Fabnr varchar(12),
   KdAuftrag varchar(6),
   Typ varchar(12),
   BauJ varchar(4),
   LeerGew varchar(5),
   NutzL varchar(5),
   GesGew varchar(5),
   ZAchsLV varchar(5),
   ZAchsLH varchar(5),
   BatSp varchar(5),
   BatGeMin varchar(5),
   BatGeMax varchar(5),
   Sanr varchar(20),
   ZGEW varchar(5),
   NANLE varchar(5),
   KZART varchar(1),
   KZANBAU varchar(2),
   GEWIBAT varchar(5),
   GEWIANB varchar(5),
   BatTyp varchar(45),
   Nennhub varchar(4),
   TSchild varchar(20),
   GEWIANB_2 varchar(5)
);

CREATE TABLE TELE207Upload_alt
(
   Send varchar(4),
   Empf varchar(4),
   Telegramm varchar(4),
   Satzart varchar(3),
   Zeitstempel varchar(14),
   Lauf varchar(3),
   NutzLen varchar(5),
   Resp1 varchar(2),
   Resp2 varchar(2),
   Rcode varchar(2),
   Fabnr varchar(12),
   KdAuftrag varchar(6),
   Typ varchar(12),
   BauJ varchar(4),
   LeerGew varchar(5),
   NutzL varchar(5),
   GesGew varchar(5),
   ZAchsLV varchar(5),
   ZAchsLH varchar(5),
   BatSp varchar(5),
   BatGeMin varchar(5),
   BatGeMax varchar(5),
   Sanr varchar(20),
   ZGEW varchar(5),
   NANLE varchar(5)
);

CREATE TABLE TELE208Upload
(
   Send varchar(4),
   Empf varchar(4),
   Telegramm varchar(4),
   Satzart varchar(3),
   Zeitstempel varchar(14),
   Lauf varchar(3),
   NutzLen varchar(5),
   Resp1 varchar(2),
   Resp2 varchar(2),
   Rcode varchar(2),
   Fabnr varchar(12),
   KdAuftrag varchar(6),
   Sanr varchar(20),
   Layout varchar(20)
);

CREATE TABLE TELE211Upload
(
   Send varchar(4),
   Empf varchar(4),
   Telegramm varchar(4),
   Satzart varchar(3),
   Zeitstempel varchar(14),
   Lauf varchar(3),
   NutzLen varchar(5),
   Resp1 varchar(2),
   Resp2 varchar(2),
   Rcode varchar(2),
   Fabnr varchar(12),
   Kont varchar(8),
   OHAU varchar(9),
   AFO varchar(3)
);

CREATE TABLE TELE616Upload
(
   Send varchar(4),
   Empf varchar(4),
   Telegramm varchar(4),
   Satzart varchar(3),
   Zeitstempel varchar(14),
   Lauf varchar(3),
   NutzLen varchar(5),
   Resp1 varchar(2),
   Resp2 varchar(2),
   Rcode varchar(2),
   Leer varchar(2),
   Modus varchar(4),
   Fabnr varchar(12),
   Cffs varchar(3),
   Ohau varchar(9)
);

CREATE TABLE TragFLayoutsachnummern
(
   lfdn integer PRIMARY KEY,
   Sanr varchar(20),
   Sprache varchar(40),
   Typ varchar(1),
   Längenmass varchar(10),
   Gewichtsmass varchar(10),
   Zeilen integer,
   Spalten integer,
   SpaltenLayout integer,
   DatumAngelegt timestamp,
   ZeitAngelegt timestamp,
   Sprache_Kurz varchar(25)
);

CREATE TABLE TragFLayoutsachnummern (alt)
(
   lfdn integer PRIMARY KEY,
   Sanr varchar(6),
   Sprache varchar(20),
   Typ varchar(1),
   Zeilen integer,
   Spalten integer,
   DatumAngelegt timestamp,
   ZeitAngelegt timestamp
);

CREATE TABLE TragFLayoutsachnummern_alt
(
   lfdn integer PRIMARY KEY,
   Sanr varchar(6),
   Sprache varchar(20),
   Typ varchar(1),
   Längenmass varchar(10),
   Gewichtsmass varchar(10),
   Zeilen integer,
   Spalten integer,
   DatumAngelegt timestamp,
   ZeitAngelegt timestamp
);

CREATE TABLE TragFLayoutsachnummernAlt
(
   lfdn integer PRIMARY KEY,
   Sanr varchar(6),
   Sprache varchar(40),
   Typ varchar(1),
   Längenmass varchar(10),
   Gewichtsmass varchar(10),
   Zeilen integer,
   Spalten integer,
   DatumAngelegt timestamp,
   ZeitAngelegt timestamp
);


CREATE TABLE fertig
(
   Fabnr varchar(12),
   FertigDatum timestamp
);

CREATE TABLE Tragfähigkeitsschilder
(
 lfdn COUNTER not null,
 lfdnDaten INTEGER,
 Kont VARCHAR(8),
 Fabnr VARCHAR(12),
 KZKundenbezogen BIT not,
 Sanr VARCHAR(20),
 DatumAngelegt DATETIME,
 ZeitAngelegt DATETIME,
 DruckKZ VARCHAR(1),
 Druckdatum DATETIME,
 Druckzeit DATETIME,
 ExecutionTime DOUBLE,
 SanrLayout VARCHAR(20),
 Zusatzdaten VARCHAR(50)
);

CREATE TABLE TragfähigkeitsschilderDaten
(
   lfdn integer PRIMARY KEY,
   Fabnr varchar(12),
   KdAuftrag varchar(6),
   KZLink varchar(1),
   Sanr varchar(20),
   SanrLayout varchar(20),
   Zusatzdaten varchar(50),
   DatumAngelegt timestamp,
   ZeitAngelegt timestamp,
   Anwender varchar(10),
   Dokument varchar(40),
   KND_BST_NR varchar(10),
   KND_BST_POS_NR varchar(6),
   BODFR varchar(4),
   KOBJNR varchar(22)
);

CREATE TABLE TragfähigkeitsschilderPositionen
(
   lfdnDaten integer,
   Pos varchar(4),
   Wert varchar(5)
);

CREATE TABLE Waage
(
   EQUI varchar(18),
   GEWICHT varchar(5),
   KZKOMPLETT varchar(1),
   KZBATT varchar(1),
   NUTZLAST varchar(1),
   KZSTVZO varchar(5)
);
