#!/usr/bin/php7.0 -q

<?php
ini_set('precision', 80);

$name = $_SERVER['argv'];

$fp = fopen("./tmp7", 'r');

$text = fread($fp, 409600);

$text = json_decode($text,true);
$text = json_encode($text,JSON_PRETTY_PRINT|JSON_UNESCAPED_UNICODE);

echo $text;

?>
