<?php

include_once 'blade/view.task_category.blade.inc';
include_once 'blade/view.assign_task.blade.inc';
include_once COMMON.'class.common.inc';

if(!isset($_GET['assignTo'])){
?>

<div class="panel panel-default">
    
    <div class="panel-heading">Task Information</div>
    
    <div class="panel-body">

	<div id="form">
		<form method="post" class="form-horizontal" enctype="multipart/form-data">

			<div class="form-group">
              	<label class="control-label col-sm-4" for="taskName">Task Name:</label>
              	<div class="col-sm-6">
              	<input type="text" name="taskName" class="form-control" placeholder="Task Name" required autofocus value="<?php 
					if(isset($_GET['editTask'])) echo $_Task->getTitle();  ?>" />
			  	</div>
			</div>			
			  
			<div class="form-group">
              	<label class="control-label col-sm-4" for="date">Date:</label>
              	<div class="col-sm-6">
			  	<input type="date" name="date" class="form-control" placeholder="Date" required
			  	value="<?php if(isset($_GET['editTask'])) echo $_Task->getLastDateOfFinish();  ?>"
			  	/>

			  	</div>
			</div>
			
			

			
			<div class="form-group">
              	<label class="control-label col-sm-4" for="Category">Category:</label>
              	<div class="col-sm-6">	

							
							<?php
							$Result = $_CategoryBAO->getAllCategory();
							
								$CategoryList = $Result->getResultObject();					
							?>
							<select name="Category" class="form-control" 
							required autofocus readonly>
								<option selected disabled>Select Category</option>
								<?php
								for ($i = 0; $i<sizeof($CategoryList); $i++){
									$Category = $CategoryList[$i];
									?>
									<?php
										
										if ($_Task->getCategory() == $Category->getCategory() ){
											?>
											<option selected value = "<?php echo $Category->getCategory();?>" > <?php echo $Category->getCategory();?> 
											</option>
											<?php
										}
										else {

											?>
											<option value="<?php echo $Category->getCategory();?>" > <?php echo $Category->getCategory(); ?> 
											</option>
											<?php
										}	
									
								}
								?>	
							</select>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-4" for="fileToUpload">Select a File
					
				</label>
				<div class="col-sm-6">

				<input type="file" name="fileToUpload" id="fileToUpload">
					
				</div>

			</div>


			<div class="form-group">
              	<label class="control-label col-sm-4" for="taskDetails">Task Details:</label>
              	<div class="col-sm-6">
              	<textarea name="taskDetails" rows="4" cols="26" class="form-control" placeholder="Details" required >

              	<?php 
					if(isset($_GET['editTask'])) echo $_Task->getDetails();  ?>
              		
              	</textarea>
			  	</div>
			</div>	


			
			<div class="form-group">        
              <div class="col-sm-offset-2 col-sm-10">	
						<?php
						if(isset($_GET['editTask']))
						{
							?>
							<button type="submit" name="updateTask" onclick="validTask()">update</button>
							<?php
						}
						else
						{
							?>
							<button type="submit" name="addTask" onclick="validTask()">save</button>
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
	
	
	//$Result = $_CategoryBAO->getAllCategory();

	//if DAO access is successful to load all the Roles then show them one by one
	if($my_task->getIsSuccess()){

		$tasks = $my_task->getResultObject();
	?>
		<tr>
			<th>Task Name</th>
			<th>Task Category</th>
			<th>Creation Date</th>
			<th>Finish Date</th>
			<th>Last Update Date</th>
			<th>Progress</th>
		</tr>
		<?php

			

			for($i = 0; $i < sizeof($tasks); $i++) {

			$task = $tasks[$i];

			?>
		    <tr>
			    <td> <?php echo $task->getTitle(); ?></td>
			    <td> <?php echo $task->getCategory(); ?></td>
			    <td> <?php echo $task->getAssignDate(); ?></td>	
			    <td> <?php echo $task->getLastDateOfFinish(); ?></td>
			    <td><?php echo $task->getLastDateOfUpdate();$progress =$task->getProgress();
			     ?></td>
			    <td> 
			    <a class="btn btn-warning" 
			    		 <?php if($progress<=0){?>
			    		disabled
			    		<?php
			    		} 
			    		else{?>
			    			 href="?progressdown=<?php echo $task->getID(); ?>"
			    			<?php
			    			} 
			    			?>

			     >-</a>
			    
			    <progress style="height:30px; vertical-align: middle; margin-left: 1px; " value="<?php 
			    				echo  $progress;
			    				?>" max="10">
							</progress>
							

							<a class="btn btn-success"
			    		<?php if($progress>=10){?>
			    				disabled
			    				<?php
			    				}
			    				else{?>
			    					 href="?progressup=<?php echo $task->getID(); ?>"
			    				<?php
			    				} 

			    				?>

			    			 >+</a>


				</td>	
			     <td><a href="?editTask=<?php echo $task->getID(); ?>" onclick="return confirm('sure to edit !'); " >edit</a></td>
			    <td><a href="?deleteTask=<?php echo $task->getID(); ?>" onclick="return confirm('sure to delete !'); " >delete</a></td>
			     <td><a href="?assignTo=<?php echo $task->getID(); ?>" >Assign Task</a></td>
			     <td><a href="task_details.php?taskDetails=<?php echo $task->getID(); ?>" >Task Details</a></td>
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
<?php } 
else{

?>

<div class="panel panel-default">
    
    <div class="panel-heading">Assign Task</div>
    
    <div class="panel-body">

	<div id="form">
		<form method="post" class="form-horizontal">
				
			<div class="form-group">
              	<label class="control-label col-sm-4" for="email">Assign To (email):</label>
              	<div class="col-sm-6">
              	<input type="email" id="taskEamil" name="email" class="form-control" placeholder="email" required autofocus onkeyup="showHint(this.value,<?php echo $_GET['assignTo']; ?>)"   />

              	<div>
			  		<p> 
			  			<b>
			  				<span id="txtHint">
			  				
			  				</span>
			  			</b>
			  		</p>
			  	</div>
			  	</div>
			  	
			  	
			  	
			</div> 

			<div class="form-group">
              	<label class="control-label col-sm-4" for="comment">Comment:</label>
              	<div class="col-sm-6">
              	<textarea name="comment" rows="4" cols="26" class="form-control" placeholder="Comment" required >              		
              	</textarea>
			  	</div>
			</div>



		        <div class="form-group">        
	              <div class="col-sm-offset-2 col-sm-10">	
						
							<button type="submit" name="Assign" onclick="validTask()">Assign</button>
							
				</div>
				</div>		

		</form>

	</div>
	</div>


	<?php } ?>


	