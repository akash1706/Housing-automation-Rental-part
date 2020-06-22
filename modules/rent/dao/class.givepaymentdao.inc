<?php
// write dao object for each class

include_once COMMON.'class.common.inc';
include_once UTILITY.'class.util.inc';
include_once COMMON.'class.common.rent.inc';


Class givepaymentDAO{

	private $_DB;
	private $_givepayment;
	



	public function __construct(){

		$this->_DB = DBUtil::getInstance();
		$this->_givepayment = new management();
		

	}

	//create givepayment funtion with the givepayment object
	public function newgivepaymentRequest($givepayment){

		//$ownerID=$givepayment->getownerID();
		$ownerEmail=$givepayment->getownerEmail();
		$flatno=$givepayment->getflatno();
		$renterEmail=$givepayment->getrenterEmail();
		$date=$givepayment->getdate();
		$month=$givepayment->getmonth();
		$house=$givepayment->gethouse();
		$payment=$givepayment->getpayment();
		
		

		$SQL = "INSERT INTO rsm_management(ownerEmail,flatno,renterEmail,date1,month,house,payment)
		 	VALUES('$ownerEmail','$flatno','$renterEmail','$date','$month','$house','$payment')";

		//beginning a transaction
		$this->_DB->getConnection()->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);
		//creating the user
		$insert = $this->_DB->doQuery($SQL);

		
		//closing the transaction
		$this->_DB->getConnection()->commit();



	 	$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($SQL);

		return $Result;
	}


	// get all the users from the database using the database query
	public function getAllgivepayments($email){
      
       $value=$email;
		$givepaymentList = array();

		$this->_DB->doQuery("SELECT * FROM rsm_management WHERE renterEmail='$value' ");

		$rows = $this->_DB->getAllRows();

		for($i = 0; $i < sizeof($rows); $i++) {
			$row = $rows[$i];
			$this->_givepayment = new management();

		    //$this->_getpayment->setownerID ( $row['ownerID']);
		    $this->_givepayment->setownerEmail ( $row['ownerEmail']);
		    $this->_givepayment->setflatno ( $row['flatno'] );
		    $this->_givepayment->setrenterEmail ( $row['renterEmail'] );
		    $this->_givepayment->setmonth ( $row['month'] );
		    $this->_givepayment->setdate ( $row['date1'] );
		    $this->_givepayment->sethouse ( $row['house'] );
		    $this->_givepayment->setpayment( $row['payment'] );
		             
          

		    $givepaymentList[]=$this->_givepayment;

		}


		$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($givepaymentList);

		return $Result;
	}

}

//$_Log->log(LogUtil::$DEBUG," exit the class.userdao.inc");

?>
