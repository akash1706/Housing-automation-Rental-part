<?php

include_once UTILITY.'class.util.inc';
include_once COMMON.'class.common.rent.inc';
include_once COMMON.'class.common.inc';
include_once MODULES_RENT.'dao/class.sellsdao.inc';


/*
	User Business Object 
*/
Class sellsBAO{

	private $_DB;
	private $_sellsDAO;

	public function __construct(){

		$this->_sellsDAO = new sellsDAO();

	}

	//get all users value
	public function getAllsells(){

		$Result = new Result();	
		$Result = $this->_sellsDAO->getAllsells();
		
		if(!$Result->getIsSuccess())
			$Result->setResultObject("Database failure in sellsDAO.getAllsells()");		

		return $Result;
	}

	

}



?>