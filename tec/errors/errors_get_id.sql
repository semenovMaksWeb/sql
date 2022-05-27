CREATE
    OR REPLACE FUNCTION tec.errors_get_id(_id integer)
    RETURNS TABLE
            (
                id      integer,
                message character varying,
                status  smallint
            )
    LANGUAGE plpgsql
AS
$function$
begin
    return query select e.id, e.message, e.status from tec.errors e WHERE e.id = _id limit 1;
END;
$function$
;
