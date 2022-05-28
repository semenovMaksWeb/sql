select *
from components.screen s
         left join components.screen_components sc ON sc.id_screen = s.id
         left join components.component_example ce on ce.id = sc.id_component
         left join components.component c on c.id = ce.id_component
         left join components.components_params cp on cp.id_components = ce.id
         left join components.component_rule cr on cr.id = cp.id_params
         left join components.params p on p.id = cr.id_params
         left join handbook.typevar t on t.id = p."type"
         left join components.schema_table st on st.id_components = ce.id
         left join components.schema_form sf on sf.id_form = ce.id
where s.id = 1
