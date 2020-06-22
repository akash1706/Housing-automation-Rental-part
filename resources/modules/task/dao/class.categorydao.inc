<?php

include_once COMMON.'class.common.inc';
include_once UTILITY.'class.util.inc';
include_once COMMON.'class.common.task.inc';

	class CategoryDAO{
	private $_DB;
	private $_TaskCategory;
	



	public function __construct(){

		$this->_DB = DBUtil::getInstance();
		$this->_TaskCategory = new Task_Category();
	}


	public function getAllCategory(){
		$CategoryList = array();

		$this->_DB->doQuery("SELECT * FROM tms_task_category");

		$rows = $this->_DB->getAllRows();

		for($i = 0; $i < sizeof($rows); $i++) {
			$row = $rows[$i];
			$this->_TaskCategory = new Task_Category();

		    $this->_TaskCategory->setID ( $row['id']);
		    $this->_TaskCategory->setCategory ( $row['task_type'] );   
		   

		    $CategoryList[]=$this->_TaskCategory;
   
		}


		$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($CategoryList);

		return $Result;

	}

	public function addNewCategory($Task_Category)
	{
		$CategoryName=$Task_Category->getCategory();
		
		$SQL = "INSERT INTO `tms_task_category` (`id`, `task_type`) VALUES (NULL, '$CategoryName')";

		$this->_DB->getConnection()->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);
		//creating task
		$SQL = $this->_DB->doQuery($SQL);

		$this->_DB->getConnection()->commit();

	 	$Result = new Result();
		$Result->setIsSuccess(1);
		

		return $Result;

	}

	public function deleteCategory($Task_Category)
	{
		$Id = $Task_Category->getID();

		$SQL = "DELETE FROM `tms_task_category` WHERE `tms_task_category`.`id` = '$Id'";
		
		$SQL = $this->_DB->doQuery($SQL);		

	 	$Result = new Result();
		$Result->setIsSuccess(1);
		

		return $Result;
	}

	public function updateCategory($Task_Category)
	{
		$id = $Task_Category->getID();
		$Category = $Task_Category->getCategory();
		$SQL = "UPDATE `tms_task_category` SET `task_type` = '$Category' WHERE `tms_task_category`.`id` = '$id';";
		$SQL = $this->_DB->doQuery($SQL);		

	 	$Result = new Result();
		$Result->setIsSuccess(1);
		return $Result;
	}

	}

?>