-- Задание 2.

CREATE TABLE car (
    gosnum      varchar(9) NOT NULL UNIQUE,
    vin         char(17) UNIQUE PRIMARY KEY,
    mark        varchar(25) NOT NULL
);


CREATE TABLE driver (
    id        SERIAL PRIMARY KEY,
    lastnm    varchar(20) NOT NULL,
    firstnm   varchar(20) NOT NULL,
    secnm     varchar(20) NOT NULL,
    b_dt      date,
    sex       char(1),
    rec_dt    date,
    status    varchar(11) DEFAULT 'не работает',
    driver_lic varchar(5),
    address   varchar(80),
    phone     char(11),
    UNIQUE (lastnm, firstnm, secnm)
);

CREATE TABLE route (
    id          SERIAL PRIMARY KEY,
    car_id      char(17) NOT NULL,
    route_type  varchar(25) NOT NULL DEFAULT 'Прямая дорога',
    status      varchar(9) NOT NULL DEFAULT 'не открыт',
    datetime    timestamp NOT NULL,
    user_id     int NOT NULL,
    driverid    int NOT NULL
);

CREATE TABLE route_pt (
    id          SERIAL PRIMARY KEY,
    route_id    int NOT NULL,
    obj_id      int NOT NULL,
    obj_type    varchar(10) NOT NULL,
    obj_name    varchar(25) NOT NULL,
    arr_plan    timestamp NOT NULL,
    arr_fact    timestamp NOT NULL,
    dep_plan    timestamp NOT NULL,
    dep_fact    timestamp NOT NULL,
    CONSTRAINT valid_plan CHECK (arr_plan < dep_plan),
    CONSTRAINT valid_fact CHECK (arr_fact < dep_fact)
);

GRANT UPDATE ON car TO dispatchers;
GRANT SELECT ON car TO PUBLIC;

GRANT UPDATE ON driver TO dispatchers;
GRANT SELECT ON driver TO operators, dispatchers;

GRANT UPDATE ON route TO dispatchers;
GRANT SELECT ON route TO operators, dispatchers;

GRANT UPDATE ON route_pt TO dispatchers;
GRANT SELECT ON route_pt TO operators, dispatchers;