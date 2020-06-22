<?php
include_once COMMON.'class.common.course.inc';
include_once COMMON.'class.common.result.inc';
include_once COMMON.'class.common.user.inc';
include_once COMMON.'class.common.inc';
include_once 'blade/view.students_result_sheet.blade.inc';

?>
<div class="container-fluid">
<h1 class="text-center">KHULNA UNIVERSITY</h1>
<h6>&nbsp;</h6>
<h4 class="text-center">STUDENT-WISE TABULATION SHEET</h4>

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
		<strong>Student No: </strong>
		<?php if(isset($Print_StudentID)) echo $Print_StudentID->getUniversityID();?>
	</div>
	<div class="col-sm-6">
		<strong>Student Name: </strong>
		<?php if(isset($Print_StudentID)) echo $Print_StudentID->getFullName();?>
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
<h1></h1>
<table class="table table-bordered">
	<thead>
<?php
	//searching the marks entry in the result list that match student id

	if(isset($Result_Course_Students))
	{
		$CourseStudentRegistrations = $Result_Course_Students->getResultObject();

		for($i = 0; $i < sizeof($CourseStudentRegistrations); $i++) {
			$CourseStudentRegistration = $CourseStudentRegistrations[$i];
		}	

		?>
		
		<tr>
			<th>Course No</th>		
			<th>Course Title</th>
			<th>Registered Credit Hour</th>
			<th>Letter Grade</th>
			<th>Grade Point(GP)</th>
			<th>Earned Credit Hours CH</th>
			<th>Earned Credit Points (GPxCH)</th>
			<th>Remarks</th>
		</tr>
		</thead>
		<tbody>
		<?php 
		for($i = 0; $i < sizeof($CourseStudentRegistrations); $i++) {
			$CourseStudentRegistration = $CourseStudentRegistrations[$i];
			
			$CourseID=$CourseStudentRegistration->getCourse()->getID();
			$CourseNo=$CourseStudentRegistration->getCourse()->getCourseNo();
			$CourseTitle=$CourseStudentRegistration->getCourse()->getTitle();
			$CourseCredit=$CourseStudentRegistration->getCourse()->getCredit();

			$LetterGrade="";
			$GradePoint="";
			$EarnedCreditH="0.00";
			$EarnedCreditPoint="0.00";

			$Result_publish_marks=$_MarksEntryBAO->getAStudentCoursePublishedMarks($CourseID,$Session,$Year,$Term,$StudentID);

			if($Result_publish_marks->getIsSuccess())
			{	
			 $StudentsResult = $Result_publish_marks->getResultObject();

			 $LetterGrade=$StudentsResult->getFinalGrade();
			 $GradePoint=$StudentsResult->getGradePoint();
			 //$IsRetake=$StudentsResult->getIsRetake();
		}
		    if($GradePoint>0.00)
		    {
		    	$EarnedCreditH=$CourseCredit;
		    	$EarnedCreditPoint=$EarnedCreditH*$GradePoint;
		    }

			
			$IsRetake=$CourseStudentRegistration->getPreRetake();

			?>
			<tr>

				<td><?php echo $CourseNo; ?></td>
				<td><?php echo $CourseTitle; ?></td>
				<td><?php echo $CourseCredit; ?></td>
				<td><?php echo $LetterGrade; ?></td>
				<td><?php echo $GradePoint; ?></td>
				<td><?php echo $EarnedCreditH; ?></td>
				<td><?php echo $EarnedCreditPoint; ?></td>
				<td><?php
				 if($IsRetake==1)
				 {
				 	echo "Retake";
				 }
				 else
				 {
				 	echo "";
				 }
				 ?></td>

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
<h1></h1>
<div class="row">
	<div class="col-sm-7"><strong><u>Term Assesment</u></strong></div>
	<div class="col-sm-5">Total Earned Credit Hours in all previous Term(s)</div>
</div>
<div class="row">
	<div class="col-sm-7">Total Earned Credit Hours in this Term(TCH)  = </div>
	<div class="col-sm-5">Total Earned Credit points in all previous Term(s)  = </div>
</div>
<div class="row">
	<div class="col-sm-7">Total Registered Credit Hours in this Term  = </div>
	<div class="col-sm-5">Total Earned Credit Hours including this Term(CCH)  = </div>
</div>

<div class="row">
	<div class="col-sm-7">Total Earned Credit Points in this Term(TCP)  = </div>
	<div class="col-sm-5">Total Earned Credit Points including this Term(CCP)  = </div>
</div>

<div class="row">
	<div class="col-sm-7"><strong>TGPA = TCP/TCH  =</strong> </div>
	<div class="col-sm-5"><strong>CGPA = CCP/CCH  =</strong> </div>
</div>
<h1></br></h1>
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

