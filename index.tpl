<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>todo</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
 <script>
  $( function() {
    $( "#datepicker" ).datepicker({
  dateFormat: "dd/mm/yy"
});
  } );
  </script>
 <script>  
  function call(el,id) {
        $.ajax({
          type: 'POST',
          url: 'todo.php',
		  data: 'i='+el+'&id='+id,
          success: function(data) {
            $('#colm'+el).html(data);
          },
          error:  function(xhr, str){
	    //alert('Возникла ошибка: ' + xhr.responseCode);
          }}); 
    }
	  function call_check(el) {
        $.ajax({
          type: 'POST',
          url: 'check.php',
		  data: 'i='+el,
          success: function(data) {
            $('#colm'+el).html(data);
          },
          error:  function(xhr, str){
	    //alert('Возникла ошибка: ' + xhr.responseCode);
          }}); 
    }
	$(document).ready(function(){  
            call("1");call("2");
            setInterval('call("1");',2000);  
			 setInterval('call("2")',2000);  
        });  
    function AjaxFormRequest(result_id,form_id,url) {	
	var error=false;
	var dates=$("#datepicker").val();
	if (!validate_date(dates)) error=true;;
              if(!error)
{			  jQuery.ajax({
                    url:     url, //Адрес подгружаемой страницы
                    type:     "POST", //Тип запроса
                    dataType: "html", //Тип данных
                    data: jQuery("#"+form_id).serialize(), 
                    success: function(response) { //Если все нормально
                    document.getElementById(result_id).innerHTML = response;
                },
                error: function(response) { //Если ошибка
                document.getElementById(result_id).innerHTML = "Ошибка при отправке формы";
                }
             });}}
function validate_date(value)
{  var arrD = value.split("/");
  arrD[1] -= 1;
  var d = new Date(arrD[2], arrD[1], arrD[0]);
  if ((d.getFullYear() == arrD[2]) && (d.getMonth() == arrD[1]) && (d.getDate() == arrD[0])) {
    return true;
  } else {
    alert("Введена некорректная дата!");
    return false;
  }
}
  </script>
  
</head>

<body>

<table width="100%" border="0">
  <tr>
    <td align="left"><script> call('1') </script><div id="colm1">вывод</div> </td>
    
    <td align="left"><script> call('2') </script><div id="colm2">вывод</div></td>
  </tr>
</table>

<table width="100%" border="0">
  <tr>
    <td><form id="form1" name="form1" action="" >
      <label>
        событие:
          <textarea name="done" rows="2" id="done"></textarea>
        Date: <input type="text" id="datepicker" name="datepicker"/>
      </label>
      <label>
        <input type="reset" name="button" id="button" value="Отправить" onclick="AjaxFormRequest('result_div_id', 'form1', 'add.php')"/>
      </label>
    </form></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>

</html>
