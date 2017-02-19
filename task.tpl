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
  function call(el,id) {
        $.ajax({
          type: 'POST',
          url: 'todo.php',
		  data: 'i='+el+'&id='+id,
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
  </script>  
</head>

<body>
<a href="index.php"> <<Вернуться к списку задач</a>
<script> call('1','{id}') </script><div id="colm1">вывод</div>
{out}
<table width="100%" border="0">
  <tr>
    <td><form id="form1" name="form1" method="post" action="add_commit.php">
      <label>имя:
          <input name="name" type="text" id="name" value="" />
          комментарий:
<textarea name="commit" rows="2" id="commit"></textarea>
      </label>
      <label>
        <input type="submit" name="button" id="button" value="Отправить" />
      </label><input name="id" type="hidden" value="{id}" />
    </form></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>

</html>
