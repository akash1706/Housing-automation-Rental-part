<?php 
include_once 'blade/view.task_details.blade.inc';

//print_r($Result);
?>

<div class="panel panel-default">
    
    <div class="panel-heading">Task Information</div>
    
    <div class="panel-body">
<?php

if($Result->getIsSuccess())
{
	$Result = $Result->getResultObject();
	$Task = $Result[0];
	$assign = $Result[1];

	

	?>
	
<h4 style="margin-left: 50px">
	<b>Task Title :</b>
	<?php
	echo $Task->getTitle();
	?>
</h4>

<h4 style="margin-left: 50px">
	<b>Task Category :</b>
	<?php
	echo $Task->getCategory();
	?>
</h4>

<h4 style="margin-left: 50px">
	<b>Creation Date :</b>
	<?php
	echo $Task->getAssignDate();
	?>
</h4>

<h4 style="margin-left: 50px">
	<b>Last Date :</b>
	<?php
	echo $Task->getLastDateOfFinish();
	?>
</h4>

<h4 style="margin-left: 50px">
	<b>Last Updated Date :</b>
	<?php
	echo $Task->getLastDateOfUpdate();
	$progress = $Task->getProgress();
	?>
</h4>

<h4 style="margin-left: 50px">
	<b>Uploaded File:</b>

	
    <?php
	if(empty($Task->getAttachment()))
	{
		echo "N/A";
	}
	else {
		?>
		<a href="<?php echo './resources/task_file/'.$Task->getAttachment(); ?>">Attachment</a>
		<?php
	}
	?>

</h4>




<h4 style="margin-left: 50px">
<b>Prograss :</b>
<a class="btn btn-warning" 
			    		 <?php if($progress<=0){?>
			    		disabled
			    		<?php
			    		} 
			    		else{?>
			    			 href="?progressdown=<?php echo $Task->getID(); ?>"
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
			    					 href="?progressup=<?php echo $Task->getID(); ?>"
			    				<?php
			    				} 

			    				?>

			    			 >+</a>
	
</h4>

<h4 style="margin-left: 50px">
	<b>Details :</b>
	<?php
	echo $Task->getDetails();
	$progress = $Task->getProgress();
	?>
</h4>

<h4 style="margin-left: 50px">
	<b>Creator :</b>
	<?php
	echo $Task->getTaskCreator();
	$progress = $Task->getProgress();
	?>
</h4>



<br>
<hr>
<h4 style="margin-left: 600px">
	<b>All Assign History</b>
</h4>
<hr>


<?php


	 if(sizeof($assign))
	 {?>
	 	<div class="panel-body">


		<table class="table table-bordered">
		<tr>
			<th>Assign By</th>
			<th>Assign To</th>
			<th>Assign Date</th>
			<th>Comment</th>
		</tr>
		<?php

		//print_r($assign);

	 	for($i=0; $i<sizeof($assign); $i++)
	 	{
	 		?>
	 		<tr>

	 		 	<td> <?php echo $assign[$i]->getAssignBy(); ?></td>
			    <td> <?php echo $assign[$i]->getAssignTo(); ?></td>
			    <td> <?php echo $assign[$i]->getDate(); ?></td>	
			    <td> <?php echo $assign[$i]->getComment(); ?></td> 
			</tr>
		<?php

	 	}
	 	?>

	 	</table>
	 	</div>

	 	<?php
	 	
	 }


}



 ?>

 </div>
 </div>
