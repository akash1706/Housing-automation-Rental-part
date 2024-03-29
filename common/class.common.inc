<?php
include_once 'class.common.user.inc';


/*All the common Model classes are listed here*/
class PermissionXML{
    var $id;  // id of permission
    var $name;    // name of permission
    var $category;  // category of permission

    //map the tag, value pair with the members serially
    //used in xml to permission mapping
    public function __construct($row) {

        //todo: check for the exception situation

        foreach ($row as $k=>$v)
            $this->$k = $row[$k];

    }

}

class MenuXML{
    private $_ParentTitle;
    public $_Child;
    private $_Title;
    private $_Permissions;
    private $_Link;
    private $_Visible=0; // by default every menu is in visible

    public function getTitle(){
        return $this->_Title;
    }

    public function setTitle($Title){
        $this->_Title = $Title;
    }


    public function getParentTitle(){
        return $this->_ParentTitle;
    }

    public function setParentTitle($ParentTitle){
        $this->_ParentTitle = $ParentTitle;
    }

    public function getPermissions(){
        return $this->_Permissions;
    }

    public function setPermissions($Permissions){
        $this->_Permissions = $Permissions;
    }

    public function getLink(){
        return $this->_Link;
    }

    public function setLink($Link){
        $this->_Link = $Link;
    }

    public function setVisible($Visible){
        $this->_Visible = $Visible;
    }

    public function isVisible(){

        return $this->_Visible;
    }

}


class Result{

    private $_IsSuccess=0;
    private $_ResultObject;

    public function setIsSuccess($IsSuccess){
        $this->_IsSuccess = $IsSuccess;
    }

    public function getIsSuccess(){

        return $this->_IsSuccess;
    }

    public function setResultObject($ResultObject){
        $this->_ResultObject = $ResultObject;
    }

    public function getResultObject(){

        return $this->_ResultObject;
    }

}



class PermissionUtil{

    public static $COURSE_C='COURSE_C';
    public static $COURSE_R='COURSE_R';
    public static $COURSE_U='COURSE_U';
    public static $COURSE_D='COURSE_D';

    public static $COURSE_TYPE_C='COURSE_TYPE_C';
    public static $COURSE_TYPE_R='COURSE_TYPE_R';
    public static $COURSE_TYPE_U='COURSE_TYPE_U';
    public static $COURSE_TYPE_D='COURSE_TYPE_D';

    public static $COURSE_SESSIONAL_TYPE_C='COURSE_SESSIONAL_TYPE_C';
    public static $COURSE_SESSIONAL_TYPE_R='COURSE_SESSIONAL_TYPE_R';
    public static $COURSE_SESSIONAL_TYPE_U='COURSE_SESSIONAL_TYPE_U';
    public static $COURSE_SESSIONAL_TYPE_D='COURSE_SESSIONAL_TYPE_D';


    public static $CLUB_C='CLUB_C';
    public static $CLUB_R='CLUB_R';
    public static $CLUB_U='CLUB_U';
    public static $CLUB_D='CLUB_D';

    public static $DISCUSSION_C='DISCUSSION_C';
    public static $DISCUSSION_R='DISCUSSION_R';
    public static $DISCUSSION_U='DISCUSSION_U';
    public static $DISCUSSION_D='DISCUSSION_D';

    public static $DISCUSSION_CAT_C='DISCUSSION_CAT_C';
    public static $DISCUSSION_CAT_R='DISCUSSION_CAT_R';
    public static $DISCUSSION_CAT_U='DISCUSSION_CAT_U';
    public static $DISCUSSION_CAT_D='DISCUSSION_CAT_D';

    public static $DISCUSSION_COMMENT_C='DISCUSSION_COMMENT_C';
    public static $DISCUSSION_COMMENT_R='DISCUSSION_COMMENT_R';
    public static $DISCUSSION_COMMENT_U='DISCUSSION_COMMENT_U';
    public static $DISCUSSION_COMMENT_D='DISCUSSION_COMMENT_D';

    public static $DISCIPLINE_C='DISCIPLINE_C';
    public static $DISCIPLINE_R='DISCIPLINE_R';
    public static $DISCIPLINE_U='DISCIPLINE_U';
    public static $DISCIPLINE_D='DISCIPLINE_D';

