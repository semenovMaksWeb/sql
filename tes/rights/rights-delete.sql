CREATE OR REPLACE FUNCTION rights_delete(
    _id integer
)
	RETURNS void
	LANGUAGE plpgsql
AS $function$
	begin
        DELETE  FROM rights where id = %1$s
	END;
$function$
;