create or replace function drop_all_sequences() returns integer as '
declare
 rec record;
begin
 for rec in select relname as seqname
   from pg_class where relkind=''S''
 loop
   execute ''drop sequence '' || rec.seqname || '' CASCADE'';
 end loop;
 return 1;
end;
' language 'plpgsql';

create or replace function drop_all_constraints() returns integer as '
DECLARE r record;
BEGIN
   FOR r IN SELECT table_name,constraint_name
            FROM information_schema.constraint_table_usage
   LOOP
      EXECUTE ''ALTER TABLE '' || quote_ident(r.table_name) || '' DROP CONSTRAINT '' || quote_ident(r.constraint_name) || '' CASCADE'';
   END LOOP;

   RETURN 1;
END;
' language 'plpgsql';

create or replace function drop_all_tables() returns integer as '
DECLARE r record;
BEGIN
   FOR r IN SELECT table_name,constraint_name
            FROM information_schema.constraint_table_usage
   LOOP
      EXECUTE ''DROP TABLE public.'' || quote_ident(r.table_name) || '' CASCADE'';
   END LOOP;

   RETURN 1;
END;
' language 'plpgsql';


SELECT drop_all_sequences();
