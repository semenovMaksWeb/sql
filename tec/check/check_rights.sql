CREATE
    OR REPLACE FUNCTION tec.check_rights(_token uuid, _rights int = null, out result boolean, errors tec.errors)
    RETURNS record
    LANGUAGE plpgsql
AS
$function$
DECLARE
begin
    select *
    from tec.token t
             left join tec."user" u on u.id = t.id_user
             left join tec.user_roles ur on u.id = ur.id_user
             left join tec.roles_rights rr on ur.id_roles = rr.id_roles
    where t.value = _token;
END;
$function$
;
