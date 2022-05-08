CREATE OR REPLACE FUNCTION screen_platform_get(_id int)
 RETURNS  TABLE(screen json)
 LANGUAGE plpgsql
AS $function$
	BEGIN
--	главный select
  return query 
  select json_build_object(
	'screen', json_build_object(
		'id', s.id,
		'url', s.url
	),
	'breadcrumbs', b,
	'components', components_platform_get((
		select array_agg(ce.id::INT)
		from components.screen s 
			left join components.screen_components sc on sc.id_screen  = s.id
			left join components.component_example ce on ce.id = sc.id_component
			where s.id  = _id
	))
) screen
from components.screen s
left join (
	select 
		b.id_screen,
		json_agg(
        	json_build_object(
            	'name', b."name",
            	'url', b.url
        	)
	) b 
	from components.breadcrumbs b
	group by b.id_screen
) b on b.id_screen = _id
where s.id = _id;
	END;    
$function$
;


select * from screen_platform_get(1);