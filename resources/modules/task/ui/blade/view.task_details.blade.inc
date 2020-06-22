<?php
include_once MODULES_TASK.'bao/class.taskbao.inc';
include_once MODULES_USER.'bao/class.userbao.inc';
include_once MODULES_USER.'bao/class.rolebao.inc';
include_once MODULES_USER.'bao/class.positionbao.inc';
include_once MODULES_TASK.'bao/class.assignbao.inc';

	$_DB = DBUtil::getInstance();
	$_Log= LogUtil::getInstance();
	$_Task = new Task();
	$_UserBAO = new UserBAO();
	$_TaskBAO = new TaskBAO();
	$_AssignBAO = new AssignBAO();
	$Result;

	if(isset($_GET['taskDetails']))
	{
		$_Task->setID($_GET['taskDetails']);
		$Result = $_TaskBAO->getAllDetails($_Task);
		//print_r($Result);
	}

	if(isset($_GET['progressdown']))
	{
		$taskId = $_GET['progressdown'];

		$_Task->setID($taskId);
		$_Task->setLastDateOfUpdate(date("Y-m-d"));	

		$Result = $_TaskBAO->prograssDown($_Task);
		

		if($Result->getIsSuccess()){
	  		 
	  		 header("Location:task_details.php?taskDetails=$taskId");	
		}
	}

	if(isset($_GET['progressup']))
	{
		$taskId = $_GET['progressup'];

		$_Task->setID($taskId);
		$_Task->setLastDateOfUpdate(date("Y-m-d"));

		$Result = $_TaskBAO->prograssUp($_Task);
				

		if($Result->getIsSuccess()){
	  		 
	  		 header("Location:task_details.php?taskDetails=$taskId");	
		}
	}
?>