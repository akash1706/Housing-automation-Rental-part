<?php
include_once COMMON.'class.common.course.inc';
include_once COMMON.'class.common.result.inc';
include_once COMMON.'class.common.user.inc';
include_once COMMON.'class.common.inc';
include_once 'blade/view.print_grade.blade.inc';
include_once 'blade/view.marks_entry.blade.inc';

?>

 <table align="center" width="100%">
      	
      	<tr>
      		<td>
      			
      			<table align="center">
      				<tr>
      					<td> 
      						<table align="center" style="text-align:center">
      							<tr>
      								<td >
      									<h1><strong>KHULNA UNIVERSITY</strong></h1>
      									<h3><strong>BANGLADESH</strong></h3>
      								</td>
      							</tr>
      						</table>
      					</td>
      				</tr>
      				<tr>
      					<td>
      						<table align="center"">
      							<tr>
      								<td >
      						    <img src="resources/img/registration/ku_logo.jpg" height="80" width="60">
      								</td>
      							</tr>
      						</table>
      					</td>
      				</tr>
      				<tr>
      					<td"> 
      						<table align="center"">
      							<tr>
      								<td >
      									<h3><strong>GRADE SHEET</strong></h3>
      								</td>
      							</tr>
      							<tr>
      								<td >
      								</td>
      							</tr>
      						</table>
      					</td>
      				</tr>
      				<tr>
      					<td colspan="2"><br></td>
       				</tr>
      			</table>

      		</td>
      	</tr>

