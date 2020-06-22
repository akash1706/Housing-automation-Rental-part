<?php

include_once 'blade/view.user_new.blade.inc';
include_once COMMON.'class.common.inc';

?>


<div class="panel panel-default">

	<script type="text/javascript">



		function validatePassword(){

		var password = document.getElementById("txtPassword"); 
		var confirm_password = document.getElementById("txtConfirmPassword");

	
		  if(password.value != confirm_password.value) {
		    confirm_password.setCustomValidity("Passwords Don't Match");
		  } else {
		    confirm_password.setCustomValidity('');
		  }
		}


	</script>
    
    <div class="panel-heading">Apply To Be a New User</div>
    
    <div class="panel-body">

	<div id="form">
		<form method="post" class="form-horizontal">

			
	
			<div class="form-group">
              	<label class="control-label col-sm-4" for="txtFirstName">First Name**:</label>
              	<div class="col-sm-6">  		
				<input type="text" name="txtFirstName" class="form-control" placeholder="First Name" required/>
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="txtMiddleName">Middle Name:</label>
              	<div class="col-sm-6">  		
				<input type="text" name="txtMiddleName" class="form-control" placeholder="Middle Name"/>
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="txtLastName">Last Name**:</label>
              	<div class="col-sm-6">	
				<input type="text" name="txtLastName" class="form-control" placeholder="Last Name" required/>
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="txtEmail">Email**:</label>
              	<div class="col-sm-6">
			  	<input type="email" name="txtEmail" class="form-control" placeholder="Email Address" required/>

			  	</div>
			</div>
			
			<div class="form-group">
              	<label class="control-label col-sm-4" for="txtPassword">Password**:</label>
              	<div class="col-sm-6">  		
				<input type="password" id="txtPassword" name="txtPassword" class="form-control" placeholder="Password" 
					onchange="validatePassword()" required/>
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="txtConfirmPassword">Confirm Password**:</label>
              	<div class="col-sm-6">  		
				<input type="password" id="txtConfirmPassword" name="txtConfirmPassword" class="form-control" placeholder="Re-enter Password" 
					onchange="validatePassword()" 
					 required/>
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="assignedRoles">Assigned Roles:</label>
              	<div class="col-sm-6">		
						   
						    <?php
						    // this block of code prints the list box of roles with current assigned  roles

						    $var = '<select name="assignedRoles[]" class="form-control" id="select-from-roles" multiple>';
							$Result = $_RoleBAO->getAllRoles();
								//if DAO access is successful to load all the Roles then show them one by one
							if($Result->getIsSuccess()){

								$Roles = $Result->getResultObject();
							
						       for ($i=0; $i < sizeof($Roles); $i++) { 
						       		
						       		$Role = $Roles[$i];
						    
						    		$var = $var. '<option value="'.$Role->getID().'"';   			

						       		if(isset($_GET['edit']) && isRoleAvailable($Role,$globalUser->getRoles())) {
						          		$var = $var.' selected="selected"';
						          	} 

						          	$var = $var.'>'.$Role->getName().'</option>';
					
								}

								$var = $var.'</select>';
							}
							echo $var;
							?>	
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

