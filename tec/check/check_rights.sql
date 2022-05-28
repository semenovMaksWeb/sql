CREATE
    OR REPLACE FUNCTION tec.check_rights(_token uuid, _rights int = null)
    RETURNS tec.errors
    LANGUAGE plpgsql
AS
$function$
DECLARE
    errors tec.errors;
    users  tec.check_rights_user;
begin
    IF _rights is not null then
        select u.id                    as user_id,
               u.active                as user_active,
               t.active                as token_active,
               t.value                 as token_value,
               t.date                  as token_date,
               array_agg(rr.id_rights) as rights
        into users
        from tec.token t
                 left join tec."user" u on u.id = t.id_user
                 left join tec.user_roles ur on u.id = ur.id_user
                 left join tec.roles_rights rr on ur.id_roles = rr.id_roles
        where t.value = _token
        group by u.id, u.active, u.id, t.active, t.value, t.date
        order by u.id;
        select *
        into errors
        from tec.check_errors_token(users.token_value, users.token_date, users.token_active, users.user_active);
        IF errors.id is null then
            IF _rights <> any(users.rights) then
                select * into errors from tec.errors_get_id(6);
            end if;
        end if;
    end if;
    return  errors;
END;
$function$