<tr> 
	    	<td>	
	    		<table width="100%" class="about">
	    			<tr>
		        	<td>
			        <strong>Term:</strong>
			       	</td >
			       	<td style="border-bottom: 1px solid black; line-height: 1.8em;text-align: center;"> 		
			        	<strong>
			        		<?php if(isset($Print_Term)) echo strtoupper($Print_Term->getName()); ?>
			        	</strong>		     
			        </td>
		    		<td style="text-align: center;">
			        <strong>Year:</strong>
			    	</td>
			    	<td style="border-bottom: 1px solid black; line-height: 1.8em;text-align: center;">

			        		<strong>
			        		<?php if(isset($Print_Year)) echo strtoupper($Print_Year->getName()); ?>
			        		</strong>
			        
		        	</td>


			    	<td style="text-align: center;">
			        <strong>Session:</strong>
			    	</td>
			    	<td style="border-bottom: 1px solid black; line-height: 1.8em;text-align: center;">
			        		<strong>
			        		<?php if(isset($Print_Session)) echo strtoupper($Print_Session->getName()); ?>
			        		</strong>
			    	</td>
			    	</tr>
			    	<tr>
			    		<td><br></td>	
			    	</tr>	

	    		</table>
	    	</td>
    	</tr>	


	    <tr>
	    	<td>
	    		<table width="100%">
	    			<tr>
	    				<td>
	    					<strong>Student No:</strong>
	    				</td>
	    				<td style="border-bottom: 1px solid black; line-height: 1.8em;text-align: center;"><strong>
	        				<?php 
	        				if(isset($Print_Student)){ 

	        					$student_id = implode('/',str_split(strtoupper($Print_Student->getUniversityID())));
	        					$student_id = implode(array($student_id, '/'));	
	        					$student_id = implode(array('/',$student_id));	
	        					echo  $student_id;
	        					}	

	        				?>
	        				
	        				</strong>
						</td>
						<td style="text-align: center;">
	        				<strong>Student Name:</strong>
	        			</td>
	        			<td style="border-bottom: 1px solid black; line-height: 1.8em;text-align: center;">
	        				<strong>
	        					<?php if(isset($Print_Student)) echo strtoupper($Print_Student->getFirstName());?>
	        					<?php echo " ";?>
	        					<?php if(isset($Print_Student)) 
	        					echo strtoupper($Print_Student->getMiddleName()); 
	        				?>
	        				<?php echo " ";?>
	        				<?php if(isset($Print_Student)) echo strtoupper($Print_Student->getLastName()); ?>
	        				</strong>
	        			</td>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
	    			</tr>
	    			<tr>
	    				<td><br></td>
	    			</tr>	    			
	    		</table>
	    	</td>    	
	    </tr>
	    <tr>
	    	<td>
	    		<table width="100%">
	    			<tr>
				    	<td>
				    		<strong>Discipline:</strong>
				    	</td>
				    	<td style="border-bottom: 1px solid black; line-height: 1.8em;text-align: center;">
				    	<strong>
				    		<?php 

	        				if(isset($Print_Student)){ 

	        						echo $Print_Student->getDiscipline()->getName();
	        					
	        					}	

	        				?>

	        			</strong>

				    	</td>
				    	<td style="text-align: center;">
				    		<strong>School:</strong>
				    	</td>	    				
				    	<td style="border-bottom: 1px solid black; line-height: 1.8em;text-align: center;">
				    	<strong>	
				    	<?php 

	        				if(isset($Print_Student)){ 

	        						echo $Print_Student->getDiscipline()->getSchool()->getName();
	        					
	        					}	

	        				?>
	        			</strong>	

				    	</td>
	    			</tr>
	    			<tr>
	    				<td><br></td>
	    			</tr>
	    			<tr>
	    				<td><br></td>
	    			</tr>
	    			<tr>
	    				<td><br></td>
	    			</tr>
	    		</table>
	    	</td>
	    </tr>
	    <tr>
	    	<td></td>
	    </tr>
    	<tr>
        	<!-- Course List -->
        	<td>
        	<table width="100%" class="courses">
        		<tr>
        			<th style="text-align: center;"><strong>Course No</strong></th>
        			<th style="text-align: center;"><strong>Course Title</strong></th>
        			<th style="text-align: center;"><strong>Credit Hours</strong></th>
        			<th style="text-align: center;"><strong>Letter Grade</strong></th>
        			<th style="text-align: center;"><strong>Grade Point</strong></th>
        		</tr>
			<?php 

			if(isset($_SESSION['Result_Search_Course']))
			{
				$Result_Search_Course = $_SESSION['Result_Search_Course'];
				$CourseStudentRegistrations = $Result_Search_Course->getResultObject();
				
				//have to print fixed number of courses 
				$totalCredit=0;
				$EarnedCredit=0;
				for($i = 0; $i < 11; $i++) {
					
					$CourseStudentRegistration = null;

					if(isset($CourseStudentRegistrations[$i]))
					{
						$CourseStudentRegistration = $CourseStudentRegistrations[$i];
						$CourseID=$CourseStudentRegistration->getCourse()->getID();

						$Result_Course_Student_Marks = $_MarksEntryBAO->getAStudentCourseMarks($CourseID,$Session,$Year,$Term,$StudentID);

                        $Result_Marks_Setup = $_MarksEntryBAO->getCourseMarksSetup($CourseID);
                        $Result_Grade_Setup = $_GradeSetupBAO->readDefaultGradeSetup();
                        $Retake_Grade_Setup = $_GradeSetupBAO->readRetakeGradeSetup();
					}


					if(isset($Result_Course_Student_Marks) && isset($Result_Marks_Setup)){

					$MarksSetup = $Result_Marks_Setup->getResultObject(); //marks setup
		            $MarksEntry= $Result_Course_Student_Marks->getResultObject();

		            if(isset($Result_Grade_Setup))
		            {
		            	$RetakeGradeSetup = $Retake_Grade_Setup->getResultObject(); //retake grade
		                $GradeSetup = $Result_Grade_Setup->getResultObject(); //grade distributionsetup

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

		            }

		            $TotalMarks = sumMarks($MarksEntry); 

		            $IsRetake=$_MarksEntryBAO->checkPreRetake($StudentID,$CourseID);

                   }

				?>
				<tr>
					<td style="text-align: center;">
						<?php 
							if(isset($CourseStudentRegistration))
							 echo strtoupper($CourseStudentRegistration->getCourse()->getCourseNo());
							else
							 echo '<br>';	
						?>
						
					</td>
					<td style="text-align: center;">
						<?php 
							if(isset($CourseStudentRegistration))
							echo strtoupper($CourseStudentRegistration->getCourse()->getTitle()); 
							else
							 echo '<br>';
						?>
						
					</td>
					<td style="text-align: center;">
						<?php 
							if(isset($CourseStudentRegistration)){
							echo strtoupper($CourseStudentRegistration->getCourse()->getCredit()); 
							$Credit =floatval($CourseStudentRegistration->getCourse()->getCredit());
							$totalCredit+=$Credit;
							}
							else
							 echo '<br>';
						?>
						
					</td>
					<td style="text-align: center;">
						<?php
						if(isset($CourseStudentRegistration)&&isset($Result_Course_Student_Marks) && isset($Result_Marks_Setup))
						{
						   if($IsRetake)
						   {
						        $FinalGrade= findGrade($TotalMarks, $RetakeGradeRangesList, $RetakeGradeList);
						   }
						   else
						   {
						   	   $FinalGrade= findGrade($TotalMarks, $GradeRangesList, $GradeList);
						   }						      
						   echo $FinalGrade;

						    if($FinalGrade!='F')
						        $EarnedCredit+=$Credit;
						}
						else
							echo "<br>";
						?>
						</td>
					<td style="text-align: center;">
						<?php
						if(isset($CourseStudentRegistration)&&isset($Result_Course_Student_Marks) && isset($Result_Marks_Setup))
						{
						   if($IsRetake)
						   {
						   	echo findGradePoint($TotalMarks, $RetakeGradeRangesList, $RetakeCgpaRangesList);
						   }
						   else
						   {
						   	echo findGradePoint($TotalMarks, $GradeRangesList, $CgpaRangesList);
						   }
						 
						}
						else
							echo "<br>";
						?></td>
				</tr>
					<?php

				} 

			}
			
			?>

        	</table>
        	</td>
    	</tr>
    	<tr><td><br></td></tr>
    	<tr><td><br></td></tr>
    	<tr>
    		<td>
    			<table>
    					<tr>
    						<td><strong>Registered Credit Hours in this Term =  </strong></td>
    						<td><strong><?php echo $totalCredit; ?></strong>
    					    </td>
    					</tr>
    					<tr>
    						<td><strong>Earned Credit Hours in this Term = </strong></td>
    						<td><strong><?php echo $EarnedCredit; ?></strong>
    					    </td>
    					</tr>
    			</table>
    		</td>
    	</tr>
    	<tr><td><br></td></tr>
    	<tr>
    		<td>
    			<table width="100%">
    					<tr>
    						<td><h5><strong>TGPA =  </strong></h5></td>
    						<td><strong><?php echo ""?></strong>
    					    </td>
    						<td><h5><strong>YGPA =  </strong></h5></td>
    						<td><strong><?php echo ""?></strong>
    					    </td>
    					</tr>
    			</table>
    		</td>
    	</tr>
    	<tr><td><br></td></tr>
    	<tr><td><br></td></tr>
    	<tr><td><br></td></tr>
    	<tr><td><br></td></tr>
    	<tr><td><br></td></tr>
    	<tr><td><br></td></tr>
    	<tr>
    		<td>
    			<table width="100%">
    					<tr>
    						<td><strong>Checked By  </strong></td>
    						<td style="border-bottom: 1px solid black; line-height: 1.8em;text-align: center;">
    							<strong><?php echo ""?></strong>
    					    </td>
    						<td style="text-align: center;"><strong>Controller of Examination (Current-charge) </strong></td>
    					</tr>
    			</table>
    		</td>
    	</tr>
    	<tr><td><br></td></tr>
    	<tr><td><br></td></tr>
</table>
		