    public static $FILE_C='FILE_C';
    public static $FILE_R='FILE_R';
    public static $FILE_U='FILE_U';
    public static $FILE_D='FILE_D';

    public static $PERMISSION_C='PERMISSION_C';
    public static $PERMISSION_R='PERMISSION_R';
    public static $PERMISSION_U='PERMISSION_U';
    public static $PERMISSION_D='PERMISSION_D';

    public static $POSITION_C='POSITION_C';
    public static $POSITION_R='POSITION_R';
    public static $POSITION_U='POSITION_U';
    public static $POSITION_D='POSITION_D';


    public static $PROJECT_C='PROJECT_C';
    public static $PROJECT_R='PROJECT_R';
    public static $PROJECT_U='PROJECT_U';
    public static $PROJECT_D='PROJECT_D';

    public static $QUESTION_C='QUESTION_C';
    public static $QUESTION_R='QUESTION_R';
    public static $QUESTION_U='QUESTION_U';
    public static $QUESTION_D='QUESTION_D';

    public static $REGISTRATION_C='REGISTRATION_C';
    public static $REGISTRATION_R='REGISTRATION_R';
    public static $REGISTRATION_U='REGISTRATION_U';
    public static $REGISTRATION_D='REGISTRATION_D';

    public static $RESULT_C='RESULT_C';
    public static $RESULT_R='RESULT_R';
    public static $RESULT_U='RESULT_U';
    public static $RESULT_D='RESULT_D';

    public static $ATTENDANCE_C='ATTENDANCE_C';
    public static $ATTENDANCE_R='ATTENDANCE_R';
    public static $ATTENDANCE_U='ATTENDANCE_U';
    public static $ATTENDANCE_D='ATTENDANCE_D';

    public static $MARKS_SETUP_C='MARKS_SETUP_C';
    public static $MARKS_SETUP_R='MARKS_SETUP_R';
    public static $MARKS_SETUP_U='MARKS_SETUP_U';
    public static $MARKS_SETUP_D='MARKS_SETUP_D';

    public static $GRADE_SETUP_C='GRADE_SETUP_C';
    public static $GRADE_SETUP_R='GRADE_SETUP_R';
    public static $GRADE_SETUP_U='GRADE_SETUP_U';
    public static $GRADE_SETUP_D='GRADE_SETUP_D';

    public static $ROLE_C='ROLE_C';
    public static $ROLE_R='ROLE_R';
    public static $ROLE_U='ROLE_U';
    public static $ROLE_D='ROLE_D';

    public static $SCHOOL_C='SCHOOL_C';
    public static $SCHOOL_R='SCHOOL_R';
    public static $SCHOOL_U='SCHOOL_U';
    public static $SCHOOL_D='SCHOOL_D';

    public static $SESSION_C='SESSION_C';
    public static $SESSION_R='SESSION_R';
    public static $SESSION_U='SESSION_U';
    public static $SESSION_D='SESSION_D';

    public static $SURVEY_C='SURVEY_C';
    public static $SURVEY_R='SURVEY_R';
    public static $SURVEY_U='SURVEY_U';
    public static $SURVEY_D='SURVEY_D';

    public static $SURVEY_QUESTION_C='SURVEY_QUESTION_C';
    public static $SURVEY_QUESTION_R='SURVEY_QUESTION_R';
    public static $SURVEY_QUESTION_U='SURVEY_QUESTION_U';
    public static $SURVEY_QUESTION_D='SURVEY_QUESTION_D';

    public static $SURVEY_QUESTION_TYPE_C='SURVEY_QUESTION_TYPE_C';
    public static $SURVEY_QUESTION_TYPE_R='SURVEY_QUESTION_TYPE_R';
    public static $SURVEY_QUESTION_TYPE_U='SURVEY_QUESTION_TYPE_U';
    public static $SURVEY_QUESTION_TYPE_D='SURVEY_QUESTION_TYPE_D';

    public static $SURVEY_QUESTION_FILLUP_C='SURVEY_QUESTION_FILLUP_C';
    public static $SURVEY_QUESTION_FILLUP_R='SURVEY_QUESTION_FILLUP_R';
    public static $SURVEY_QUESTION_FILLUP_U='SURVEY_QUESTION_FILLUP_U';
    public static $SURVEY_QUESTION_FILLUP_D='SURVEY_QUESTION_FILLUP_D';

