<?php

include_once UTILITY.'class.util.inc';
include_once COMMON.'class.common.rent.inc';
include_once COMMON.'class.common.inc';
include_once MODULES_RENT.'dao/class.rentdao.inc';


/*
	User Business Object 
*/
Class rentBAO{

	private $_DB;
	private $_rentDAO;

	public function __construct(){

		$this->_rentDAO = new rentDAO();

	}

	//get all users value
	public function getAllrents(){

		$Result = new Result();	
		$Result = $this->_rentDAO->getAllrents();
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in rentDAO.getAllrents()");		

		return $Result;
	}

	

}



?>