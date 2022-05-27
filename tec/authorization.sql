CREATE OR REPLACE FUNCTION tec."authorization"(_login character varying, _password character varying,
                                               OUT errors tec.errors, OUT token text)
    RETURNS record
    LANGUAGE plpgsql
AS
$function$
DECLARE
    id int4;
    active boolean;
begin
    SELECT u.id, u.active
    into id, active
    FROM tec."user" u
    WHERE u.login = _login
      and u.password = crypt(_password, u.password);
    if id is null then
        select * into errors from tec.errors_get_id(3);
    elseif active = false then
        select * into errors from tec.errors_get_id(4);
    else
        INSERT INTO tec.token ("id_user") VALUES (id) RETURNING value INTO token;
    END IF;
END;
$function$
;

DROP FUNCTION tec."authorization"