<?php


function checkPrivilege($p){
    global $BD;
    if($_SESSION['userid']==0){
        return true;
    }
    $sql = $BD->prepare("SELECT * FROM utilisateur WHERE id = ?" );
    $sql->execute(array($_SESSION['userid'], $p));
    $etat = $sql->fetch();
    if($sql->rowCount()>0) return true;
    else return false;
}


    function compte($page){
        if (!isset($_SESSION)) session_start();

        if (!isset($_SESSION["ip"])){
            $_SESSION["ip"] = $_SERVER['REMOTE_ADDR'];
            global $BD;
            $req = $BD->prepare("INSERT INTO visites (ip) VALUES (?)");
            $req->execute(array($_SESSION["ip"])) or die('Erreur : ' . $req->errorInfo()[2]);
        }

        if (!isset($_SESSION["page"][$page])){
            $_SESSION["page"][$page] = $page;
            global $BD;
            $req = $BD->prepare("UPDATE compteur SET visites = visites + 1 WHERE id = ?");
            $req->execute(array($page)) or die('Erreur : ' . $req->errorInfo()[2]);
        }
    }

  function cmp($a, $b) {
      if ($a == $b) {
          return 0;
      }
      return ($a < $b) ? -1 : 1;
  }
  function cmppers($a, $b) {
    if ($a->ORDRE == $b->ORDRE) {
        return 0;
    }
    return ($a->ORDRE < $b->ORDRE) ? -1 : 1;
  }
  function getToken($length){
     $token = "";
     $codeAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
     $codeAlphabet .= "abcdefghijklmnopqrstuvwxyz";
     $codeAlphabet .= "0123456789";
     $codeAlphabet .= "_";
     $max = strlen($codeAlphabet); // edited

    for ($i=0; $i < $length; $i++) {
        $token .= $codeAlphabet[rand(0, $max-1)];
    }

    return $token;
}
function pickerDateTimeToMysql($str){
    return date('Y-m-d H:i:s', strtotime(str_replace("/", "-", $str)));
  }
  function pickerDateToMysql($str){
    return date('Y-m-d', strtotime(str_replace("/", "-", $str)));
  }
function has_prefix($string, $prefix) {
   return ((substr($string, 0, strlen($prefix)) == $prefix) ? true : false);
}
function getInbetweenStrings($start, $end, $str){
    $matches = array();
    $regex = "/$start([a-zA-Z0-9_]*)$end/";
    preg_match_all($regex, $str, $matches);
    return $matches[1];
}
function send_notification($msg, $registrationIds){
    define( 'API_ACCESS_KEY', 'AIzaSyB9e-i5X7kKzmMp1Y0sxVET16sLavN6KxY');

    $fields = array(
    'registration_ids'  => $registrationIds,
    'data'      => $msg
    );

    $headers = array(
    'Authorization: key=' . API_ACCESS_KEY,
    'Content-Type: application/json'
    );

    $ch = curl_init();
    curl_setopt( $ch,CURLOPT_URL, 'https://android.googleapis.com/gcm/send' );
    curl_setopt( $ch,CURLOPT_POST, true );
    curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
    curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
    curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
    curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
    $result = curl_exec($ch );
    curl_close( $ch );
  return $result;
  }
