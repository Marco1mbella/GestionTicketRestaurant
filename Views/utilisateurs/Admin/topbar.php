<!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <!-- Main Content -->
      <div id="content">
    <!-- Topbar -->
      <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
        </button>

        <!-- Topbar Navbar -->
        <div class="collapse navbar-collapse" >

          <ul class="navbar-nav ml-auto">           

          <div class="topbar-divider d-none d-sm-block"></div>
          <!-- Nav Item - User Information -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">
              <img class="img-profile rounded-circle" src="images/user.svg" title="<?php echo $_SESSION['email'].': '.$_SESSION['droits']; ?>" width="30" height="30">
            </a> 
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="dropdown-a">
                
                 <a class="dropdown-item" href="admin" >
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profil
                </a>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                 <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
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
             <!-- Delete user Modal-->
            <div class="modal fade" id="modaldeleteU" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                <button class="btn btn-danger" id="deleteU" data-dismiss="modal">Delete</button>
              </div>
              </div>
            </div>
            </div>

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
        

<!---------------------------------Lecture des donnees--------------------------------------->
        
        <!--  Consulter le commandes cli -->

        <!---  View Modal-->
          <div class="modal fade" id="ViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Liste des commandes</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
                </button>
              </div>
              <div class="modal-body">
                <h6>Commandes</h6>
                <hr/>
                <table class="table table-bordered table-striped table-hover"  width="100%" cellspacing="0">
                <thead id="userCmd" class="thead-dark" align=center> 
                <tr>
                  <th class="th-sm">Nom Commande</th>
                  <th class="th-sm">Statuts</th> 
                  <th class="th-sm">Nom Client</th>
                </tr>           
                </thead>

                <tbody id="cmd" >

                </tbody>

                </table>
              </div>
              
              <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Fermer</button>
              </div>
              </div>
            </div>
            </div>

        <!--  Consulter le ticket -->
    <div id="consulterModal" class="modal" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
          <div class="modal-content">

              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
              </div>

              <div class="modal-body">
                <form method="post">
                  <div class="form-group">
                    <label for="Id ticket" class="col-form-label">Id Ticket:</label>
                    <label id="idTicket" class="col-form-label" name="idTicket" disabled="disabled">ID</label>
                  </div>

                  <div class="form-group">
                    <label for="message-text" class="col-form-label">Message:</label>
                      <input type="text" class="form-control" id="messageTic" name="messageTic" rows="5" cols="50"  disabled="disabled" value="" >
                  </div>

                  <div class="form-group">
                    <label for="reponse" class="col-form-label">Reponse:</label>
                    <input type="textarea" id="reponse" class="form-control" placeholder="Type your answer here..." required=""  rows="5" cols="50"/>                              
                  </div>

                  <div class="form-group" id="result">
                                                  
                  </div>

                  <div class="form-group">
                    <button type="button" id="repondre" class="btn btn-primary" data-dismiss="modal">Répondre</button>
                  </div>
              </form>
              </div>

              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="canc"data-dismiss="modal">Close</button>
                
              </div>
               

          </div>
       </div>
    </div>