<?php

include_once UTILITY.'class.util.inc';
include_once MODULES_RENT.'dao/class.givepaymentdao.inc';


/*
	User Business Object 
*/
Class givepaymentBAO{

	private $_DB;
	private $_givepaymentDAO;

	public function __construct(){

		$this->_givepaymentDAO = new givepaymentDAO();

	}


	//new givepayment request funtion with the givepayment object
	public function newgivepaymentRequest($givepayment){

		$Result = new Result();	
		$Result = $this->_givepaymentDAO->newgivepaymentRequest($givepayment);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in givepaymentDAO.newgivepaymentRequest($givepayment)");		

		return $Result;

	
	}

	//get all users value
	public function getAllgivepayments($email){

		$Result = new Result();	
		$Result = $this->_givepaymentDAO->getAllgivepayments($email);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in getpaymentDAO.getAllgivepayments($email)");		

		return $Result;
	}
  

}

//$_Log->log(LogUtil::$DEBUG," exit the class.userbao.inc");

?>