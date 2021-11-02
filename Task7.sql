-- Задание 7.

CREATE TABLE gps_pt (
    id          SERIAL PRIMARY KEY,
    car_id      char(17) NOT NULL,
    datetime    timestamp NOT NULL,
    lon         numeric(9,6) NOT NULL,
    lat         numeric(9,6) NOT NULL,
    alt         varchar(4) NOT NULL,
    spd         varchar(3) NOT NULL
);

GRANT SELECT ON gps_pt TO dispatchers;
GRANT UPDATE ON gps_pt TO operators;