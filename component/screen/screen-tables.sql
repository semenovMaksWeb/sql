CREATE TABLE components.screen (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	url varchar NULL,
	CONSTRAINT screen_pk PRIMARY KEY (id)
);
