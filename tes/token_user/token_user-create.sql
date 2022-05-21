 CREATE OR REPLACE FUNCTION tes.token_user_create(
	_login character varying,
    _password character varying
)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
    _token tes.token;
	_id_user int = (SELECT id FROM tes."user" u WHERE u.login = _login and u.password = crypt(_password, u.password));
	begin
        IF _id_user IS NOT NULL THEN
            INSERT INTO tes.token DEFAULT VALUES RETURNING * INTO _token;
            INSERT INTO tes.token_user  
            ("id_token", "id_user")
            VALUES(_token.id, _id_user);
            return _token.value;
        END IF;
        return 'Не вверно введены данные';
	END;
$function$
;