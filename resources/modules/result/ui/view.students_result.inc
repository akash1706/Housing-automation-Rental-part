<?php
include_once COMMON.'class.common.course.inc';
include_once COMMON.'class.common.user.inc';
include_once COMMON.'class.common.inc';
include_once 'blade/view.students_result.blade.inc';

//course status evolve: pending, submitted, approved/rejected, registered, passed/failed
?>

<div class="panel panel-default">
	<div class="panel-heading"><strong>Studentwise Marks Update</strong></div>
	<div class="panel-body">
		<div id="form">
			<form method="get" target="_blank" action="students_result_sheet.php" class="form-horizontal">
				<input type="hidden" name="print" value="true">
				<div class="form-group">
					<label class="control-label col-sm-4" for="txtStudentId">Student Id:</label>
					<div class="col-sm-6">       
						<input type="text" name="txtStudentId" class="form-control"  placeholder="020202"
						value="<?php if(isset($_POST['txtStudentId'])) echo $_POST['txtStudentId']; ?>"required/>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-4" for="session">Session:</label>
					<div class="col-sm-6">	

						<?php
						$Result = $_RegistrationSessionBAO->getAllRegistrationSessions();
						if ($Result->getIsSuccess())
							$SessionList = $Result->getResultObject();					
						?>
						<select name="session" class="form-control" style="width:170px">
							<?php
							for ($i = 0; $i<sizeof($SessionList); $i++){
								$Session = $SessionList[$i];

								if (isset($_POST['session'])){

									if ($_POST['session'] == $Session->getID() ){
										?>
										<option selected value = "<?php echo $Session->getID();?>" > <?php echo $Session->getName();?> 
									</option>
									<?php
								}
								else {

									?>
									<option value="<?php echo $Session->getID();?>" > <?php echo $Session->getName(); ?> 
								</option>
								<?php
							}
						}	
						else {

							?>
							<option value="<?php echo $Session->getID();?>" > <?php echo $Session->getName(); ?> 
						</option>
						<?php
					}	

				}
				?>	
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-4" for="year">Year:</label>
		<div class="col-sm-6">	

			<?php
			$Result = $_YearBAO->getAllYears();
			if ($Result->getIsSuccess())
				$YearList = $Result->getResultObject();					
			?>
			<select name="year" class="form-control" style="width:170px">
				<?php
				for ($i = 0; $i<sizeof($YearList); $i++){
					$Year = $YearList[$i];

					if (isset($_POST['year'])){

						if ($_POST['year'] == $Year->getID() ){
							?>
							<option selected value = "<?php echo $Year->getID();?>" > <?php echo $Year->getName();?> 
						</option>
						<?php
					}
					else {

						?>
						<option value="<?php echo $Year->getID();?>" > <?php echo $Year->getName(); ?> 
					</option>
					<?php
				}
			}	
			else {

				?>
				<option value="<?php echo $Year->getID();?>" > <?php echo $Year->getName(); ?> 
			</option>
			<?php
		}	

	}
	?>	
</select>
</div>
</div>	

<div class="form-group">
	<label class="control-label col-sm-4" for="term">Term:</label>
	<div class="col-sm-6">
		<?php
		$Result = $_TermBAO->getAllTerms();
		if ($Result->getIsSuccess())
			$TermList = $Result->getResultObject();					
		?>

		<select name="term" class="form-control" style="width:170px">
			<?php
			for ($i = 0; $i<sizeof($TermList); $i++){
				$Term = $TermList[$i];

				if (isset($_POST['term'])){

					if ($_POST['term'] == $Term->getID() ){
						?>
						<option selected value = "<?php echo $Term->getID();?>" > <?php echo $Term->getName();?> 
					</option>
					<?php
				}
				else {

					?>
					<option value="<?php echo $Term->getID();?>" > <?php echo $Term->getName(); ?> 
				</option>
				<?php
			}
		}	
		else {

			?>
			<option value="<?php echo $Term->getID();?>" > <?php echo $Term->getName(); ?> 
		</option>
		<?php
	}	

}
?>	
</select>
</div>
</div>	

<div class="form-group">
	<div class=" col-sm-6">	
		<button type="submit" name="load_marks" class="btn btn-info">Print Result</button>
	</div>
</div>
</form>
		

