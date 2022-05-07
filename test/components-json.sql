CREATE OR REPLACE FUNCTION screen_platform_get(_id int)
 RETURNS  TABLE(screen json)
 LANGUAGE plpgsql
AS $function$
	BEGIN
--	главный select
  return query select json_build_object(
	'screen_id', s.id,
	'component', components
) screen
from components.screen s 
left join (
--	компоненты select
	select sc.id_screen,
	json_agg(
			json_build_object(
			'id', sc.id,
			'class', ce."class", 
			'style', ce."style",
			'type', c."name",
			'params', cp.params,
			'api', config_api,
			'event', component_callback,
			'schema_table', "schema" 
			)) components
	from components.screen_components sc
	left join components.component_example ce on ce.id = sc.id
	left join components.component c on c.id = ce.id_component
-- схема для таблиц
 		left join (
 			select schema_c.id_components,
 				json_agg(
 					json_build_object(
 						schema_c.key, json_build_object(
 							'id', schema_c.id,
 							'key', schema_c.key,
 							'sort', schema_c.sort,
 							'title', schema_c.title,
 							'button', schema_c.button,
 							'w', schema_c.w
 						)
 					)
 			) "schema"
 			from components.schema_table schema_c
 			group by schema_c.id_components 
 		)schema_c  on schema_c.id_components = ce.id
	-- калбек + event
left join (
	select cc.id_component,
	json_agg(
		json_build_object(
			e.name, (json_build_object(
				'id', cc.id,
				'params', cc.params	
			)))) component_callback
	from components.component_callback cc
	left join  components.event e on e.id = cc.id_event
	group by cc.id_component
) cc on cc.id_component = ce.id 
--	параметры
		left join (
			select cp.id_components,
			json_agg(
					json_build_object(
					p."name", json_build_object(
--						'id', p.id,
						'url', cr.url,
						'value', cp.value,
						'type', t."name" 	
					))) params
			from components.components_params cp  
			left join components.component_rule cr  on cr.id  = cp.id_params
			left join components.params p  on p.id  = cr.id_params
			left join components.typevar t on t.id  = p."type" 
			group by cp.id_components 
			)cp on cp.id_components = ce.id 		
	left join (
		select ca.id_component, json_agg(
			json_build_object(
				'url', ca.url,
				'type', ca.type,
				'params', api_params
			)
		) config_api  from components.config_api ca 
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
					)) api_params 
			from components.component_api_params cap 
			left join components.element_fd ef ON cap.id_element_fd = ef.id
			left join components.typevar t2 on t2.id = ef.var_type 
			group by cap.id_config_api
		) cap on cap.id_config_api = ca.id
				group by ca.id_component
	 ) ca  on ca.id_component = ce.id
	where sc.id_screen = _id
		group by sc.id_screen 
) sc on s.id = sc.id_screen
where s.id = _id;
	END;    
$function$
;  


select * from screen_platform_get(1);