<?php
	require 'config.php';

	$query = sprintf("SELECT p.ID, p.NameFirst, p.NameLast, p.NameMiddle, p.Address, p.Phone, p.InsuranceCarrierID, p.DateOfBirth, p.Gender, p.PrimaryCarePhysician,p.ChangeByID, p.ChangeDate
						from Patient p
						limit %s , %s"
						,mysql_real_escape_string(0)
						,mysql_real_escape_string(constant('maxNumberOfResults')));


	$queryResult =  getQueryResult($query);

	$count = 1;


	$result = array();

	while ($row = mysql_fetch_assoc($queryResult))
	{

			$arr['ID'] = $row['ID'];
			$arr['NameFirst'] = $row['NameFirst'];
			$arr['NameLast'] = $row['NameLast'];
			$arr['NameMiddle'] = $row['NameMiddle'];
			$arr['Address'] = $row['Address'];
			$arr['Phone'] = $row['Phone'];
			$arr['InsuranceCarrierID'] = $row['InsuranceCarrierID'];
			$arr['DateOfBirth'] = $row['DateOfBirth'];
			$arr['Gender'] = $row['Gender'];
			$arr['PrimaryCarePhysician'] = $row['PrimaryCarePhysician'];
			$arr['ChangedByID'] = $row['ChangedByID'];
			$arr['ChangeDate'] = $row['ChangeDate'];

			
			array_push( $result, $arr);
	}



	header("HTTP/1.0 200 OK");
	echo json_encode($result);
		

?>