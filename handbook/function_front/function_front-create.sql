CREATE OR REPLACE FUNCTION function_front_create(
    _name character varying,
    _description varying = null,
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
    	INSERT INTO function_front (name, description) VALUES(_name, _description);
	END;
$function$
;
