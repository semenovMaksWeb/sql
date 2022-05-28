create OR REPLACE FUNCTION tec.check_errors_token(
    _token uuid,
    date timestamp,
    active_token boolean,
    active_user boolean
)
    returns tec.errors
    language plpgsql
as
$$
Declare
    errors tec.errors;
begin
    if _token is null or active_token = false or date < now() then
        select * into errors from tec.errors_get_id(5);
    elseif active_user = false then
        select * into errors from tec.errors_get_id(4);
    end if;
    return errors;
END;
$$;

alter function check_errors_token(uuid, timestamp, boolean, boolean, out tec.errors, out boolean) owner to root;


select *
from tec.check_errors_token(
        '3642ae1f-0625-46e0-8ed3-32a6bc3af790',
        '2022-05-29 21:28:33.820535',
        false,
        true
    );