<?php
include_once MODULES_TASK.'bao/class.taskbao.inc';
include_once MODULES_USER.'bao/class.userbao.inc';
include_once MODULES_USER.'bao/class.rolebao.inc';
include_once MODULES_USER.'bao/class.positionbao.inc';

	$_DB = DBUtil::getInstance();
	$_Log= LogUtil::getInstance();
	$_Task = new Task();
	$_UserBAO = new UserBAO();
	$_TaskBAO = new TaskBAO();

	$globalUser = $_SESSION["globalUser"];


	if(isset($_POST['addTask'])){
		$_Task->setId (null);
		$_Task->setTitle ($_DB->secureInput($_POST['taskName']));
		$_Task->setCategory ($_DB->secureInput($_POST['Category']));
		$_Task->setDetails ($_DB->secureInput($_POST['taskDetails']));
		$_Task->setLastDateOfFinish ($_DB->secureInput($_POST['date']));



		$_Task->setAssignDate ($_DB->secureInput(date("Y-m-d")));

		//print_r( $globalUser);
		$userPositions = $_UserBAO->readUserRolesPositions($globalUser)->getResultObject(); //reading the user 
		$userDetails = $_UserBAO->readUserDetails($globalUser)->getResultObject();


		if(isset($_POST['assingTo'])){

		}
		else{
			$_Task->setAssignTo($userPositions->getUniversityID());
		}	

		$_Task->setAssignBy($userPositions->getUniversityID());	

		

		$Result = $_TaskBAO->addNewTask($_Task);		

		if($Result->getIsSuccess()){
	  		 
	  		 header("Location:assign_my_task.php");	
		}
			

	}

?>