<?php

include_once COMMON.'class.common.inc';
include_once UTILITY.'class.util.inc';
include_once COMMON.'class.common.rent.inc';
include_once MODULES_RENT.'bao/class.seepaymentbao.inc';

//include_once MODULES_USER.'bao/class.rolebao.inc';
//include_once MODULES_USER.'bao/class.disciplinebao.inc';//here comes module dependency


$_seepaymentBAO = new seepaymentBAO();

$_DB = DBUtil::getInstance();
$_Log= LogUtil::getInstance();



/* deleting an existing user */
if(isset($_GET['del']))
{

	//$setad = new setad();	
	//$setad->setownerID($_GET['del']);
	$sl=$_GET['del'];	
	$_seepaymentBAO->deleteseepayment($sl); //reading the user object from the result object

	header("Location:".PageUtil::$SEEPAYMENT);
}

/* approving a user */
if(isset($_GET['approve']))
{
   
	//$setad = new setad();	
	//$setad->setownerID($_GET['approve']);
	$sl=$_GET['approve'];
	//$Result = $_setadBAO->readsetad($mama);	
	$_seepaymentBAO->approve_Reject_seepayment($sl,'approved'); //reading the user object from the result object

	header("Location:".PageUtil::$SEEPAYMENT);
}

/* rejecting a user */
if(isset($_GET['reject']))
{

	//$setad = new setad();	
	//$setad->setID($_GET['reject']);	
	$sl=$_GET['reject'];
	//$Result = $_setadBAO->readsetad($sl);	
	$_seepaymentBAO->approve_Reject_seepayment($sl,'rejected'); 
	//reading the user object from the result object

	header("Location:".PageUtil::$SEEPAYMENT);
}

if(isset($_GET['submit']))
{

	//$setad = new setad();	
	//$setad->setID($_GET['search']);	
	//$month=$_GET['month'];
	//$email=$_GET['email'];
	//$Result = $_setadBAO->readsetad($month);	
	//$_seepaymentBAO->searchseepayment($email,$month); 
	//reading the user object from the result object

	header("Location:".PageUtil::$SEEPAYMENT);
}



?>