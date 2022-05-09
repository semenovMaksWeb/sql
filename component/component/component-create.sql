CREATE OR REPLACE FUNCTION components.component_create(_name character varying, _description character varying)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
	    INSERT INTO components."component"
            ("name", "description")
            VALUES(_name, _description);
	END;
$function$
;