<?php
// write dao object for each class

include_once COMMON.'class.common.inc';
include_once UTILITY.'class.util.inc';
include_once COMMON.'class.common.rent.inc';


Class setadDAO{

	private $_DB;
	private $_setad;
	



	public function __construct(){

		$this->_DB = DBUtil::getInstance();
		$this->_setad = new setad();
		

	}

	//create setad funtion with the setad object
	public function newsetadRequest($setad){

		$ownerID=$setad->getownerID();
		$adtype=$setad->getadtype();
		
		$flatno=$setad->getflatno();
		$flatsize=$setad->getflatsize();
		$rooms=$setad->getrooms();
		$washrooms=$setad->getwashrooms();
		$address=$setad->getaddress();
		$price=$setad->getprice();
		$flatimage=$setad->getflatimage();
		$flatinfo=$setad->getflatinfo();
		$phoneno = $setad->getphoneno();
		

		$SQL = "INSERT INTO rsm_rent(ownerID,adtype,flatno,flatsize,rooms,washrooms,address,price,flatimage,flatinfo,phoneno)
		 	VALUES('$ownerID','$adtype','$flatno','$flatsize','$rooms','$washrooms','$address','$price',
		 	'$flatimage','$flatinfo','$phoneno')";

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
	public function getAllsetads(){

		$setadList = array();

		$this->_DB->doQuery("SELECT * FROM rsm_rent ");

		$rows = $this->_DB->getAllRows();

		for($i = 0; $i < sizeof($rows); $i++) {
			$row = $rows[$i];
			$this->_setad = new Setad();
            $this->_setad->setownerID ( $row['ownerID']);
            $this->_setad->setadtype ( $row['adtype']);
		    $this->_setad->setflatno ( $row['flatno']);
		    $this->_setad->setflatsize ( $row['flatsize'] );
		    $this->_setad->setrooms ( $row['rooms'] );
		    $this->_setad->setwashrooms ( $row['washrooms'] );
		    $this->_setad->setaddress( $row['address'] );
		    $this->_setad->setprice( $row['price'] );
		    $this->_setad->setphoneno( $row['phoneno'] );
               
            
			$imageData = base64_encode($row['flatimage']);
			// Format the image SRC:  data:{mime};base64,{data};   
            $src = 'data:image/jpeg;base64,'.$imageData;
            $this->_setad->setflatimage($src  );                 
            $this->_setad->setStatus( $row['Status'] );

		    $setadList[]=$this->_setad;

		}


		$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($setadList);

		return $Result;
	}

	//delete an user based on its id of the database
	public function deletesetad($flatno){

		//beginning a transaction
		$this->_DB->getConnection()->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);

		//removing previous Positions

		$SQL_delete = "DELETE FROM rsm_rent WHERE flatno ='".$flatno."'";
		$SQL_delete = $this->_DB->doQuery($SQL_delete);

		//closing the transaction
		$this->_DB->getConnection()->commit();


	 	$Result = new Result();
		$Result->setIsSuccess(1);
		
		return $Result;

	}


	//approve or reject an user
	public function approve_Reject_setad($flatno,$Status){

		//beginning a transaction
		$this->_DB->getConnection()->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);
        $gotid=$flatno;

		// check the deleted row to true in the user now
		$SQL = "UPDATE rsm_rent SET Status='$Status' where flatno ='".$gotid."'";

		$SQL = $this->_DB->doQuery($SQL);


		//closing the transaction
		$this->_DB->getConnection()->commit();


	 	$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($SQL);

		

		return $Result;

	}

	//read an user object based on its id from user object
	public function readsetad($flatno){

        $gotid=$flatno;
		$SQL = "SELECT * FROM rsm_rent WHERE flatno='".$gotid."'";
		$this->_DB->doQuery($SQL);

		//reading the top row for this user from the database
		$row = $this->_DB->getTopRow();

		

		//preparing the user object
	   $this->_setad = new Setad();
            $this->_setad->setownerID ( $row['ownerID']);
            $this->_setad->setadtype ( $row['adtype']);
		    $this->_setad->setflatno ( $row['flatno']);
		    $this->_setad->setflatsize ( $row['flatsize'] );
		    $this->_setad->setrooms ( $row['rooms'] );
		    $this->_setad->setwashrooms ( $row['washrooms'] );
		    $this->_setad->setaddress( $row['address'] );
		    $this->_setad->setprice( $row['price'] );
		    $this->_setad->setphoneno( $row['phoneno'] );
               
            
			$imageData = base64_encode($row['flatimage']);
			// Format the image SRC:  data:{mime};base64,{data};   
            $src = 'data:image/jpeg;base64,'.$imageData;
           // $this->_setad->setflatimage($src  );                 
            $this->_setad->setStatus( $row['Status'] );


	 	$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($this->_setad);

		return $Result;
	}

	
	//update an user object based on its id information

	public function updatesetad($setad){

        
        $ownerID=$setad->getownerID();
		$adtype=$setad->getadtype();
		
		$flatno=$setad->getflatno();
		$gotid=$flatno;
		$flatsize=$setad->getflatsize();
		$rooms=$setad->getrooms();
		$washrooms=$setad->getwashrooms();
		$address=$setad->getaddress();
		$price=$setad->getprice();
		$flatimage=$setad->getflatimage();
		$flatinfo=$setad->getflatinfo();
		$phoneno = $setad->getphoneno();
		$SQL = "UPDATE rsm_rent SET ownerID='$ownerID', adtype='$adtype', flatsize='$flatsize', rooms='$rooms',  
		washrooms='$washrooms', address='$address', price='$price', flatimage='$flatimage', flatinfo='$flatinfo' ,
		phoneno='$phoneno' WHERE flatno='$gotid'";
		//$this->_DB->doQuery($SQL);

		//reading the top row for this user from the database
		//$row = $this->_DB->getTopRow();

		//beginning a transaction
		$this->_DB->getConnection()->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);
		//creating the user
		$insert = $this->_DB->doQuery($SQL);

		
		//closing the transaction
		$this->_DB->getConnection()->commit();

		/*

		//preparing the user object
	   $this->_setad = new Setad();
            $this->_setad->setownerID ( $row['ownerID']);
            $this->_setad->setadtype ( $row['adtype']);
		    //$this->_setad->setflatno ( $row['flatno']);
		    $this->_setad->setflatsize ( $row['flatsize'] );
		    $this->_setad->setrooms ( $row['rooms'] );
		    $this->_setad->setwashrooms ( $row['washrooms'] );
		    $this->_setad->setaddress( $row['address'] );
		    $this->_setad->setprice( $row['price'] );
		    $this->_setad->setphoneno( $row['phoneno'] );
               
            
			$imageData = base64_encode($row['flatimage']);
			// Format the image SRC:  data:{mime};base64,{data};   
            $src = 'data:image/jpeg;base64,'.$imageData;
            $this->_setad->setflatimage($src  );                 
            //$this->_setad->setStatus( $row['Status'] );
            */


	 	$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($this->_setad);

		return $Result;
	}
	public function updateUser($User){

		$ID=$User->getID();
		$UniversityID=$User->getUniversityID();
		$Email=$User->getEmail();
		$Password=$User->getPassword();
		$FirstName=$User->getFirstName();
		$MiddleName = $User->getMiddleName();
		$LastName=$User->getLastName();
		$DisciplineID=$User->getDiscipline()->getID();


		if(strcasecmp($Password, "*__KEEP__*")==0){ //if you are keeping your old password

		$SQL = "UPDATE ums_user SET UniversityID='$UniversityID',
			Email='$Email',FirstName='$FirstName',MiddleName='$MiddleName',LastName='$LastName',
			DisciplineID='$DisciplineID' WHERE ID='$ID'";

		}else{ //otherwise you have entered a new password

		$SQL = "UPDATE ums_user SET UniversityID='$UniversityID',Password='$Password',
		Email='$Email',FirstName='$FirstName',MiddleName='$MiddleName',LastName='$LastName',
		DisciplineID='$DisciplineID' WHERE ID='$ID'";


		}

		//beginning a transaction
		$this->_DB->getConnection()->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);
		//updating the user
		$SQL = $this->_DB->doQuery($SQL);

		//removing previous roles

		$SQL_delete = "DELETE from ums_user_role where UserID ='".$User->getID()."'";
		$SQL_delete = $this->_DB->doQuery($SQL_delete);

		//print_r($User);
		$Roles = $User->getRoles();

		//assigning new roles to the user
		for ($i=0; $i < sizeof($Roles); $i++) {
			$Role = $Roles[$i];

			$SQL_Role = "INSERT INTO ums_user_role(UserID,RoleID)
										VALUES('".$User->getID()."','".$Role->getID()."')";
			$SQL_Role = $this->_DB->doQuery($SQL_Role);
		}


		//removing previous Positions

		$SQL_delete = "DELETE from ums_user_position where UserID ='".$User->getID()."'";
		$SQL_delete = $this->_DB->doQuery($SQL_delete);

		//print_r($User);
		$Positions = $User->getPositions();

		//assigning new Positions to the user
		for ($i=0; $i < sizeof($Positions); $i++) {
			$Position = $Positions[$i];

			$SQL_Position = "INSERT INTO ums_user_position(UserID,PositionID)
										VALUES('".$User->getID()."','".$Position->getID()."')";

			$SQL_Position = $this->_DB->doQuery($SQL_Position);
		}



		//closing the transaction
		$this->_DB->getConnection()->commit();


	 	$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($SQL);
		return $Result;

	}



}

//$_Log->log(LogUtil::$DEBUG," exit the class.userdao.inc");

?>
