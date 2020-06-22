<?php

include_once 'blade/view.givepayment.blade.inc';
include_once COMMON.'class.common.inc';
include_once COMMON.'class.common.rent.inc';
include_once MODULES_USER.'ui/blade/view.user_details.blade.inc';
?>


<div class="panel panel-default">

    <div class="panel-heading">Apply for new payment</div>
    
    <div class="panel-body">

	<div id="form">
		<form method="post" class="form-horizontal" enctype="multipart/form-data">

			
			<div class="form-group">
              	<label class="control-label col-sm-4" for="ownerID">ownerEmail::</label>
              	<div class="col-sm-6">
              	<input type="text" name="ownerEmail" class="form-control" placeholder="Owner Email" required />
			  	</div>
			</div>
	
			<div class="form-group">
              	<label class="control-label col-sm-4" for="flatno">FlatNO::</label>
              	<div class="col-sm-6">  		
				<input type="text" name="flatno" class="form-control" placeholder="FlatNO " required />
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="renterID">renterEmail::</label>
              	<div class="col-sm-6">
              	<input type="text" name="renterEmail" class="form-control" placeholder="renter Email" required />
			  	</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="date">date:</label>
              	<div class="col-sm-6">  		
				<input type="date" name="date" class="form-control" placeholder="date" required />
				</div>
			</div>

            <div class="form-group">
              	<label class="control-label col-sm-4" for="month">month:</label>
              	<div class="col-sm-6">  		
                <input type="checkbox" name="month[]" class="form-control" value="january" />January<br/>
				<input type="checkbox" name="month[]" class="form-control" value="february" />
				february<br/>
				<input type="checkbox" name="month[]" class="form-control" value="march" />
				march<br/>
				<input type="checkbox" name="month[]" class="form-control" value="april" />
				april<br/>
				<input type="checkbox" name="month[]" class="form-control" value="may" />
				may<br/>
				<input type="checkbox" name="month[]" class="form-control" value="june" />
				june<br/>
				<input type="checkbox" name="month[]" class="form-control" value="july" />
				july<br/>
				<input type="checkbox" name="month[]" class="form-control" value="august" />
				august<br/>
				<input type="checkbox" name="month[]" class="form-control" value="september" />
				september<br/>
				<input type="checkbox" name="month[]" class="form-control" value="october" />
				october<br/>
				<input type="checkbox" name="month[]" class="form-control" value="november" />
				november<br/>
				<input type="checkbox" name="month[]" class="form-control" value="december" />
				december<br/>
				</div>
			</div>			
            
            <div class="form-group">
              	<label class="control-label col-sm-4" for="house">house:</label>
              	<div class="col-sm-6">	
				<input type="int" name="house" class="form-control" placeholder="house" required="" />
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="payment">Payment:</label>
              	<div class="col-sm-6">	
				<input type="int" name="payment" class="form-control" placeholder="payment" required="" />
				</div>
			</div>

			

	        <div class="form-group">        
              <div class="col-sm-offset-2 col-sm-10">

		<button type="submit" value="request" name="request">Submit Request</button>

			    </div>
            </div> 
		</form>

	</div>
	<div id="toastME">Some Text Message..</div>
	</div>

	

</div>


<div class="panel-body">

	<table class="table table-bordered">
	<?php
      $email= $userPositions->getEmail();
     $_givepaymentBAO;
	$_givepaymentBAO=new givepaymentBAO();

	$Result = $_givepaymentBAO->getAllgivepayments($email);

	//if DAO access is successful to load all the users then show them one by one
	if($Result->getIsSuccess()){

		$givepaymentList = $Result->getResultObject();
	?>

	<tr>
			<th>ownerEmail</th>
           <th> flatno</th>
           <th> renterEmail</th>
            <th>month</th>
            <th>date</th>
            <th>housing</th>
            <th>payment</th>
           
		</tr>

	<?php
		for($i = 0; $i < sizeof($givepaymentList); $i++) {
			$givepayment = $givepaymentList[$i];
			?>
		

		       
		        
		        <td><?php echo $givepayment->getownerEmail(); ?></td>
                <td><?php echo $givepayment->getflatno(); ?></td>
			    <td><?php echo $givepayment->getrenterEmail(); ?></td>
			    <td><?php echo $givepayment->getmonth(); ?></td>
			    <td><?php echo $givepayment->getdate(); ?></td>
			    <td><?php echo $givepayment->gethouse(); ?></td>
			    <td><?php echo $givepayment->getpayment(); ?></td>
			    
			    
			   
			    
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

