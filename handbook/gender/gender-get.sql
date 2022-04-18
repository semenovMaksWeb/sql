CREATE OR REPLACE FUNCTION gender_get()
 RETURNS TABLE(id bigint, name character varying)
 LANGUAGE plpgsql
AS $function$
	begin
		return query
            SELECT id, name FROM gender
	END;
$function$
;
