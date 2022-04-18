CREATE TABLE history (
    id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
    message varchar NOT NULL,
    id_user int4 NOT NULL,
    id_type int4 NOT NULL,
    CONSTRAINT history_pk PRIMARY KEY (id),
    CONSTRAINT history_fk FOREIGN KEY (id_user) REFERENCES %1$s."user"(id),
    CONSTRAINT type_fk FOREIGN KEY (id_type) REFERENCES type_history(id)
);