CREATE OR REPLACE FUNCTION component_create(_name character varying, _description character varying)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
	    INSERT INTO "component"
            ("name", "description")
            VALUES(_name, _description);
	END;
$function$
;
