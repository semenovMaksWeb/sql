CREATE TABLE tes."token" (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	value uuid NOT NULL DEFAULT uuid_generate_v4(),
	active bool NULL DEFAULT true,
	"date" timestamp NOT NULL DEFAULT (CURRENT_DATE + 2),
	CONSTRAINT token_pk PRIMARY KEY (id),
	CONSTRAINT token_value_key UNIQUE (value)
);