CREATE OR REPLACE FUNCTION public.params_update_description(_id int, _description varchar)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
	    UPDATE public."params"
	    SET "description" = _description
	    where public."params".id  = _id;
	END;
$function$
;

