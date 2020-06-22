<?php


class Rentandsells
{
	private $_ownerID;
	private $_adtype;
	private $_flatno;
	private $_flatsize;
	private $_rooms;
	private $_washrooms;
	private $_address;
	private $_price;
	private $_flatimage;
	private $_flatinfo;
    private $_phoneno;

    public function getownerID()
    {
    	return $this->_ownerID;
    }

    public function getadtype()
    {
    	return $this->_adtype;
    }


    public function getflatno()
    {
    	return $this->_flatno;
    }

    public function getflatsize()
    {
    	return $this->_flatsize;
    }

    public function getrooms()
    {
    	return $this->_rooms;
    }

    public function getwashrooms()
    {
    	return $this->_washrooms;
    }

    public function getaddress()
    {
    	return $this->_address;
    }

    public function getprice()
    {
    	return $this->_price;
    }

    public function getflatimage()
    {
    	return $this->_flatimage;
    }

    public function getflatinfo()
    {
    	return $this->_flatinfo;
    }

    public function getphoneno()
    {
    	return $this->_phoneno;
    }

    

    public function setownerID($ownerID)
    {
        $this->_ownerID=$ownerID;
    }

    public function setadtype($adtype)
    {
        $this->_adtype=$adtype;
    }

    public function setflatno($flatno)
    {
        $this->_flatno=$flatno;
    }

    public function setflatsize($flatsize)
    {
        $this->_flatsize=$flatsize;
    }

    public function setrooms($rooms)
    {
        $this->_rooms=$rooms;
    }

    public function setwashrooms($washrooms)
    {
        $this->_washrooms=$washrooms;
    }

    public function setaddress($address)
    {
        $this->_address=$address;
    }

    public function setprice($price)
    {
        $this->_price=$price;
    }

    public function setflatimage($flatimage)
    {
        $this->_flatimage=$flatimage;
    }

    public function setflatinfo($flatinfo)
    {
        $this->_flatinfo=$flatinfo;
    }

    public function setphoneno($phoneno)
    {
        $this->_phoneno=$phoneno;
    }
 
}

class  Setad
{
	private $_ownerID;
	private $_adtype;
	private $_flatno;
	private $_flatsize;
	private $_rooms;
	private $_washrooms;
	private $_address;
	private $_price;
	private $_flatimage;
	private $_flatinfo;
    private $_phoneno;
    private $_Status;

     public function setownerID($ownerID)
    {
    	$this->_ownerID=$ownerID;
    }

    public function setadtype($adtype)
    {
    	$this->_adtype=$adtype;
    }

    public function setflatno($flatno)
    {
    	$this->_flatno=$flatno;
    }

    public function setflatsize($flatsize)
    {
    	$this->_flatsize=$flatsize;
    }

    public function setrooms($rooms)
    {
    	$this->_rooms=$rooms;
    }

    public function setwashrooms($washrooms)
    {
    	$this->_washrooms=$washrooms;
    }

    public function setaddress($address)
    {
    	$this->_address=$address;
    }

    public function setprice($price)
    {
    	$this->_price=$price;
    }

    public function setflatimage($flatimage)
    {
    	$this->_flatimage=$flatimage;
    }

    public function setflatinfo($flatinfo)
    {
    	$this->_flatinfo=$flatinfo;
    }

    public function setphoneno($phoneno)
    {
    	$this->_phoneno=$phoneno;
    }

    public function setStatus($Status)
    {
        $this->_Status=$Status;
    }
    
    

    public function getownerID()
    {
        return $this->_ownerID;
    }

    public function getadtype()
    {
        return $this->_adtype;
    }


    public function getflatno()
    {
        return $this->_flatno;
    }

    public function getflatsize()
    {
        return $this->_flatsize;
    }

    public function getrooms()
    {
        return $this->_rooms;
    }

    public function getwashrooms()
    {
        return $this->_washrooms;
    }

    public function getaddress()
    {
        return $this->_address;
    }

    public function getprice()
    {
        return $this->_price;
    }

    public function getflatimage()
    {
        return $this->_flatimage;
    }

    public function getflatinfo()
    {
        return $this->_flatinfo;
    }

    public function getphoneno()
    {
        return $this->_phoneno;
    }

    public function getStatus()
    {
        return $this->_Status;
    }
 
}

class management
{
    private $_sl;
    private $_ownerEmail;
    private $_flatno;
    private $_renterEmail;
    private $_month;
    private $_date;
    private $_house;
    private $_payment;

    public function setsl($sl)
    {
        $this->_sl=$sl;
    }

   
    public function setownerEmail($ownerEmail)
    {
        $this->_ownerEmail=$ownerEmail;
    }

    public function setflatno($flatno)
    {
        $this->_flatno=$flatno;
    }

    public function setrenterEmail($renterEmail)
    {
        $this->_renterEmail=$renterEmail;
    }

    public function setdate($date)
    {
        $this->_date=$date;
    }

    public function setpayment($payment)
    {
        $this->_payment=$payment;
    }
  
    public function setstatas($statas)
    {
        $this->_statas=$statas;
    }

    public function setmonth($month)
    {
        $this->_month=$month;
    }
  
    public function sethouse($house)
    {
        $this->_house=$house;
    }

    public function getsl()
    {
        return $this->_sl;
    }

    public function getownerEmail()
    {
        return $this->_ownerEmail;
    }

    public function getrenterEmail()
    {
        return $this->_renterEmail;
    }


    public function getflatno()
    {
        return $this->_flatno;
    }

     public function getdate()
    {
        return  $this->_date;
    }

    public function getmonth()
    {
        return $this->_month;
    }

    public function gethouse()
    {
        return $this->_house;
    }

    public function getpayment()
    {
        return $this->_payment;
    }

    public function getstatas()
    {
        return $this->_statas;
    }


  
}

?>