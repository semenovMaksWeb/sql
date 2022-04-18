CREATE OR REPLACE FUNCTION public.params_delete(_id int)
 RETURNS  void
 LANGUAGE plpgsql
AS $function$
	BEGIN
          DELETE FROM public."params" WHERE id = _id;
	END;
$function$
;