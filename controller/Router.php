<?php 

    class Router{

        private $ctrl;
        private $views;

        public function routeReq(){
            try {
                spl_autoload_register(function($class){
                    require_once('entities/'.$class.'php')
                });

                $url='';
                if(isset($_GET['url'])){
                    $url=explode('/',filter_var($_GET['url'],FILTER_SANITZE_URL));
                    
                    $controller=ucfirst(strtolower($url[0]));
                    $controllerClass="Controller".$controller;
                    $controllerFile="controller/".$controllerClass.".php";

                    if(file_exists($controllerFile)){
                        require_once($controllerFile);
                        $this->$ctrl=new $controllerClass($url);
                    }else
                    throw new Exception("Page introuvable");
                    
                }
                else
               { 
                   require_once("controller/ControllerIndex.php");
                   $this->$ctrl=new ControllerIndex($url);
               }

            } catch (Exception $e) {
                
            }
        }
    }
?>