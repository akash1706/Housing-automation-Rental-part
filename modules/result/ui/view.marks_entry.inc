<?php
include_once COMMON.'class.common.course.inc';
include_once COMMON.'class.common.user.inc';
include_once COMMON.'class.common.inc';
include_once 'blade/view.marks_entry.blade.inc';

//course status evolve: pending, submitted, approved/rejected, registered, passed/failed
?>

<div class="panel  panel-default">
<div class="panel-heading"><strong>Coursewise Marks Update</strong></div>
<div class="panel-body">
	<div id="form">
		<form method="post" name="form1" class="form-horizontal">

			<div class="form-group">
          	<label class="control-label col-sm-4" for="CourseID">Course Name:</label>
			 	<div class="col-sm-6">	
							<?php
                                $Result = $_CourseTeacherBAO->getAllOfMyCourses($CourseTeacher);
							if ($Result->getIsSuccess())
							{
								$CourseTeachers = $Result->getResultObject();							}
							?>
							<select name="CourseID" class="form-control" style="width:170px">
								<?php
								for ($i = 0; $i<sizeof($CourseTeachers); $i++){
									$CourseTeacher = $CourseTeachers[$i];

									if (isset($_POST['CourseID'])){

										if ($_POST['CourseID'] == $CourseTeacher->getCourse()->getCourseNo()){
											?>
											<option selected value = "<?php echo $CourseTeacher->getCourse()->getID();?>" > <?php echo $CourseTeacher->getCourse()->getTitle();?> 
											</option>
											<?php
										}
										else {

											?>
											<option value="<?php echo $CourseTeacher->getCourse()->getID();?>" > <?php echo $CourseTeacher->getCourse()->getTitle(); ?> 
											</option>
											<?php
										}
									}	
									else {

											?>
											<option value="<?php echo $CourseTeacher->getCourse()->getID();?>" > <?php echo $CourseTeacher->getCourse()->getTitle();?> 
											</option>
											<?php
									}	
								
								}
								?>	
							</select>
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
              	<div class="col-sm-6">	

						<button type="submit" name="load_marks">Load Marks</button>
	
				</div>
              	<div class=" col-sm-6">	

						<button type="submit" name="save_marks">Save Marks</button>
	
				</div>
			</div>
			<div class="form-group">
              	<div class=" col-sm-6">	

						<button type="submit" class="btn btn-info" onclick="window.open('marks_shit.php?print=true&&session=<?php
							if(isset($Print_Session)) echo $Print_Session->getID();?>&&CourseID=<?php
							if(isset($Course)) echo $Course->getID();?>&&year=<?php 
							if(isset($Print_Year))echo $Print_Year->getID();?>&&term=<?php 
							if(isset($Print_Term))echo $Print_Term->getID();?>')" 
			>
			Print Marks
			</button> 
	
				</div>
              	<div class=" col-sm-6">	

						<button type="submit" name="delete_marks" onclick="return confirm('Sure to delete! All the marks from the database for this registration will be deleted?'); ">Delete Marks</button>
	
				</div>

			</div>              		
			<div class="form-group">
              	<div class="col-sm-12">	

						<button type="submit" name="publish_marks">Publish Marks</button>
	
				</div>

			</div> 
		 <!--/form-->	
	</div>

</div>

<div>
<div><strong>Currently Registered Students</strong></div> 
<table class="table table-bordered">
<div>
		<!--form method="post" name="form2" class="form-horizontal"-->