    public static $TERM_C='TERM_C';
    public static $TERM_R='TERM_R';
    public static $TERM_U='TERM_U';
    public static $TERM_D='TERM_D';


    public static $USER_C='USER_C';
    public static $USER_R='USER_R';
    public static $USER_U='USER_U';
    public static $USER_D='USER_D';

    public static $YEAR_C='YEAR_C';
    public static $YEAR_R='YEAR_R';
    public static $YEAR_U='YEAR_U';
    public static $YEAR_D='YEAR_D';

    public static $VIDEO_C='VIDEO_C';
    public static $VIDEO_R='VIDEO_R';
    public static $VIDEO_U='VIDEO_U';
    public static $VIDEO_D='VIDEO_D';

    public static $VIDEO_COMMENT_C='VIDEO_COMMENT_C';
    public static $VIDEO_COMMENT_R='VIDEO_COMMENT_R';
    public static $VIDEO_COMMENT_U='VIDEO_COMMENT_U';
    public static $VIDEO_COMMENT_D='VIDEO_COMMENT_D';

    public static $RENTANDSELLS_C='RENTANDSELLS_C';
    public static $RENTANDSELLS_R='RENTANDSELLS_R';
    public static $RENTANDSELLS_U='RENTANDSELLS_U';
    public static $RENTANDSELLS_D='RENTANDSELLS_D';

    public static $RENT_C='RENT_C';
    public static $RENT_R='RENT_R';
    public static $RENT_U='RENT_U';
    public static $RENT_D='RENT_D';

    public static $SELLS_C='SELLS_C';
    public static $SELLS_R='SELLS_R';
    public static $SELLS_U='SELLS_U';
    public static $SELLS_D='SELLS_D';

    public static $SETAD_C='SETAD_C';
    public static $SETAD_R='SETAD_R';
    public static $SETAD_U='SETAD_U';
    public static $SETAD_D='SETAD_D';

    public static $MANAGEMENT_C='MANAGEMENT_C';
    public static $MANAGEMENT_R='MANAGEMENT_R';
    public static $MANAGEMENT_U='MANAGEMENT_U';
    public static $MANAGEMENT_D='MANAGEMENT_D';

    public static $SEEPAYMENT_C='SEEPAYMENT_C';
    public static $SEEPAYMENT_R='SEEPAYMENT_R';
    public static $SEEPAYMENT_U='SEEPAYMENT_U';
    public static $SEEPAYMENT_D='SEEPAYMENT_D';

    public static $GIVEPAYMENT_C='GIVEPAYMENT_C';
    public static $GIVEPAYMENT_R='GIVEPAYMENT_R';
    public static $GIVEPAYMENT_U='GIVEPAYMENT_U';
    public static $GIVEPAYMENT_D='GIVEPAYMENT_D';


}

class PageUtil{

    public static $COURSE='course.php';
    public static $COURSE_TYPE='course_type.php';
    public static $COURSE_SESSIONAL_TYPE='course_sessional_type.php';
    public static $COURSE_TEACHER='course_teacher.php';
    public static $MY_COURSES='my_courses.php';
    public static $COURSE_TEACHER_REGISTRATION='course_teacher_registration.php';
    public static $COURSE_STUDENT_REGISTRATION='course_student_registration.php';
    public static $COURSEWISE_REGISTRATION='coursewise_registration.php';
    public static $STUDENTWISE_REGISTRATION='studentwise_registration.php';
    public static $MANAGE_REGISTRATION_REQUEST='manage_registration_request.php';
    public static $MY_REGISTRATION='my_registration.php';
    public static $PRINT_REGISTRATION='print_registration.php';

    public static $MARKS_SETUP='marks_setup.php';
    public static $GRADE_SETUP='grade_setup.php';
    public static $MARKS_ENTRY='marks_entry.php';
    public static $TESTS_ENTRY='tests_entry.php';
    public static $PRINT_GRADE='print_grade.php';
    public static $GRADE_SHIT ='marks_shit.php';
    public static $STUDENT_RESULT ='students_result.php';
    public static $STUDENT_RESULT_SHEET ='students_result_sheet.php';






    public static $DISCIPLINE='discipline.php';


    public static $ERROR='error.php';

