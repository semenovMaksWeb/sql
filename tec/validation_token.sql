create OR REPLACE FUNCTION validation_token(_token uuid, OUT errors tec.errors, out result boolean) returns record
    language plpgsql
as
$$
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
    select errors,result
    into errors, result
    from tec.check_errors_token(
            validate_token.token_value,
            validate_token.token_date,
            validate_token.token_active,
            validate_token.user_active
        );
END;

$$;


