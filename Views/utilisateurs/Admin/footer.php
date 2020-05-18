<!-- Footer -->
  <footer class="row sticky-footer bg-white">
   <div class="container my-auto">
     <div class="copyright text-center my-auto">
      <span>Copyright &copy; <?=date('Y')?>. Designed by <a href="contact">@MKD corporation </a></span>
    </div>
   </div>
 </footer>
<!-- End of Footer -->
</div>
<!-- /.container-fluid -->
</div>
</div>
</div>
<!-- End of Content Wrapper -->
  

<!-- ALL JS FILES -->
  <script src="js/all/jquery-3.4.1.min.js"></script>
  <script src="js/all/popper.min.js"></script>
  <script src="js/all/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
  <script src="js/all/W3.js"></script>
  <script src="js/all/sb-admin-2.min.js"></script>
  <!-- ALL dataTable Js -->
    <script src="js/data-table/bootstrap-table.js"></script>
    <script src="js/data-table/tableExport.js"></script>
    <script src="js/data-table/data-table-active.js"></script>
    <script src="js/data-table/bootstrap-table-editable.js"></script>
    <script src="js/data-table/bootstrap-editable.js"></script>
    <script src="js/data-table/bootstrap-table-resizable.js"></script>
    <script src="js/data-table/colResizable-1.5.source.js"></script>
    <script src="js/data-table/bootstrap-table-export.js"></script>
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  

<script>
  //On masque tout
        $('#affiche').hide(); 
        $('#affiche2').hide();  
                 
        $('.reset').click(function(){ 
          $('#affiche').hide();
          $('#affiche2').hide();
        });
                        
        function listerUtil(){
          $('#affiche').show();
          $('#liTic').hide();          
          $('#liC').hide();
           $('#liU').hide();
          $('#liUti').show(); 
          $.get("Views/utilisateurs/Admin/users/ListeUtilisateur.php",chargeDataUtil);              
       }
              
        function listerCl(){
          $('#affiche').show();
          $('#liTic').hide();          
          $('#liC').hide();
          $('#liUti').hide(); 
          $('#liU').show(); 
          $.get("Views/utilisateurs/Admin/users/ListeClient.php",chargeDataUsers);              
       }

       function listerCmd(){
         $('#affiche').show();
         $('#liTic').hide();
         $('#liU').hide();
         $('#liUti').hide();
         $('#liC').show();
          $.get("Views/utilisateurs/Admin/Commands/ListeCommandes.php",chargeDataCommand);
       }
       
        function listerTic(){
          $('#affiche').show();
          $('#liU').hide();
          $('#liC').hide();
          $('#liUti').hide();
          $('#liTic').show();
          $.get("Views/utilisateurs/Admin/Tickets/ListeTickets.php",chargeDataTicket);
        }

        $("#allTic").click(function(){
          $.get("Views/utilisateurs/Admin/Tickets/ListeTicketsGroup.php",chargeDataTicket);   
        });

        $("#opened").click(function(){
          $.get("Views/utilisateurs/Admin/Tickets/ListeTicketsOuvert.php",chargeDataTicket);
        });
        
        $("#treatmentTic").click(function(){
          $.get("Views/utilisateurs/Admin/Tickets/ListeTicketsEnTraitement.php",chargeDataTicket);
        });

        $("#closed").click(function(){
          $.get("Views/utilisateurs/Admin/Tickets/ListeTicketsFerme.php",chargeDataTicket);
        });

        //on charge les données dans la page
        function chargeDataTicket(data){ $("#tickBody").html(data); }
        function chargeDataCommand(data){ $("#cmdBody").html(data); }
        function chargeDataUsers(data){ $("#userBody").html(data); }
        function chargeDataUtil(data){ $("#utilBody").html(data); }

    </script>


  </body>
 </html>