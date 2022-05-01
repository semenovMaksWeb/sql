CREATE OR REPLACE FUNCTION type_var_get()
 RETURNS TABLE(id bigint, name character varying)
 LANGUAGE plpgsql
AS $function$
	begin
		return query
            select * from typevar t 
	END;
$function$
;
