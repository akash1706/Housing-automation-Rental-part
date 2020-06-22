<?php

include_once 'blade/view.task_category.blade.inc';


?>

<div class="panel panel-default">
    
    <div class="panel-heading">Task Category</div>
    
    <div class="panel-body">

	<div id="form">
		<form method="post" class="form-horizontal">
				
				<div class="form-group">
              	<label class="control-label col-sm-2" for="categoryName">Category Name:</label>
              	<div class="col-sm-10"> 
				<input type="text" name="categoryName" placeholder="Category Name" required autofocus value="<?php 
					if(isset($_GET['edit'])) echo $Task_Category->getCategory();  ?>" />
				</div>
				</div>
		        <div class="form-group">        
	              <div class="col-sm-offset-2 col-sm-10">	
						<?php
						if(isset($_GET['edit']))
						{
							?>
							<button type="submit" name="update">update</button>
							<?php
						}
						else
						{
							?>
							<button type="submit" name="save">save</button>
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
	
	
	$Result = $_CategoryBAO->getAllCategory();

	//if DAO access is successful to load all the Roles then show them one by one
	if($Result->getIsSuccess()){

		$Categories = $Result->getResultObject();
	?>
		<tr>
			<th>Task Category</th>
		</tr>
		<?php
		for($i = 0; $i < sizeof($Categories); $i++) {
			$Category = $Categories[$i];
			?>
		    <tr>
			    <td><?php echo $Category->getCategory(); ?></td>
			    <td><a href="?edit=<?php echo $Category->getID(); ?>&&name=<?php echo $Category->getCategory(); ?>" onclick="return confirm('sure to edit !'); " >edit</a></td>
			    <td><a href="?del=<?php echo $Category->getID(); ?>" onclick="return confirm('sure to delete !'); " >delete</a></td>
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
