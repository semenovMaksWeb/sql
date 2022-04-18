CREATE OR REPLACE FUNCTION component_update(_id int, _name varchar, _description varchar, _active bool)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
	    UPDATE component
	    SET
	        "name" = _name,
	        "description" = _description,
	        "active" = _active
	    WHERE component.id = _id;
	END;
$function$
;