    public static $HOME='home.php';
    public static $LOGIN='login.php';
    public static $LOGOUT='logout.php';

    public static $PROJECT='project.php';
    public static $POSITION='position.php';
    public static $PERMISSION='permission.php';

    public static $ROLE='role.php';
    public static $RESOURCE='resource.php';
    public static $REGISTRATION_SESSION='registration_session.php';


    public static $SCHOOL='school.php';



    public static $TERM='term.php';

    public static $USER='user.php';
    public static $USER_NEW='user_new.php';
    public static $USER_DETAILS='user_details.php';
    public static $USER_SEARCH='user_search.php';
    public static $USER_FORGOT_PASSWORD='forgot_password.php';


    public static $YEAR='year.php';
    //task
    public static $Task='my_cal.php';
    public static $Assign_My_Task = 'assign_my_task.php';
    public static $MANAGE_CATEGORY = 'manage_category.php';
    public static $MY_TASK = 'my_task.php';
    public static $CREAT_TASK = 'create_task.php';
    public static $ASSIGN_TASK_AJAX = 'assign_task_ajax.php';
    public static $TASK_DETAILS = 'task_details.php';

    //rent and sells
    public static $RENTANDSELLS ='rentandsells.php';
    public static $RENT ='rent.php';
    public static $SELLS ='sells.php';
    public static $SETAD ='setad.php';

    public static $MANAGEMENT ='management.php';
    public static $SEEPAYMENT ='seepayment.php';
    public static $GIVEPAYMENT ='givepayment.php';

}

class RouteUtil{

    private static $s_Routes; //The single instance
    private static $s_instance; //The single instance


