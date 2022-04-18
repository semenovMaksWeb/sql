CREATE OR REPLACE FUNCTION roles_delete(
    _id integer
)
	RETURNS void
	LANGUAGE plpgsql
AS $function$
	begin
        DELETE  FROM roles where id = %1$s
	END;
$function$
;