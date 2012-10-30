<?php
	$dbHost = "localhost:8889";
	$dbUserName = "HealthTrak";
	$dbPassword = "1234";
	$dbName = "HealthTrak";

	$con = mysql_connect($dbHost, $dbUserName, $dbPassword)
	or die ('Could not connect: '.mysql_error());

	mysql_select_db($dbName, $con) 
	or die ('Could not select database: '.mysql_error());


	function getQueryResult($query)
	{

		$queryResult = mysql_query($query);

		if (!$queryResult)
		{
			echo 'Could not run query. Please contact support. Error Message: '. mysql_error();
		}

		return $queryResult;

	}

?>

