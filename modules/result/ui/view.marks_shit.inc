<?php
include_once COMMON.'class.common.course.inc';
include_once COMMON.'class.common.result.inc';
include_once COMMON.'class.common.user.inc';
include_once COMMON.'class.common.inc';
include_once 'blade/view.marks_entry.blade.inc';
include_once 'blade/view.marks_shit.blade.inc';
$studentNumber=0;

?>
<div class="container-fluid">
<h1 class="text-center">KHULNA UNIVERSITY</h1>
<h6>&nbsp;</h6>
<h4 class="text-center">COURSE-WISE TABULATION SHEET</h4>

<div class="row mx-5">
	<div class="col-sm-4 ">
		<strong>Year: </strong>
		<?php if(isset($Print_Year)) echo strtoupper($Print_Year->getName());?>
	</div>
	<div class="col-sm-4">
		<strong>Term: </strong>	
		<?php if(isset($Print_Term)) echo strtoupper($Print_Term->getName());?>
	</div>
	<div class="col-sm-4">
		<strong>Session: </strong>
		<?php if(isset($Print_Session)) echo strtoupper($Print_Session->getName()); ?>
	</div>
</div>

<div class="row">
	<div class="col-sm-6">
		<strong>Discipline: </strong>
		<?php if(isset($Print_Student)) echo $Print_Student->getDiscipline()->getName();?>
	</div>
	<div class="col-sm-6">
		<strong>School: </strong>
		<?php if(isset($Print_Student)) echo $Print_Student->getDiscipline()->getSchool()->getName();?>
	</div>
</div>

<div class="row">
	<div class="col-sm-4">
		<strong>Course No: </strong>
		<?php if(isset($Course)) echo $Course->getCourseNo();?>

	</div>
	<div class="col-sm-6">
		<strong>Course Title: </strong>
		    <?php if(isset($Course)) echo $Course->getTitle();?>
	</div>
	<div class="col-sm-2">
		<strong>CH: </strong>
				<?php if(isset($Course)) echo $Course->getCredit();?>
	</div>
</div>
<h1></h1>
<table class="table table-bordered">
	<thead>
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

		$Grades = $GradeSetup->getGrades();
		$GradeRanges= $GradeSetup->getRanges();
		$CgpaRanges=$GradeSetup->getCgpa();

		
		$HeaderIDList = explode(",",$MarksHeaderID); //getting header ids
		$HeaderList = explode(",",$MarksHeaderName); //getting header names
		$HeaderMaxList = explode(",",$MarksHeaderMax); //getting header maxs

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
		
		<tr>
			<th>Student No</th>		
		<?php	for ($i=0; $i < sizeof($HeaderList) ; $i++) { 
				$Header = $HeaderList[$i];
				$HeaderMax = $HeaderMaxList[$i];
				echo '<th>'.$Header.' ('.$HeaderMax.')</th>';
			}
		?>
			<th>Total Marks</th>
			<th>Letter Grade</th>
			<th>Grade Point</th>
			<th>Remarks</th>
		</tr>
		</thead>
		<tbody>
		<?php 
		   $studentNumber=sizeof($CourseStudentRegistrations);

		for($i = 0; $i < sizeof($CourseStudentRegistrations); $i++) {
			$CourseStudentRegistration = $CourseStudentRegistrations[$i];
			$StudentID = $CourseStudentRegistration->getStudent()->getUniversityID();
			$StudentEmail = $CourseStudentRegistration->getStudent()->getID();
			$MarksEntry = findMarksEntry($MarksEntryList,$StudentID);//marks entry, marks value
			$TotalMarks = sumMarks($MarksEntry); // sum of all the marks
			$IsRetake=$_MarksEntryBAO->checkPreRetake($StudentID,$CourseID);
			//$IsRetake=0;


			?>
			<tr>

				<td>
				<?php echo $StudentID; ?>
				</td>
				<?php	for ($j=0; $j < sizeof($HeaderList) ; $j++) {
						$HeaderID= $HeaderIDList[$j]; 
						echo '<td>'.findMarks($MarksEntry, $HeaderID).'</td>';
					}
				?>

				<td><?php echo $TotalMarks; ?>
				</td>
				<td><?php 
				        if($IsRetake)
						 echo findGrade($TotalMarks, $RetakeGradeRangesList, $RetakeGradeList);
						else
						 echo findGrade($TotalMarks, $GradeRangesList, $GradeList);  ?>
				</td>
				<td><?php 
				if($IsRetake)
						echo findGradePoint($TotalMarks, $RetakeGradeRangesList, $RetakeCgpaRangesList);
						else
						 echo findGradePoint($TotalMarks, $GradeRangesList, $CgpaRangesList); ?></td>
				<td><?php 
				if($IsRetake==1)
				   echo "RETAKE";
				 else 
				   echo ""; ?></td>

			</tr>
			</tbody>
			<?php

		}

	}
	else{

	echo 'No students to display!';
	}

?>
</table>
<p class="mx-10">Number of students : <?php echo $studentNumber ;?></p>
<h1></h1>
<div class="row">
	<div class="col-sm-8">Signature of First Tabulator<br>Date</div>
	<div class="col-sm-4">Signature of First Tabulator<br>Date</div>
</div>
<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-6">Signature of Chairman,Examination Committee<br>Date</div>
	<div class="col-sm-2"></div>
</div>
<h1></h1>
</div>

