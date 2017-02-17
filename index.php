<?
require('plug/templ.php');
$parse->get_tpl('index.tpl');



$parse->set_tpl("{colm1}",$colm1);

$parse->tpl_parse();
print $parse->template;
?>