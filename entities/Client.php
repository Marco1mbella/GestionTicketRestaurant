<?php
	
	Class Client extends Model{
		private $tableName='client';
		private $id;

		public function __Construct(){

		}

 		   //lister les tickets du clients
            public static function listerTicCli($idCli){
                global $BD;
                $req=$BD->prepare("SELECT u.email, c.nom_client, t.id as idTicket,t.dateOuverture,t.dateConsultation, t.dateFermeture, t.etatTicket,t.repTicket, cmd.id as idCmd, c.id as idCli FROM utilisateur u Inner JOIN client c on u.id=c.idUser Inner JOIN tickets t on c.id=t.idClient Inner JOIN commande cmd on c.id=cmd.id_client WHERE u.id=?");
               $req->execute(array($idCli));
                $result=$req->fetchAll();
                return $result;
            }
    
            //lister les commandes du client
            public static function listerCmdCli($idCli){
                global $BD;
                $req=$BD->prepare("SELECT cmd.id,nom_categorie,cmd.statut,us.id as idutil,cl.id as idCli,
                  cl.nom_client as nomCli FROM categorie ca
                              inner join constituant co on ca.id=co.id_categorie 
                              inner join ligne_commande_constituant lcc ON  co.id=lcc.id_constituant
                              inner join ligne_commande lc ON lcc.id_ligne_commande=lc.id 
                              inner join commande cmd on lc.id_commande=cmd.id 
                              INNER join client cl on cmd.id_client=cl.id 
                              inner join utilisateur us   on cl.iduser=us.id
                              where us.id=? ");
                $req->execute(array($idCli));
                $result=$req->fetchAll();
                return $result;
            }
    
            public function commander($idCmd,$qte,$idCli){
    
    
            }
    
            //creer le ticket du client
            public static function creerTicket($idCli,$message){
                   global $BD;
                $etatTicket='ouvert';//etat par defaut du ticket
                $req=$BD->prepare("INSERT INTO `tickets` (`msgTicket`, `etatTicket`, `repTicket`, `dateOuverture`, `dateFermeture`, `idClient`) VALUES (?,?, NULL, now(), NULL, ?)");
                $req->execute(array($message,$etatTicket,$idCli));            
    
            }
    
            public static function annulerCmd(){
    
            }
    
            public static function annulerTic(){
    
            }


	}
?>