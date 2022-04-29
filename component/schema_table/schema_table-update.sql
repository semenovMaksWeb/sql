CREATE OR REPLACE FUNCTION public.schema_table_update(_id int, _key varchar,_sort boolean, _title varchar, _button int, _w int)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
	    UPDATE public."schema_table"
	    SET
	        "key" = _key,
	        "sort" = _sort,
	        "title" = _title,
	        "button" = _button,
            "w" = _w
	    WHERE public."schema_table"."id" = _id;
	END;
$function$
;