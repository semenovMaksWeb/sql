CREATE OR REPLACE FUNCTION function_front_get()
 RETURNS TABLE(id bigint, name character varchar, description varchar)
 LANGUAGE plpgsql
AS $function$
	begin
		return query
            select * from function_front ff;
	END;
$function$
;
