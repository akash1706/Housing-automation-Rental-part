<?php
	
include_once UTILITY.'class.util.inc';
include_once MODULES_TASK.'dao/class.taskdao.inc';

class TaskBAO{

	private $_TaskDao;

	public function __construct(){

		$this->_TaskDao = new TaskDAO();

	}
	
	public function addNewTask($task){

		$Result = new Result();	
		$Result = $this->_TaskDao->addTask($task);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in CategoryDAO.addTask()");		

		return $Result;

	}

	public function findByUser($user)
	{
		$Result = new Result();	
		$Result = $this->_TaskDao->findByUser($user);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in CategoryDAO.addTask()");		

		return $Result;
	}



	public function findMyTask($user)
	{
		$Result = new Result();	
		$Result = $this->_TaskDao->findMyTask($user);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in CategoryDAO.addTask()");		

		return $Result;
	} 	


	public function findTask($Task)
	{
		$Result = new Result();	
		$Result = $this->_TaskDao->findTask($Task);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in CategoryDAO.addTask()");		

		return $Result;
	}

	public function deleteTask($Task)
	{
		$Result = new Result();	
		$Result = $this->_TaskDao->deleteTask($Task);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in TaskDAO.addTask()");		

		return $Result;
	}


	public function updateTask($Task)
	{
		$Result = new Result();	
		$Result = $this->_TaskDao->updateTask($Task);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in TaskDAO.addTask()");		

		return $Result;	
	}

	public function findMyByDate($User,$date)
	{
		$Result = new Result();	
		$Result = $this->_TaskDao->findMyByDate($User,$date);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in CategoryDAO.addTask()");		

		return $Result;	
	}


	public function prograssDown($_Task)
	{
		$Result = new Result();	
		$Result = $this->_TaskDao->prograssDown($_Task);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in CategoryDAO.addTask()");		

		return $Result;
	}

	public function prograssUp($_Task)
	{
		$Result = new Result();	
		$Result = $this->_TaskDao->prograssUp($_Task);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in CategoryDAO.addTask()");		

		return $Result;
	}

	public function getAllDetails($_Task)
	{
		$Result = new Result();	
		$Result = $this->_TaskDao->getAllDetails($_Task);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in  TaskDAO.getAllDetails()");	

		return $Result;
	}

	public function findMyByDateRange($User, $date1,$date2)
	{
		$Result = new Result();	
		$Result = $this->_TaskDao->findMyByDateRange($User, $date1,$date2);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in  TaskDAO.findMyTaskByDateRange()");	

		return $Result;
	}

}
?>