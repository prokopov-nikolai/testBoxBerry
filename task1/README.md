Можно пойти двумя путями:

1. Перед записью всех значений в таблицу arterial_pressure_log добавлять каждому значению флаг bad (1|0) - признак отклонения от нормы. 
2. На уровне кода проверять являются ли значения текущего пациента плохими и записывать их в отдельную таблицу arterial_pressure_bad.
Можно предположить, что количество таких записей должно быть не больше 20-30% от общего количества. Все передаваемые результаты записывать в таблицу arterial_pressure_log.

В запросах на выборке из 1 000 000 записей оба варианта дают приблизительно одинаковые результаты

<code>hospital> explain SELECT DISTINCT user_id FROM arterial_pressure_bad WHERE hours_add > 12 LIMIT 200
1 row retrieved starting from 1 in 31 ms (execution: 2 ms, fetching: 29 ms)

hospital> explain SELECT DISTINCT user_id FROM arterial_pressure_log WHERE hours_add > 12 AND upper_bad = 1 AND pulse_bad = 1 LIMIT 200
1 row retrieved starting from 1 in 35 ms (execution: 2 ms, fetching: 33 ms)</code>