CREATE OR REPLACE FUNCTION event_delete(_id int)
 RETURNS  void
 LANGUAGE plpgsql
AS $function$
	BEGIN
       DELETE FROM event WHERE id = _id;
	END;    
$function$
;
