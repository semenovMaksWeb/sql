CREATE OR REPLACE FUNCTION public.element_fd_delete(_id int)
 RETURNS  void
 LANGUAGE plpgsql
AS $function$
	BEGIN
          DELETE FROM public."element_fd" WHERE id = _id;
	END;
$function$
;