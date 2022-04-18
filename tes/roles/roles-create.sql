CREATE OR REPLACE FUNCTION roles_create(
	_name character varying
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
        INSERT INTO roles (name) VALUES(%L);
	END;
$function$
;
 