<?php 
//
session_start();
try{
      $BD = new PDO('mysql:host=localhost;dbname=base_de_donnees', 'root','');
      $BD->exec("SET CHARACTER SET UTF8");
      $BD->exec("SET NAMES 'UTF8'");
      $BD->exec("SET CHARACTER SET_CLIENT='UTF8'");
      $BD->exec("set collation_connection='utf8_general_ci'");
      $BD->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      $BD->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
      
$idCli=$_COOKIE["idC"];
$reqidC=$BD->prepare("SELECT * from client where idUser=?");
$reqidC->execute(array($idCli));
$reqidC=$reqidC->fetch();
var_dump($reqidC["id"]);
$idCli=$reqidC["id"];
$message=$_REQUEST["message"];
$etatTicket='ouvert';//etat par defaut du ticket
$req=$BD->prepare("INSERT INTO `tickets` (`msgTicket`, `etatTicket`, `repTicket`, `dateOuverture`, `dateFermeture`, `idClient`) VALUES (?,?, NULL, now(), NULL, ?)");
$req->execute(array($message,$etatTicket,$idCli));
//var_dump($req);
}catch(Exception $e){
		die('Erreur : '.$e->getMessage());
	}

?>