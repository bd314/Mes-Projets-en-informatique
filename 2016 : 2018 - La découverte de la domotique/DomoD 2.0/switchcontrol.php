<?php 
// Get parameter 

$getSwitch = $_GET['switch']; 
$getTargetState = $_GET['state']; 

// Make it safe 

switch($getSwitch) {
	case "a":
		$action = 'reboot';
		break;
	case "b":
		$nb_switch = 1;
		$action== '433'
		$code_switch_on = -----;
		$code_switch_off = ------;
		break;
	case "c":
		$nb_switch = 1;
		$action== 'relay';
		$selectionRelay = 1;
		$selectionEta = $_GET['state'];		
		break;
	case "d":
		$action = 'tv';
		break;
	case "e":
	
		break;
	case "f":

		break;
	default:
		die("ERROR");
}
// Call RPi_utils codesend

//Reboot
elseif ($action == 'reboot') {
	shell_exec('sudo reboot');
	echo "SUCCESS";
}


 // Commande Relay
 if ($nb_switch == '1' AND $action== 'relay' ) {
	shell_exec('sudo /domod/module/relay/relay.py '.$selectionRelay.$selectionEta);	
	echo "SUCCESS";
}

//433 commandes on
elseif ($getTargetState == '1' AND $nb_switch == '1' AND $action== '433') {
	shell_exec('sudo /domod/module/433/codesend '.$code_switch1_on);			
	echo "SUCCESS";
}

//433 commandes off
elseif ($getTargetState == '0' AND $nb_switch == '1' AND $action== '433') {
	shell_exec('sudo /domod/module/433/codesend '.$code_switch1_off);
	echo "SUCCESS";
}


//tv
//commandes on
elseif ($getTargetState == '1' AND $action == 'tv') {
	shell_exec('sudo echo "on 0" | cec-client -s');
	echo "SUCCESS";
}

//commandes off
elseif($getTargetState == '0' AND  $action == 'tv'){
	shell_exec('sudo echo "standby 0" | cec-client -s');
	echo "SUCCESS";
}

else {
	die("ERROR");
}
?>
