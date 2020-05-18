<?php

      try{
      $BD = new PDO('mysql:host=localhost;dbname=base_de_donnees', 'root','');
      $BD->exec("SET CHARACTER SET UTF8");
      $BD->exec("SET NAMES 'UTF8'");
      $BD->exec("SET CHARACTER SET_CLIENT='UTF8'");
      $BD->exec("set collation_connection='utf8_general_ci'");
      $BD->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      $BD->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

      $idTicket=$_REQUEST["idTicket"];//id du ticket 
      $reponseTi=$_REQUEST["reponse"];//reponse
      
      $etatTicket="fermé";    
      
      $req=$BD->prepare("UPDATE tickets SET etatTicket=?,dateFermeture=now(),repTicket=? where id=?");
      $req->execute(array($etatTicket,$reponseTi,$idTicket));
      header('location: admin');   

      }catch(Exception $e){
            die('Erreur : '.$e->getMessage());
      }
      
?>