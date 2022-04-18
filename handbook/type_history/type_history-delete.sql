CREATE OR REPLACE FUNCTION type_history_delete(
    _id bigint
)
	RETURNS void
	LANGUAGE plpgsql
AS $function$
	begin
    	DELETE FROM type_history where id = %1$s
	END;
$function$
;
