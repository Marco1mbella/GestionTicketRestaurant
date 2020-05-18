
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
  
  $req=$BD->prepare("SELECT nom_categorie,cmd.statut,us.id as idutil,cl.nom_client FROM categorie ca
                     inner join constituant co on ca.id=co.id_categorie 
                     inner join ligne_commande_constituant lcc ON  co.id=lcc.id_constituant
                     inner join ligne_commande lc ON lcc.id_ligne_commande=lc.id 
                     inner join commande cmd on lc.id_commande=cmd.id 
                     INNER join client cl on cmd.id_client=cl.id 
                     inner join utilisateur us   on cl.iduser=us.id
                     where us.id=? GROUP by cl.id");
            $req->execute(array($id));
            $result=$req->fetchAll();


?>

<?php 
	foreach ($result as $champs) { 	?>					

    <tr style="text-align:center;">
            <td> <?=$champs['nom_categorie']?></td>                                            
            <td> <?=$champs['statut']?></td>
			<td> <?=$champs['nom_client']?></td>	
							  					  
           </tr>;                  
                  
 <?php   } 


  }catch(Exception $e){
		die('Erreur : '.$e->getMessage());
	}

?>
