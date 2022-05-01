CREATE TABLE component_callback (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_callback int NOT NULL,
	params json NULL,
	id_component int NULL,
	CONSTRAINT component_callback_pk PRIMARY KEY (id),
	CONSTRAINT component_callback_fk FOREIGN KEY (id_callback) REFERENCES components.function_front(id),
	CONSTRAINT component_callback_fk_1 FOREIGN KEY (id_component) REFERENCES components.component_example(id)
);
