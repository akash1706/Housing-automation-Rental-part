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

	$globalUser = $_SESSION["globalUser"];


	$globalUser = $_SESSION["globalUser"];

	$userPositions = $_UserBAO->readUserRolesPositions($globalUser)->getResultObject(); //reading the user 
	$userDetails = $_UserBAO->readUserDetails($globalUser)->getResultObject();
	$ID = $userPositions->getID();
	
	$User = new User();
	$User->setID($ID);

	$my_task = $_TaskBAO->findMyTask($User);




	if(isset($_POST['addTask'])){
		$taskId = time();
		$_Task->setId ($taskId);
		$_Task->setTitle ($_DB->secureInput($_POST['taskName']));
		$_Task->setCategory ($_DB->secureInput($_POST['Category']));
		$_Task->setDetails ($_DB->secureInput($_POST['taskDetails']));
		$_Task->setLastDateOfFinish ($_DB->secureInput($_POST['date']));
		$_Task->setAttachment(0);

		$fileName = null;

		if(isset($_FILES["fileToUpload"]))
		{
			$name = $_FILES["fileToUpload"]["name"];
			$tmp = explode('.', $name);
			$ext = end($tmp);
			
			$fileName = $taskId.".".$ext;

			

			$_Task->setAttachment($fileName);

		}

		$_Task->setAssignDate ($_DB->secureInput(date("Y-m-d")));
		$_Task->setLastDateOfUpdate(date("Y-m-d"));
		
		$userPositions = $_UserBAO->readUserRolesPositions($globalUser)->getResultObject(); 

		$_Task->setTaskCreator($userPositions->getID());	

		$_Task->setProgress(0);	

		

		$Result = $_TaskBAO->addNewTask($_Task);

		//print_r($_FILES['fileToUpload']['name']);		

		if($Result->getIsSuccess()){
	  		// print_r($Result);

			$target_dir = RESOURCES."task_file/";

		    $target_file = $target_dir . $fileName;
		     

		 if(move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file))
		 {
		 	header("Location:create_task.php");
		 }
		 else
		 {
		 	echo "There are some errors occurs during uploading the file";
		 }



	  		 	
		}
			

	}


	if(isset($_POST['updateTask'])){
		$taskId = $_GET['editTask'];
		$_Task->setID ($_GET['editTask']);

		$_Task->setTitle ($_DB->secureInput($_POST['taskName']));
		$_Task->setCategory ($_DB->secureInput($_POST['Category']));
		$_Task->setDetails ($_DB->secureInput($_POST['taskDetails']));
		$_Task->setLastDateOfFinish ($_DB->secureInput($_POST['date']));
		$_Task->setLastDateOfUpdate(date("Y-m-d"));

		$Result = $_TaskBAO->findTask($_Task);

		$Task2 = $Result->getResultObject();

		$_Task->setAttachment($Task2->getAttachment());

		if(isset($_FILES["fileToUpload"]))
		{
			$oldFile = $Task2->getAttachment();
			$name = $_FILES["fileToUpload"]["name"];
			$tmp = explode('.', $name);
			$ext = end($tmp);
			$fileName = $taskId.".".$ext;

			

			$_Task->setAttachment($fileName);

			$target_dir = RESOURCES."task_file/";


			unlink($target_dir.$oldFile);

			
			

		    $target_file = $target_dir . $fileName;
		     

		    move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file);
		 
		 	//header("Location:create_task.php");
		 

		}

		$Result = $_TaskBAO->updateTask($_Task);	

		if($Result->getIsSuccess()){
	  		 
	  		 header("Location:create_task.php");	
		}
			

	}


	if(isset($_GET['editTask']))
	{
		$Task = new Task();
		$Task->setId($_GET['editTask']);

		$Result = $_TaskBAO->findTask($Task);

		$_Task = $Result->getResultObject();

		//print_r($_Task);

	}

	if(isset($_GET['deleteTask']))
	{
		$Task = new Task();

		$Task->setId($_GET['deleteTask']);

		$Result = $_TaskBAO->findTask($Task);

		$Task2 = $Result->getResultObject();

		
		$Result=$_TaskBAO->deleteTask($Task);

		if($Result->getIsSuccess()){

			$target_dir = RESOURCES."task_file/".$Task2->getAttachment();

			unlink($target_dir);
	  		 
	  		 header("Location:create_task.php");	
		}
	}


	if(isset($_POST['Assign']))
	{
		$Assign = new Assign();
		$Assign->setTaskId($_GET['assignTo']);

		$userPositions = $_UserBAO->readUserRolesPositions($globalUser)->getResultObject();
		$Assign->setAssignBy($userPositions->getID());

		$userEmail = $_POST['email'];
		$Assign->setAssignTo($userEmail);
		$Assign->setDate(date("Y-m-d"));
		$Assign->setComment($_POST['comment']);

		$result = $_AssignBAO->assignTask($Assign);

		if($result->getIsSuccess()){
	  		 
	  		 header("Location:create_task.php");	
		}
		else
		{
			//print_r($Assign);
		}

	}

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