CREATE OR REPLACE FUNCTION public.component_rule_create(_id_params int, _id_component int, _url varchar = NULL, _default boolean = NULL)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
	    INSERT INTO "component_rule"
            ("id_params", "id_component", "url", "default")
            VALUES(_id_params, _id_component, _url, _default);
	END;
$function$
;