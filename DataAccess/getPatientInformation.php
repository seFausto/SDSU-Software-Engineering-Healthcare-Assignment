<?php
	require 'config.php';

	$patientID =  $_GET['pid'];

	$query = sprintf("SELECT p.ID,  p.NameFirst, p.NameLast, p.NameMiddle, p.Address, p.Phone, p.InsuranceCarrierID, p.DateOfBirth, p.Gender, p.PrimaryCarePhysician
						,p.ChangeByID, p.ChangeDate
						FROM Patient p
						WHERE ID = %s", mysql_real_escape_string($patientID));


	$queryResult = getQueryResult($query);

	if(mysql_num_rows($queryResult))
		echo json_encode(mysql_fetch_assoc($queryResult));

	else 
		echo json_encode(array('ID' => -1));
	/*
	Why was all this here when there is a perfectly good mysql_fetch_assoc function to use?
	if ($row)
	{
		$arr = array('ID' => $row[0],
					'NameFirst'=> $row[1],
					'NameLast'=> $row[2],
					'NameMiddle'=> $row[3],
					'Address'=> $row[4],
					'Phone'=> $row[5],
					'InsuranceCarrierID'=> $row[6],
					'DateOfBirth'=> $row[7],
					'Gender'=> $row[8],
					'PrimaryCarePhysician'=> $row[9],
					'ChangedByID'=> $row[10],
					'ChangeDate'=> $row[11],);
	}
	else
	{

		$arr = array('ID' => -1);
	}

	echo json_encode($arr);*/

?>