CREATE OR REPLACE FUNCTION tes.user_create(
	_login character varying,
    _password character varying,
    _name character varying = NULL,
    _surname character varying = NULL,
    _patronymic character varying = NULL,
    _telephone character varying = NULL,
    _email character varying = NULL
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE
	_password_cache text = crypt(_password::TEXT, gen_salt('bf'::TEXT));
	begin
        INSERT INTO tes."user" (login, password, name,surname,patronymic,telephone, email, active) 
        VALUES(_login, _password_cache ,_name,_surname,_patronymic,_telephone,_email, TRUE);
	END;
$function$
;
 