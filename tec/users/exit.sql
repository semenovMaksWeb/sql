CREATE
    OR REPLACE FUNCTION tec.exit(_token uuid)
    RETURNS record
    LANGUAGE plpgsql
AS
$function$
begin
    UPDATE tec.token SET active = false where value = _token;
END;
$function$
;