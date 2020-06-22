<?php
include_once MODULES_TASK.'bao/class.taskbao.inc';
include_once MODULES_USER.'bao/class.userbao.inc';
include_once MODULES_USER.'bao/class.rolebao.inc';
include_once MODULES_USER.'bao/class.positionbao.inc';
include_once UTILITY.'class.util.inc';

	$_DB = DBUtil::getInstance();
	$_Log= LogUtil::getInstance();
	$_Task = new Task();
	$_UserBAO = new UserBAO();
	$_TaskBAO = new TaskBAO();

	$globalUser = $_SESSION["globalUser"];

	$userPositions = $_UserBAO->readUserRolesPositions($globalUser)->getResultObject(); //reading the user 
	$userDetails = $_UserBAO->readUserDetails($globalUser)->getResultObject();
	$ID = $userPositions->getID();
	$User = new User();
	$User->setID($ID);

	$my_task = $_TaskBAO->findByUser($User);
	//print_r ($my_task->getResultObject()[0]->getAssignBy());

	if(isset($_GET['progressdown']))
	{
		$taskId = $_GET['progressdown'];

		$_Task->setID($taskId);
		$_Task->setLastDateOfUpdate(date("Y-m-d"));	

		$Result = $_TaskBAO->prograssDown($_Task);
		

		if($Result->getIsSuccess()){
	  		 
	  		 header("Location:create_task.php");	
		}
	}

	if(isset($_GET['progressup']))
	{
		$taskId = $_GET['progressup'];

		$_Task->setID($taskId);
		$_Task->setLastDateOfUpdate(date("Y-m-d"));

		$Result = $_TaskBAO->prograssUp($_Task);
				

		if($Result->getIsSuccess()){
	  		 
	  		 header("Location:create_task.php");	
		}
	}

?>