<?
require_once("../admin/stran.php");
require_once("../admin/fu.php");
//echo($_SERVER['HTTP_REFERER']);
obd();
if (isset($_POST['i'])) {$colmn=(int)($_POST['i']); $limit="limit 100";} else $colmn=1;
if ($colmn==1)$sql="select * from todo order by val desc, date $limit"; else $sql="select * from todo order by date $limit";
if (isset($_POST['id'])&&$_POST['id']!='undefined')  $sql="select * from todo where id=".$_POST['id'];
//echo $_POST['id'];
$colm="<table id=\"colm$colmn\" border=\"1\"\"><tr><td>задача</td><td>дата</td><td>коммиты</td></tr>";
$result=mysql_query($sql) or die("Invalid query1:" . mysql_error());
while ($res=mysql_fetch_object($result)){
$id=$res->id;
$val=$res->val;
$sql_commit="select count(*) from todo_commit where todo_id=$id";
$res_commit=mysql_query($sql_commit) or die("Invalid query1:" . mysql_error());
$row = mysql_fetch_row($res_commit);
$count_commit=$row[0];

if ($val=="0") {$strike0="<strike>";$strike1="</strike>";$ch="checked";} else {$strike0="";$strike1="";$ch="";};
$colm.="<tr><td>$strike0<input type=\"checkbox\" name=$colmn|c$id id=$colmn|c$id $ch onclick=\"call_check('$id|$val')\"><a href=\"task.php?id=$id\">".$res->action."</label>$strike1</td><td>".$res->date."</td><td align=\"center\">".$count_commit."</td></tr>";
}
$colm.="</table>";
echo $colm;

?>