function getTokenLight($length){
     $token = "";
     $codeAlphabet .= "abcdefghijklmnopqrstuvwxyz";
     $codeAlphabet .= "0123456789";
     $max = strlen($codeAlphabet); // edited

    for ($i=0; $i < $length; $i++) {
        $token .= $codeAlphabet[rand(0, $max-1)];
    }

    return $token;
}
function getYoutubeIdFromUrl($url) {
    $parts = parse_url($url);
    if(isset($parts['query'])){
        parse_str($parts['query'], $qs);
        if(isset($qs['v'])){
            return $qs['v'];
        }else if(isset($qs['vi'])){
            return $qs['vi'];
        }
    }
    if(isset($parts['path'])){
        $path = explode('/', trim($parts['path'], '/'));
        return $path[count($path)-1];
    }
    return false;
}
  function getYouTubeVideoDuration($videoID){
     $apikey = "AIzaSyBY2sC1MQDEVAKrGzaKB41x7BsAmuY_hV4"; // Like this AIcvSyBsLA8znZn-i-aPLWFrsPOlWMkEyVaXAcv
     $dur = file_get_contents("https://www.googleapis.com/youtube/v3/videos?part=contentDetails&id=$videoID&key=$apikey");
     $VidDuration =json_decode($dur, true);
     foreach ($VidDuration['items'] as $vidTime)
     {
         $VidDuration= $vidTime['contentDetails']['duration'];
     }
     preg_match_all('/(\d+)/',$VidDuration,$parts);
     if(count($parts[0])==1)
      return $parts[0][0];
     else if(count($parts[0])==2)
      return $parts[0][0].":".$parts[0][1];
     else
      return $parts[0][0].":".$parts[0][1].":".$parts[0][2]; // Return 1:11:46 (i.e) HH:MM:SS
  }
  function getDayOfWeek($date){
      $days = array('Dimanche', 'Lundi', 'Mardi', 'Mercredi','Jeudi','Vendredi', 'Samedi');
      echo $days[date('w', strtotime($date))];
  }
  function getrealip(){
     if (isset($_SERVER)){
    if(isset($_SERVER["HTTP_X_FORWARDED_FOR"])){
    $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
    if(strpos($ip,",")){
    $exp_ip = explode(",",$ip);
    $ip = $exp_ip[0];
    }
    }else if(isset($_SERVER["HTTP_CLIENT_IP"])){
    $ip = $_SERVER["HTTP_CLIENT_IP"];
    }else{
    $ip = $_SERVER["REMOTE_ADDR"];
    }
    }else{
    if(getenv('HTTP_X_FORWARDED_FOR')){
    $ip = getenv('HTTP_X_FORWARDED_FOR');
    if(strpos($ip,",")){
    $exp_ip=explode(",",$ip);
    $ip = $exp_ip[0];
    }
    }else if(getenv('HTTP_CLIENT_IP')){
    $ip = getenv('HTTP_CLIENT_IP');
    }else {
    $ip = getenv('REMOTE_ADDR');
    }
    }
    return $ip; 
  }


function MakeUrls($str){
    $find=array('`((?:https?|ftp)://\S+[[:alnum:]]/?)`si','`((?<!//)(www\.\S+[[:alnum:]]/?))`si');
    $replace=array('<a href="$1" target="_blank">$1</a>', '<a href="http://$1" target="_blank">$1</a>');
    return preg_replace($find,$replace,$str);
}

	function size($taille,$dim){if(str_word_count($taille)>$dim){$ref='...';}else{$ref='';}return $ref;}
	function pp($char,$size){return substr($char,0,$size).size($char,$size);}
	function s($tr){return str_replace("\'","'",htmlspecialchars($tr));}
	function sa($tr){return str_replace("'","\'",htmlspecialchars($tr));}
	function a($mot){return Addslashes($mot);}
	function i($chiff){return intval($chiff);}
	function r($a,$b,$char){return s(str_replace($a,$b,$char));}
  

  function removehtmlTags($string){
    return s($string);
  }
  
  function format_date($date){
    $utc = new DateTime($date, new DateTimeZone('UTC'));
    $utc->setTimezone(new DateTimeZone('Africa/Douala'));
    return $utc->format('d-m-Y à H:i:s');}
  function format_dateToTime($date){
    $utc = new DateTime($date, new DateTimeZone('UTC'));
    $utc->setTimezone(new DateTimeZone('Africa/Douala'));
    return $utc->format('H:i');}
  function customformat_date($date){
    $utc = new DateTime($date, new DateTimeZone('UTC'));
    $utc->setTimezone(new DateTimeZone('Africa/Douala'));
    return $utc->format('d-F-Y à H:i:s');}
  function format_dateDate($date){
    $utc = new DateTime($date, new DateTimeZone('UTC'));
    $utc->setTimezone(new DateTimeZone('Africa/Douala'));
    return $utc->format('d/m/Y');}
	function getConvertFileSize($path){
    $bytes = sprintf('%u', filesize($path));

    if ($bytes > 0)
    {
        $unit = intval(log($bytes, 1024));
        $units = array('B', 'KB', 'MB', 'GB');

        if (array_key_exists($unit, $units) === true)
        {
            return sprintf('%d %s', $bytes / pow(1024, $unit), $units[$unit]);
        }
    }

    return $bytes;
}
function getTagExpression( $str) {
    preg_match('/#(.*?)Z/', $str, $matches);
    return $matches;
}
function getTagValues($tag, $str) {
    $re = sprintf("/\{(%s)\}(.+?)\{\/\\1\}/", preg_quote($tag));
    preg_match_all($re, $str, $matches);
    return $matches[2];
}
function getRelativeTime($date) { //Mon incroyable Fonction de Date
   // Déduction de la date donnée à la date actuelle

  $utc = new DateTime($date, new DateTimeZone('Africa/Douala'));
  $utc->setTimezone(new DateTimeZone('Africa/Douala'));
  $date = $utc->format('Y-m-d H:i:s');
  
  $diff = time() - strtotime($date);
  if($diff == 0) {
      return 'maintenant';
  } elseif($diff > 0) {
      $day_diff = floor($diff / 86400);
      if($day_diff == 0) {
          if($diff < 60) return 'il y\'a un instant';
          if($diff < 120) return 'il y\'a une minute';
          if($diff < 3600) return 'il y\'a '.floor($diff / 60) . ' minutes';
          if($diff < 7200) return 'il y\'a une heure';
          if($diff < 86400) return 'il y\'a '.floor($diff / 3600) . ' heures';
      }
      if($day_diff == 1) { return 'Hier'; }
      if($day_diff < 7) { return 'il y\'a '.$day_diff . ' jours'; }
      if($day_diff < 31) { return 'il y\'a '.ceil($day_diff / 7) . ' semaines'; }
      if($day_diff < 60) { return 'le mois passé'; }
      return date('F Y', $ts);
  } else {
      $diff = abs($diff);
      $day_diff = floor($diff / 86400);
      if($day_diff == 0) {
          if($diff < 120) { return 'dans une minute'; }
          if($diff < 3600) { return 'dans ' . floor($diff / 60) . ' minutes'; }
          if($diff < 7200) { return 'dans une heure'; }
          if($diff < 86400) { return 'dans ' . floor($diff / 3600) . ' heures'; }
      }
      if($day_diff == 1) { return 'Demain'; }
      if($day_diff < 4) { return date('l', $ts); }
      if($day_diff < 7 + (7 - date('w'))) { return 'La semaine prochaine'; }
      if(ceil($day_diff / 7) < 4) { return 'dans ' . ceil($day_diff / 7) . ' semaines'; }
      if(date('n', $ts) == date('n') + 1) { return 'le mois prochain'; }
      return date('F Y', $ts);
  }

}

