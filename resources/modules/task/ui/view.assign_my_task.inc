<?php

include_once 'blade/view.task_category.blade.inc';
include_once 'blade/view.assign_my_task.blade.inc';
include_once COMMON.'class.common.inc';

?>

<div class="panel panel-default">
    
    <div class="panel-heading">Task Information</div>
    
    <div class="panel-body">

	<div id="form">
		<form method="post" class="form-horizontal">

			<div class="form-group">
              	<label class="control-label col-sm-4" for="taskName">Task Name:</label>
              	<div class="col-sm-6">
              	<input type="text" name="taskName" class="form-control" placeholder="Task Name" />
			  	</div>
			</div>
			  
			<div class="form-group">
              	<label class="control-label col-sm-4" for="date">Date:</label>
              	<div class="col-sm-6">
			  	<input type="date" name="date" class="form-control" placeholder="Date" required/>

			  	</div>
			</div>
			
			

			
			<div class="form-group">
              	<label class="control-label col-sm-4" for="Category">Category:</label>
              	<div class="col-sm-6">	

							
							<?php
							$Result = $_CategoryBAO->getAllCategory();
							
								$CategoryList = $Result->getResultObject();					
							?>
							<select name="Category" class="form-control" required>
								<option selected disabled>Select Category</option>
								<?php
								for ($i = 0; $i<sizeof($CategoryList); $i++){
									$Category = $CategoryList[$i];
									?>								
										
										<option value="<?php echo $Category->getCategory();?>" > <?php echo $Category->getCategory(); ?> 
										</option>
										<?php
										}	
									
								?>	
							</select>
				</div>
			</div>


			<div class="form-group">
              	<label class="control-label col-sm-4" for="taskDetails">Task Details:</label>
              	<div class="col-sm-6">
              	<textarea name="taskDetails" rows="4" cols="26" class="form-control" placeholder="Details" required></textarea>
			  	</div>
			</div>	


			
			<div class="form-group">        
              <div class="col-sm-offset-2 col-sm-9">

              <button type="submit" value="addTask" name="addTask">Add Task</button>
    
						
			    </div>
            </div> 
		</form>

	</div>
	</div>

	