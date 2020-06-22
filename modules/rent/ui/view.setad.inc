<?php

include_once 'blade/view.setad.blade.inc';
include_once COMMON.'class.common.inc';
include_once COMMON.'class.common.rent.inc';
//include_once MODULE_USER.'blade/view.user.blade.inc';

  if(isset($_GET['edit']))
  {
     $_setadBAO;
     $mama=$_GET['edit'];
	$_setadBAO=new setadBAO();

	$Result = $_setadBAO->readsetad($mama);

	//if DAO access is successful to load all the users then show them one by one
	if($Result->getIsSuccess()){

		$setad = $Result->getResultObject();
	}
}
?>



<div class="panel panel-default">

    <div class="panel-heading">Apply for new ad</div>
    
    <div class="panel-body">

	<div id="form">
		<form method="post" class="form-horizontal" enctype="multipart/form-data">

			<div class="form-group">
              	<label class="control-label col-sm-4" for="ownerID">ownerEmail::</label>
              	<div class="col-sm-6">
              	<input type="int" name="ownerID" class="form-control" placeholder="Owner Identity"         value="<?php 
					if(isset($_GET['edit'])) echo $setad->getownerID();  ?> "/>
			  	</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="adtype"> adtype :</label>
              	<div class="col-sm-6">		
						   						    
						<select name="adtype" class="form-control" id="adtype" required>
							<option selected disabled>RENT OR SELL</option>
							<option value="rent">Rent</option>
							<option value="sells">Sell</option>
						</select>	
				</div>
			</div>
	
			<div class="form-group">
              	<label class="control-label col-sm-4" for="flatno">FlatNO **:</label>
              	<div class="col-sm-6">  		
				<input type="text" name="flatno" class="form-control" placeholder="FlatNO " 
				value="<?php 
					if(isset($_GET['edit'])) echo $setad->getflatno();  ?>"/>
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="flatsize">Flatsize:</label>
              	<div class="col-sm-6">  		
				<input type="int" name="flatsize" class="form-control" placeholder="flatsize" value="<?php 
					if(isset($_GET['edit'])) echo $setad->getflatsize();  ?>" />
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="rooms">Rooms **:</label>
              	<div class="col-sm-6">	
				<input type="int" name="rooms" class="form-control" placeholder="rooms" value="<?php 
					if(isset($_GET['edit'])) echo $setad->getrooms();  ?>" />
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="washrooms">WashRooms **:</label>
              	<div class="col-sm-6">	
				<input type="int" name="washrooms" class="form-control" placeholder="washrooms"  value="<?php 
					if(isset($_GET['edit'])) echo $setad->getwashrooms();  ?>" />
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="address">address:</label>
              	<div class="col-sm-6">  		
				<input type="text" name="address" class="form-control" placeholder="address" value="<?php 
					if(isset($_GET['edit'])) echo $setad->getaddress();  ?>" />
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="price">price :</label>
              	<div class="col-sm-6">	
				<input type="int" name="price" class="form-control" placeholder="price"  value="<?php 
					if(isset($_GET['edit'])) echo $setad->getprice();  ?>" />
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="flatimage">Flatimage**:</label>
              	<div class="col-sm-6">
			  	<input type="file" name="file">

			  	</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="flatinfo">flatinfo:</label>
              	<div class="col-sm-6">  		
				<input type="text" name="flatinfo" class="form-control" placeholder="flatinfo" value="<?php 
					if(isset($_GET['edit'])) echo $setad->getflatinfo();  ?>"/>
				</div>
			</div>
			
			<div class="form-group">
              	<label class="control-label col-sm-4" for="phoneno">phoneno:</label>
              	<div class="col-sm-6">  		
				<input type="text" name="phoneno" class="form-control" placeholder="phoneno" value="<?php 
					if(isset($_GET['edit'])) echo $setad->getphoneno();  ?>" />
				</div>
			</div>


	        <div class="form-group">        
              <div class="col-sm-offset-2 col-sm-10">
        <?php if(!isset($_GET['edit'])) { ?>
		<button type="submit" value="request" name="request">Submit Request</button>
	<?php } ?>
	<?php if(isset($_GET['edit'])) { ?>
		<button type="submit" value="update" name="update">update this </button>
          <?php } ?>
			    </div>
            </div> 
		</form>

	</div>
	<div id="toastME">Some Text Message..</div>
	</div>

	<div class="panel-body">

	<table class="table table-bordered">
	<?php

     $_setadBAO;
	$_setadBAO=new setadBAO();

	$Result = $_setadBAO->getAllsetads();

	//if DAO access is successful to load all the users then show them one by one
	if($Result->getIsSuccess()){

		$setadList = $Result->getResultObject();
	?>

	
		<tr>
			<th>ownerEmail</th>
            <th> adtype</th>
           <th> flatno</th>
           <th> flatsize</th>
            <th>price</th>
            <th>rooms</th>
           <th> wrooms</th>
           <th> address</th>
          <th>phoneno</th>
         <th>flatimage</th>
         
        
        <th>status</th>
		</tr>

		<?php
		for($i = 0; $i < sizeof($setadList); $i++) {
			$setad = $setadList[$i];
			?>

		        <td><?php echo $setad->getownerID(); ?></td>
		        <td><?php echo $setad->getadtype(); ?></td>
		
                <td><?php echo $setad->getflatno(); ?></td>
			    <td><?php echo $setad->getflatsize(); ?></td>
			    <td><?php echo $setad->getprice(); ?></td>
			    <td><?php echo $setad->getrooms(); ?></td>
			    <td><?php echo $setad->getwashrooms(); ?></td>
			    <td><?php echo $setad->getaddress(); ?></td>
			    <td><?php echo $setad->getphoneno(); ?></td>
			    <td><div class="row align-items-center single-model item">
           <?php
                
              echo "<div >";
                 echo "<img  src='".$setad->getflatimage()."'  height='30'  width='40'>";
                 echo "</div>";
            ?>
           
                      </div>
               </td>
               <td><?php echo $setad->getStatus(); ?></td>
			    <td>
			    <a href="?edit=<?php echo $setad->getflatno(); ?>" onclick="return confirm('sure to edit !'); " >edit</a>
			    </td>
			    <td>
			    <a href="?approve=<?php echo $setad->getflatno(); ?>" onclick="return confirm('sure to approve !'); " >approve</a>
			    </td>
			    <td>
			    <a href="?reject=<?php echo $setad->getflatno(); ?>" onclick="return confirm('sure to reject !'); " >reject</a>
			    </td>
			    <td>
			    <a href="?del=<?php echo $setad->getflatno(); ?>" onclick="return confirm('sure to delete !'); " >delete</a>
			    </td>
		    </tr>
	    <?php

		}
     }
	
	else{

		echo $Result->getResultObject(); //giving failure message
	}

	?>
	</table>
	</div>

</div>