function formatDateAgo($value){
    $time = strtotime($value);
    $d = new \DateTime($value);

    $weekDays = ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'];
    $months = ['Janvier', 'Février', 'Mars', 'Avril',' Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Décembre'];

    if ($time > strtotime('-2 minutes'))
    {
        return 'Il y a quelques secondes';
    }
    elseif ($time > strtotime('-30 minutes'))
    {
        return 'Il y a ' . floor((strtotime('now') - $time)/60) . ' min';
    }
    elseif ($time > strtotime('today'))
    {
        return $d->format('G:i');
    }
    elseif ($time > strtotime('yesterday'))
    {
        return 'Hier, ' . $d->format('G:i');
    }
    elseif ($time > strtotime('this week'))
    {
        return $weekDays[$d->format('N') - 1] . ', ' . $d->format('G:i');
    }
    else
    {
        return $d->format('j') . ' ' . $months[$d->format('n') - 1] . ', ' . $d->format('G:i');
    }
}


function getRelativeDayes($date) { //Mon incroyable Fonction de Date
   // Déduction de la date donnée à la date actuelle

  $utc = new DateTime($date, new DateTimeZone('Africa/Douala'));
  $utc->setTimezone(new DateTimeZone('Africa/Douala'));
  $date = $utc->format('Y-m-d H:i:s');
  
  $diff = time() - strtotime($date);
  if($diff == 0) {
      return 'maintenant';
  } elseif($diff > 0) {
      $day_diff = floor($diff / 86400);
      if($day_diff == 0) {
          if($diff < 60) return 'il y\'a un instant';
          if($diff < 120) return 'il y\'a une minute';
          if($diff < 3600) return 'il y\'a '.floor($diff / 60) . ' minutes';
          if($diff < 7200) return 'il y\'a une heure';
          if($diff < 86400) return 'il y\'a '.floor($diff / 3600) . ' heures';
      }
      if($day_diff == 1) { return 'Hier'; }
      if($day_diff < 7) { return 'il y\'a '.$day_diff . ' jours'; }
      if($day_diff < 31) { return 'il y\'a '.ceil($day_diff / 7) . ' semaines'; }
      if($day_diff < 60) { return 'le mois passé'; }
      return date('F Y', strtotime($date));
  } else {
      $diff = abs($diff);
      $day_diff = floor($diff / 86400);
      if($day_diff == 0) {
          if($diff < 120) { return 'dans une minute'; }
          if($diff < 3600) { return 'dans ' . floor($diff / 60) . ' minutes'; }
          if($diff < 7200) { return 'dans une heure'; }
          if($diff < 86400) { return 'dans ' . floor($diff / 3600) . ' heures'; }
      }
      if($day_diff == 1) { return 'Demain'; }
      if($day_diff < 4) { return date('l', $ts); }
      if($day_diff < 7 + (7 - date('w'))) { return 'La semaine prochaine'; }
      if(ceil($day_diff / 7) < 4) { return 'dans ' . ceil($day_diff / 7) . ' semaines'; }
      if(date('n', $ts) == date('n') + 1) { return 'le mois prochain'; }
      return date('F Y', strtotime($date));
  }

}

  function format_date3($date){

    $date=explode('-',(explode(' ', $date)[0]));
    $annee=$date[0]; $jour=$date[2]; $mois=$date[1];
    $listemois= array('','Jan','Fev','Mars','Avr','Mai','Juin','Juil','Août','Sept','Oct','Nov','Dec');
    $newmois=$listemois[($mois+0)];
    return $jour." ".$newmois." ".$annee;

  }

  function format_dateHour($date1){

    $date=explode('-',(explode(' ', $date1)[0]));
    $heure=explode(' ', $date1)[1];
    $annee=$date[0]; $jour=$date[2]; $mois=$date[1];
    $listemois= array('','Jan','Fev','Mars','Avr','Mai','Juin','Juil','Août','Sept','Oct','Nov','Dec');
    $newmois=$listemois[($mois+0)];
    return $jour." ".$newmois." ".$annee." à ".$heure;

  }
  
	function getJourSemaine($i){
		switch ($i) {
			case '1':
				return 'Lundi';
				break;
			case '2':
				return 'Mardi';
				break;
			case '3':
				return 'Mercredi';
				break;
			case '4':
				return 'Jeudi';
				break;
			case '5':
				return 'Vendredi';
				break;
			case '6':
				return 'Samedi';
				break;
			case '7':
				return 'Dimanche';
				break;
			
			default:
				return '';
				break;
		}
	}

	function getBaseUrl(){
		$base_dir = __DIR__;

		// server protocol
		$protocol = empty($_SERVER['HTTPS']) ? 'http' : 'https';

		// domain name
		$domain = $_SERVER['SERVER_NAME'];

		// server port
		$port = $_SERVER['SERVER_PORT'];
		$disp_port = ($protocol == 'http' && $port == 80 || $protocol == 'https' && $port == 443) ? '' : ":$port";

		// put em all together to get the complete base URL
		$url = "${protocol}://${domain}${disp_port}".BASEURL;

		return $url;
	}

	function minimumQuatreChiffre($number){
		if(strlen($number)==1){
			return "000".$number;
		}
		else if(strlen($number)==2){
			return "00".$number;
		}
		else if(strlen($number)==3){
			return "0".$number;
		}
		else if(strlen($number)>3){
			return "".$number;
		}
		else {
			return "".$number;
		}
	}
  function slugify($text){
    // replace non letter or digits by -
    $text = preg_replace('~[^\pL\d]+~u', '-', $text);

    // transliterate
    $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);

    // remove unwanted characters
    $text = preg_replace('~[^-\w]+~', '', $text);

    // trim
    $text = trim($text, '-');

    // remove duplicate -
    $text = preg_replace('~-+~', '-', $text);

    // lowercase
    $text = strtolower($text);

    if (empty($text)) {
      return 'n-a';
    }

    return $text;
  }

	function format_money($number){
		$n = $number;
		/*if($_SESSION['lang']=='fr')
			$n = number_format($number, 0, ',', ' ');
		else
			$n = number_format($number);*/
	 	$n = number_format($number, 0);
    	return str_replace(",", " ", $n)." FCFA";
	}
	class Template {
	    protected $file;
	    protected $values = array();
	  
	    public function __construct($file) {
	        $this->file = $file;
	    }
	    public function set($key, $value) {
		    $this->values[$key] = $value;
		}
		  
		public function output() {
		    if (!file_exists($this->file)) {
		        return "Error loading template file ($this->file).";
		    }
		    $output = file_get_contents($this->file);
		  
		    foreach ($this->values as $key => $value) {
		        $tagToReplace = "[@$key]";
		        $output = str_replace($tagToReplace, $value, $output);
		    }
		  
		    return $output;
		}
	}

?>