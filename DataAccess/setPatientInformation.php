<?php
	require 'config.php';

	$updateInformation = json_decode(file_get_contents("php://input"));

	$query = sprintf("insert into PatientHistory (ID, NameFirst, NameLast, NameMiddle, Address, Phone, InsuranceCarrierID, DateOfBirth, Gender, PrimaryCarePhysician, MedicationListID, AppointmentsID, ChangeByID, ChangeDate)
				select ID, NameFirst, NameLast, NameMiddle, Address, Phone, InsuranceCarrierID, DateOfBirth, Gender, PrimaryCarePhysician, MedicationListID, AppointmentsID, ChangeByID, ChangeDate 
				FROM Patient
				where ID = %s", 
				mysql_real_escape_string($updateInformation['ID']));

	$queryResult = getQueryResult($query);

	if (mysql_affected_rows() > 0 )
	{

		$query = sprintf("
				UPDATE Patient
				SET NameFirst = %s
				,NameLast = %s
				,NameMiddle = %s
				,Address = %s
				,Phone = %s
				,InsuranceCarrierID = %s
				,DateOfBirth = %s
				,Gender = %s
				,PrimaryCarePhysician = %s
				,ChangedByID = %s
				,ChangeDate =  NOW()
				WHERE
				ID = %s
				" 
				,mysql_real_escape_string($updateInformation->NameFirst)
				,mysql_real_escape_string($updateInformation->NameLast)
				,mysql_real_escape_string($updateInformation->NameMiddle)
				,mysql_real_escape_string($updateInformation->Address)
				,mysql_real_escape_string($updateInformation->Phone)
				,mysql_real_escape_string($updateInformation->InsuranceCarrierID)
				,mysql_real_escape_string($updateInformation->DateOfBirth)
				,mysql_real_escape_string($updateInformation->Gender)
				,mysql_real_escape_string($updateInformation->PrimaryCarePhysician)
				,mysql_real_escape_string($updateInformation->ChangedByID))

		;
	}



?>