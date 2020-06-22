<?php

include_once UTILITY.'class.util.inc';
//depenency with modules
include_once MODULES_RESULT.'bao/class.marks_entrybao.inc';
include_once MODULES_RESULT.'bao/class.grade_setupbao.inc';
include_once MODULES_REGISTRATION.'bao/class.coursebao.inc';
include_once MODULES_REGISTRATION.'bao/class.course_student_registrationbao.inc';
include_once MODULES_REGISTRATION.'bao/class.registration_sessionbao.inc';
include_once MODULES_REGISTRATION.'bao/class.course_teacherbao.inc';
include_once MODULES_REGISTRATION.'bao/class.yearbao.inc';
include_once MODULES_REGISTRATION.'bao/class.termbao.inc';
include_once MODULES_USER.'bao/class.disciplinebao.inc'; //depenency with modules
include_once MODULES_USER.'bao/class.userbao.inc';//depenency with modules
//
$_GradeSetupBAO = new GradeSetupBAO();
$_MarksEntryBAO = new MarksEntryBAO();
$_CourseBAO = new CourseBAO();
$_UserBAO = new UserBAO();
$_RegistrationSessionBAO = new RegistrationSessionBAO();
$_YearBAO = new YearBAO();
$_TermBAO = new TermBAO();
$_CourseTeacherBAO = new CourseTeacherBAO();
$_CourseStudentRegistrationBAO = new CourseStudentRegistrationBAO();



$_DB = DBUtil::getInstance();

$globalUser =null;
$Result_Course_Students=null;
$Result_Marks_Setup=null;
$Result_Course_Student_Marks=null;
$Result_Grade_Setup=null;
$Retake_Grade_Setup=null;

$globalUser = $_SESSION['globalUser'];

$CourseTeacher = new CourseTeacher();
$CourseTeacher->setTeacher($globalUser->getID());



