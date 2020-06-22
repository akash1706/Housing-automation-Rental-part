<?php

include_once UTILITY.'class.util.inc';
//depenency with modules
include_once MODULES_RESULT.'bao/class.marks_entrybao.inc';
include_once MODULES_RESULT.'bao/class.grade_setupbao.inc';

include_once MODULES_REGISTRATION.'bao/class.coursebao.inc';
include_once MODULES_REGISTRATION.'bao/class.course_student_registrationbao.inc';
include_once MODULES_REGISTRATION.'bao/class.registration_sessionbao.inc';
include_once MODULES_REGISTRATION.'bao/class.yearbao.inc';
include_once MODULES_REGISTRATION.'bao/class.termbao.inc';
include_once MODULES_USER.'bao/class.disciplinebao.inc'; //depenency with modules
include_once MODULES_USER.'bao/class.userbao.inc';//depenency with modules

$_GradeSetupBAO = new GradeSetupBAO();
$_MarksEntryBAO = new MarksEntryBAO();
$_CourseBAO = new CourseBAO();
$_UserBAO = new UserBAO();
$_RegistrationSessionBAO = new RegistrationSessionBAO();
$_YearBAO = new YearBAO();
$_TermBAO = new TermBAO();
$_CourseStudentRegistrationBAO = new CourseStudentRegistrationBAO();

$_DB = DBUtil::getInstance();

$globalUser =null;
$Result_Course_Students=null;
$Result_Marks_Setup=null;
$Result_Course_Student_Marks=null;
$Result_Grade_Setup=null;

$globalUser = $_SESSION['globalUser'];
    
?>