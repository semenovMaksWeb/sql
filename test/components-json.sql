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
			'params', cp.params,
			'api', config_api
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
	left join (
		select ca.id_component, json_agg(
			json_build_object(
				'url', ca.url,
				'type', ca.type,
				'params', api_params
			)
		) config_api  from config_api ca 
		left join (
			select cap.id_config_api,
			  json_agg(
					json_build_object(
						'name_params', ef.name_params,
						'result', ef.result,
						'name', ef.name,
						'index', ef."index",
						'type', ef."type",
						'type_var', t2."name" 
					)
			) api_params 
			from component_api_params cap 
			left join element_fd ef ON cap.id_element_fd = ef.id
			left join typevar t2 on t2.id = ef.var_type 
			group by cap.id_config_api
		) cap on cap.id_config_api = ca.id
				group by ca.id_component
	 ) ca  on ca.id_component = ce.id
			
	where sc.id_screen = 1
		group by sc.id_screen 
) sc on s.id = sc.id_screen

where s.id = 1