CREATE OR REPLACE FUNCTION public.params_insert(_name varchar, _req bool, _description varchar, _type int)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
	    INSERT INTO "params"
            ("name", "req", "description", "type")
            VALUES(_name, _req, _description, _type);
	END;
$function$
;