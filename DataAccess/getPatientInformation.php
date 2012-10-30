<?php
	require 'config.php';

	$patientID =  1;//$_POST['PatientID'];

	$query = sprintf("SELECT p.ID,  p.NameFirst, p.NameLast, p.NameMiddle, p.Address, p.Phone, p.InsuranceCarrierID, p.DateOfBirth, p.Gender, p.PrimaryCarePhysician
						,p.ChangeByID, p.ChangeDate
						FROM Patient p
						WHERE ID = %s", mysql_real_escape_string($patientID));


	$queryResult = getQueryResult($query);

	$row = mysql_fetch_row($queryResult);

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

	echo json_encode($arr);

?>