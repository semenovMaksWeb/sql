CREATE TABLE public.config_api (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	url varchar NULL,
	"type" varchar NULL,
    CONSTRAINT element_fd_result_check CHECK (
        "type" = 'delete' 
        or  "type" = 'post' 
        or "type" = 'update'
        or "type" = 'get'
        )
);
