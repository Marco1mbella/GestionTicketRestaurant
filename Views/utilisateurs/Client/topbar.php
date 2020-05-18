<!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <!-- Main Content -->
      <div id="content">
    <!-- Topbar -->
      <nav class="navbar navbar-expand navbar-light  topbar mb-4 static-top shadow">
        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
        </button>

        <!-- Topbar Navbar -->
        <div class="collapse navbar-collapse" >

          <ul class="navbar-nav ml-auto">           

          <div class="topbar-divider d-none d-sm-block"></div>
          <!-- Nav home Information -->
            <li class="nav-item">
              <a class="nav-link" href="contact" >
                <i class="fa fa-fw fa-home"></i>
                <span>Home            
                </span>
              </a>
            </li>
          <!-- Nav menu Information -->
           <li class="nav-item">
              <a class="nav-link" href="menu" >
                <i class="fa fa-fw fa-bars"></i>
                <span>Menu              
                </span>
              </a>
            </li>
            
          <!-- Nav Contact Information -->
            <li class="nav-item">
              <a class="nav-link" class="btn" href="contact" >
                <i class="fa fa-fw fa-phone"></i>
                <span>Contact            
                </span>
              </a>
            </li>
            
          <!-- Nav Item - User Information -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">
              <img class="img-profile rounded-circle" src="images/user.svg" title="<?php echo $_SESSION['email'].': '.$_SESSION['droits']; ?>" width="30" height="30">
            </a> 
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="dropdown-a">
                
                 <a class="dropdown-item" href="admin" >
                  <i class="fa fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profil
                </a>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                 <i class="fa fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Deconnexion
                </a>
            </div>
          </li>
          </ul>
        </div>
      </nav>
      <!-- End of Topbar -->

      <!-- Logout Modal-->
       <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Deconnexion</h5>
                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="modal-body">Voulez vous vraiment vous deconnecter?</div>
                <div class="modal-footer">
                  <button class="btn btn-secondary" type="button" data-dismiss="modal">Annuler</button>
                  <a class="btn btn-primary" href="logout">Deconnecter</a>
                </div>
                </div>
              </div>
            
            </div>
<!---------------------------------confirmation de suppression--------------------------------------->
             
             <!-- Delete commande Modal-->
            <div class="modal fade" id="modaldeleteC" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirmation Suppression</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
                </button>
              </div>
              <div class="modal-body">Voules-vous vraiment supprimer cette entree?</div>
              <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <button class="btn btn-danger" id="deleteC" data-dismiss="modal">Delete</button>
              </div>
              </div>
            </div>
            </div>


             <!-- Delete tic Modal-->
            <div class="modal fade" id="modaldeleteT" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirmation Suppression</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
                </button>
              </div>
              <div class="modal-body">Voules-vous vraiment supprimer cette entree?</div>
              <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <button class="btn btn-danger" id="deleteT" data-dismiss="modal">Delete</button>
              </div>
              </div>
            </div>
            </div>
<!------------------------------Fin confirmation de suppression----------------------------------->
        

