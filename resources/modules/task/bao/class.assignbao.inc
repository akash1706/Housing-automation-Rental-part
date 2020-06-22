<?php
	
include_once UTILITY.'class.util.inc';
include_once MODULES_TASK.'dao/class.assigndao.inc';

class AssignBAO{

	private $_AssignDao;

	public function __construct(){

		$this->_AssignDao = new AssignDAO();

	}


	public function assignTask($assign)
	{
		$Result = new Result();	
		$Result = $this->_AssignDao->assignTask($assign);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in AssignDAO.assignTask($assign)");		

		return $Result;
	}

	public function findAllbyUserId($User)
	{
		$Result = new Result();	
		$Result = $this->_AssignDao->findAllbyUserId($User);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in AssignDAO.assignTask($User)");		

		return $Result;
	}

	public function findTaskUserId($id,$taksId)
	{
		$Result = new Result();	
		$Result = $this->_AssignDao->findTaskUserId($id,$taksId);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in AssignDAO.findTaskUserId($id,$taksId)");		

		return $Result;
	}

	public function findAllAssing($Task)
	{
		$Result = new Result();	
		$Result = $this->_AssignDao->findAllAssing($Task);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in AssignDAO.findAllAssing($Task)");		

		return $Result;
	}
	
	


}
?>