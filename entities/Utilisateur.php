<?php
    
    Class Utilisateur extends Model{
        private $tableName='utilisateur';
        private $id;

        public function __Construct(){

        }

        //fonction pour se connecter
        public static function login()
        {
            global $BD;   
          if(isset($_REQUEST["email"]) && isset($_REQUEST["pass"])){
           
                $res = $BD->prepare("SELECT * FROM utilisateur WHERE email=? AND pass=?");
                $res->execute(array($_REQUEST["email"],sha1($_REQUEST['pass'])));
                //var_dump($res);
                if ($res->rowCount() ==0) {
                    $_SESSION["login_error"] = "Email ou mot de passe incorrect ";
                    header('Location: login');
                    //echo "je suis une erreur";
                }
                else{
                        $list = $res->fetch();
                        $_SESSION["userid"] = $list["id"];
                        $id=$list["id"];
                        $_SESSION["email"] = $list["email"];
                        $_SESSION["droits"]=$list["droits"];
                        
                      
                        if($_SESSION["droits"]=="administrateur"){                                                                
                            header('Location: admin');
                          
                        }else if($_SESSION["droits"]=="client"){
                            // echo "je suis client";
                             header('location: client');
                        }else{
                        //echo "je vais a l'accueil";
                        header('location: login');
                        }
                      
                }
            }              
        }

        //fonction pour se deconnecter
        public static function logout()
        {
            session_destroy();
            header("location: login");
        }

        public static function getId() {
            return $id;
        }



         public static function ajouter(){
                   global $BD;
                
            $id = $BD->lastInsertId();
            $email=$_REQUEST['email'];
            $pass=sha1($_REQUEST['pass']);
            $droit='client';//etat par defaut client
            $req=$BD->prepare("INSERT INTO `utilisateur` (id,email,pass,droits) VALUES (?,?,?,?)");


            $verf=$BD->prepare("SELECT email From utilisateur where email=?");
            $verf->execute(array($email)); 
            $result=$verf->fetch();
            if($result!=NULL){                
                setcookie('email',$email, time()+3600,null,null,false,true);
            }
            else{
            $req->execute(array($id,$email,$pass,$droit)); 
            }           
    
        }
        


    }
?>