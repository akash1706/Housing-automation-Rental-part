<?php
include_once UTILITY.'class.util.inc';
include_once MODULES_TASK.'bao/class.categorybao.inc';
include_once COMMON.'class.common.inc';

	$_CategoryBAO = new CategoryBAO();
	$_DB = DBUtil::getInstance();
	$_Log= LogUtil::getInstance();
	$_Task = new Task();
	//$_UserBAO = new UserBAO();
	//$_TaskBAO = new TaskBAO();
	$_Task_Category = new Task_Category();

	$globalUser = $_SESSION["globalUser"];

	
	if(isset($_POST['save']))
	{
		$_Task_Category->setID(null);
		
		$_Task_Category->setCategory($_DB->secureInput($_POST['categoryName']));
		$Result = $_CategoryBAO->addCategory($_Task_Category);

		if($Result->getIsSuccess()){
	  		 
	  		 header("Location:manage_category.php");	
		}
	}

	if(isset($_GET['del']))
	{
		$Task_Category = new Task_Category();	
		$Task_Category->setID($_GET['del']);

		$Result = $_CategoryBAO->deleteCategory($Task_Category);
		if($Result->getIsSuccess()){
	  		 
	  		 header("Location:manage_category.php");	
		}

	}

	 if(isset($_GET['edit']))
	{
		$Task_Category = new Task_Category();
		$Task_Category->setID($_GET['edit']);
		$Task_Category->setCategory($_GET['name']);	
		
	}


	if(isset($_POST['update']))
	{
		$Task_Category = new Task_Category();	

    	$Task_Category->setID ($_GET['edit']);
    	$Task_Category->setCategory( $_POST['categoryName'] );
	
		$_CategoryBAO->updateCategory($Task_Category);

		header("Location:manage_category.php");
	}



?>