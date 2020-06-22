<?php
// write dao object for each class

include_once COMMON.'class.common.inc';
include_once UTILITY.'class.util.inc';
//include_once 'class.roledao.inc';
//include_once 'class.disciplinedao.inc';
include_once COMMON.'class.common.rent.inc';

Class rentDAO{

	private $_DB;
	public $_rent;
	//private $_RoleDAO;
	//private $_DisciplineDAO;



	public function __construct(){

		$this->_DB = DBUtil::getInstance();
		$this->_rent = new Rentandsells();
		//$this->_RoleDAO = new RoleDAO();
		//$this->_DisciplineDAO = new DisciplineDAO();

	}

	// get all the users from the database using the database query
	public function getAllrents(){

		$rentList = array();

		$this->_DB->doQuery("SELECT * FROM rsm_rent WHERE adtype='rent'");

		$rows = $this->_DB->getAllRows();

		for($i = 0; $i < sizeof($rows); $i++) {
			$row = $rows[$i];
			$this->_rent = new Rentandsells();

		    $this->_rent->setflatno ( $row['flatno']);
		    $this->_rent->setflatsize ( $row['flatsize'] );
		    $this->_rent->setrooms ( $row['rooms'] );
		    $this->_rent->setwashrooms ( $row['washrooms'] );
		    $this->_rent->setaddress( $row['address'] );
		    $this->_rent->setprice( $row['price'] );
		    $this->_rent->setphoneno( $row['phoneno'] );
               
            
			$imageData = base64_encode($row['flatimage']);
			// Format the image SRC:  data:{mime};base64,{data};   
            $src = 'data:image/jpeg;base64,'.$imageData;
            $this->_rent->setflatimage($src  );                 
          

		    $rentList[]=$this->_rent;

		}


		$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($rentList);

		return $Result;
	}

	

}



?>
