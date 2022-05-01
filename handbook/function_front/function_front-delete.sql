CREATE OR REPLACE FUNCTION function_front_delete(
    _id bigint
)
	RETURNS void
	LANGUAGE plpgsql
AS $function$
	begin
    	DELETE FROM function_front where id = _id
	END;
$function$
;
