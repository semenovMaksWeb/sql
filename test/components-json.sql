--	главный select
select json_build_object(
	'screen_id', s.id,
	'component', components
)
from screen s 
left join (
--	компоненты select
	select 
	sc.id_screen,
	json_agg(
			json_build_object(
			'id', sc.id,
			'class', ce."class", 
			'style', ce."style",
			'type', c."name",
			'params', cp.params 
			)
	) components
	from screen_components sc
	left join component_example ce on ce.id = sc.id
	left join component c on c.id = ce.id_component
--	параметры
		left join (
			select
		cp.id_components,
			json_agg(
					json_build_object(
						'id', p.id,
						'url', cr.url,
						'name', p."name",
						'value', cp.value,
						'type', t."name" 
					)	
				) params
			from components_params cp  
			left join component_rule cr  on cr.id  = cp.id_params
			left join params p  on p.id  = cr.id_params
			left join typevar t on t.id  = p."type" 
			group by cp.id_components 
			)cp on cp.id_components = ce.id 	
	
	
	
	where sc.id_screen = 1
		group by sc.id_screen 
) sc on s.id = sc.id_screen

where s.id = 1