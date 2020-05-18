<?php
	
	Class Administrateur extends Model{
		private $tableName='utilisateur';
		private $id;

		public function __Construct(){

		}

         //lister les clients et leur nombre de commandes
         public static function listerCli(){
            global $BD;
            $req=$BD->prepare("SELECT us.id,email,count(*) as nbcmd,cmd.id_client from utilisateur us,client cl,commande cmd WHERE us.id=cl.iduser and cl.id=cmd.id_client GROUP by cmd.id_client;");
            $req->execute();
            $result=$req->fetchAll();
            return $result;
        }

        //liste de toutes les commandes
        public static function listerCmd(){
            global $BD;
            $req=$BD->prepare("SELECT cmd.id,nom_categorie,cmd.statut,us.id as idutil,cl.nom_client as nomCli 
                              FROM categorie ca
                              inner join constituant co on ca.id=co.id_categorie 
                              inner join ligne_commande_constituant lcc ON  co.id=lcc.id_constituant
                              inner join ligne_commande lc ON lcc.id_ligne_commande=lc.id 
                              inner join commande cmd on lc.id_commande=cmd.id 
                              INNER join client cl on cmd.id_client=cl.id 
                              inner join utilisateur us   on cl.iduser=us.id
                              GROUP by cl.id");
            $req->execute();
            $result=$req->fetchAll();
            return $result;
        }
        
         //liste de tous les tickets
        public static function listerTic(){
            global $BD;
            $req=$BD->prepare("SELECT u.email, c.nom_client, t.id as idTicket,t.dateOuverture,t.dateConsultation, t.dateFermeture, t.etatTicket, cmd.id as idCmd, c.id as idCli FROM utilisateur u Inner JOIN client c on u.id=c.idUser Inner JOIN tickets t on c.id=t.idClient Inner JOIN commande cmd on c.id=cmd.id_client  GROUP By c.id ");
           $req->execute();
            $result=$req->fetchAll();
            return $result;

        }

         //lister les tickets du clients
        public static function listeTicCli($idCli){
            global $BD;
            $req=$BD->prepare("SELECT u.email, c.nom_client, t.id as idTicket,t.dateOuverture, t.dateFermeture, t.etatTicket, cmd.id as idCmd, c.id as idCli FROM utilisateur u Inner JOIN client c on u.id=c.idUser Inner JOIN tickets t on c.id=t.idClient Inner JOIN commande cmd on c.id=cmd.id_client WHERE c.id=? ");
           $req->execute(array($idCli));
            $result=$req->fetchAll();
            return $result;
        }

         public static function listerCmdCli($idCli){
                global $BD;
                $req=$BD->prepare("SELECT cmd.id,nom_categorie,cmd.statut,us.id as idutil,
                  cl.nom_client as nomCli FROM categorie ca
                              inner join constituant co on ca.id=co.id_categorie 
                              inner join ligne_commande_constituant lcc ON  co.id=lcc.id_constituant
                              inner join ligne_commande lc ON lcc.id_ligne_commande=lc.id 
                              inner join commande cmd on lc.id_commande=cmd.id 
                              INNER join client cl on cmd.id_client=cl.id 
                              inner join utilisateur us   on cl.iduser=us.id
                              where cl.id=? ");
                $req->execute(array($idCli));
                $result=$req->fetchAll();
                return $result;
            }

        public static function modifierTicket($idTicket){
            global $BD;
            $etatTicket="En cours de traitement";
            $req=$BD->prepare("UPDATE tickets SET etatTicket=? where id=?");
            $req->execute(array($etatTicket,$idTicket));

            return $idTicket;

         }
         //fermer le ticket
         public static function supprimerTicket($idTicket,$reponse){
            global $BD;
            $etatTicket="fermé";
            $req=$BD->prepare("UPDATE tickets SET etatTicket=?,repTicket=? ,dateFermeture=now() where id=?");
            $req->execute(array($etatTicket,$reponse,$idTicket));
            return $idTicket;
         }

      


	}
?>