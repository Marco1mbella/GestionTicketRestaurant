<?php

	try{
      $BD = new PDO('mysql:host=localhost;dbname=base_de_donnees', 'root','');
      $BD->exec("SET CHARACTER SET UTF8");
      $BD->exec("SET NAMES 'UTF8'");
      $BD->exec("SET CHARACTER SET_CLIENT='UTF8'");
      $BD->exec("set collation_connection='utf8_general_ci'");
      $BD->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      $BD->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

      $id=$_REQUEST["id"];     
    
      $supC=$BD->prepare('Delete from commande where id=?');
      $supC->execute(array($id));
      echo $id;
	}catch(Exception $e){
		die('Erreur : '.$e->getMessage());
	}
	
?>