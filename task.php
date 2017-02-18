<?
require_once("../admin/stran.php");
require_once("../admin/fu.php");
obd();
require('plug/templ.php');
$parse->get_tpl('task.tpl');
$id=(int)$_GET['id'];
$sql="select name,commit,date from todo_commit where todo_id=$id order by date";
$result=mysql_query($sql) or die("Invalid query1:" . mysql_error());
while ($res=mysql_fetch_object($result)){
$out.=$res->name.'&nbsp cказал(а)&nbsp'.$res->commit.'&nbsp('.$res->date.")<BR>";
}
$parse->set_tpl("{out}",$out);
$parse->set_tpl("{id}",$id);
$parse->tpl_parse();
print $parse->template;

?>