# sql-dev-1
Тестовое задание на должность PostgreSQL разработчика.

## Задание 1

Создайте роли:
+ Оператор
+ Диспетчер

Создайте пользователей:
+ Иванов И.В. (администратор БД)
+ Петров П.Е. (оператор и диспетчер)
+ Соколов А.А. (диспетчер)
+ Сидоров В.А. (оператор)

[Решение. Задание 1](Task1.sql)

## Задание 2

Создайте справочники:
| Название            | Поля                             | Ограничения                         | Права на чтение    | Права на изменение |
|---------------------|----------------------------------|-------------------------------------|--------------------|--------------------|
| **Автомобили**      |Госномер                          |Обязательно, уникально               |Все                 |Диспетчер           |
|                     |VIN                               |Обязательно, уникально               |                    |                    |
|                     |Марка                             |Обязательно                          |                    |                    |
| **Водители**        |Фамилия                           |Обязательны, Связка полей уникальна  |Оператор, Диспетчер |Диспетчер           |
|                     |Имя                               |Обязательны, Связка полей уникальна  |Оператор, Диспетчер |Диспетчер           |
|                     |Отчество                          |Обязательны, Связка полей уникальна  |Оператор, Диспетчер |Диспетчер           |
|                     |Дата рождения                     |                                     |                    |                    |
|                     |Пол                               |                                     |                    |                    |
|                     |Дата приема на работу             |                                     |                    |                    |
|                     |Статус (работает/не работает)     |По-умолчанию "не работает"           |                    |                    |
|                     |Категория водительских прав       |                                     |                    |                    |
|                     |Адрес                             |                                     |                    |                    |
|                     |Телефон                           |формата 79181112233                  |                    |                    |
| **Маршруты**        |Автомобиль                        |Обязательно                          | Оператор, Диспетчер| Диспетчер          |
|                     |Тип маршрута                      |Обязательно, По-умолчанию "Прямая доставка" |             |                    |
|                     |Статус открытия (открыт/не открыт)|Обязательно, По-умолчанию "не открыт" |                   |                    |
|                     |Дата/время открытия               |Обязательно                          |Оператор, Диспетчер | Диспетчер          |
|                     |Пользователь, открывший маршрут   |Обязательно                          |                    |                    |
|                     |Водители маршрута                 |Обязательно                          |                    |                    |
| **Точки маршрутов** |Маршрут                           |Обязательно                          |Оператор, Диспетчер |Диспетчер           |
|                     |Порядковый номер                  |Обязательно                          |                    |                    |
|                     |ИД объекта                        |Обязательно                          |                    |                    |
|                     |Тип объекта                       |Обязательно                          |                    |                    |
|                     |Название объекта                  |Обязательно                          |                    |                    |
|                     |Даты планового прибытия/убытия    |Обязательно, Дата прибытия должна быть меньше даты убытия |          |         |
|                     |Даты фактического прибытия/убытия |Обязательно, Дата прибытия должна быть меньше даты убытия |          |         |

[Решение. Задание 2](Task2.sql)

## Задание 3
Заполните созданные таблицы некими данными (напишите несколько запросов добавления, изменения, удаления записей, а также очистки таблицы).

[Решение. Задание 3](Task3.sql)

## Задание 4
Каким образом можно оптимизировать запросы из созданных таблиц?  
**Ответ**: Использовать первичные ключи для связи между таблицами.

## Задание 5
Создайте хранимую процедуру добавления/изменения справочника «Водители» с проверками указанных выше ограничений. 
Права на запуск имеет роль диспетчер и администратор БД.

[Решение. Задание 5](Task5.sql)

## Задание 6
Создайте представление, которое будет выводить точки маршрутов с информацией о маршруте, автомобиле и водителях.
Права на просмотр имеют роли диспетчер и оператор.  
Столбцы:
+ Автомобиль
+ Госномер
+ ФИО привязанных к маршруту водителей через запятую
+ Дата/время открытия маршрута
+ Порядковый номер точки
+ Тип объекта<пробел>Название объекта
+ Даты/время планового прибытия/убытия
+ Даты/время фактического прибытия/убытия

[Решение. Задание 6](Task6.sql)

## Задание 7
Создайте структуру для хранения GPS-точек (права на изменение — у оператора, на просмотр — у диспетчера):
+ Автомобиль
+ Дата/время
+ Широта
+ Долгота
+ Скорость
 
[Решение. Задание 7](Task7.sql)

## Задание 8
Создайте триггер на языке pl/python для проверки корректности атрибутов GPS-точек, записываемых в таблицу:
+ дата не из будущего и не старше 48 часов
+ координаты в диапазоне от -180 до 180
+ высота больше или равна 0, но не превышает 5000
+ скорость больше или равна 0, но не превышает 150
Некорректные точки пропускаются.

[Решение. Задание 8](Task8.sql)
