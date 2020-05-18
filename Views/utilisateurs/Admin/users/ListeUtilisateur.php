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

$req=$BD->prepare("SELECT id,email,droits from utilisateur");
   $req->execute(array()); 
   $lisUtil=$req->fetchALL();

}catch(Exception $e){
    die('Erreur : '.$e->getMessage());
  }

?>

<?php 
 foreach ($lisUtil as $utilisateur) {
?>
<tr id="<?=$utilisateur['id']?>" class="item" style="text-align:center;">
  <td><?=$utilisateur['id']?></td>
  <td><?=$utilisateur['email']?></td>
  <td><?=$utilisateur['droits']?></td>
  <td>
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