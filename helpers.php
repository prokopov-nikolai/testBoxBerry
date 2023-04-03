<?php

if (!function_exists('pr')) {
    /**
     * Функции для дебажинга
     * @param $array
     * @param bool $return
     * @return bool|string
     */
    function pr($array, $return = false)
    {
        if ($return === false) {
            ob_start();
            print_r($array);
            return false;
        } else {
            ob_start();
            echo '<pre>';
            print_r($array);
            echo '</pre>';
            return ob_get_clean();
        }
    }

    function prex($array)
    {
        pr($array);
        exit;
    }
}