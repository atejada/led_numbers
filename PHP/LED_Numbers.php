<?php
	$number = $argv[1];
	$leds = array(array(' _  ','| | ','|_| '),
				  array('  ','| ','| '),
				  array(' _  ',' _| ','|_  '),
				  array('_  ','_| ','_| '),
				  array('    ','|_| ','  | '),
				  array(' _  ','|_  ',' _| '),
				  array(' _  ','|_  ','|_| '),
				  array('_   ',' |  ',' |  '),
				  array(' _  ','|_| ','|_| '),
				  array(' _  ','|_| ',' _| '));
	for($i = 0; $i < 3; $i++){
		for($j = 0; $j < strlen($number); $j++){
			echo $leds[$number[$j]][$i];
		}
		echo "\n";
	}
?>
