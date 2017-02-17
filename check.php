<?
require_once("../admin/stran.php");
require_once("../admin/fu.php");
obd();
if (isset($_POST['i'])) 
{$i=explode("|",$_POST['i']);
$id=(int)$i[0];
if ($i[1]==0) $val=1; else $val=0;
$sql="update todo set val=$val where id=$id";
$result=mysql_query($sql) or die("Invalid query1:" . mysql_error());
}
?>