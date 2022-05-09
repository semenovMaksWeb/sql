CREATE OR REPLACE FUNCTION component_get_name(_name varchar)
 RETURNS TABLE(component_id integer, component_name varchar)
 LANGUAGE plpgsql
AS $function$
	BEGIN
        return query
          select
            c.id as component_id,
            c.name as component_name
            from components."component" c
            where c.name = _name;
	END;
$function$
;