    private function __construct(){

         self::$s_Routes = array();

        //add new page and routing address here always

         self::$s_Routes[PageUtil::$HOME]             =   "modules/dashboard/ui/view.home.inc";
         self::$s_Routes[PageUtil::$LOGIN]            =   "modules/dashboard/ui/view.login.inc";
         self::$s_Routes[PageUtil::$LOGOUT]            =   "modules/dashboard/ui/view.logout.inc";

         self::$s_Routes[PageUtil::$ROLE]   =   "modules/user/ui/view.role.inc";
         self::$s_Routes[PageUtil::$DISCIPLINE]       =   "modules/user/ui/view.discipline.inc";
         self::$s_Routes[PageUtil::$PERMISSION]       =   "modules/user/ui/view.permission.inc";
         self::$s_Routes[PageUtil::$POSITION]         =   "modules/user/ui/view.position.inc";
         self::$s_Routes[PageUtil::$SCHOOL]           =   "modules/user/ui/view.school.inc";


         self::$s_Routes[PageUtil::$REGISTRATION_SESSION] =
         "modules/registration/ui/view.registration_session.inc";



         self::$s_Routes[PageUtil::$TERM]  =   "modules/registration/ui/view.term.inc";

         self::$s_Routes[PageUtil::$COURSE] =
         "modules/registration/ui/view.course.inc";
         self::$s_Routes[PageUtil::$COURSE_TYPE]      =
         "modules/registration/ui/view.course_type.inc";
         self::$s_Routes[PageUtil::$COURSE_SESSIONAL_TYPE] =
         "modules/registration/ui/view.course_sessional_type.inc";
         self::$s_Routes[PageUtil::$COURSE_TEACHER] =
         "modules/registration/ui/view.course_teacher.inc";
         self::$s_Routes[PageUtil::$MY_COURSES] =
         "modules/registration/ui/view.my_courses.inc";

         self::$s_Routes[PageUtil::$COURSE_TEACHER_REGISTRATION] =
         "modules/registration/ui/view.course_teacher_registration.inc";
         self::$s_Routes[PageUtil::$COURSE_STUDENT_REGISTRATION] =
         "modules/registration/ui/view.course_student_registration.inc";
         self::$s_Routes[PageUtil::$COURSEWISE_REGISTRATION] =
         "modules/registration/ui/view.coursewise_registration.inc";
         self::$s_Routes[PageUtil::$STUDENTWISE_REGISTRATION] =
         "modules/registration/ui/view.studentwise_registration.inc";
         self::$s_Routes[PageUtil::$MANAGE_REGISTRATION_REQUEST] =
         "modules/registration/ui/view.manage_registration_request.inc";
         self::$s_Routes[PageUtil::$MY_REGISTRATION] =
         "modules/registration/ui/view.my_registration.inc";
         self::$s_Routes[PageUtil::$PRINT_REGISTRATION] =
         "modules/registration/ui/view.print_registration.inc";


         self::$s_Routes[PageUtil::$MARKS_SETUP] =
         "modules/result/ui/view.marks_setup.inc";
         self::$s_Routes[PageUtil::$GRADE_SETUP] =
         "modules/result/ui/view.grade_setup.inc";
         self::$s_Routes[PageUtil::$MARKS_ENTRY] =
         "modules/result/ui/view.marks_entry.inc";

         self::$s_Routes[PageUtil::$TESTS_ENTRY] =
         "modules/result/ui/view.tests_entry.inc";
         self::$s_Routes[PageUtil::$PRINT_GRADE] =
         "modules/result/ui/view.print_grade.inc";
         self::$s_Routes[PageUtil::$GRADE_SHIT] =
         "modules/result/ui/view.marks_shit.inc";
         self::$s_Routes[PageUtil::$STUDENT_RESULT_SHEET] =
         "modules/result/ui/view.students_result_sheet.inc";
         self::$s_Routes[PageUtil::$STUDENT_RESULT] =
         "modules/result/ui/view.students_result.inc";



         self::$s_Routes[PageUtil::$USER] =   "modules/user/ui/view.user.inc";
         self::$s_Routes[PageUtil::$USER_DETAILS] =   "modules/user/ui/view.user_details.inc";
         self::$s_Routes[PageUtil::$USER_NEW] =   "modules/user/ui/view.user_new.inc";
         self::$s_Routes[PageUtil::$USER_SEARCH] =   "modules/user/ui/view.user_search.inc";
         self::$s_Routes[PageUtil::$USER_FORGOT_PASSWORD] =   "modules/user/ui/view.forgot_password.inc";


        //the page not found will redirect to error page
         self::$s_Routes[PageUtil::$ERROR] = "modules/dashboard/ui/view.error.inc";

         self::$s_Routes[PageUtil::$YEAR]  =   "modules/registration/ui/view.year.inc";

         //Task
         self::$s_Routes[PageUtil::$Task]  =   "modules/task/ui/view.my_cal.inc";
         //view.assign_my_task.inc
         self::$s_Routes[PageUtil::$Assign_My_Task]  =   "modules/task/ui/view.assign_my_task.inc";
         //MANAGE_CATEGORY
         self::$s_Routes[PageUtil::$MANAGE_CATEGORY]  =   "modules/task/ui/view.manage_category.inc";
         self::$s_Routes[PageUtil::$MY_TASK] = "modules/task/ui/view.my_task.inc";
         //ASSIGN_TASK
         self::$s_Routes[PageUtil::$CREAT_TASK] = "modules/task/ui/view.assign_task.inc";
         //ASSIGN_TASK_AJAX
         self::$s_Routes[PageUtil::$ASSIGN_TASK_AJAX] = "modules/task/ui/ajax/view.assign_task.ajax.inc";
         self::$s_Routes[PageUtil::$TASK_DETAILS] = "modules/task/ui/view.task_details.inc";
         self::$s_Routes[PageUtil::$RENT] = "modules/rent/ui/view.rent.inc";
         self::$s_Routes[PageUtil::$SELLS] = "modules/rent/ui/view.sells.inc";
         self::$s_Routes[PageUtil::$SETAD] = "modules/rent/ui/view.setad.inc";

         self::$s_Routes[PageUtil::$SEEPAYMENT] = "modules/rent/ui/view.seepayment.inc";
         self::$s_Routes[PageUtil::$GIVEPAYMENT] = "modules/rent/ui/view.givepayment.inc";

    }

    public static function getInstance() {
        if(!self::$s_instance) { // If no instance then make one
            self::$s_instance = new self();
        }
        return self::$s_instance;
    }

    public static function get($Page){

        $Page = strtolower(trim($Page));

        if(array_key_exists($Page, self::$s_Routes)){

            return self::$s_Routes[$Page];
        }
        else{

            return self::$s_Routes[PageUtil::$ERROR];
        }
    }

}

class MiddlewareUtil{

    private static $s_Routes; //The single instance
    private static $s_instance; //The single instance


