CREATE
    OR REPLACE FUNCTION tec.get_users_token(_token text)
    RETURNS record
    LANGUAGE plpgsql
AS
$function$
begin
--     if select  tec.validation_token(_token) then

--     end if;
END;
$function$
;


select *
from tec.token