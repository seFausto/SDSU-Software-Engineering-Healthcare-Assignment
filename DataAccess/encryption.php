<?php
	$salt = "vendetta";
	$pepper = "inception";
	$key = "prestige";

	function encryptString($stringToEncrypt)
	{

		$string = $GLOBALS['salt'].$stringToEncrypt.$GLOBALS['pepper'];

		$encrypted = base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, md5($key), $string, MCRYPT_MODE_CBC, md5(md5($key))));

		return $encrypted;

	

	}

	function decryptString($stringToDecrypt)
	{

		$decrypted = rtrim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, md5($key), base64_decode($stringToDecrypt), MCRYPT_MODE_CBC, md5(md5($key))), "\0");
		
		$valuesToReplace = array($GLOBALS['salt'], $GLOBALS['pepper']);

		return str_replace($valuesToReplace, "", $decrypted); 
	}
?>