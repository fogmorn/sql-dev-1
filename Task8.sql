-- Задание 8.

CREATE FUNCTION trg_i_gps_pt() RETURNS TRIGGER AS $$
from datetime import datetime, timedelta
dt =  TD["new"]["datetime"]
lon = int(TD["new"]["lon"])
lat = int(TD["new"]["lat"])
alt = int(TD["new"]["alt"])
spd = int(TD["new"]["spd"])

dt = datetime.strptime(dt, '%Y-%m-%d %H:%M:%S')

if dt-datetime.now() > timedelta(hours=48):
    return 'SKIP'
if lon < -180.0 or lon > 180.0:
    return 'SKIP'
if lat < -90.0 or lat > 90.0:
    return 'SKIP'
if alt < 0 or alt > 5000:
    return 'SKIP'
if spd < 0 or spd > 150:
    return 'SKIP'
return 'OK'
$$ LANGUAGE plpythonu;


CREATE TRIGGER i_gps_pt
BEFORE INSERT ON gps_pt
FOR EACH ROW
EXECUTE PROCEDURE trg_i_gps_pt();