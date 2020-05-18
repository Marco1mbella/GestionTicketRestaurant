 
    <!-- Begin Page Content -->
    <div class="container">     
         <!-- DataTales Example -->
    <div class="card shadow mb-8"  style="padding:0.5em;">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">Tous les utilisateurs</h6>         
        </div>

        <br/>
        
        <!--div class="card-body" align=center-->
      <div class="table-responsive" id="affiche">

        <!--Liste des clients-->
        <div id="liUti" class="ml-auto">
          <div class="container-fluid">

           <div class="content-header row">
                  <div class="col-md-4 col-xs-12">          
                   <input type="text" class="form-control" oninput="w3.filterHTML('#myTableUti', '.item', this.value)" placeholder="search for user">
                  </div>
                  <div class="col-md-4 col-xs-12"> </div>
                  <div class="col-md-4 col-xs-12 dropdown" id="dropdown-a" style="text-align: right;">          
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sort BY: <span class="caret"></span></a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="dropdown-a">
                      <a class="dropdown-item" id="allUser">
                          <i class="fa fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        ALL
                      </a>
                      <a class="dropdown-item" onclick="w3.sortHTML('#myTableUti', '.item', 'td:nth-child(1)')" style="cursor:pointer" title="cliquer ici pour les classer">
                          <i class="fa fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                        By Email
                      </a>
                      <a class="dropdown-item" onclick="w3.sortHTML('#myTableUti', '.item', 'td:nth-child(2)')" style="cursor:pointer" title="cliquer ici pour les classer">
                        <i class="fa fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        By ID
                      </a>
                    
                  </div>
                </div>

            </div>
          </div>
          <br/>
          
          <br/>
          <div class="content-header row">
          <!--Table-->
            <table id="myTableUti" class="table table-bordered table-hover table-striped table-responsive{-sm|-md|-lg|-xl}" >
              <!--Table head-->
                
                  <thead class="thead-dark" align="center">
                   <tr>                
                      <th class='th-sm' onclick="w3.sortHTML('#myTableUti', '.item', 'td:nth-child(1)')" style="cursor:pointer" title="cliquer ici pour les classer">ID</th>
                      <th class='th-sm'onclick="w3.sortHTML('#myTableUti', '.item', 'td:nth-child(2)')" style="cursor:pointer" title="cliquer ici pour les classer">Email</th>
                       <th class='th-sm'onclick="w3.sortHTML('#myTableUti', '.item', 'td:nth-child(3)')" style="cursor:pointer" title="cliquer ici pour les classer">DROITS</th>
                      <th class='th-sm'>Actions</th>
                    </tr>
                  </thead>
                  <tbody id="utilBody">
                   
                  </tbody>
                  <!--Table body-->
               </table>
            <!--Table-->
          </div>
        </div>


        <!--Liste des clients-->
        <div id="liU" class="ml-auto">
          <div class="container-fluid">

           <div class="content-header row">
                  <div class="col-md-4 col-xs-12">          
                   <input type="text" class="form-control" oninput="w3.filterHTML('#myTableU', '.item', this.value)" placeholder="search for user">
                  </div>
                  <div class="col-md-4 col-xs-12"> </div>
                  <div class="col-md-4 col-xs-12 dropdown" id="dropdown-a" style="text-align: right;">          
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sort BY: <span class="caret"></span></a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="dropdown-a">
                      <a class="dropdown-item" id="allUser">
                          <i class="fa fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        ALL
                      </a>
                      <a class="dropdown-item" onclick="w3.sortHTML('#myTableU', '.item', 'td:nth-child(1)')" style="cursor:pointer" title="cliquer ici pour les classer">
                          <i class="fa fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                        By Email
                      </a>
                      <a class="dropdown-item" onclick="w3.sortHTML('#myTableU', '.item', 'td:nth-child(2)')" style="cursor:pointer" title="cliquer ici pour les classer">
                        <i class="fa fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        By Commands
                      </a>
                    
                  </div>
                </div>

            </div>
          </div>
          <br/>
          
          <br/>
          <div class="content-header row">
          <!--Table-->
            <table id="myTableU" class="table table-bordered table-hover table-striped table-responsive{-sm|-md|-lg|-xl}" >
              <!--Table head-->
                
                  <thead class="thead-dark" align="center">
                   <tr>                
                      <th class='th-sm' onclick="w3.sortHTML('#myTableU', '.item', 'td:nth-child(1)')" style="cursor:pointer" title="cliquer ici pour les classer">Email</th>
                      <th class='th-sm'onclick="w3.sortHTML('#myTableU', '.item', 'td:nth-child(2)')" style="cursor:pointer" title="cliquer ici pour les classer">Nombre de commandes</th>                    
                      <th class='th-sm'>Actions</th>
                    </tr>
                  </thead>
                  <tbody id="userBody">
                   
                  </tbody>
                  <!--Table body-->
               </table>
            <!--Table-->
          </div>
        </div>

        <!--Liste des commandes-->
        <div id="liC" class="ml-auto">
          <div class="container-fluid">

            <div class="content-header row">
              <div class="col-md-4 col-xs-12">          
                <input type="text" class="form-control" oninput="w3.filterHTML('#myTable', '.item', this.value)" placeholder="search for command...">
              </div>
               <div class="col-md-4 col-xs-12"> </div>
              <div class="col-md-4 col-xs-12 dropdown" id="dropdown-a" style="text-align: right;">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><label>Sort BY:</label></a>
                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="dropdown-a">
                  <a class="dropdown-item" id="allCmd">
                    <i class="fa fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                      ALL
                  </a>
                  <a class="dropdown-item" id="ordere">
                    <i class="fa fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    ordered
                  </a>
                  <a class="dropdown-item" id="prepare" >
                    <i class="fa fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    Preparing
                  </a>
                  <a class="dropdown-item" id="delivere">
                    <i class="fa fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    Delivered
                  </a>                    
                </div>
              </div>             
            </div>
          </div>
          <br/>
          
          <br/>
          <div class="content-header row">
          <!--Table-->
            <table id="myTable" class="table table-bordered table-hover table-striped table-responsive{-sm|-md|-lg|-xl}" >
              <!--Table head-->
                
                  <thead class="thead-dark" align="center">
                   <tr>                
                      <th class='th-sm'onclick="w3.sortHTML('#myTable', '.item', 'td:nth-child(1)')" style="cursor:pointer" title="cliquer ici pour les classer">Commandes</th>
                      <th class='th-sm'onclick="w3.sortHTML('#myTable', '.item', 'td:nth-child(2)')" style="cursor:pointer" title="cliquer ici pour les classer">Statuts</th>
                     
                      <th class='th-sm'>Actions</th>
                    </tr>
                  </thead>
                  <tbody id="cmdBody">
                   
                  </tbody>
                  <!--Table body-->
               </table>
            <!--Table-->
          </div>
        </div>
        
        <!--Liste des tickets-->
        <div id="liTic" class="ml-auto">
          <div class="container-fluid">          
           <div class="content-header row">
              <div class="col-md-4 col-xs-12">          
                   <input type="text" class="form-control" oninput="w3.filterHTML('#myTableT', '.item', this.value)" placeholder="search for tickets" >
                  </div>
                  <div class="col-md-4 col-xs-12"></div>
                   <div class="col-md-4 col-xs-12 dropdown" id="dropdown-a" style="text-align: right;">          
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sort BY: <span class="caret"></span></a>
                      <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="dropdown-a">
                        <a class="dropdown-item" id="allTic">
                     <i class="fa fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                      ALL
                    </a>
                     <a class="dropdown-item" id="opened" >
                      <i class="fa fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                      Opened
                    </a>
                    <a class="dropdown-item" id="treatmentTic">
                     <i class="fa fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                      In traitement
                    </a>
                    <a class="dropdown-item" id="closed">
                     <i class="fa fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                      Closed
                    </a>
                </div>
              </div>
          </div>
          <br/><br/>
                    
          <div class="content-header row">
          <!--Table-->
            <table id="myTableT" class="table table-bordered table-hover table-striped table-responsive{-sm|-md|-lg|-xl}" >
              <!--Table head-->                 
                  <thead style="background: rgb(51,103,214); color: white;" align="center"> 
                            <tr>
                              <th class='th-sm' alt='Identifiant du ticket'>N-° Ticket</th>
                              <th class='th-sm' onclick="w3.sortHTML('#myTableT', '.item', 'td:nth-child(2)')" style="cursor:pointer">Date de création</th>
                              <th class='th-sm'onclick="w3.sortHTML('#myTableT', '.item', 'td:nth-child(3)')" style="cursor:pointer">Date de d'ouverture</th>
                              <th class='th-sm' onclick="w3.sortHTML('#myTableT', '.item', 'td:nth-child(4)')" style="cursor:pointer">Date de Clôture</th>
                              <th class='th-sm' alt='reponse ticket'>Réponse</th>
                              <th class='th-sm' onclick="w3.sortHTML('#myTableT', '.item', 'td:nth-child(5)')" style="cursor:pointer">Etat</th>
                              <th class='th-sm' alt='Email du Client'>Email</th>                           
                              <th class='th-sm'onclick="w3.sortHTML('#myTableT', '.item', 'td:nth-child(9)')" style="cursor:pointer">Id_Commande</th>                              
                              <th class='th-sm'>Actions</th>
                            </tr>                              
                  </thead> 
                  <!--Table head-->
                  <!--Table body-->
                  <tbody id="tickBody">
                    
                  </tbody>
                  <!--Table body-->
               </table>
            <!--Table-->
          </div>
         
                
            </div>  
        </div>
      </div>          
        <!-- -->
    </div>
 


<