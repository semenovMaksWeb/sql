CREATE
    OR REPLACE FUNCTION tec.registration(_login character varying, _password character varying,
                                         _name character varying DEFAULT NULL::character varying,
                                         _surname character varying DEFAULT NULL::character varying,
                                         _patronymic character varying DEFAULT NULL::character varying,
                                         _phone character varying DEFAULT NULL::character varying,
                                         _email character varying DEFAULT NULL::character varying,
                                         OUT token character varying, OUT errors tec.errors)
    RETURNS record
    LANGUAGE plpgsql
AS
$function$
DECLARE
    id_user int;
    check_emain
            varchar;
    check_login
            varchar;
begin
    select u.login, u.email
    into check_login,check_emain
    from tec.user_get_unique(_login, _email) u;
    IF
        check_login is not null and check_login = _login then
        select *
        into errors
        from tec.errors_get_id(1);
    elseif
        check_emain is not null and check_emain = _email then
        select *
        into errors
        from tec.errors_get_id(2);
    else
        INSERT INTO tec."user" (login, password, name, surname, patronymic, phone, email, active)
        VALUES (_login, crypt(_password::TEXT, gen_salt('bf'::TEXT)), _name, _surname, _patronymic, _phone, _email,
                TRUE)
        RETURNING id into id_user;
        INSERT INTO tec.user_roles (id_roles, id_user)
        VALUES (1, id_user);
        INSERT INTO tec.token (id_user)
        VALUES (id_user)
        RETURNING value into token;
    END IF;
END;
$function$
;
