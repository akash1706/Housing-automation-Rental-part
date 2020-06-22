<?php

include_once COMMON.'class.common.inc';
include_once UTILITY.'class.util.inc';
include_once COMMON.'class.common.rent.inc';
include_once MODULES_RENT.'bao/class.setadbao.inc';
//include_once MODULES_USER.'bao/class.rolebao.inc';
//include_once MODULES_USER.'bao/class.disciplinebao.inc';//here comes module dependency


$_setadBAO = new setadBAO();

$_DB = DBUtil::getInstance();
$_Log= LogUtil::getInstance();


/* saving a new user account*/
if(isset($_POST['request']))
{
	 $setad = new setad();	

	 $setad->setownerID($_DB->secureInput($_POST['ownerID'])); 
	 
	 $setad->setadtype($_DB->secureInput($_POST['adtype']));

     $setad->setflatno($_DB->secureInput($_POST['flatno']));
     $setad->setflatsize($_DB->secureInput($_POST['flatsize']));
     $setad->setrooms($_DB->secureInput($_POST['rooms']));
	 $setad->setwashrooms($_DB->secureInput($_POST['washrooms']));
	 $setad->setaddress($_DB->secureInput($_POST['address'])); 
     $setad->setprice($_DB->secureInput($_POST['price']));
      $flatimage = addslashes(file_get_contents($_FILES['file']['tmp_name']));
      $setad->setflatimage($_DB->simpleInput($flatimage));

     $setad->setflatinfo($_DB->secureInput($_POST['flatinfo']));
     $setad->setphoneno($_DB->secureInput($_POST['phoneno']));


   

	$Result = $_setadBAO->newsetadRequest($setad);		

	if($Result->getIsSuccess()){
	   Util::printToast($Result->getResultObject());	
	}


}


/* deleting an existing user */
if(isset($_GET['del']))
{

	//$setad = new setad();	
	//$setad->setownerID($_GET['del']);
	$mama=$_GET['del'];	
	$_setadBAO->deletesetad($mama); //reading the user object from the result object

	header("Location:".PageUtil::$SETAD);
}

/* approving a user */
if(isset($_GET['approve']))
{

	//$setad = new setad();	
	//$setad->setownerID($_GET['approve']);
	$mama=$_GET['approve'];
	//$Result = $_setadBAO->readsetad($mama);	
	$_setadBAO->approve_Reject_setad($mama,'approved'); //reading the user object from the result object

	header("Location:".PageUtil::$SETAD);
}

/* rejecting a user */
if(isset($_GET['reject']))
{

	//$setad = new setad();	
	//$setad->setID($_GET['reject']);	
	$mama=$_GET['reject'];
	//$Result = $_setadBAO->readsetad($mama);	
	$_setadBAO->approve_Reject_setad($mama,'rejected'); 
	//reading the user object from the result object

	header("Location:".PageUtil::$SETAD);
}

/* rejecting a user */
if(isset($_GET['edit']))
{

	//$setad = new setad();	
	//$setad->setID($_GET['reject']);	
	$mama=$_GET['edit'];
	echo($mama);
	//$Result = $_setadBAO->readsetad($mama);	
	$_setadBAO->readsetad($mama); 
	//reading the user object from the result object

	//header("Location:".PageUtil::$SETAD);
}



/*updating an existing user information*/
if(isset($_POST['update']))
{
	$setad = new setad();	

    
   $setad->setownerID($_DB->secureInput($_POST['ownerID'])); 
	 
	 $setad->setadtype($_DB->secureInput($_POST['adtype']));

     $setad->setflatno($_DB->secureInput($_POST['flatno']));
     $setad->setflatsize($_DB->secureInput($_POST['flatsize']));
     $setad->setrooms($_DB->secureInput($_POST['rooms']));
	 $setad->setwashrooms($_DB->secureInput($_POST['washrooms']));
	 $setad->setaddress($_DB->secureInput($_POST['address'])); 
     $setad->setprice($_DB->secureInput($_POST['price']));
       $flatimage = addslashes(file_get_contents($_FILES['file']['tmp_name']));
       $setad->setflatimage($_DB->simpleInput($flatimage));

     $setad->setflatinfo($_DB->secureInput($_POST['flatinfo']));
     $setad->setphoneno($_DB->secureInput($_POST['phoneno']));

	$_setadBAO->updatesetad($setad);

	header("Location:".PageUtil::$SETAD);
}

//$_Log->log(LogUtil::$DEBUG,"exit blade.user_new.inc");

?>