CREATE OR REPLACE FUNCTION tec."authorization"(_login character varying, _password character varying,
                                               OUT errors tec.errors, OUT token text, OUT users tec.users_get)
    RETURNS record
    LANGUAGE plpgsql
AS
$function$
DECLARE
begin
    SELECT u.id,
           u.login,
           u.active,
           u."name",
           u.surname,
           u.patronymic,
           u.phone,
           u.email
    into users
    FROM tec."user" u
    WHERE u.login = _login
      and u.password = crypt(_password, u.password);
    if users.id is null then
        select * into errors from tec.errors_get_id(3);
    elseif users.active = false then
        users = null;
        select * into errors from tec.errors_get_id(4);
    else
        INSERT INTO tec.token ("id_user") VALUES (users.id) RETURNING value INTO token;
    END IF;
END;
$function$
;
