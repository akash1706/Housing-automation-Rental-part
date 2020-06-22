<?php

include_once COMMON.'class.common.inc';
include_once UTILITY.'class.util.inc';
include_once COMMON.'class.common.task.inc';
include_once COMMON.'class.common.user.inc';
include_once MODULES_USER.'dao/class.userdao.inc';

	class AssignDAO{

	private $_DB;
	private $_Assign;

	public function __construct(){

		$this->_DB = DBUtil::getInstance();
		$_Assign = new Assign();
	}


	public function assignTask($assign)
	{
		$taskId=$assign->getTaskId();
		$assignTo = $assign->getAssignTo();
		$assignBy = $assign->getAssignBy();
		$date = $assign->getDate();
		$comment = $assign->getComment();

		//print_r($assign);
		$sql1 = "UPDATE tms_assign SET tms_assign.status=0 WHERE tms_assign.id='$taskId'";

		$SQL = "INSERT INTO `tms_assign` (`id`, `assign_to`, `assign_by`, `assing_date`, `comment`) VALUES ('$taskId', '$assignTo', '$assignBy', '$date', '$comment');";


		$this->_DB->getConnection()->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);
		$SQL1 = $this->_DB->doQuery($sql1);
		$SQL = $this->_DB->doQuery($SQL);

		$this->_DB->getConnection()->commit();

	 	$Result = new Result();
		$Result->setIsSuccess(1);	

		return $Result;
	}

	public function findAllbyUserId($User)
	{
		$id = $User->getID();
		$assignList = array();

		$this->_DB->doQuery("SELECT * FROM `tms_assign` WHERE tms_assign.assign_to='$id' AND tms_assign.status = 1");

		$rows = $this->_DB->getAllRows();

		for($i = 0; $i < sizeof($rows); $i++) {
			$row = $rows[$i];
			$this->_Assign = new Assign();

		    $this->_Assign->setTaskId ( $row['id']);

		    $user = new User();
		    $user->setID($row['assign_by']);
		    $UserBAO = new UserDAO();

		   $assign = $UserBAO->readUser($user)->getResultObject();

		   $assignby = $assign->getFirstName() . " ". $assign->getMiddleName()." " .$assign->getLastName();
		    //$this->_Assign->setAssignTo( $row['assign_to'] );



		    $this->_Assign->setAssignBy( $assignby );
		    $this->_Assign->setDate( $row['assing_date'] ); 
		    $this->_Assign->setComment( $row['comment'] ); 
		    $assignList[]=$this->_Assign;
   
		}


		$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($assignList);

		return $Result;
	}


	public function findTaskUserId($id,$taksId)
	{
		$assignList = array();
		$Result = new Result();

		$this->_DB->doQuery("SELECT * FROM `tms_assign` WHERE tms_assign.assign_to='$id' AND tms_assign.status = 1 AND tms_assign.id = '$taksId' ");

		$row = $this->_DB->getTopRow();

		if(isset($row)){
			$this->_Assign = new Assign();

		    $this->_Assign->setTaskId ( $row['id']);

		    $user = new User();
		    $user->setID($row['assign_by']);
		    $UserBAO = new UserDAO();

		   $assign = $UserBAO->readUser($user)->getResultObject();

		   $assignby = $assign->getFirstName() . " ". $assign->getMiddleName()." " .$assign->getLastName();
		    //$this->_Assign->setAssignTo( $row['assign_to'] );



		    $this->_Assign->setAssignBy( $assignby );
		    $this->_Assign->setDate( $row['assing_date'] ); 
		    $this->_Assign->setComment( $row['comment'] ); 
		    $assignList[]=$this->_Assign;
		    $Result->setIsSuccess(1);
			$Result->setResultObject($assignList);

   
		}


		
		
		return $Result;
	}



	public function findAllAssing($Task)
	{

		$assignList = array();
		$Result = new Result();

		$taskId = $Task->getID();

		$this->_DB->doQuery("SELECT * FROM `tms_assign` WHERE tms_assign.id = '$taskId' ");

		$rows = $this->_DB->getAllRows();

		for($i=0; $i<sizeof($rows); $i++)
		{
			$row = $rows[$i];
			$this->_Assign = new Assign();

		    $this->_Assign->setTaskId ( $row['id']);

		    $user = new User();
		    $user->setID($row['assign_by']);
		    $UserBAO = new UserDAO();

		   $assign = $UserBAO->readUser($user)->getResultObject();

		   $assignby = $assign->getFirstName() . " ". $assign->getMiddleName()." " .$assign->getLastName();
		    //$this->_Assign->setAssignTo( $row['assign_to'] );



		    $this->_Assign->setAssignBy( $assignby );

		    $user->setID($row['assign_to']);
		    $UserBAO = new UserDAO();

		   $assign = $UserBAO->readUser($user)->getResultObject();

		   $assignto = $assign->getFirstName() . " ". $assign->getMiddleName()." " .$assign->getLastName();

		   $this->_Assign->setAssignTo( $assignto );

		    $this->_Assign->setDate( $row['assing_date'] ); 
		    $this->_Assign->setComment( $row['comment'] ); 
		    $assignList[]=$this->_Assign;
		    
			  
		}


		$Result->setIsSuccess(1);
		$Result->setResultObject($assignList); 
		return $Result;

	}


	
	}

?>