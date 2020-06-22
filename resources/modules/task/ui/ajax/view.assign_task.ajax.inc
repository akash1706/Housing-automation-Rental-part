<?php	

include_once MODULES_USER.'bao/class.userbao.inc';
include_once MODULES_USER.'bao/class.rolebao.inc';
include_once MODULES_USER.'bao/class.positionbao.inc';
include_once MODULES_TASK.'bao/class.assignbao.inc';


	$_UserBAO = new UserBAO();
	$_AssignBAO = new AssignBAO();

	if(isset($_GET['searchName']))
	{
		$userEmail = $_GET['searchName'];
		$taskId = $_GET['taskId'];
		$result = $_UserBAO->findUserDetailsByEmail($userEmail);
		//print_r($userDetails);


		if($result->getIsSuccess()){
			$result2 = $_AssignBAO->findTaskUserId($userEmail,$taskId);
			$userDetails = $result->getResultObject();
			if($result2->getIsSuccess()){
			
			echo $userDetails->getFirstName()." ".$userDetails->getMiddleName()." " . $userDetails->getLastName() ;
			echo "<br/> Already Assigned";
		}
		else
		{
			echo $userDetails->getFirstName()." ".$userDetails->getMiddleName()." " . $userDetails->getLastName();
		}

	}
	else
	{
		echo "Searching...";
	}
	}



?>
