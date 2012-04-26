CREATE OR REPLACE FUNCTION drop_all_sequences() RETURNS INTEGER AS '
DECLARE
 rec record;
BEGIN
 FOR rec IN SELECT relname as seqname FROM pg_class WHERE relkind=''S''
 LOOP
   EXECUTE ''DROP SEQUENCE '' || rec.seqname || '' CASCADE'';
 END LOOP;

 RETURN 1;
END;
' language 'plpgsql';

CREATE OR REPLACE FUNCTION drop_all_constraints() RETURNS INTEGER AS '
DECLARE
	r record;
BEGIN
   FOR r IN SELECT table_name, constraint_name FROM information_schema.constraint_table_usage
   LOOP
      EXECUTE ''ALTER TABLE '' || quote_ident(r.table_name) || '' DROP CONSTRAINT '' || quote_ident(r.constraint_name) || '' CASCADE'';
   END LOOP;

   RETURN 1;
END;
' language 'plpgsql';

CREATE OR REPLACE FUNCTION drop_all_tables() RETURNS INTEGER AS '
DECLARE
	r record;
BEGIN
   FOR r IN SELECT schemaname, tablename FROM pg_tables WHERE schemaname =''public''
   LOOP
      EXECUTE ''DROP TABLE IF EXISTS '' || quote_ident(r.schemaname) || ''.'' || quote_ident(r.tablename) || '' CASCADE'';
   END LOOP;

   RETURN 1;
END;
' language 'plpgsql';

CREATE OR REPLACE FUNCTION truncate_all_tables() RETURNS INTEGER AS '
DECLARE
	r record;
BEGIN
   FOR r IN SELECT schemaname, tablename FROM pg_tables WHERE schemaname =''public''
   LOOP
      EXECUTE ''TRUNCATE TABLE '' || quote_ident(r.schemaname) || ''.'' || quote_ident(r.tablename) || '' CASCADE'';
   END LOOP;

   RETURN 1;
END;
' language 'plpgsql';


SELECT drop_all_tables();
SELECT drop_all_sequences();

-- SELECT pg_size_pretty(pg_database_size('tdmka'));
-- SELECT 'VACUUM FULL ANALYZE ' || quote_ident(r.schemaname) || '.' || quote_ident(r.tablename) || ';' FROM pg_tables r WHERE schemaname ='public'
