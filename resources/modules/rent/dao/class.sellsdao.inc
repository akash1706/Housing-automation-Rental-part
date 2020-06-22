<?php
// write dao object for each class

include_once COMMON.'class.common.inc';
include_once UTILITY.'class.util.inc';
//include_once 'class.roledao.inc';
//include_once 'class.disciplinedao.inc';
include_once COMMON.'class.common.rent.inc';

Class sellsDAO{

	private $_DB;
	public $_sells;
	//private $_RoleDAO;
	//private $_DisciplineDAO;



	public function __construct(){

		$this->_DB = DBUtil::getInstance();
		$this->_sells = new Rentandsells();
		//$this->_RoleDAO = new RoleDAO();
		//$this->_DisciplineDAO = new DisciplineDAO();

	}

	// get all the users from the database using the database query
	public function getAllsells(){

		$sellsList = array();

		$this->_DB->doQuery("SELECT * FROM rsm_rent WHERE adtype='sells' ");

		$rows = $this->_DB->getAllRows();

		for($i = 0; $i < sizeof($rows); $i++) {
			$row = $rows[$i];
			$this->_sells = new Rentandsells();

		    $this->_sells->setflatno ( $row['flatno']);
		    $this->_sells->setflatsize ( $row['flatsize'] );
		    $this->_sells->setrooms ( $row['rooms'] );
		    $this->_sells->setwashrooms ( $row['washrooms'] );
		    $this->_sells->setaddress( $row['address'] );
		    $this->_sells->setprice( $row['price'] );
		    $this->_sells->setphoneno( $row['phoneno'] );
               
            
			$imageData = base64_encode($row['flatimage']);
			// Format the image SRC:  data:{mime};base64,{data};   
            $src = 'data:image/jpeg;base64,'.$imageData;
            $this->_sells->setflatimage($src  );                 
          

		    $sellsList[]=$this->_sells;

		}


		$Result = new Result();
		$Result->setIsSuccess(1);
		$Result->setResultObject($sellsList);

		return $Result;
	}

	

}



?>
