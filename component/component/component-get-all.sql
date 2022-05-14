CREATE OR REPLACE FUNCTION components.component_get_all()
 RETURNS TABLE(component_id integer, component_name varchar, )
 LANGUAGE plpgsql
AS $function$
	BEGIN
        return query
          select
            c.id as component_id,
            c.name as component_name,
            c.description component_description
            from components."component" c
	END;
$function$
;