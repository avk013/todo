<?
require_once("../admin/stran.php");
require_once("../admin/fu.php");
//echo($_SERVER['HTTP_REFERER']);
obd();
if(isset($_POST['name'])&&isset($_POST['commit']))
{
$id=(int)($_POST['id']);
$name=mysql_escape_string($_POST['name']);
$commit=mysql_escape_string($_POST['commit']);
$sql="insert into todo_commit(todo_id, name, commit, date) values ('$id', '$name','$commit', NOW())";
$result=mysql_query($sql) or die("Invalid query1:" . mysql_error());
}
if (@$_SERVER['HTTP_REFERER'] != null) {
            header("Location: ".$_SERVER['HTTP_REFERER']);
        }
        Sys::GoHome();

?>