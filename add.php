<?
require_once("../admin/stran.php");
require_once("../admin/fu.php");
function dt2sql($dt) {
	    //определяем какой разделитель использован в дате (любое символ, кроме цифр и пробела)
	    preg_match("/([^0-9 ])/",$dt,$m);
	    if(!isset($m[1])) return FALSE;
	    //экранируем в разделитель т.к. он может являться управляющим символом регулярных выражений
	    $s = preg_quote($m[1],"/");
	    //разбиваем строку на день, месяц и год    
	    preg_match("/([\d]{1,2})".$s."([\d]{1,2})".$s."([\d]{2,4})/",$dt,$m);
	    //выводим дату в формате mySQL
	    return isset($m[1]) ? y24($m[3])."-".a0($m[2])."-".a0($m[1]) : FALSE;    
	}
	//дополнительная функция, ставящая 0 перед цифрой
function a0($v) {    
	    return preg_match("/^\d$/",$v) ? "0".$v : $v;
	}    
	
	//преобразует год 09 в 2009. В качестве параметра $c задается префикс = век+1
function y24($v,$c = 20) {
	    return preg_match("/^\d{2}$/",$v) ? $c.$v : $v;
	}    
//echo($_SERVER['HTTP_REFERER']);
obd();
$date=dt2sql($_POST['datepicker']);
//echo date_create_from_format('d/m/y', '27/05/1990');
//if(isset($_POST['name'])&&isset($_POST['commit']))

$done=mysql_escape_string($_POST['done']);
//$date=date_create_from_format('d/m/y', $_POST['datepicker']);
echo $date;
$sql="insert into todo (action, date) values ('$done', '$date')";
echo $sql;
$result=mysql_query($sql) or die("Invalid query1:" . mysql_error());


//if (@$_SERVER['HTTP_REFERER'] != null) {
  //          header("Location: ".$_SERVER['HTTP_REFERER']);
    //    }
      //  Sys::GoHome();
?>