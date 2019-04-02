<?php 
// Get parameter 

$getSwitch = $_GET['switch']; 
$getTargetState = $_GET['state']; 

// Make it safe 

switch($getSwitch) {
	case "a":
		$switch = 1;
		$nb_switch = 1;
		$code_switch_on = 5510485;
		$code_switch_off = 5510484;
		break;
	case "b":
		$switch = 2;
		$nb_switch = 1;
		$code_switch_on = 5522773;
		$code_switch_off = 5522772;
		break;
	case "c":
		$switch = 3;
		$nb_switch = 1;
		$code_switch_on = 5525845;
		$code_switch_off = 5525844;
		break;
	case "d":
		$switch = 4;
		$nb_switch = 2;
		$code_switch1_on = 5525845;
		$code_switch1_off = 5525844;
		$code_switch2_on = 5522773;
		$code_switch2_off = 5522772;
		break;
	case "e":
		$switch = 5;
		$nb_switch = 2;
		$code_switch1_on = 5510485;
		$code_switch1_off = 5510484;		
		$code_switch2_on = 5522773;
		$code_switch2_off = 5522772;		
		break;
	case "f":
		$switch = 6;
		$nb_switch = 3;
		$code_switch1_on = 5510485;
		$code_switch1_off = 5510484;		
		$code_switch2_on = 5522773;
		$code_switch2_off = 5522772;
		$code_switch3_on = 5525845;
		$code_switch3_off = 5525844;
		break;
	default:
		die("ERROR");
}
// Call RPi_utils codesend
if($getTargetState == '1' AND $nb_switch == '1' ) {
	shell_exec('cd / && touch aaa);
	echo "SUCCESS";
} elseif ($getTargetState == '0' AND $nb_switch == '1' ) {
	shell_exec('sudo /domod/module/433/codesend '.$code_switch_off);
	echo "SUCCESS";
}elseif ($getTargetState == '1' AND $nb_switch == '2') {
	shell_exec('sudo /domod/module/433/codesend '.$code_switch1_on);
	shell_exec('sudo /domod/module/433/codesend '.$code_switch2_on);
	echo "SUCCESS";
}elseif ($getTargetState == '0' AND $nb_switch == '2') {
	shell_exec('sudo /domod/module/433/RPi_utils/codesend '.$code_switch1_off);
	shell_exec('sudo /domod/module/433/RPi_utils/codesend '.$code_switch2_off);
	echo "SUCCESS";
}elseif ($getTargetState == '1' AND $nb_switch == '3') {
	shell_exec('sudo /domod/module/433/codesend '.$code_switch1_on);
	shell_exec('sudo /domod/module/433/codesend '.$code_switch2_on);
	shell_exec('sudo /domod/module/433/codesend '.$code_switch3_on);
	echo "SUCCESS";
}elseif($getTargetState == '0' AND  $nb_switch == '3'){
	shell_exec('sudo /domod/module/433/codesend '.$code_switch1_off);
	shell_exec('sudo /domod/module/433/codesend '.$code_switch2_off);
	shell_exec('sudo /domod/module/433/codesend '.$code_switch3_off);
	echo "SUCCESS";
}else {
	die("ERROR");
}
?>
