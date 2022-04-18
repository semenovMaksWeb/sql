CREATE OR REPLACE FUNCTION rights_create(
	_name character varying
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
        INSERT INTO rights (name) VALUES(%L);
	END;
$function$
;
 