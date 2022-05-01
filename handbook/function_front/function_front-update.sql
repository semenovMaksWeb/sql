CREATE OR REPLACE FUNCTION function_front_update(
	_id int,
    _name character varchar,
    _description varchar = null
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
		UPDATE function_front 
		SET 
			"name"=_name, 
			"description"=_description
		WHERE id=_id;
	END;
$function$
;
