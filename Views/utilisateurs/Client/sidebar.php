<?php 
  session_start();
  if($_SESSION["droits"]!="client"){
    if($_SESSION["droits"]!="administrateur"){
      header('location: login');
    }   
    header('location:admin');
  } 

$client = new Client();
$maLisCmd=$client->listerCmdCli($_SESSION['userid']);
$maLisTic=$client->listerTicCli($_SESSION['userid']);

setcookie('idC',$_SESSION['userid'], time()+36000,null,null,false,true);

  ?>

<body id="page-top">

<!-- Page Wrapper -->
  <div id="wrapper">     

   
 <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-dark accordion" style="background: rgb(51,103,214); color: white;" id="accordionSidebar">

    
      <!-- Divider -->
      <hr class="sidebar-divider my-0">
      <br><br>

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" >
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span id="reset">Accueil</span></a>
      </li>

      
      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" class="btn btn-info col" onclick="listerCmdFav()" >
          <i class="fa fa-fw fa-star"></i>
          <span>My Favorites               
          </span>
        </a>
      </li>
      

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" class="btn btn-info col" onclick="listerCmd()">
          <i class="fa fa-fw fa-image"></i>
          <span>Commands List</span></a>
      </li>

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" onclick="listerTic()">
          <i class="fa fa-fw fa-image"></i>
          <span>My Tickets</span></a>
      </li>
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button id="sidebarToggle" class="btn btn-link rounded-circle mr-3">
        <i class="fa fa-bars"></i>
        </button>
      </div>
     

    </ul>
    <!-- End of Sidebar -->

