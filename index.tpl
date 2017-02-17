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
    $( "#datepicker" ).datepicker();
  } );
  </script>
 <script>  
  function call(el) {
        $.ajax({
          type: 'POST',
          url: 'todo.php',
		  data: 'i='+el,
          success: function(data) {
            $('#colm'+el).html(data);
          },
          error:  function(xhr, str){
	    alert('Возникла ошибка: ' + xhr.responseCode);
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
	    alert('Возникла ошибка: ' + xhr.responseCode);
          }}); 
    }
	$(document).ready(function(){  
            call("1");call("2");
            setInterval('call("1");',3000);  
			 setInterval('call("2")',3000);  
        });  
function cal_hard(el) {
	var msg   = $('#formx1').serialize();
   $.ajax({
   type: 'POST',
   url: 'add.php',
    data: 'msg',
   success: function(data){
    $('#results').html(data);
    },
	error:  function(xhr, str){
	alert('Возникла ошибка: ' + xhr.responseCode);
   }});
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
    <td><form id="form1" name="form1" method="post" action="add.php">
      <label>
        событие:
          <textarea name="done" rows="2" id="done"></textarea>
        Date: <input type="text" id="datepicker" name="datepicker" />
      </label>
      <label>
        <input type="submit" name="button" id="button" value="Отправить" />
      </label>
    </form></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>

</html>
