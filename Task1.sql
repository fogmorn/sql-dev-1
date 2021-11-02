-- Задание 1.

CREATE ROLE operators;
CREATE ROLE dispatchers;

CREATE USER ivanov;
CREATE USER petrov;
CREATE USER sokolov;
CREATE USER sidorov;
GRANT ALL PRIVILEGES ON database TO ivanov;
GRANT operators TO petrov, sidorov;
GRANT dispatchers TO petrov, sokolov;