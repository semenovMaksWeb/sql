CREATE OR REPLACE FUNCTION event_create(_name varchar, _description varchar)
 RETURNS  void
 LANGUAGE plpgsql
AS $function$
	BEGIN
        INSERT INTO "event"
            ("name", description)
            VALUES(_name, _description);
	END;    
$function$
;