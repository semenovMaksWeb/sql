CREATE
    OR REPLACE FUNCTION tec.get_users_token(_token uuid, out errors tec.errors, out users tec.get_users)
    RETURNS record
    LANGUAGE plpgsql
AS
$function$
DECLARE
    validate tec.tec_type;
begin
    select * into validate from tec.validation_token(_token);
    IF validate.result = false then
        errors = validate.errors;
    else
        select u.id         as id,
               u.login      as login,
               u.active     as active,
               u.name       as name,
               u.surname    as surname,
               u.patronymic as patronymic,
               u.phone      as phone,
               u.email      as email
        into users
        from tec.token t
                 LEFT JOIN tec."user" u on t.id_user = u.id
        where t.value = _token;
    end if;
END;
$function$
;