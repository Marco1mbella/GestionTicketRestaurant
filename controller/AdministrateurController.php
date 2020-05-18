<?php 
      global $res;
   $cible = isset($_GET['cible'])? $_GET['cible'] : "load";
   switch($cible){
                  case 'load':{                       
                        include("Views/utilisateurs/header.php");                         
                        include("Views/utilisateurs/sidebar.php");
                        include("Views/utilisateurs/topbarUser.php");
                        include("Views/utilisateurs/admin.php");
                        include("Views/utilisateurs/footerUser.php");
                        break;
                  }
                  
                  case 'listeCli':{
                      $res=Administrateur::listerCli();
                        include("Views/utilisateurs/header.php");                         
                        include("Views/utilisateurs/sidebar.php");
                        include("Views/utilisateurs/topbarUser.php");
                        include("Views/utilisateurs/admin.php");
                        include("Views/utilisateurs/footerUser.php");               
                      break;
                  }
                  case 'listeCmd':{
                      $res=Administrateur::listerCmd();
                        include("Views/utilisateurs/header.php");                         
                        include("Views/utilisateurs/sidebar.php");
                        include("Views/utilisateurs/topbarUser.php");
                        include("Views/utilisateurs/admin.php");
                        include("Views/utilisateurs/footerUser.php");
                      break;
                  }
                  case 'listeTic':{
                      $res=Administrateur::listerTic();
                        include("Views/utilisateurs/header.php");                         
                        include("Views/utilisateurs/sidebar.php");
                        include("Views/utilisateurs/topbarUser.php");
                        include("Views/utilisateurs/admin.php");
                        include("Views/utilisateurs/footerUser.php");
                      break;
                  }
                  
                  default:{
                      //header('location: ../utilisateur');
                      echo "rien a signaler";
                  }
              }
        var_dump($res);

   ?>