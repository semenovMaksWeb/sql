CREATE OR REPLACE FUNCTION type_history_get()
 RETURNS TABLE(id bigint, name character varying)
 LANGUAGE plpgsql
AS $function$
	begin
		return query
            SELECT id, name FROM type_history
	END;
$function$
;