<?php
	//searching the marks entry in the result list that match student id

	if(isset($Result_Course_Students) && isset($Result_Marks_Setup)&&isset($Result_Grade_Setup))
	{
		$StudentIDList=null;
		$CourseStudentRegistrations = $Result_Course_Students->getResultObject();

		for($i = 0; $i < sizeof($CourseStudentRegistrations); $i++) {
			$CourseStudentRegistration = $CourseStudentRegistrations[$i];
			$StudentIDList[] = $CourseStudentRegistration->getStudent()->getUniversityID();
		}

		$MarksSetup = $Result_Marks_Setup->getResultObject(); //marks setup
		$MarksEntryList= $Result_Course_Student_Marks->getResultObject(); //all student registered
		$GradeSetup = $Result_Grade_Setup->getResultObject(); //grade distribution setup
		$RetakeGradeSetup = $Retake_Grade_Setup->getResultObject(); //retake grade distribution setup


		$MarksHeaderID= $MarksSetup->getHeaderID(); //getting header id
		$MarksHeaderName= $MarksSetup->getHeaderName(); //header name
		$MarksHeaderMax= $MarksSetup->getHeaderMax(); //maximum heade value


		
		$HeaderIDList = explode(",",$MarksHeaderID); //getting header ids
		$HeaderList = explode(",",$MarksHeaderName); //getting header names
		$HeaderMaxList = explode(",",$MarksHeaderMax); //getting header maxs


//normal grade
		$Grades = $GradeSetup->getGrades();
		$GradeRanges= $GradeSetup->getRanges();
		$CgpaRanges=$GradeSetup->getCgpa();

		$GradeList = explode(",",$Grades); //getting grades
		$GradeRangesList=explode(",",$GradeRanges); //getting grade ranges
		$CgpaRangesList=explode(",", $CgpaRanges);

		//retake
		$RetakeGrades = $RetakeGradeSetup->getGrades();
		$RetakeGradeRanges= $RetakeGradeSetup->getRanges();
		$RetakeCgpaRanges=$RetakeGradeSetup->getCgpa();

		$RetakeGradeList = explode(",",$RetakeGrades); //getting grades
		$RetakeGradeRangesList=explode(",",$RetakeGradeRanges); //getting grade ranges
		$RetakeCgpaRangesList=explode(",", $RetakeCgpaRanges);

		?>
		
		<input type="hidden" name="all_header_id" value="<?php echo $MarksHeaderID; ?>" />
		<input type="hidden" name="all_header_name" value="<?php echo $MarksHeaderName; ?>" />
		<input type="hidden" name="all_header_max" value="<?php echo $MarksHeaderMax; ?>" />
		<input type="hidden" name="all_grades" value="<?php echo $Grades; ?>" />
		<input type="hidden" name="all_grade_ranges" value="<?php echo $GradeRanges; ?>" />
		

		<input type="hidden" name="marks_id" value="<?php echo $MarksSetup->getID(); ?>" />
		<?php
		if(sizeof($StudentIDList)>0)
		{?>
		<input type="hidden" name="all_students" value="<?php echo implode(",",$StudentIDList ); ?>"/>
	    <?php }?>
		<tr>

			<th>University ID</th>
			<th>Name</th>
		
		<?php
		for ($i=0; $i < sizeof($HeaderList) ; $i++) { 
				$Header = $HeaderList[$i];
				$HeaderMax = $HeaderMaxList[$i];
				echo '<th>'.$Header.' ('.$HeaderMax.')</th>';
			}
		?>	
			<th>Total</th>
			<th>Grade</th>
			<th>Grade Point</th>
			<th>Is Retake</th>
		</tr>
		<?php 
		for($i = 0; $i < sizeof($CourseStudentRegistrations); $i++) {
			$CourseStudentRegistration = $CourseStudentRegistrations[$i];
			$StudentID = $CourseStudentRegistration->getStudent()->getUniversityID();
			$StudentEmail = $CourseStudentRegistration->getStudent()->getID();
			$MarksEntry = findMarksEntry($MarksEntryList,$StudentID);//marks entry, marks value
			$TotalMarks = sumMarks($MarksEntry); // sum of all the marks
			$IsRetake=$_MarksEntryBAO->checkPreRetake($StudentID,$CourseID);
;

			?>
			<tr>

				<td>
				<input type="text" name="<?php echo $StudentID.'[\'0\']'; ?>" 
						value="<?php echo $StudentID; ?>" size="8" readonly/>
				</td>
				<td><?php echo $CourseStudentRegistration->getStudent()->getFullName()
				.' ('.$StudentEmail.')'; ?> 
				</td>

				<?php	for ($j=0; $j < sizeof($HeaderList) ; $j++) {
						$HeaderID= $HeaderIDList[$j]; 
						echo '<td><input type="text" name="'.$StudentID.'[\''.($j+1).'\']" 
							  value="'.findMarks($MarksEntry, $HeaderID).'" size="3"	/></td>';
					}
				?>

				<td><input type="text" name="<?php echo $StudentID.'[\''.(sizeof($HeaderList)+1).'\']'; ?>" 
						value="<?php echo $TotalMarks; ?>" size="3" readonly/>
				</td>
				<td><input type="text" name="<?php echo $StudentID.'[\''.(sizeof($HeaderList)+2).'\']'; ?>" 
						value="<?php
						if($IsRetake)
						 echo findGrade($TotalMarks, $RetakeGradeRangesList, $RetakeGradeList);
						else
						 echo findGrade($TotalMarks, $GradeRangesList, $GradeList); 
						 ?>" 
						size="3"
						readonly/>
				</td>
				<td><input type="text" name="<?php echo $StudentID.'[\''.(sizeof($HeaderList)+3).'\']'; ?>" 
						value="<?php
						if($IsRetake)
						echo findGradePoint($TotalMarks, $RetakeGradeRangesList, $RetakeCgpaRangesList);
						else
						 echo findGradePoint($TotalMarks, $GradeRangesList, $CgpaRangesList); ?>" 
						size="3"
						readonly/>
				</td>
				<td>
					<?php
					if($IsRetake)
					{
						echo "Retake";
					}
					else
					{
						echo "";
					}
					?>
				</td>	
			</tr>
			<?php

		}

	}
	else{

	echo 'No students to display!';
	}

?>
</form>
</table>
</div>

</div>
