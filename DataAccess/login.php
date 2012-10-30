<?php
	require 'config.php';
	require 'encryption.php';


	$userName = $_POST['UserName'];
	$password = encryptString($_POST['Password']);

	$query = sprintf("SELECT ID FROM User WHERE UserName ='%s' AND Password = '%s'",
		mysql_real_escape_string($userName), mysql_real_escape_string($password));


	$queryResult = getQueryResult($query);
	
	$row = mysql_fetch_row($queryResult);

	if($row)
	{
		$arr = array('ID' => $row[0]);
	}
	else
	{
		$arr = array('ID' => -1);
	}

	echo json_encode($arr);

?>