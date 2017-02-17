<?
require_once("../admin/stran.php");
require_once("../admin/fu.php");
obd();
if (isset($_POST['i'])) $colmn=(int)($_POST['i']); else $colmn=1;
if ($colmn==1)$sql="select * from todo order by val desc, date limit 100"; else $sql="select * from todo order by date limit 100";
$colm="<table id=\"colm$colmn\" border=\"1\"\"><tr><td>задача</td><td>дата</td><td>коммиты</td></tr>";
$result=mysql_query($sql) or die("Invalid query1:" . mysql_error());
while ($res=mysql_fetch_object($result)){
$id=$res->id;
$val=$res->val;
if ($val=="0") {$strike0="<strike>";$strike1="</strike>";$ch="checked";} else {$strike0="";$strike1="";$ch="";};
$colm.="<tr><td>$strike0<input type=\"checkbox\" name=$colmn|c$id id=$colmn|c$id $ch onclick=\"call_check('$id|$val')\"><label for=$colmn|c$id onclick=\"call_check('$id|$val')\">".$res->action."</label>$strike1</td><td>".$res->date."</td><td>".$res->commit."</td></tr>";
}
$colm.="</table>";
echo $colm;

?>