    private function __construct(){

         self::$s_Routes = array();

        //add which page should be successfully logged before getting to this page
        //example: login.php should be successfully logged in to get to home.php


         


         self::$s_Routes[PageUtil::$HOME]   =  PageUtil::$LOGIN ;

         self::$s_Routes[PageUtil::$USER]   =  PageUtil::$LOGIN ;
         self::$s_Routes[PageUtil::$USER_DETAILS]   =  PageUtil::$LOGIN ;
         self::$s_Routes[PageUtil::$USER_SEARCH]   =  PageUtil::$LOGIN ;
         //self::$s_Routes[PageUtil::$USER_NEW]   =  PageUtil::$LOGIN ;
         //self::$s_Routes[PageUtil::$USER_FORGOT_PASSWORD]   =  PageUtil::$LOGIN ;

         self::$s_Routes[PageUtil::$ROLE]   =  PageUtil::$LOGIN ;
         self::$s_Routes[PageUtil::$PERMISSION]   =  PageUtil::$LOGIN ;
         self::$s_Routes[PageUtil::$POSITION]   =  PageUtil::$LOGIN ;
          //task
         self::$s_Routes[PageUtil::$Task]  =   PageUtil::$LOGIN ;
         self::$s_Routes[PageUtil::$Assign_My_Task]  =   PageUtil::$LOGIN ;
         self::$s_Routes[PageUtil::$MANAGE_CATEGORY]  =   PageUtil::$LOGIN ;
         self::$s_Routes[PageUtil::$MY_TASK]  =   PageUtil::$LOGIN ;
         self::$s_Routes[PageUtil::$TASK_DETAILS]  =   PageUtil::$LOGIN ;

         //rent and sells
         self::$s_Routes[PageUtil::$RENTANDSELLS]   =  PageUtil::$LOGIN ;
         //self::$s_Routes[PageUtil::$RENT]   =  PageUtil::$LOGIN ;
         //self::$s_Routes[PageUtil::$SELLS]   =  PageUtil::$LOGIN ;
         self::$s_Routes[PageUtil::$SETAD]   =  PageUtil::$LOGIN ;
          self::$s_Routes[PageUtil::$MANAGEMENT]   =  PageUtil::$LOGIN ;
        self::$s_Routes[PageUtil::$GIVEPAYMENT]   =  PageUtil::$LOGIN ;
        self::$s_Routes[PageUtil::$SEEPAYMENT]   =  PageUtil::$LOGIN ;
    }

    public static function getInstance() {
        if(!self::$s_instance) { // If no instance then make one
            self::$s_instance = new self();
        }
        return self::$s_instance;
    }

    private static function isAvailable($Page){

        $Page = strtolower(trim($Page));

        //if the page is refereneced in the middleware
        if(array_key_exists($Page, self::$s_Routes)){

            return true;
        }
        else{

            return false;
        }
    }

    public static function get($Page){


        //if page is referenced
        if(self::isAvailable($Page)){
            //start session and check whether the middleware is successfully crossed

            if (session_status() == PHP_SESSION_NONE) {
                session_start();
            }

            // other send initial page: example if logged out then go to login.php page
            return isset($_SESSION[self::$s_Routes[$Page]])? $Page: header("Location:".self::$s_Routes[$Page]);// self::$s_Routes[$Page];

        }else{
            // if no middleware then just go on with the current request
            return $Page;
        }
    }

}

//finding different partse of an url
function unparse_url($parsed_url) {
        $scheme   = isset($parsed_url['scheme']) ? $parsed_url['scheme'] . '://' : '';
        $host     = isset($parsed_url['host']) ? $parsed_url['host'] : '';
        $port     = isset($parsed_url['port']) ? ':' . $parsed_url['port'] : '';
        $user     = isset($parsed_url['user']) ? $parsed_url['user'] : '';
        $pass     = isset($parsed_url['pass']) ? ':' . $parsed_url['pass']  : '';
        $pass     = ($user || $pass) ? "$pass@" : '';
        $path     = isset($parsed_url['path']) ? $parsed_url['path'] : '';
        $query    = isset($parsed_url['query']) ? '?' . $parsed_url['query'] : '';
        $fragment = isset($parsed_url['fragment']) ? '#' . $parsed_url['fragment'] : '';

        //extracting the page name such as user.php from the url
        $page = substr($path, strrpos($path,'/')+1,strrpos($path,'.php')-strrpos($path,'/')+strlen('.php'));

        return $page;
        //return "$scheme$user$pass$host$port$path$query$fragment";
}


