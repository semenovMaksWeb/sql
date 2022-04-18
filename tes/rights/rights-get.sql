CREATE OR REPLACE FUNCTION rights_get(
	_name character varying,
	_id integer
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
        SELECT id, name FROM rights
	END;
$function$
;
 