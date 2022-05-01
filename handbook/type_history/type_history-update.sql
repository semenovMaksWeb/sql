CREATE OR REPLACE FUNCTION type_history_update(
	_name character varying, 
	_id bigint
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
        UPDATE type_history SET "name"=_name WHERE id=%2$s;
	END;
$function$
;
