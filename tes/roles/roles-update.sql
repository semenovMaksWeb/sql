CREATE OR REPLACE FUNCTION roles_update(
	_name character varying,
	_id integer
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
         UPDATE roles SET "name"=%L WHERE id=%2$s;
	END;
$function$
;
 