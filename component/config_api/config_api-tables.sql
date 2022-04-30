CREATE TABLE public.config_api (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	url varchar NULL,
	"type" varchar NULL,
	id_component int4 NULL,
	CONSTRAINT element_fd_result_check CHECK ((((type)::text = 'delete'::text) OR ((type)::text = 'post'::text) OR ((type)::text = 'update'::text) OR ((type)::text = 'get'::text))),
	CONSTRAINT config_api_fk FOREIGN KEY (id_component) REFERENCES public.component_example(id)
);
