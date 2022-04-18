CREATE OR REPLACE FUNCTION component_get_all()
 RETURNS TABLE(component_id integer, component_name varchar, component_description varchar, component_active bool)
 LANGUAGE plpgsql
AS $function$
	BEGIN
        return query
          select
            c.id as component_id,
            c.name as component_name,
            c.description as component_description,
            c.active as component_active
            from component c;
	END;
$function$
;