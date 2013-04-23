-- Delta-Skript zur Datenbank-Transformation für den Versionswechsel von 1.1.1 auf 1.1.2

-- ProzessSchritt.processNodeId wird nicht mehr benötigt.
ALTER TABLE DEVA_PROZESS_SCHRITT DROP COLUMN PROCESSNODE_ID;

-- Für jeden ProzessSchritt eines _abgeschlossenen_ (finished) Prozesses, dessen WEITERGESCHALTET_DATUM null ist,
-- soll dieses auf das IST_DATUM (erreicht am) gesetzt werden (sodass es danach nicht mehr null ist).
UPDATE DEVA_PROZESS_SCHRITT
  SET WEITERGESCHALTET_DATUM = IST_DATUM
  WHERE WEITERGESCHALTET_DATUM IS NULL AND ABGESCHLOSSENER_SCHRITT IS NOT NULL;




create table public.DEVA_ABSTRACT_PROZESSKONV_FEHLER (
    ID  bigserial not null,
    VERSION int8,
    DATE_OF_CONVERSION timestamp not null,
    ERROR_MESSAGE varchar(255) not null,
    primary key (ID)
);

create table public.DEVA_ARTIKEL_PROZESS_KONVFEHLER (
    ID int8 not null,
    ARTIKEL_ID int8,
    primary key (ID)
);

alter table public.DEVA_ARTIKEL_PROZESS_KONVFEHLER 
    add constraint FK3A31D529AB214BC 
    foreign key (ID) 
    references public.DEVA_ABSTRACT_PROZESSKONV_FEHLER;

alter table public.DEVA_ARTIKEL_PROZESS_KONVFEHLER 
    add constraint FK3A31D5297FFED7F4 
    foreign key (ARTIKEL_ID) 
    references public.DEVA_ARTIKEL;
    
    

create table public.DEVA_KOMPONENTE_PROZESS_KONVFEHLER (
    ID int8 not null,
    KOMPONENTE_ID int8,
    primary key (ID)
);

alter table public.DEVA_KOMPONENTE_PROZESS_KONVFEHLER 
    add constraint FKCB8E7B6FAB214BC 
    foreign key (ID) 
    references public.DEVA_ABSTRACT_PROZESSKONV_FEHLER;

alter table public.DEVA_KOMPONENTE_PROZESS_KONVFEHLER 
    add constraint FKCB8E7B6FDFA2B9C0 
    foreign key (KOMPONENTE_ID) 
    references public.DEVA_KOMPONENTE;
    
ALTER TABLE DEVA_ABSTRACT_PROZESSKONV_FEHLER OWNER TO meyle;
ALTER TABLE DEVA_ARTIKEL_PROZESS_KONVFEHLER OWNER TO meyle;
ALTER TABLE DEVA_KOMPONENTE_PROZESS_KONVFEHLER OWNER TO meyle;