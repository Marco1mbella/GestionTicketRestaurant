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

$req=$BD->prepare("SELECT us.id,email,count(*) as nbcmd,cmd.id_client from utilisateur us,client cl,commande cmd WHERE us.id=cl.iduser and cl.id=cmd.id_client GROUP by cmd.id_client;");
   $req->execute(); 
   $lisCli=$req->fetchALL();

}catch(Exception $e){
    die('Erreur : '.$e->getMessage());
  }

?>

<?php 
 foreach ($lisCli as $utilisateur) {
?>
<tr id="<?=$utilisateur['id']?>" class="item" style="text-align:center;">
  <td><?=$utilisateur['email']?></td>
  <td><?=$utilisateur['nbcmd']?></td>
  <td>
   <a class="btnconsUcmd btn btn-success" data-id="<?=$utilisateur['id']?>" title="<?=$utilisateur['id']?>" data-toggle="modal" data-target="#ViewModal">
     <i class="fas fa-eye"></i>
   </a>
     &nbsp;&nbsp;
    <button href="javascript:;" class="btndeleteU btn btn-danger"  data-id="<?=$utilisateur['id']?>" data-toggle="modal" data-target="#modaldeleteU">
     <i class="fas fa-trash"></i>
    </button>
  </td>
</tr> 
          
<?php } ?>

<script type="text/javascript">
   //Pour l'utilisateur
    $('.btnconsUcmd').click(function(){    
      var idU = $(this).attr('data-id');  
      
      $.ajax({
        type: "POST",
        url: "Views/utilisateurs/Admin/Commands/listeCmdCli.php",
        data: {id:idU},
        dataType: "text",
        success: function(data){ $('#cmd').html(data); }
        });
   });

    $('.btndeleteU').click(function(){    
      var id = $(this).attr('data-id');
      $('#deleteU').attr('data-id',id);     
    });
  
    $('#deleteU').click(function(){
      var idUtil = $(this).attr('data-id');
      $.post("Views/utilisateurs/Admin/users/deleteClient.php",{id:idUtil},traiterRepSup); 
    });

     function traiterRepSup(donnees)
        { console.log(donnees);
          if (donnees!="----erreur----"){                  
            $("#"+donnees).remove();       
          }
        }
</script>