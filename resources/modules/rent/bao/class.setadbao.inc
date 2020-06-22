<?php

include_once UTILITY.'class.util.inc';
include_once MODULES_RENT.'dao/class.setaddao.inc';


/*
	User Business Object 
*/
Class setadBAO{

	private $_DB;
	private $_setadDAO;

	public function __construct(){

		$this->_setadDAO = new setadDAO();

	}


	//new setad request funtion with the setad object
	public function newsetadRequest($setad){

		$Result = new Result();	
		$Result = $this->_setadDAO->newsetadRequest($setad);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in setadDAO.newsetadRequest($setad)");		

		return $Result;

	
	}
   //get all users value
	public function getAllsetads(){

		$Result = new Result();	
		$Result = $this->_setadDAO->getAllsetads();
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in setadDAO.getAllsetads()");		

		return $Result;
	}


	//update an user object based on its current information
	public function updatesetad($setad){

		$Result = new Result();	
		$Result = $this->_setadDAO->updatesetad($setad);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in setadDAO.updatesetad($setad)");		

		return $Result;
	}

	
	//delete an existing user
	public function deletesetad($flatno){

		$Result = new Result();	
		$Result = $this->_setadDAO->deletesetad($flatno);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in setadDAO.deletesetad()");		

		return $Result;

	}

	//approve or reject a user
	public function approve_Reject_setad($flatno,$Status){

		$Result = new Result();	
		$Result = $this->_setadDAO->approve_Reject_setad($flatno,$Status);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in setadDAO.approve_Reject_setad()");		
		else
			$Result->setResultObject("Operation Successful!!");		

		return $Result;

	}


	//read an user object based on its id form user object
	public function readsetad($flatno){


		$Result = new Result();	
		$Result = $this->_setadDAO->readsetad($flatno);
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in setadDAO.readsetad()");		

		return $Result;


	}


}

//$_Log->log(LogUtil::$DEBUG," exit the class.userbao.inc");

?>