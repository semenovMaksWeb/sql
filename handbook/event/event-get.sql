CREATE OR REPLACE FUNCTION event_get()
 RETURNS TABLE(id integer, name character varying, description character varying, date timestamp without time zone)
 LANGUAGE plpgsql
AS $function$
	BEGIN
        return query select event.id, event.name, event.description, event.date from event;
	END;    
$function$
;