if(isset($_POST['load_marks']))
{
  
    $CourseID = $_DB->secureInput($_POST['CourseID']);
    $Session = $_DB->secureInput($_POST['session']);
    $Year = $_DB->secureInput($_POST['year']);
    $Term = $_DB->secureInput($_POST['term']);

    //read all registered students to this course
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

    if($Result_Course_Students->getIsSuccess())
    {
                
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
}


//marks update
if(isset($_POST['save_marks']))
{
    
    $HeaderIDList=null;
    $MarksID=null;
    $StudentIDList=null;
    $CourseID=null;
    $Session=null;
    $Year=null;
    $Term=null;


    if(isset($_POST['all_header_id']))
        $HeaderIDList = explode(",", $_POST['all_header_id']);

    if(isset($_POST['marks_id']))
        $MarksID = $_POST['marks_id'];

    if(isset($_POST['all_students']))
        $StudentIDList = explode(",", $_POST['all_students']);

    if(isset($_POST['CourseID']))
        $CourseID = $_POST['CourseID'];

    if(isset($_POST['session']))
        $Session = $_POST['session'];

    if(isset($_POST['year']))
        $Year = $_POST['year'];

    if(isset($_POST['term']))
        $Term = $_POST['term'];

   $MarksEntryList = array();

   for ($i=0; $i < sizeof($StudentIDList) ; $i++) { 
       
       $StudentID= $StudentIDList[$i];
       
       $MarksList = array();

       $j=0;
       foreach ($_POST[$StudentID] as $input) {
            
            if($j==(sizeof($HeaderIDList)+1))
            {
                $MarksTotal=$input;
            }
            else if($j==(sizeof($HeaderIDList)+2))
            {
                $FinalGrade=$input;
            }
            else if($j>=1 && $j<=sizeof($HeaderIDList)) //avoiding first id and last total and grade
            {
               $MarksList[]=$input;
            }   
         $j++;   
       }
        

       if(isset($MarksList))
            $MarksValue = implode(",", $MarksList);

        $MarksEntry  = new MarksEntry();
       
  
        $MarksEntry->setCourse ( $CourseID);        

        $MarksEntry->setSession ( $Session);

        $MarksEntry->setYear ( $Year);         

        $MarksEntry->setTerm ( $Term); 

        $MarksEntry->setTeacher($globalUser->getID());

        $MarksEntry->setStudent ( $StudentID);   

        $MarksEntry->setMarksID( $MarksID);

        $MarksEntry->setMarksValue( $MarksValue);

        if($FinalGrade=="F")
        {
            $MarksEntry->setStatus("Retake");
        }
        else
        {
            $MarksEntry->setStatus(null);
        }

        $MarksEntryList[] = $MarksEntry;

        
   }

   //update the marks entry in to the database for this course, session, year and term

    $Result_Marks_Entry = $_MarksEntryBAO->updateCourseAllMarksEntry($MarksEntryList);

    //*****reload the UI********

     //read all registered students to this course
    $Result_Course_Students = $_CourseBAO->searchAllStudents($CourseID,$Session,$Year,$Term);

    //read the marks of the students for this course, session, year, term
    $Result_Course_Student_Marks = $_MarksEntryBAO->getCourseStudentMarks($CourseID,$Session,$Year,$Term,$Result_Course_Students->getResultObject());
    //read the marks setup for this course
    $Result_Marks_Setup = $_MarksEntryBAO->getCourseMarksSetup($CourseID);   

   //read default grade
    $Result_Grade_Setup = $_GradeSetupBAO->readDefaultGradeSetup();

    $Retake_Grade_Setup = $_GradeSetupBAO->readRetakeGradeSetup();

 }


//publish marks to the final result database
if(isset($_POST['publish_marks']))
{
    
    $HeaderIDList=null;
    $HeaderNameList=null;
    $HeaderMaxList=null;
    $MarksTotal=null;
    
    $GradeList=null;
    $GradeRangesList=null;
    $FinalGrade=null;
    $GradePoint=null;

    $MarksID=null;
    $StudentIDList=null;

    $CourseID=null;
    $Session=null;
    $Year=null;
    $Term=null;

    $MarksEntryList=null;

    if(isset($_POST['all_header_id']))
        $HeaderIDList = explode(",", $_POST['all_header_id']);
    if(isset($_POST['all_header_name']))
        $HeaderNameList = explode(",", $_POST['all_header_name']);
    if(isset($_POST['all_header_max']))
        $HeaderMaxList = explode(",", $_POST['all_header_max']);

    if(isset($_POST['all_grades']))
        $GradeList = explode(",", $_POST['all_grades']);
    if(isset($_POST['all_grade_ranges']))
        $GradeRangesList = explode(",", $_POST['all_grade_ranges']);


    if(isset($_POST['marks_id']))
        $MarksID = $_POST['marks_id'];

    if(isset($_POST['all_students']))
        $StudentIDList = explode(",", $_POST['all_students']);


    if(isset($_POST['CourseID']))
        $CourseID = $_POST['CourseID'];

    if(isset($_POST['session']))
        $Session = $_POST['session'];

    if(isset($_POST['year']))
        $Year = $_POST['year'];

    if(isset($_POST['term']))
        $Term = $_POST['term'];

   $MarksEntryList = array();

   for ($i=0; $i < sizeof($StudentIDList) ; $i++) { 
       
       $StudentID= $StudentIDList[$i];
       
       $MarksList = array();

       $j=0;
       foreach ($_POST[$StudentID] as $input) {
            
            if($j==(sizeof($HeaderIDList)+1))
                $MarksTotal=$input;
            else if($j==(sizeof($HeaderIDList)+2))
                $FinalGrade=$input;
            else if($j==(sizeof($HeaderIDList)+3))
                $GradePoint=$input;
            else if($j>=1 && $j<=sizeof($HeaderIDList)) //avoiding first id and last total and grade
            {
               $MarksList[]=$input;
            }   
         $j++;   
       }
        

       if(isset($MarksList)){
            $MarksValue = implode(",", $MarksList);
            $MarksTotal = array_sum(array_map('intval',$MarksList));
       }

        $MarksEntry  = new MarksEntry();
       
  
        $MarksEntry->setCourse ( $CourseID);        

        $MarksEntry->setSession ( $Session);

        $MarksEntry->setYear ( $Year);         

        $MarksEntry->setTerm ( $Term); 

        $MarksEntry->setTeacher($globalUser->getID());

        $MarksEntry->setStudent ( $StudentID);   

        $MarksEntry->setMarksValue( $MarksValue);

        $MarksEntry->setMarksTotal( $MarksTotal);

        $MarksEntry->setHeaderID( implode(",", $HeaderIDList) );

        $MarksEntry->setHeaderName( implode(",", $HeaderNameList) );

        $MarksEntry->setHeaderMax( implode(",", $HeaderMaxList) );

        $MarksEntry->setGrades( implode(",", $GradeList) );

        $MarksEntry->setGradeRanges( implode(",", $GradeRangesList));

        $MarksEntry->setFinalGrade( $FinalGrade );

        $MarksEntry->setGradePoint( $GradePoint );

        $MarksEntryList[] = $MarksEntry;


        if($FinalGrade=="F")
        {
            $IsRetake=1;
            $Status="failed";
            $Retake_status=$_CourseStudentRegistrationBAO->setRetakeStatus($StudentID,$IsRetake,$CourseID,$Status);
        }
        
   }

   //update the marks entry in to the database for this course, session, year and term
    $Result_Marks_Entry = $_MarksEntryBAO->publishCourseAllMarksEntry($MarksEntryList);

     //read all registered students to this course
    $Result_Course_Students = $_CourseBAO->searchAllStudents($CourseID,$Session,$Year,$Term);
    //read the marks of the students for this course, session, year, term
    $Result_Course_Student_Marks = $_MarksEntryBAO->getCourseStudentMarks($CourseID,$Session,$Year,$Term,$Result_Course_Students->getResultObject());
    //read the marks setup for this course
    $Result_Marks_Setup = $_MarksEntryBAO->getCourseMarksSetup($CourseID);   
   //read default grade
    $Result_Grade_Setup = $_GradeSetupBAO->readDefaultGradeSetup();

    $Retake_Grade_Setup = $_GradeSetupBAO->readRetakeGradeSetup();


 }


//delete marks for a course registered on a session, year and term
if(isset($_POST['delete_marks']))
{
    
    $HeaderIDList=null;
    $MarksID=null;
    $StudentIDList=null;
    $CourseID=null;
    $Session=null;
    $Year=null;
    $Term=null;


    if(isset($_POST['all_header_id']))
        $HeaderIDList = explode(",", $_POST['all_header_id']);

    if(isset($_POST['marks_id']))
        $MarksID = $_POST['marks_id'];

    if(isset($_POST['all_students']))
        $StudentIDList = explode(",", $_POST['all_students']);

    if(isset($_POST['CourseID']))
        $CourseID = $_POST['CourseID'];

    if(isset($_POST['session']))
        $Session = $_POST['session'];

    if(isset($_POST['year']))
        $Year = $_POST['year'];

    if(isset($_POST['term']))
        $Term = $_POST['term'];

   $MarksEntryList = array();

   for ($i=0; $i < sizeof($StudentIDList) ; $i++) { 
       
       $StudentID= $StudentIDList[$i];
       
        $MarksEntry  = new MarksEntry();
       
  
        $MarksEntry->setCourse ( $CourseID);        

        $MarksEntry->setSession ( $Session);

        $MarksEntry->setYear ( $Year);         

        $MarksEntry->setTerm ( $Term); 

        $MarksEntry->setStudent ( $StudentID);   

        $MarksEntry->setMarksID( $MarksID);

        $MarksEntryList[] = $MarksEntry;
        
   }

   //delete all the marks entry in to the database for this course, session, year and term

    $Result_Marks_Entry = $_MarksEntryBAO->deleteCourseAllMarksEntry($MarksEntryList);

    //*****reload the UI********

     //read all registered students to this course
    $Result_Course_Students = $_CourseBAO->searchAllStudents($CourseID,$Session,$Year,$Term);

    //read the marks of the students for this course, session, year, term
    $Result_Course_Student_Marks = $_MarksEntryBAO->getCourseStudentMarks($CourseID,$Session,$Year,$Term,$Result_Course_Students->getResultObject());

    //read the marks setup for this course
    $Result_Marks_Setup = $_MarksEntryBAO->getCourseMarksSetup($CourseID);   

   //read default grade
    $Result_Grade_Setup = $_GradeSetupBAO->readDefaultGradeSetup();

    $Retake_Grade_Setup = $_GradeSetupBAO->readRetakeGradeSetup();


 }

 if(isset($_POST['notify_marks']))
{
    
}
////$_Log->log(LogUtil::$DEBUG," exit view.marks_entry.blade.inc");
    function findMarksEntry($MarksEntryList,$StudentID){

        for ($i=0; $i < sizeof($MarksEntryList) ; $i++) { 
            
            $MarksEntry = $MarksEntryList[$i];
            if($MarksEntry->getStudent()==$StudentID)
                return $MarksEntry;
        }

        return null;
    }

    //returning the marks value from the marks entry
    function findMarks($MarksEntry, $FindHeaderID){

        if(isset($MarksEntry)){
            $MarksValueList = explode(",",$MarksEntry->getMarksValue());
            $HeaderIDList = explode(",",$MarksEntry->getHeaderID());

            for ($i=0; $i < sizeof($HeaderIDList) ; $i++) { 
                
                $HeaderID = $HeaderIDList[$i];
                $MarksValue = $MarksValueList[$i];

                if($HeaderID==$FindHeaderID){
                    return $MarksValue;
                }
            }
        }
        else
            return "X"; 
    }

    function findGrade($TotalMarks, $GradeRangesList, $GradeList){
                
    $GradePos = searchGrade($GradeRangesList,$TotalMarks );
        
            if($GradePos>=0)
                return $GradeList[$GradePos]; //grade position
    
        return "X";
    }

    function findGradePoint($TotalMarks, $GradeRangesList, $CgpaRangesList){
                
    $GradePos = searchGrade($GradeRangesList,$TotalMarks );
        
            if($GradePos>=0)
                return $CgpaRangesList[$GradePos]; //grade position
    
        return "0.00";
    }

    function searchGrade($GradeRangesList,$TotalMarks){
        $j=0;
        foreach ($GradeRangesList as $Range) { //extracting the list
            if(strpos($Range, '-')!==false){ //if - is present
                $X = explode("-", $Range);  
                if(count($X)===2){//both from and to are found
                    if($TotalMarks>=$X[0] && $TotalMarks<= $X[1]) //searching the grade position
                        return $j;
                }
            }
            $j++;
        }

        return -1;          
    }

    function sumMarks($MarksEntry){
        if(isset($MarksEntry)){
            
            $MarksValueList = explode(",",$MarksEntry->getMarksValue());
            $MarksValueList = array_map('intval',$MarksValueList); //converting string arrya to num array
            $TotalMarks=array_sum($MarksValueList); //adding all the numbers

            return $TotalMarks;
        }   

    }
    
?>