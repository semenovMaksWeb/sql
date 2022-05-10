CREATE TABLE component_example (
   id int NOT NULL GENERATED ALWAYS AS IDENTITY,
   id_component int NOT NULL,
   attr json NULL,
   "style" json NULL,
   CONSTRAINT component_example_pk PRIMARY KEY (id),
   CONSTRAINT component_example_fk FOREIGN KEY (id_component) REFERENCES components."component"(id)
)
