<?php

ini_set('set_time_limit', 0);
$dir = __DIR__;
require_once $dir."/../helpers.php";

$date1 = $argv[1];
$date2 = $argv[2];

if (!preg_match('#\d\d\d\d-\d\d-\d\d#', $date1)) {
    throw new Exception('Неверный формат даты старта');
}
if (!preg_match('#\d\d\d\d-\d\d-\d\d#', $date2)) {
    throw new Exception('Неверный формат даты окончания');
}

$dateFrom = new DateTime($date1);
$dateTo = new DateTime($date2);
$interval = $dateFrom->diff($dateTo);

$weekDay = $dateFrom->format('w');
$count = floor($interval->days / 7) + ($weekDay == 2 ? 1 : 0);
echo "Количество вторников между {$dateFrom->format('d.m.Y')} и {$dateTo->format('d.m.Y')} - {$count}
";