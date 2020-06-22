<?php

include_once UTILITY.'class.util.inc';
//include_once COMMON.'class.common.rent.inc';
//include_once COMMON.'class.common.inc';
include_once MODULES_RENT.'dao/class.seepaymentdao.inc';


/*
	User Business Object 
*/
Class seepaymentBAO{

	private $_DB;
	private $_seepaymentDAO;

	public function __construct(){

		$this->_seepaymentDAO = new seepaymentDAO();

	}

	//get all users value
	public function getAllseepayments($email){

		$Result = new Result();	
		$Result = $this->_seepaymentDAO->getAllseepayments($email);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in seepaymentDAO.getAllseepayments($email)");		

		return $Result;
	}



	//delete an existing user
	public function deleteseepayment($sl){

		$Result = new Result();	
		$Result = $this->_seepaymentDAO->deleteseepayment($sl);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in seepaymentDAO.deleteseepayment($sl)");		

		return $Result;

	}

	//approve or reject a user
	public function approve_Reject_seepayment($sl,$statas){

		$Result = new Result();	
		$Result = $this->_seepaymentDAO->approve_Reject_seepayment($sl,$statas);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in seepaymentDAO.approve_Reject_seepayment($sl,$statas)");		
		

		return $Result;

	}

	//delete an existing user
	public function searchseepayment($email,$month){

		$Result = new Result();	
		$Result = $this->_seepaymentDAO->searchseepayment($email,$month);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in seepaymentDAO.searchseepayment($email,$month)");		

		return $Result;

	}

	

}



?>