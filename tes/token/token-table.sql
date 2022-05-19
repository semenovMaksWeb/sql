CREATE TABLE tes."token" (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	value varchar NOT NULL,
	active boolean NULL,
	"date" timestamp NOT NULL,
	CONSTRAINT token_pk PRIMARY KEY (id)
);