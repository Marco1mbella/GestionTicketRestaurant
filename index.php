<?php
	header("Cache-Control: no-store, no-cache, must-revalidate"); // HTTP/1.1 
	header("Cache-Control: post-check=0, pre-check=0", false); 
	header("Cache-Control: private");
	header("Pragma: no-cache");
	header('Content-Type:text/html; Charset=UTF-8');
	error_reporting(E_ERROR | E_PARSE);
	ob_start();

	session_start();
	define("BASEURL", "/foyer/");
	define("MYINDEX", 1);
	define("HOMEINDEX", 1);

	require_once("fonctions.php");  
	require("chargerBD.php");
	include ("entities/classes.php");

	$crtl = "home"; // Page de connexion par défaut
	
	// Par défaut on affiche l'index
	if(isset($_REQUEST['page']) ){
		$ctrl = $_REQUEST['page'];
	}
	
	if(isset($_SESSION["userid"])){
		switch($ctrl){ 	
			
			case '':{
				header("location: home");
				break;
			}

			case 'home':{
				$page_title = 'Accueil';
				include("Views/header.php");
				include("Views/topbar.php");
				include('Views/Home.php');
				include('Views/footer.php');			  
                break;
			}    		

			case 'menu':{
				$page_title = 'Menu';
				include("Views/header.php");
				include("Views/topbar.php");
				include('Views/menu.php');
				include('Views/footer.php');  
				break;
			}

			case 'contact':{
				$page_title = 'Contacts';
				include("Views/header.php");
				include("Views/topbar.php");
				include('Views/contact.php');
				include('Views/footer.php');				
                break;
			}

			case 'client':{
				$page_title = 'Client';				
				include("Views/utilisateurs/Client/header.php");									
				include("Views/utilisateurs/Client/sidebar.php");
				include("Views/utilisateurs/Client/topbar.php");											
				include("Views/utilisateurs/Client/client.php");	
				include("Views/utilisateurs/Client/footer.php");
				break;
			}

			case 'admin':{	
				$page_title = 'Administrateur';		
				include("Views/utilisateurs/Admin/header.php");									
				include("Views/utilisateurs/Admin/sidebar.php");
				include("Views/utilisateurs/Admin/topbar.php");												
				include("Views/utilisateurs/Admin/admin.php");	
				include("Views/utilisateurs/Admin/footer.php");			
				break;
			}
			case 'repondre':{																
				include("Views/utilisateurs/Admin/repondre.php");
										
				break;
			}
			case 'creerTic':{																
				include("Views/utilisateurs/Client/Tickets/creerTic.php");
				header('location: client');					
				break;
			}

			case 'logout':{
				Utilisateur::logout(); 				
				break;
			}

			
			default:{
				header('location: login');
			break;
			}
			
		}
	}else{
		switch($ctrl){ 	
		case 'inscription':{
				$page_title = 'Inscription';
				include("Views/header.php");
				include("Views/topbar.php");
				include('Views/inscription.php');
				include('Views/footer.php');				
                break;
			}
			
			
			case 'login':{
				$page_title = 'Connexion';
				include("Views/header.php");
				include("Views/topbar.php");
				include('Views/login.php');
				include('Views/footer.php');
				break;
			}
			case 'recuperation':{
				$page_title = 'Mot de Passe oublié';
				include("Views/header.php");
				include("Views/topbar.php");
				include('Views/recuperation.php');
				include('Views/footer.php');
				break;
			}	
			case 'inscrire':{				
				Utilisateur::ajouter();
				isset($_COOKIE['email'])?header("location: inscription"):header("location: login");
				break;
			}
			case 'connecter':{				
				Utilisateur::login(); 
				break;
			}
			default:{
				header('location: login');
			break;
			}
		}
	}
	ob_end_flush();
	?>

