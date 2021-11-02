-- Задание 6.

CREATE VIEW route_points AS SELECT mark, gosnum, 
    CONCAT_WS(' ', lastnm, firstnm, secnm) AS fio, datetime, rpt.id, 
    CONCAT_WS(' ', obj_type, obj_name) AS object, 
    CONCAT_WS('/', arr_plan, dep_plan) AS arrdep_plan,
    CONCAT_WS('/', arr_fact, dep_fact) AS arrdep_fact
FROM route_pt rpt
LEFT JOIN route r ON rpt.route_id=r.id
LEFT JOIN driver d ON r.driverid=d.id
LEFT JOIN car c ON r.car_id=c.vin;

GRANT SELECT ON route_points TO operators, dispatchers;