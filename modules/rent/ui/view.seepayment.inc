
<?php

//include_once 'blade/view.sells.blade.inc';
include_once COMMON.'class.common.inc';
//include_once MODULES_RENT.'blade/bao/class.seepaymentbao.inc';
include_once MODULES_RENT.'ui/blade/view.seepayment.blade.inc';
//include_once MODULES_RENT.'bao/class.seepaymentbao.inc';
include_once COMMON.'class.common.rent.inc';
//include_once COMMON.'class.common.inc';
include_once MODULES_USER.'ui/blade/view.user_details.blade.inc';


?>

 <div class="panel-body">

	<div id="form">
		<form method="post" class="form-horizontal" >
			<div class="form-group">
              <label class="control-label col-sm-4" for="email"> email :</label>
              	<div class="col-sm-6">
              		<input type="email" name="email" class="form-control" id="email" value="<?php echo $userPositions->getEmail(); ?>" readonly/>
              	</div>

              		
				<label class="control-label col-sm-4" for="month"> month :</label>
              	<div class="col-sm-6">				    
						<select name="month" class="form-control" id="month" required>
							<option selected disabled>select ur month</option>
							<option value="january">january</option>
							<option value="february">february</option>
							<option value="march">march</option>
							<option value="april">april</option>
							<option value="may">may</option>
							<option value="june">june</option>
							<option value="july">july</option>
							<option value="august">august</option>
							<option value="september">september</option>
							<option value="october">october</option>
							<option value="november">november</option>
							<option value="december">december</option>
						</select>	
				</div>
			</div>
			<div class="form-group">        
              <div class="col-sm-offset-2 col-sm-10">
       
		<input type = "submit" /><br>
          
			    </div>
            </div> 
		</form>
	</div>
</div>


	<div class="panel-body">

	<table class="table table-bordered">
	<?php
	if (isset($_GET['submit'])) {
		 //$email= $userPositions->GETEmail();
     $_seepaymentBAO;
	$_seepaymentBAO=new seepaymentBAO();
    $month=$_GET['month'];
	$email=$_GET['email'];
	echo "$month";
	$Result = $_seepaymentBAO->searchseepayments($email,$month);
	//header("Location:".PageUtil::$SEEPAYMENT);

	//if DAO access is successful to load all the users then show them one by one
	if($Result->getIsSuccess()){

		$seepaymentList = $Result->getResultObject(); 
		?>

	<?php
		for($i = 0; $i < sizeof($seepaymentList); $i++) {
			$seepayment = $seepaymentList[$i];
			?>
		<tr>
			<th>serial</th>
           <th> flatno</th>
           <th> renterEmail</th>
            <th>date</th>
            <th>month</th>
            <th>payment</th>
           <th>statas</th>
		</tr>

		       
		        
		        <td><?php echo $seepayment->getsl(); ?></td>
                <td><?php echo $seepayment->getflatno(); ?></td>
			    <td><?php echo $seepayment->getrenterEmail(); ?></td>
			    <td><?php echo $seepayment->getdate(); ?></td>
			    <td><?php echo $seepayment->getmonth(); ?></td>
			    <td><?php echo $seepayment->getpayment(); ?></td>
			    <td><?php echo $seepayment->getstatas(); ?></td>
			    
			    <td>
			    <a href="?approve=<?php echo $seepayment->getsl(); ?>" onclick="return confirm('sure to approve !'); " >approve</a>
			    </td>
			    <td>
			    <a href="?reject=<?php echo $seepayment->getsl(); ?>" onclick="return confirm('sure to reject !'); " >reject</a>
			    </td>
			    <td>
			    <a href="?del=<?php echo $seepayment->getsl(); ?>" onclick="return confirm('sure to delete !'); " >delete</a>
			    </td>
		    </tr>
	    <?php

		}
      }
	}
	else if(!isset($_GET['submit'])){
      $email= $userPositions->getEmail();
     $_seepaymentBAO;
	$_seepaymentBAO=new seepaymentBAO();

	$Result = $_seepaymentBAO->getAllseepayments($email);

	//if DAO access is successful to load all the users then show them one by one
	if($Result->getIsSuccess()){

		$seepaymentList = $Result->getResultObject();

	?>

	<?php
		for($i = 0; $i < sizeof($seepaymentList); $i++) {
			$seepayment = $seepaymentList[$i];
			?>
		<tr>
			<th>serial</th>
           <th> flatno</th>
           <th> renterEmail</th>
            <th>date</th>
            <th>month</th>
            <th>payment</th>
           <th>statas</th>
		</tr>

		       
		        
		        <td><?php echo $seepayment->getsl(); ?></td>
                <td><?php echo $seepayment->getflatno(); ?></td>
			    <td><?php echo $seepayment->getrenterEmail(); ?></td>
			    <td><?php echo $seepayment->getdate(); ?></td>
			    <td><?php echo $seepayment->getmonth(); ?></td>
			    <td><?php echo $seepayment->getpayment(); ?></td>
			    <td><?php echo $seepayment->getstatas(); ?></td>
			    
			    <td>
			    <a href="?approve=<?php echo $seepayment->getsl(); ?>" onclick="return confirm('sure to approve !'); " >approve</a>
			    </td>
			    <td>
			    <a href="?reject=<?php echo $seepayment->getsl(); ?>" onclick="return confirm('sure to reject !'); " >reject</a>
			    </td>
			    <td>
			    <a href="?del=<?php echo $seepayment->getsl(); ?>" onclick="return confirm('sure to delete !'); " >delete</a>
			    </td>
		    </tr>
	    <?php

		}
     }
 }
	
	

	?>
	</table>
	</div>