<?php

include_once COMMON.'class.common.inc';
include_once UTILITY.'class.util.inc';
include_once COMMON.'class.common.rent.inc';
include_once MODULES_RENT.'bao/class.givepaymentbao.inc';

//include_once MODULES_USER.'bao/class.rolebao.inc';
//include_once MODULES_USER.'bao/class.disciplinebao.inc';//here comes module dependency


$_givepaymentBAO = new givepaymentBAO();

$_DB = DBUtil::getInstance();
$_Log= LogUtil::getInstance();


/* saving a new user account*/
if(isset($_POST['request']))
{
	 $givepayment = new management();	

      $months= $_POST['month'];
if(empty($months)) 
    {
        echo("jhhjhhj\n");
    } 
    else 
    {
       foreach ($months as $month) {
          
	    $givepayment->setownerEmail($_DB->secureInput($_POST['ownerEmail'])); 
	    $givepayment->setflatno($_DB->secureInput($_POST['flatno']));
        $givepayment->setrenterEmail($_DB->secureInput($_POST['renterEmail']));
        $givepayment->setdate($_DB->secureInput($_POST['date']));
	    $givepayment->setmonth($_DB->secureInput($month));
	    $givepayment->sethouse($_DB->secureInput($_POST['house']));	
	    $givepayment->setpayment($_DB->secureInput($_POST['payment'])); 
        $Result = $_givepaymentBAO->newgivepaymentRequest($givepayment);
   
        }
        		

	  if($Result->getIsSuccess()){
	   Util::printToast($Result->getResultObject());
	    }	
	}


       
     


	

}


//$_Log->log(LogUtil::$DEBUG,"exit blade.user_new.inc");

?>