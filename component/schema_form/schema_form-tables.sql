CREATE TABLE schema_form (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_form int NOT NULL,
	id_components int NOT NULL,
	id_parent int NULL,
	CONSTRAINT schema_form_pk PRIMARY KEY (id),
	CONSTRAINT schema_form_fk FOREIGN KEY (id_form) REFERENCES component(id),
	CONSTRAINT schema_form_fk_1 FOREIGN KEY (id_components) REFERENCES component(id),
	CONSTRAINT schema_form_fk_2 FOREIGN KEY (id_parent) REFERENCES component(id)
);