//applying middleware such as login.php comes before home.php
function apply_middleware($page) {

    // checking whtether there is any middleware
    $page=MiddlewareUtil::get($page);

    return $page;

}

//finding different partse of an url
function apply_routing($page) {

    //looking for the extracted page in the route list

    return RouteUtil::get($page);;
}

function userHasAccessToLink($Link){

    $globalPermission = $_SESSION["globalPermission"];

    $unorganizedMenu = $_SESSION["unorganizedMenu"];

    $LinkPermissions = menu_link_permissions($unorganizedMenu,$Link);

    foreach ($LinkPermissions as $permission) { // any global permission of the logged in user
        if(in_array($permission, $globalPermission)){ //if matches with any permission of a given link

           return true;
        }

    }

    return false;
}

    /*permission sets related to a given link is returned otherwise returned <<null>>*/
function menu_link_permissions($Menus,$Link){

    //taking each menu from the menu xml file
    for ($i=0; $i<sizeof($Menus); $i++) {

        //matching with the given link
        if (strcasecmp($Menus[$i]->getLink(), $Link)==0) {

            $LinkPermissions = $Menus[$i]->getPermissions();

            $LinkPermissionList = array();

            foreach ($LinkPermissions as $LinkPermission) {

                $LinkPermissionList[] = $LinkPermission->getID();
            }

            return $LinkPermissionList;
         }

    }

    return null;

}


function every_one_has_access($page){

    $All_Access_Pages= array();

    $All_Access_Pages[PageUtil::$LOGIN]= PageUtil::$LOGIN;
    $All_Access_Pages[PageUtil::$LOGOUT]= PageUtil::$LOGOUT;
    $All_Access_Pages[PageUtil::$HOME]= PageUtil::$HOME;
    $All_Access_Pages[PageUtil::$PRINT_REGISTRATION]= PageUtil::$PRINT_REGISTRATION;
    $All_Access_Pages[PageUtil::$PRINT_GRADE]= PageUtil::$PRINT_GRADE;
    $All_Access_Pages[PageUtil::$TESTS_ENTRY]= PageUtil::$TESTS_ENTRY;
    $All_Access_Pages[PageUtil::$GRADE_SHIT]= PageUtil::$GRADE_SHIT;
    $All_Access_Pages[PageUtil::$STUDENT_RESULT_SHEET]= PageUtil::$STUDENT_RESULT_SHEET;
    $All_Access_Pages[PageUtil::$RENT]= PageUtil::$RENT;
    
    $All_Access_Pages[PageUtil::$SELLS]= PageUtil::$SELLS;


    if (array_key_exists($page, $All_Access_Pages))
        return true;
    else
        return false;

}

function no_layout_page($page){

    $All_Access_Pages= array();

    $All_Access_Pages[PageUtil::$LOGIN]= PageUtil::$LOGIN;
    $All_Access_Pages[PageUtil::$LOGOUT]= PageUtil::$LOGOUT;
    $All_Access_Pages[PageUtil::$PRINT_REGISTRATION]= PageUtil::$PRINT_REGISTRATION;
    $All_Access_Pages[PageUtil::$PRINT_GRADE]= PageUtil::$PRINT_GRADE;
    $All_Access_Pages[PageUtil::$USER_NEW]= PageUtil::$USER_NEW;
    $All_Access_Pages[PageUtil::$USER_FORGOT_PASSWORD]=PageUtil::$USER_FORGOT_PASSWORD;
    $All_Access_Pages[PageUtil::$GRADE_SHIT]= PageUtil::$GRADE_SHIT;
    $All_Access_Pages[PageUtil::$STUDENT_RESULT_SHEET]= PageUtil::$STUDENT_RESULT_SHEET;
     $All_Access_Pages[PageUtil::$RENT]= PageUtil::$RENT;
    
    $All_Access_Pages[PageUtil::$SELLS]= PageUtil::$SELLS;



    if (array_key_exists($page, $All_Access_Pages))
        return true;
    else
        return false;

}


MiddlewareUtil::getInstance();
RouteUtil::getInstance();

?>
