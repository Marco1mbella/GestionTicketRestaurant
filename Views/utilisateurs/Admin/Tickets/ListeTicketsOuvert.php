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
      


$etatTicket='ouvert';//etat par defaut du ticket
$req=$BD->prepare("SELECT u.email, c.nom_client, t.id as idTicket,t.dateOuverture,t.dateConsultation, t.dateFermeture, t.etatTicket,t.repTicket, cmd.id as idCmd, c.id as idCli FROM utilisateur u Inner JOIN client c on u.id=c.idUser Inner JOIN tickets t on c.id=t.idClient Inner JOIN commande cmd on c.id=cmd.id_client WHERE t.etatTicket=?");
                $req->execute(array($etatTicket)); 
                $LisTic=$req->fetchALL();
}catch(Exception $e){
    die('Erreur : '.$e->getMessage());
  }

?>

<?php 

  foreach ($LisTic as $row) {
                              
   $statBuCan=NULL;
    if (htmlspecialchars($row["etatTicket"])!="fermé") { 
         $statBuCan="disabled";
      }  
                                
  ?>
   <tr class="item" id='<?=htmlspecialchars($row["idTicket"])?>'style="text-align=center;" >
      <td><?=htmlspecialchars($row["idTicket"])?></td>
      <td><?=htmlspecialchars($row["dateOuverture"])?></td> 
      <td><?=htmlspecialchars($row["dateConsultation"])?></td> 
      <td><?=htmlspecialchars($row["dateFermeture"])?></td>
      <td><?=htmlspecialchars($row["repTicket"])?></td>
      <td><?=htmlspecialchars($row["etatTicket"])?></td>
      <td><?=htmlspecialchars($row["email"])?></td>      
      <td><?=htmlspecialchars($row["idCmd"])?></td>
      
    <td class="form-group"> 
       <button class="btnConsTic btn btn-success form-control" data-id='<?=htmlspecialchars($row["idTicket"])?>' title="consulter Ticket :'<?=htmlspecialchars($row["idTicket"])?>'" data-toggle="modal" data-target="#consulterModal">
                  <i class="fas fa-eye"></i>
       </button>
      <button  class="deleteBT btn btn-danger"  data-id='<?=htmlspecialchars($row["idTicket"])?>' title="Annuler Ticket :'<?=htmlspecialchars($row["idTicket"])?>'" data-toggle="modal" data-target="#modaldeleteT"  <?=htmlspecialchars($statBuCan)?>>
          <i class="fa fa-trash"></i>
      </button>
    </td>
   </tr>
                       
<?php }?>

<script type="text/javascript">
  
  //Pour consulter un ticket
     $('.btnConsTic').click(function(){    
      var idTic = $(this).attr('data-id');  
      $('#repondre').attr('data-id',idTic);  
       $.ajax({
        type: "POST",
        url: "Views/utilisateurs/Admin/Tickets/consulterTicket.php",
        data: {id:idTic},
        dataType: "text",
        success: function(data){ 
        //$('#liTic').location.reload();
       
          $('#messageTic').val(data);
          $('#idTicket').text(idTic);  
          console.log(document.getElementById("messageTic").value);
        }
        });
      });
      $('#repondre').click(function(){
      
     var idTic=$(this).attr('data-id'); 
     var rep=document.getElementById("reponse").value;     
     $.post("Views/utilisateurs/Admin/Tickets/repondreTicket.php",{idTicket:idTic , reponse:rep},ecrire)
     location.reload();
    });

 function ecrire(data){
  $("#result").html(data); 
 }
 

  //pour supprimer les tickets
   $('.deleteBT').click(function(){    
      var id = $(this).attr('data-id');
      $('#deleteT').attr('data-id',id);  
      console.log(id);   
    });

   $('#deleteT').click(function(){
      var idTic = $(this).attr('data-id'); 
      console.log(idTic);  
     //$.post("Views/utilisateurs/Client/annulerTicket.php",{id:idTic},traiterSupT); 
    });

    function traiterSupT(donnees){ 

         if (donnees!="----erreur----"){
           $("#"+donnees).remove();
            }
        } 

</script>