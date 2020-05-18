<?php

	try{
      $BD = new PDO('mysql:host=localhost;dbname=base_de_donnees', 'root','');
      $BD->exec("SET CHARACTER SET UTF8");
      $BD->exec("SET NAMES 'UTF8'");
      $BD->exec("SET CHARACTER SET_CLIENT='UTF8'");
      $BD->exec("set collation_connection='utf8_general_ci'");
      $BD->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      $BD->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

      $idTicket=$_REQUEST["id"];//id du ticket 
	$etatTicket="En cours de traitement";
      $dateConsultation=date('Y-m-d H:i:s');
      $req=$BD->prepare("UPDATE tickets SET etatTicket=?,dateConsultation=? where id=?");
      $req->execute(array($etatTicket,$dateConsultation,$idTicket));

      $Rmessage=$BD->prepare("SELECT * FROM tickets where id=?");
      $Rmessage->execute(array($idTicket ));
      $message=$Rmessage->fetch();
	
	echo $message['msgTicket']; 
	}catch(Exception $e){
		die('Erreur : '.$e->getMessage());
	}
	
?>