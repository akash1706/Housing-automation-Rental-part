<?php
include_once UTILITY.'class.util.inc';
include_once MODULES_REGISTRATION.'bao/class.coursebao.inc';
include_once MODULES_REGISTRATION.'bao/class.registration_sessionbao.inc';
include_once MODULES_REGISTRATION.'bao/class.yearbao.inc';
include_once MODULES_REGISTRATION.'bao/class.termbao.inc';


$_CourseBAO = new CourseBAO();
$_RegistrationSessionBAO = new RegistrationSessionBAO();
$_YearBAO = new YearBAO();
$_TermBAO = new TermBAO();
$Course = new Course();

$_DB = DBUtil::getInstance();

$Result_Search_Course=null;

$globalUser =null;
$Print_Student=null;
$Print_Session=null;
$Print_Year=null;
$Print_Term=null;
$Print_CourseID=null;


$globalUser = $_SESSION['globalUser'];


if(isset($_GET['print']))
{
    
    $StudentID =  $globalUser->getUniversityID(); //getting current logged students university id

    $Session = $_DB->secureInput($_GET['session']);
    $Year = $_DB->secureInput($_GET['year']);
    $Term = $_DB->secureInput($_GET['term']);
    $CourseID = $_DB->secureInput($_GET['CourseID']);
    
    $Result_Course_Students = $_CourseBAO->searchAllStudents($CourseID,$Session,$Year,$Term);

    if($Result_Course_Students->getIsSuccess())
    {
    //read the marks of the students for this course, session, year, term
    $Result_Course_Student_Marks = $_MarksEntryBAO->getCourseStudentMarks($CourseID,$Session,$Year,$Term,$Result_Course_Students->getResultObject());
    //read the marks setup for this course
    $Result_Marks_Setup = $_MarksEntryBAO->getCourseMarksSetup($CourseID);
    //read default grade
    $Result_Grade_Setup = $_GradeSetupBAO->readDefaultGradeSetup();

    $Retake_Grade_Setup = $_GradeSetupBAO->readRetakeGradeSetup();
 
    if($Result_Course_Students->getIsSuccess()){
  
         
        $Print_Student=$globalUser;

        $Print_Session = new RegistrationSession();
        $Print_Session->setID($Session);
        $Print_Session = $_RegistrationSessionBAO->
                                            readRegistrationSession($Print_Session)->getResultObject();

        $Print_Year = new Year();
        $Print_Year->setID($Year);
        $Print_Year = $_YearBAO->readYear($Print_Year)->getResultObject();

        $Print_Term = new Term();
        $Print_Term->setID($Term);
        $Print_Term = $_TermBAO->readTerm($Print_Term)->getResultObject();


        $Course = new Course();
        $Course->setID($CourseID);
        $Course = $_CourseBAO->readCourse($Course)->getResultObject();


    }
  }
  
    //read all registered students to this course
     
}

?>