<?php 
  session_start();
  if($_SESSION["droits"]!="administrateur"){
    if($_SESSION["droits"]!="client"){
      header('location: login');
    }   
    header('location:client');
  }  
$admin = new Administrateur();
$lisCli=$admin->listerCli();
$lisCmd=$admin->listerCmd();
$lisTic=$admin->listerTic()


  ?>

<body id="page-top">

<!-- Page Wrapper -->
  <div id="wrapper">     

   
 <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-dark accordion" style="background: rgb(51,103,214); color: white;"id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin">
        <div class="sidebar-brand-icon">
          <img src="images/3il.jpg" alt="Logo 3iL" class="img-fluid rounded-circle img-thumbnail">
        </div>
        <div class="sidebar-brand-text mx-3">Administration</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">
      <br>

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" >
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span class="reset">Accueil</span></a>
      </li>

      
      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" class="btn btn-info col" onclick="listerUtil()" >
          <i class="fas fa-fw fa-users"></i>
          <span>Liste des Utilisateurs              
          </span>
        </a>
      </li>

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" class="btn btn-info col" onclick="listerCl()" >
          <i class="fas fa-fw fa-image"></i>
          <span>Liste des Clients                
          </span>
        </a>
      </li>

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" class="btn btn-info col" onclick="listerCmd()">
          <i class="fas fa-fw fa-image"></i>
          <span>Liste des Commandes</span></a>
      </li>

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" onclick="listerTic()">
          <i class="fas fa-fw fa-image"></i>
          <span>Gerer les tickets</span></a>
      </li>
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle " id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

