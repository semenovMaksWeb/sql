CREATE OR REPLACE FUNCTION component_delete(_id int)
 RETURNS  void
 LANGUAGE plpgsql
AS $function$
	BEGIN
        DELETE FROM "component" WHERE id = _id;
	END;
$function$
;