CREATE OR REPLACE FUNCTION type_history_update(
	_name character varying, 
	_id bigint
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
        UPDATE _handbook.%1$s SET "name"=%L WHERE id=%2$s;
	END;
$function$
;
