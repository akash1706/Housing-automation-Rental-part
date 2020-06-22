<?php

include_once 'blade/view.user.blade.inc';
include_once COMMON.'class.common.inc';

?>

<div class="panel panel-default">
    
    <div class="panel-heading">User Information</div>
    
    <div class="panel-body">

	<div id="form">
		<form method="post" class="form-horizontal">

			
			  
			<div class="form-group">
              	<label class="control-label col-sm-4" for="txtEmail">Email:</label>
              	<div class="col-sm-6">
			  	<input type="email" name="txtEmail" class="form-control" placeholder="Email Address" value="<?php 
					if(isset($_GET['edit'])) echo $globalUser->getEmail();  ?>" required/>

			  	</div>
			</div>
			
			<div class="form-group">
              	<label class="control-label col-sm-4" for="txtPassword">Password:</label>
              	<div class="col-sm-6">  		
				<input type="password" name="txtPassword" class="form-control" placeholder="Don't update to keep the last password"/>
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="txtFirstName">First Name:</label>
              	<div class="col-sm-6">  		
				<input type="text" name="txtFirstName" class="form-control" placeholder="First Name" 
				value="<?php 
					if(isset($_GET['edit'])) echo $globalUser->getFirstName();  ?>" 
				required/>
				</div>
			</div>


			<div class="form-group">
              	<label class="control-label col-sm-4" for="txtMiddleName">Middle Name:</label>
              	<div class="col-sm-6">  		
				<input type="text" name="txtMiddleName" class="form-control" placeholder="Middle Name"
				value="<?php 
					if(isset($_GET['edit'])) echo $globalUser->getMiddleName();  ?>"
				/>
				</div>
			</div>

			<div class="form-group">
              	<label class="control-label col-sm-4" for="txtLastName">Last Name:</label>
              	<div class="col-sm-6">	
				<input type="text" name="txtLastName" class="form-control" placeholder="Last Name" value="<?php 
					if(isset($_GET['edit'])) echo $globalUser->getLastName();  ?>" required/>
				</div>
			</div>

            <div class="form-group">
              	<label class="control-label col-sm-4" for="company">Company:</label>
              	<div class="col-sm-6">	

							<select name="company" class="form-control" required>

								<option selected disabled>Select Company</option>
								<option value="<?php 
					if(isset($_GET['edit'])) echo"Akash Housing"; 
					else echo"Akash Housing";  ?>">Akash Housing</option>
								<option value="<?php 
					if(isset($_GET['edit'])) echo"Asif Housing"; 
					else echo"Asif Housing";  ?>">Asif Housing</option>
							</select>
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
    
						<?php
						if(isset($_GET['edit']))
						{
							?>
							<button type="submit" value="update" name="update">update</button>
							<?php
						}
						else
						{
							?>
							<button type="submit" value="save" name="save">save</button>
							<?php
						}
						?>
			    </div>
            </div> 
		</form>

	</div>
	</div>

	<div class="panel-body">

	<table class="table table-bordered">
	<?php
	
	
	$Result = $_UserBAO->getAllUsers();

	//if DAO access is successful to load all the users then show them one by one
	if($Result->getIsSuccess()){

		$UserList = $Result->getResultObject();
	?>
		<tr>
			
			<th>Email</th>
			<th>First Name</th>
			<th>Middle Name</th>
			<th>Last Name</th>
			<th>position</th>
			<th>Company</th>
			<th>Status</th>
		</tr>
		<?php
		for($i = 0; $i < sizeof($UserList); $i++) {
			$User = $UserList[$i];
			?>
		    <tr>
			    
			    <td><?php echo $User->getEmail(); ?></td>
			    <td><?php echo $User->getFirstName(); ?></td>
			    <td><?php echo $User->getMiddleName(); ?></td>
			    <td><?php echo $User->getLastName(); ?></td>
			    <td><?php echo $User->getRoles(); ?>	</td>
			    
			    <td><?php echo $User->getcompany(); ?> </td>
			    <td><?php echo $User->getStatus(); ?></td>
			    <td>
			    <a href="?edit=<?php echo $User->getID(); ?>" onclick="return confirm('sure to edit !'); " >edit</a>
			    </td>
			    <td>
			    <a href="?approve=<?php echo $User->getID(); ?>" onclick="return confirm('sure to approve !'); " >approve</a>
			    </td>
			    <td>
			    <a href="?reject=<?php echo $User->getID(); ?>" onclick="return confirm('sure to reject !'); " >reject</a>
			    </td>
			    <td>
			    <a href="?del=<?php echo $User->getID(); ?>" onclick="return confirm('sure to delete !'); " >delete</a>
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

