CREATE OR REPLACE FUNCTION public.schema_table_create(_id_components int, _key varchar,_sort boolean, _title varchar, _button int, _w int)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
        INSERT INTO "schema_table"
            ("id_components","key", "sort", "title", "button", "w")
            VALUES(_id_components, _key, _sort, _title, _button, _w);
	END;
$function$
;