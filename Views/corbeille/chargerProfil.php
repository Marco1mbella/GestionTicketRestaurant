<?php 
session_start();
    if($_SESSION["droits"]=="administrateur"){ 
        //echo "je suis admin";                                       
        //header('Location: adminis');
       header('Location: admin.php');
    }else if($_SESSION["droits"]=="client"){
        // echo "je suis client";
         header('location: client.php');
    }else{
    //echo "je vais a l'accueil";
    header('location: login');
    }

?>