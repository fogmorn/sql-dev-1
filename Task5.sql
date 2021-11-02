-- Задание 5.

CREATE FUNCTION driver_change(
    lastnm      text DEFAULT NULL,
    firstnm     text DEFAULT NULL,
    secnm       text DEFAULT NULL,
    b_dt        date DEFAULT NULL,
    sex         text DEFAULT NULL,
    rec_dt      date DEFAULT NULL,
    status      text DEFAULT NULL,
    driver_lic  text DEFAULT NULL,
    address     text DEFAULT NULL,
    phone       text DEFAULT NULL,
    action      text DEFAULT NULL,
    condition   text DEFAULT NULL)
    RETURNS text
AS $$
if phone:
    if len(phone) <> 11:
        return 'Phone number must be equal "11" characters!'
    if phone[0] <> '7':
        return 'The valid phone number format is: 79181112233\n\'%s\'' % phone


if action == 'insert':
    if (lastnm is None) or (firstnm is None) or (secnm is None):
        return 'ERROR: FIO is the obligatory field!'
    try:
        qry = plpy.prepare("""
	    INSERT INTO driver (
                lastnm, firstnm, secnm, b_dt, sex, rec_dt, 
                status, driver_lic, address, phone)
              VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)""", 
            ["text", "text", "text", "date", "text", "date", 
             "text", "text", "text", "text"])
        plpy.execute(qry, 
            [lastnm, firstnm, secnm, b_dt, sex, rec_dt, status, 
             driver_lic, address, phone])
    except plpy.SPIError, e:
        return "Error while add data: %s" % e.sqlstate
    return 'Success!'
elif action == 'update':
    arg_lst = ["lastnm", "firstnm", "secnm", "b_dt", "sex", 
               "rec_d", "status", "driver_lic", "address", "phone"]
    type_lst = ["text", "text", "text", "date", "text", 
                "date", "text", "text", "text", "text"]
    j = 0
    k = 0
    vars = ''
    q_str = '' 

    for i in range(0, 10):
        if args[i] is not None:
            k+=1
            q_str += '%s=$%d, ' % (arg_lst[j], k) 
            vars += '%s, ' % args[i]
        else:
           type_lst.pop(k)
        j+=1

    q_str = q_str.rstrip(', ')
    vars = vars.rstrip(', ')
    vars = vars.split(', ')

    try:
        qry = plpy.prepare("UPDATE driver SET %s WHERE %s" % (q_str, condition), type_lst)
        plpy.execute(qry, vars)
    except plpy.SPIError, e:
        return "ERROR: %s" % e.sqlstate
    return 'Success!'
else:
    return 'Action is not recognized as permissible!'
$$ LANGUAGE plpythonu;

GRANT EXECUTE ON FUNCTION driver_change(
    lastnm      text,
    firstnm     text,
    secnm       text,
    b_dt        date,
    sex         text,
    rec_dt      date,
    status      text,
    driver_lic  text,
    address     text,
    phone       text,
    action      text,
    condition   text
) TO dispatchers;