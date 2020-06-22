<?php

//include_once 'blade/view.rent.blade.inc';
include_once COMMON.'class.common.inc';
include_once MODULES_RENT.'bao/class.rentbao.inc';
include_once COMMON.'class.common.rent.inc';
?>

<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
     <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet"> 
	<style type="text/css">
		div {
        font-family: 'Poppins';
        font-size: 16px;
        }
        .fh2{
			font-family:Lobster; 
			font-size: 24px;
		}
        h4
        {
        	font-size: 20px;
        }
	</style>
	
</head>



<body>
  
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand fh2" href="#">Akash Housing</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
     </button>

     <div class="collapse navbar-collapse" id="navbarSupportedContent">
     <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="rent.php">Rent</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="sells.php">Buy</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="login.php">Login</a>
      </li>
    </ul>
    </div>
   </nav>
      
      <div class="p-3 mb-2 bg-dark text-white">RENT YOUR FLAT NOW</div>
	<?php

     $_rentBAO;
	$_rentBAO=new rentBAO();

	$Result = $_rentBAO->getAllrents();

	//if DAO access is successful to load all the users then show them one by one
	if($Result->getIsSuccess()){

		$rentList = $Result->getResultObject();
	?>
		
		<?php
		for($i = 0; $i < sizeof($rentList); $i++) {
			$rent = $rentList[$i];
			?>
	  <div class="container-fluid">
      <div class="ml-5 row align-items-center single-model item">
      	
		<div class="ml-3 col-lg-6 model-left ">
		<div class="title justify-content-between d-flex">
            <h4 class="mt-20">Flat NO : <?php echo $rent->getflatno(); ?></h4>
            <br>
			<h4 class="mt-20">Flatsize :<?php echo $rent->getflatsize(); ?></h4>			
			<h4>Tk <?php echo $rent->getprice(); ?><span>/manth</span></h2>
									
			</div> 
			<p>
			Rooms     : <?php echo $rent->getrooms(); ?> <br>
			washrooms : <?php echo $rent->getwashrooms(); ?> <br>
			Address   : <?php echo $rent->getaddress(); ?><br>						
		    Phone NO  :<?php echo $rent->getphoneno(); ?>

		   </p>
		      
           
		       
	    </div>

	      <div class="row align-items-center single-model item">
	      	<div class="col-lg-6 model-right">
           <?php
                
              echo "<div >";
                 echo "<img  src='".$rent->getflatimage()."'  height='300'  width='400'>";
                 echo "</div>";
            ?>
             </div>
           </div>
        </div>
    </br>
    </br>
       </div>      
    
   

	    <?php

		}

	}
	else{

		echo $Result->getResultObject(); //giving failure message
	}

	?>
	
	

</body>

</html>

