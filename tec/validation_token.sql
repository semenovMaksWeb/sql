CREATE
    OR REPLACE FUNCTION tec.validation_token(_token uuid, out errors tec.errors, out result boolean)
    RETURNS record
    LANGUAGE plpgsql
AS
$function$
Declare
    validate_token tec.validate_token;
begin

    select t.id     as token_id,
           t.active as token_active,
           t.date   as token_date,
           t.value  as token_value,
           u.id     as user_id,
           u.active as user_active
    into validate_token
    from tec.token t
             left join tec."user" u on u.id = t.id_user
    where t.value = _token
    limit 1;
    if validate_token.token_active = false or validate_token.token_date < now() then
        select * into errors from tec.errors_get_id(5);
        result = false;
    elseif validate_token.user_active = false then
        select * into errors from tec.errors_get_id(4);
        result = false;
    end if;
    result = true;
END;
$function$
;

DROP FUNCTION tec.validation_token