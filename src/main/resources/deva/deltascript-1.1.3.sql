-- Delta-Skript zur Datenbank-Transformation für den Versionswechsel von 1.1.1 auf 1.1.2

-- ProzessSchritt.processNodeId wird nicht mehr benötigt.
ALTER TABLE DEVA_PROZESS_SCHRITT DROP COLUMN PROCESSNODE_ID;

-- Für jeden ProzessSchritt eines _abgeschlossenen_ (finished) Prozesses, dessen WEITERGESCHALTET_DATUM null ist,
-- soll dieses auf das IST_DATUM (erreicht am) gesetzt werden (sodass es danach nicht mehr null ist).
UPDATE DEVA_PROZESS_SCHRITT
  SET WEITERGESCHALTET_DATUM = IST_DATUM
  WHERE WEITERGESCHALTET_DATUM IS NULL AND ABGESCHLOSSENER_SCHRITT IS NOT NULL;

