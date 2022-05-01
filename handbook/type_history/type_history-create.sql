CREATE OR REPLACE FUNCTION type_history_create(
    _name character varying
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
    	INSERT INTO type_history (name) VALUES(_name);
	END;
$function$
;
