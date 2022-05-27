CREATE OR REPLACE FUNCTION tec.user_get_unique(_login character varying,
                                               _email character varying DEFAULT NULL::character varying)
    RETURNS TABLE
            (
                email character varying,
                login character varying
            )
    LANGUAGE plpgsql
AS
$function$
begin
    return query select u.email, u.login
                 from tec.user u
                 WHERE (u.login = _login) or (u.email IS NOT NULL and u.email = _email)
                 LIMIT 1;
END;
$function$
;
