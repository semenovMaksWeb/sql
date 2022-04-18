CREATE TABLE event (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	description varchar NOT NULL,
	"date" timestamp NULL DEFAULT '2021-12-27 17:14:40.965813'::timestamp without time zone,
	CONSTRAINT event_pk PRIMARY KEY (id)
);