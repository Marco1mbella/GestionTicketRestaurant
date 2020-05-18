 
    <!-- Begin Page Content -->
    <div class="container">     
         <!-- DataTales Example -->
    <div class="card shadow mb-8"  style="padding:0.5em;">
        

        <br/>
        
        <!--div class="card-body" align=center-->
      <div class="table-responsive" id="affiche">

        <!--Liste des commandes-->
        <div id="liC" class="ml-auto">
          <div class="container-fluid">

           <div class="content-header row">
                  <div class="col-md-4 col-xs-12">          
                   <input type="text" class="form-control" oninput="w3.filterHTML('#myTable', '.item', this.value)" placeholder="search for name command" id="searchC">
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

            <div class="row">
               <div class="col-md-4 col-xs-12"></div>
               <div class="content-header-right col-md-6 col-xs-12">
                  <div role="group" aria-label="Button group with nested dropdown" class="float-md-right">
                    <div role="group" class="btn-group">
                      <button id="btnadd" class="btn btn-primary btn-icon-split">
                        <span class="icon text-white-50">
                          <i class="fas fa-plus icon-left"></i>
                        </span>
                        <span class="text" id="creer">Nouveau Ticket</span>
                      </button>
                    </div>
                  </div>
                 </div>
              </div>

              <div class="container-fluid">

           <div class="content-header row">
              <div class="col-md-4 col-xs-12">          
                   <input type="text" class="form-control" oninput="w3.filterHTML('#myTableT', '.item', this.value)" placeholder="search for name command" >
                  </div>
                  <div class="col-md-4 col-xs-12"></div>
                   <div class="col-md-4 col-xs-12 dropdown" id="dropdown-a" style="text-align: right;">          
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sort<span class="caret"></span></a>
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
      </div>

      <div class="table-responsive" id="affiche2" action="creerTic">
       
          <form method="POST" align="center" action="creerTic">
              <div class="form-group">
                  <label for="Commande">Commande</label>
                  <select class="form-control">
                    <?php foreach($maLisCmd as $row) {?>
                      <option name="NumCmd">                             
                      <?=htmlspecialchars($row['id']); ?> 
                      </option>
                    <?php } ?>
                   </select>                           
              </div>
               <div class="form-group">
                <label for="Date d'ouverture" class="text-uppercase">Ticket Date Creation</label>
                <input type="date" id="dateOuverture" name="dateOuverture" class="form-control"  value="" readonly/>
               </div>
                       
               <div class="form-group ">
                  <label for="message">Message</label>
                    <textarea class="form-control" name="message" placeholder="Message sent to the employer of Foyer">                              
                    </textarea>                         
                </div> 

                <div class="form-group ">
                  <label for="button-submit"></label>
                  <button class="btn btn-radius btn-primary" type="submit">Send Message</button>
                </div>                    
          </form>
        
      </div>

    </div>          
        <!-- -->
    
</div>
 
