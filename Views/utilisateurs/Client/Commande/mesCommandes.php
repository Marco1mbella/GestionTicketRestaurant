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

$req=$BD->prepare("SELECT cmd.id,nom_categorie,cmd.statut,us.id as idutil,cl.id as idCli,
                  cl.nom_client as nomCli FROM categorie ca
                              inner join constituant co on ca.id=co.id_categorie 
                              inner join ligne_commande_constituant lcc ON  co.id=lcc.id_constituant
                              inner join ligne_commande lc ON lcc.id_ligne_commande=lc.id 
                              inner join commande cmd on lc.id_commande=cmd.id 
                              INNER join client cl on cmd.id_client=cl.id 
                              inner join utilisateur us   on cl.iduser=us.id
                              where us.id=?");
   $req->execute(array($idCli)); 
   $maLisCmd=$req->fetchALL();
}catch(Exception $e){
    die('Erreur : '.$e->getMessage());
  }

?>

 <?php //$_SESSION["idCli"]=$maLisCmd[0]["idCli"];
    if($maLisCmd!=Null){
    foreach ($maLisCmd as $cmd) { ?>

      <tr class="item" id='<?=htmlspecialchars($cmd["id"])?>' style="text-align:center;" >
        <td><?=htmlspecialchars($cmd["nom_categorie"])?></td>
        <td><?=htmlspecialchars($cmd["statut"])?></td>
        <td> 
          <button class="btndeleteC btn btn-danger" data-id='<?=htmlspecialchars($cmd["id"])?>' title='<?=htmlspecialchars($cmd["id"])?>' data-toggle="modal" data-target="#modaldeleteC"><i class="fa fa-trash"></i>
          </button>
        </td>
      </tr>
                   
<?php }} ?>

<script type="text/javascript">
  
  document.getElementById("dateOuverture").valueAsDate=new Date();

  //pour les commandes
   $('.btndeleteC').click(function(){    
      var id = $(this).attr('data-id');
      $('#deleteC').attr('data-id',id);     
    });

   $('#deleteC').click(function(){
      var idCmd = $(this).attr('data-id');       
    $.post("Views/utilisateurs/Client/Commande/supprimerCmd.php",{id:idCmd},traiterSupC); 
    });

    function traiterSupC(donnees){
         if (donnees!="----erreur----"){
           $("#"+donnees).remove();
            }
    }


</script>