-- Задание 3.

INSERT INTO car (gosnum, vin, mark) 
VALUES ('А59БН93', 'WVGZZZ7LZ4D07136', 'Wagen');
INSERT INTO car (gosnum, vin, mark) 
VALUES ('Х68ЕН123', 'SKGZPP7LZ4D07472', 'Skoda');


INSERT INTO driver (
lastnm, firstnm, secnm, b_dt, sex, rec_dt, status, driver_lic, address, phone)
VALUES (
'Иванов', 'Пётр', 'Алексеевич', '24.09.1983', 'm', '08.10.2013', 'работает', 
'BC', 'Краснодар, Туляева, 8/235', '791877665544');
INSERT INTO driver (
lastnm, firstnm, secnm, b_dt, sex, rec_dt, status, driver_lic, address, phone)
VALUES (
'Сидоров', 'Юрий', 'Петрович', '13.11.1980', 'm', '23.06.2010', 'работает', 
'BCDE', 'Краснодар, Московская, 13/1', '79181122440');


INSERT INTO route (car_id, datetime, user_id, driverid)
VALUES (
'SKGZPP7LZ4D074472', '2016-09-18 17:51:47', '15', '2');


INSERT INTO route_pt
(route_id, obj_id, obj_type, obj_name, arr_plan, arr_fact, dep_plan, dep_fact)
VALUES (1, 4, 2, 'Склад 4', '2016-10-13 08:10:00', '2016-10-13 08:08:57', 
'2016-10-13 08:40:00', '2016-10-13 08:40:07');


UPDATE car SET gosnum='К42РР05' WHERE vin='WVGZZZ7LZ4D07136';
UPDATE driver SET address='Краснодар, Садовая, 9/2' 
WHERE id=1;