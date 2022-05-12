CREATE OR REPLACE FUNCTION components.screen_platform_get(_id int)
 RETURNS  TABLE(screen json)
 LANGUAGE plpgsql
AS $function$
	DECLARE
	id_component_screen int[];
	id_component_form int[];
	BEGIN
	id_component_screen := (select array_agg(ce.id::INT)
		from components."screen" s 
		left join components."screen_components" sc on sc.id_screen  = s.id
		left join components."component_example" ce on ce.id = sc.id_component
		where s.id  = _id);
	id_component_form := (select array_agg(sf.id_components)
		from components."component_example" ce 
		left join components."schema_form" sf on sf.id_form = ce.id
		where ce.id = any (id_component_screen) and sf.id_components notnull);   		
--	главный select
  return query 
  select json_build_object(
	'screen', json_build_object(
		'id', s.id,
		'url', s.url
	),
	'breadcrumbs', b,
 	'components', components."components_platform_get"(array_cat(id_component_screen, id_component_form))
) screen
from components."screen" s
left join (
	select 
		b.id_screen,
		json_agg(
        	json_build_object(
            	'name', b."name",
            	'url', b.url,
				'order', b.order
        	)
	) b 
	from components."breadcrumbs" b
	group by b.id_screen
) b on b.id_screen = _id
where s.id = _id;
	END;    
$function$
;