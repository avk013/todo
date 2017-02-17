<?
require('plug/task.php');
$parse->get_tpl('index.tpl');
$parse->tpl_parse();
print $parse->template;

?>