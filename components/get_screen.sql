select s.id,
       s.url,
       s.id_right,
       s.title,
       s.description,
       s.keywords,
       json_agg(
               json_build_object(
                       'id', ce.id,
                       'style', ce.style,
                       'parent_id', ce.id_parent,
                       'order', ce.order,
                       'params', json_build_object(
                               p.name, json_build_object(
                               'value', cp.value,
                               'type', t.name
                           )
                           )
                   )
           ) as components
from config.screen s
         left join config.screen_components sc ON sc.id_screen = s.id
         left join config.component ce on ce.id = sc.id_component
         left join config.component_type c on c.id = ce.id_component
         left join config.components_params cp on cp.id_components = ce.id
         left join config.component_rule cr on cr.id = cp.id_params
         left join config.params p on p.id = cr.id_params
         left join handbook.typevar t on t.id = p."type"
         left join config.table_schema st on st.id_components = ce.id
         left join config.form_schema sf on sf.id_form = ce.id
where s.id = 1
group by s.id