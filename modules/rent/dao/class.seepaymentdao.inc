<?php
// write dao object for each class

include_once COMMON.'class.common.inc';
include_once UTILITY.'class.util.inc';
include_once MODULES_USER.'ui/blade/view.user_details.blade.inc';
include_once COMMON.'class.common.rent.inc';


Class seepaymentDAO{

	private $_DB;
	public $_seepayment;
	//$email=$userPositions->getEmail();



	public function __construct(){

		$this->_DB = DBUtil::getInstance();
		$this->_seepayment = new management();
		//$_Log= LogUtil::getInstance();

	}

	// get all the users from the database using the database query
	public function getAllseepayments($email){
      
       $value=$email;
		$seepaymentList = array();

		$this->_DB->doQuery("SELECT * FROM rsm_management WHERE ownerEmail='$value' ");

		$rows = $this->_DB->getAllRows();

		for($i = 0; $i < sizeof($rows); $i++) {
			$row = $rows[$i];
			$this->_seepayment = new management();

		    $this->_seepayment->setsl ( $row['sl']);
		    $this->_seepayment->setownerEmail ( $row['ownerEmail']);
		    $this->_seepayment->setflatno ( $row['flatno'] );
		    $this->_seepayment->setrenterEmail ( $row['renterEmail'] );
		    $this->_seepayment->setdate ( $row['date1'] );
		     $this->_seepayment->setmonth ( $row['month'] );
		    $this->_seepayment->setpayment( $row['payment'] );
		    $this->_seepayment->setstatas( $row['statas'] );         
          

		    $seepaymentList[]=$this->_seepayment;

		}


		$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($seepaymentList);

		return $Result;
	}




	//delete an user based on its id of the database
	public function deleteseepayment($sl){
       // echo($sl);
		//beginning a transaction
		$this->_DB->getConnection()->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);

		//removing previous Positions
         echo "get value $sl";
		$SQL_delete = "DELETE FROM rsm_management WHERE sl ='".$sl."'";
		$SQL_d = $this->_DB->doQuery($SQL_delete);

		//closing the transaction
		$this->_DB->getConnection()->commit();


	 	$Result = new Result();
		$Result->setIsSuccess(1);
		//$Result->setResultObject($SQL_d);
		return $Result;

	}


	//approve or reject an user
	public function approve_Reject_seepayment($sl,$statas){

		//beginning a transaction
		$this->_DB->getConnection()->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);
        $gotid=$statas;

		// check the deleted row to true in the user now
		$SQL = "UPDATE rsm_management SET statas='$statas' WHERE sl = '".$sl."'";

		$SQL1 = $this->_DB->doQuery($SQL);


		//closing the transaction
		$this->_DB->getConnection()->commit();


	 	$Result = new Result();
		$Result->setIsSuccess(1);
		//$Result->setResultObject($SQL1);

		

		return $Result;

	}

	//delete an user based on its id of the database
	public function searchseepayment($email,$month){
       // echo($month);
		//beginning a transaction
		$this->_DB->getConnection()->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);

		//$email=$userPositions->getEmail();
		$seepaymentList = array();

		$this->_DB->doQuery("SELECT * FROM rsm_management WHERE month='$month' AND ownerEmail='$email'");

		$rows = $this->_DB->getAllRows();

		for($i = 0; $i < sizeof($rows); $i++) {
			$row = $rows[$i];
			$this->_seepayment = new management();

		    $this->_seepayment->setsl ( $row['sl']);
		    $this->_seepayment->setownerEmail ( $row['ownerEmail']);
		    $this->_seepayment->setflatno ( $row['flatno'] );
		    $this->_seepayment->setrenterEmail ( $row['renterEmail'] );
		    $this->_seepayment->setdate ( $row['date1'] );
		     $this->_seepayment->setmonth ( $row['month'] );
		    $this->_seepayment->setpayment( $row['payment'] );
		    $this->_seepayment->setstatas( $row['statas'] );         
          

		    $seepaymentList[]=$this->_seepayment;

		}


		$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($seepaymentList);

		return $Result;

		

	}


	

}



?>
