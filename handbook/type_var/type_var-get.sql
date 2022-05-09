CREATE OR REPLACE FUNCTION type_var_get()
 RETURNS TABLE(id int, "name" character varying)
 LANGUAGE plpgsql
AS $function$
	begin
		return query
            select * from components."typevar" t; 
	END;
$function$
;
