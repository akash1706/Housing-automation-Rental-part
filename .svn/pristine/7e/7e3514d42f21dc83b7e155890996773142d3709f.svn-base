<?php

include_once COMMON.'class.common.inc';
include_once UTILITY.'class.util.inc';
include_once COMMON.'class.common.task.inc';
include_once MODULES_TASK.'bao/class.assignbao.inc';
include_once COMMON.'class.common.user.inc';
include_once MODULES_USER.'bao/class.userbao.inc';

	class TaskDAO{
	private $_DB;
	private $_Task;
	



	public function __construct(){

		$this->_DB = DBUtil::getInstance();
		$this->_Task = new Task();
	}


	public function addTask($task){
		$_Task = $task;

		$id = $_Task->getID();
		$title = $_Task->getTitle();
		$details = $_Task->getDetails();
		$lastDateOfFinish = $_Task->getLastDateOfFinish();
		$assignDate = $_Task->getAssignDate();
		$task_creator = $_Task->getTaskCreator();
		$progress = $_Task->getProgress();
		$category = $_Task->getCategory();
		$LastDateOfUpdate = $_Task->getLastDateOfUpdate();
		$attachment = $_Task->getAttachment();

		$SQL = "INSERT INTO `tms_task` (`id`, `task_name`, `task_creator`, `task_category`, `date_of_assign`, `date_of_submission`,`last_date_of_update`, `progress`, `details`,`attachment`) VALUES ('$id', '$title', '$task_creator', '$category', '$assignDate', '$lastDateOfFinish','$LastDateOfUpdate', '$progress', '$details','$attachment')";

		//beginning a transaction 	
		$this->_DB->getConnection()->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);
		//creating task
		$SQL = $this->_DB->doQuery($SQL);





		$this->_DB->getConnection()->commit();



	 	$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($SQL);

		return $Result;
	}




	public function updateTask($Task)
	{

		$_Task = $Task;
		$id = $_Task->getID();
		$title = $_Task->getTitle();
		$details = $_Task->getDetails();
		$lastDateOfFinish = $_Task->getLastDateOfFinish();
		$assignDate = $_Task->getAssignDate();
		$LastDateOfUpdate = $_Task->getLastDateOfUpdate();
		$category = $_Task->getCategory();
		$attachment = $_Task->getAttachment();

		$SQL = "UPDATE `tms_task` SET `details`='$details',`attachment` = '$attachment',`date_of_submission` = '$lastDateOfFinish',`task_category`='$category',`task_name`='$title',`last_date_of_update` = '$LastDateOfUpdate' WHERE `tms_task`.`id` = '$id';";

		//beginning a transaction 	
		$this->_DB->getConnection()->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);
		//creating task
		$SQL = $this->_DB->doQuery($SQL);





		$this->_DB->getConnection()->commit();



	 	$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($SQL);

		return $Result;
	}

	public function findByUser($user)
	{
		$List = array();
		
		$id = $user->getID();

		$AssignBAO = new AssignBAO();

		$all_assginedtask =  $AssignBAO->findAllbyUserId($user)->getResultObject();

		for($i=0; $i<sizeof($all_assginedtask);$i++)
		{
			$taskId = $all_assginedtask[$i]->getTaskId();
			$SQL = "SELECT * FROM `tms_task` WHERE tms_task.id = '$taskId'";
			$SQL = $this->_DB->doQuery($SQL);
			$rows = $this->_DB->getAllRows();

			if(!empty($rows)){
			$row = $rows[0];

			$Task = new Task();

		    $Task->setID ( $row['id']);
		    $Task->setTitle($row['task_name']);
		    $Task->setDetails($row['details']);
		    $Task->setLastDateOfFinish($row['date_of_submission']);
		    $Task->setAssignDate($row['date_of_assign']);
		    $Task->setProgress($row['progress']); 

		    $Task->setAssignBy($all_assginedtask[$i]->getAssignBy());

		    $Task->setLastDateOfUpdate($row['last_date_of_update']);	
		    $Task->setCategory($row['task_category']);


		    //


		     $user = new User();
		    //$user->setID($row['task_creator']);
 			$user->setID($row['task_creator']);
		    $UserBAO = new UserBAO();

		   $creator = $UserBAO->readUser($user)->getResultObject();

		   $creatorName = $creator->getFirstName() . " ". $creator->getMiddleName()." " .$creator->getLastName();


		   $Task->setTaskCreator($creatorName);
		   $Task->setDate($all_assginedtask[$i]->getDate());



		    $List[]=$Task;
		}


		}

		


		//print_r($List);


		$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($List);
		return $Result;

	}


	public function findMyTask($user)
	{
		$List = array();
		
		$id = $user->getID();

		$SQL = "SELECT * FROM `tms_task` WHERE  tms_task.task_creator = '$id'";

		$SQL = $this->_DB->doQuery($SQL);

		$rows = $this->_DB->getAllRows();

		for($i = 0; $i < sizeof($rows); $i++) {
			$row = $rows[$i];
			$Task = new Task();

		    $Task->setID ( $row['id']);
		    $Task->setTitle($row['task_name']);
		    $Task->setDetails($row['details']);
		    $Task->setLastDateOfFinish($row['date_of_submission']);
		    $Task->setAssignDate($row['date_of_assign']);
		    $Task->setProgress($row['progress']); 
		    //$Task->setAssignTo($assign_to);
		    $Task->setLastDateOfUpdate($row['last_date_of_update']);	
		    $Task->setCategory($row['task_category']);	   

		    $List[]=$Task;
   
		}

		//print_r($List);


		$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($List);

		return $Result;

	}


	public function findTask($Task)
	{
		
		$Result = new Result();

		$id = $Task->getID();

		$SQL = "SELECT * FROM `tms_task` WHERE  tms_task.id = '$id'";

		$SQL = $this->_DB->doQuery($SQL);

		$row = $this->_DB->getAllRows();
		//print_r($row);
		$row = $row['0'];

		if(sizeof($row)>0){
			$Task = new Task();

		    $Task->setID ( $row['id']);
		    $Task->setTitle($row['task_name']);
		    $Task->setDetails($row['details']);
		    $Task->setLastDateOfFinish($row['date_of_submission']);
		    $Task->setAssignDate($row['date_of_assign']);
		    //$assign_to = $row['Email']; 
		    $Task->setProgress($row['progress']);
		    //$Task->setAssignBy($row['assign_by']);	
		    $Task->setCategory($row['task_category']);	

		    $Task->setAttachment($row['attachment']);
			//$Result = new Result();
			$Result->setIsSuccess(1);
			$Result->setResultObject($Task);
		}

		return $Result;
		//	print_r($Result);
	}

	public function findMyByDate($User,$date)
	{

		$List = array();
		$Result = new Result();

		$id = $User->getID();


		//$id = $user->getID();

		$AssignBAO = new AssignBAO();

		$all_assginedtask =  $AssignBAO->findAllbyUserId($User)->getResultObject();


		for($i=0; $i<sizeof($all_assginedtask);$i++)
		{
			$taskId = $all_assginedtask[$i]->getTaskId();
			$SQL = "SELECT * FROM `tms_task` WHERE tms_task.id = '$taskId' AND tms_task.date_of_submission='$date';";

			//echo $SQL;

			$SQL = $this->_DB->doQuery($SQL);
			$rows = $this->_DB->getAllRows();

			if($this->_DB->getNumRows()>0)
			{
				//print_r($rows);

				$row = $rows[0];

				$Task = new Task();

			    $Task->setID ( $row['id']);
		    	$Task->setTitle($row['task_name']);
		    	$Task->setDetails($row['details']);
		   		$Task->setLastDateOfFinish($row['date_of_submission']);
		    	$Task->setAssignDate($row['date_of_assign']);
		    	$Task->setProgress($row['progress']); 

		    	$Task->setAssignBy($all_assginedtask[$i]->getAssignBy());

		    	$Task->setLastDateOfUpdate($row['last_date_of_update']);	
		    	$Task->setCategory($row['task_category']);


		     	$user = new User();
		    //$user->setID($row['task_creator']);
 				$user->setID($row['task_creator']);
		    	$UserBAO = new UserBAO();

		   		$creator = $UserBAO->readUser($user)->getResultObject();

		   		$creatorName = $creator->getFirstName() . " ". $creator->getMiddleName()." " .$creator->getLastName();


		   		$Task->setTaskCreator($creatorName);
		   		$Task->setDate($all_assginedtask[$i]->getDate());



		    	$List[]=$Task;
			}
			


			


		}


		$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($List);
		return $Result;

	}

	public function deleteTask($Task)
	{
		$Id = $Task->getID();

		$SQL = "DELETE FROM `tms_task` WHERE `tms_task`.`id` = '$Id'";
		
		$SQL = $this->_DB->doQuery($SQL);		

	 	$Result = new Result();
		$Result->setIsSuccess(1);
		

		return $Result;
	}



	public function prograssDown($Task)
	{
		$_Task = $Task;
		$id = $_Task->getID();
		$updatedDate = $_Task->getLastDateOfUpdate();
		
		$SQL = "UPDATE tms_task SET `progress` = progress-1 ,`last_date_of_update` = '$updatedDate' WHERE tms_task.id='$id';";

		//beginning a transaction 	
		$this->_DB->getConnection()->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);
		$SQL = $this->_DB->doQuery($SQL);
		$this->_DB->getConnection()->commit();
	 	$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($SQL);

		return $Result;
	}


	public function prograssUp($_Task)
	{
		
		$id = $_Task->getID();
		
		$updatedDate = $_Task->getLastDateOfUpdate();
		
		$SQL = "UPDATE tms_task SET tms_task.progress = tms_task.progress+1 ,tms_task.last_date_of_update = '$updatedDate' WHERE tms_task.id='$id';";

		//beginning a transaction 	
		$this->_DB->getConnection()->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);
		$SQL = $this->_DB->doQuery($SQL);
		$this->_DB->getConnection()->commit();
	 	$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($SQL);

		return $Result;
	}

	public function getAllDetails($_Task)
	{
			
			$taskId = $_Task->getID();
			$SQL = "SELECT * FROM `tms_task` WHERE tms_task.id = '$taskId'";
			$Result = new Result();
			//echo $SQL;

			$SQL = $this->_DB->doQuery($SQL);
			$rows = $this->_DB->getAllRows();

			if($this->_DB->getNumRows()>0)
			{
				//print_r($rows);

				$row = $rows[0];

				$Task = new Task();

			    $Task->setID ( $row['id']);
		    	$Task->setTitle($row['task_name']);
		    	$Task->setDetails($row['details']);
		   		$Task->setLastDateOfFinish($row['date_of_submission']);
		    	$Task->setAssignDate($row['date_of_assign']);
		    	$Task->setProgress($row['progress']); 
		    	$Task->setLastDateOfUpdate($row['last_date_of_update']);	
		    	$Task->setCategory($row['task_category']);
		    	$Task->setAttachment($row['attachment']);

		     	$user = new User();
 				$user->setID($row['task_creator']);
		    	$UserBAO = new UserBAO();

		   		$creator = $UserBAO->readUser($user)->getResultObject();

		   		$creatorName = $creator->getFirstName() . " ". $creator->getMiddleName()." " .$creator->getLastName();


		   		$Task->setTaskCreator($creatorName);
		   		//$Task->setDate($all_assginedtask[$i]->getDate());

		    	$List[]=$Task;

		    	$AssignBAO = new AssignBAO();

				$all_assign =  $AssignBAO->findAllAssing($Task)->getResultObject();
				$List[]=$all_assign;
				$Result->setIsSuccess(1);
				$Result->setResultObject($List);
		    }

		    return $Result;



	}


	public function findMyByDateRange($User, $date1,$date2)
	{

		$List = array();
		$Result = new Result();

		
		$AssignBAO = new AssignBAO();

		$all_assginedtask =  $AssignBAO->findAllbyUserId($User)->getResultObject();


		for($i=0; $i<sizeof($all_assginedtask);$i++)
		{
			$taskId = $all_assginedtask[$i]->getTaskId();

			$SQL = "SELECT * FROM `tms_task` WHERE tms_task.id = '$taskId' AND tms_task.date_of_submission BETWEEN '$date1' AND '$date2';";

			//echo $SQL;

			$SQL = $this->_DB->doQuery($SQL);
			$rows = $this->_DB->getAllRows();

			if($this->_DB->getNumRows()>0)
			{
				//print_r($rows);

				$row = $rows[0];

				$Task = new Task();

			    $Task->setID ( $row['id']);
		    	$Task->setTitle($row['task_name']);
		    	$Task->setLastDateOfFinish($row['date_of_submission']);
		    	
		    	
		    	$List[]=$Task;
			}
			


		}


		$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($List);
		return $Result;


	}

	}

?>