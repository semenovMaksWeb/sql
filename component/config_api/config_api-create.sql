CREATE OR REPLACE FUNCTION public.config_api_create(_url varchar, _type varchar, _id_component int)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
        INSERT INTO "config_api"
            ("url","type", "id_component")
            VALUES(_url, _type, _id_component);
	END;
$function$
;