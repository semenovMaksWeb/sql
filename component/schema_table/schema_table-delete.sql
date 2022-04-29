CREATE OR REPLACE FUNCTION public.schema_table_delete(_id int)
 RETURNS  void
 LANGUAGE plpgsql
AS $function$
	BEGIN
          DELETE FROM public."schema_table" WHERE id = _id;
	END;
$function$
;