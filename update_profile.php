<?php
require('connection.inc.php');
require('functions.inc.php');
if(!isset($_SESSION['USER_LOGIN'])){
	?>
	<script>
	window.location.href='index.php';
	</script>
	<?php
}
$name=get_safe_value($con,$_POST['name']);
if($name==$_SESSION['USER_NAME']){
	echo "Please enter new name";
}
else{
$uid=$_SESSION['USER_ID'];
mysqli_query($con,"update users set username='$name' where id='$uid'");
$_SESSION['USER_NAME']=$name;
// echo "Your name is updated";
?>
<script>
	window.location.href = window.location.href;
	
</script>
<?php

}
?>