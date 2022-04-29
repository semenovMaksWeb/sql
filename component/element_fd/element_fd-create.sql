CREATE OR REPLACE FUNCTION public.element_fd_create(_name_params varchar, _result varchar, _type int, _name varchar, _index int = null, _var_type int = null )
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
		INSERT INTO "element_fd"
            ("name_params", "result", "type", "name", "index", "var_type")
            VALUES(_name_params, _result, _type, _name, _index, _var_type);
	END;
$function$
;