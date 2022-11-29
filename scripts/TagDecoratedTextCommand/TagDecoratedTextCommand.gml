/**
* @func TagDecoratedTextCommand(commandString, argArray)
* @desc Returns a new command instance with the given string as the command and args array as the arguments for that command.
* @arg {String} commandString The command this command instance performs on the decorated text.
* @arg {Array<Any>} argArray The arguments for the command.
*/
function TagDecoratedTextCommand(commandString, argArray) constructor {	
	command = commandString;
	aargs = argArray;
	
	/**
	* @arg {Real} red The red hue of the rgb color to convert to.
	* @arg {Real} green The green hue of the rgb color to convert to.
	* @arg {Real} blue The blue hue of the rgb color to convert to.
	* @self
	* @ignore
	*/
	function convertToColor(red, green, blue) {
		array_resize(aargs, 3);
		aargs[0] = red;
		aargs[1] = green;
		aargs[2] = blue;
		command = "rgb";
	}
	
	/*
	We automatically convert any color commands into rgb commands with equivalent
	arguments. This makes it more convenient to work with Command instances in
	other contexts.
	*/
	if (command == "red") {
		convertToColor(color_get_red(c_red), color_get_green(c_red), color_get_blue(c_red));
	}
	if (command == "blue") {
		convertToColor(color_get_red(c_blue), color_get_green(c_blue), color_get_blue(c_blue));
	}
	if (command == "green") {
		convertToColor(color_get_red(c_green), color_get_green(c_green), color_get_blue(c_green));
	}
	if (command == "yellow") {
		convertToColor(color_get_red(c_yellow), color_get_green(c_yellow), color_get_blue(c_yellow));
	}
	if (command == "orange") {
		convertToColor(color_get_red(c_orange), color_get_green(c_orange), color_get_blue(c_orange));
	}
	if (command == "purple") {
		convertToColor(color_get_red(c_purple), color_get_green(c_purple), color_get_blue(c_purple));
	}
	if (command == "black") {
		convertToColor(color_get_red(c_black), color_get_green(c_black), color_get_blue(c_black));
	}
	if (command == "white") {
		convertToColor(color_get_red(c_white), color_get_green(c_white), color_get_blue(c_white));
	}
	if (command == "gray" || command == "grey") {
		convertToColor(color_get_red(c_gray), color_get_green(c_gray), color_get_blue(c_gray));
	}
	if (command == "ltgray" || command == "ltgrey") {
		convertToColor(color_get_red(c_ltgray), color_get_green(c_ltgray), color_get_blue(c_ltgray));
	}
	if (command == "dkgray" || command == "dkgrey") {
		convertToColor(color_get_red(c_dkgray), color_get_green(c_dkgray), color_get_blue(c_dkgray));
	}
	if (command == "teal") {
		convertToColor(color_get_red(c_teal), color_get_green(c_teal), color_get_blue(c_teal));
	}
	if (command == "aqua") {
		convertToColor(color_get_red(c_aqua), color_get_green(c_aqua), color_get_blue(c_aqua));
	}
	if (command == "fuchsia") {
		convertToColor(color_get_red(c_fuchsia), color_get_green(c_fuchsia), color_get_blue(c_fuchsia));
	}
	if (command == "lime") {
		convertToColor(color_get_red(c_lime), color_get_green(c_lime), color_get_blue(c_lime));
	}
	if (command == "maroon") {
		convertToColor(color_get_red(c_maroon), color_get_green(c_maroon), color_get_blue(c_maroon));
	}
	if (command == "navy") {
		convertToColor(color_get_red(c_navy), color_get_green(c_navy), color_get_blue(c_navy));
	}
	if (command == "olive") {
		convertToColor(color_get_red(c_olive), color_get_green(c_olive), color_get_blue(c_olive));
	}
	if (command == "silver") {
		convertToColor(color_get_red(c_silver), color_get_green(c_silver), color_get_blue(c_silver));
	}
	if (command == "brown") {
		convertToColor(102, 51, 0);
	}
	if (command == "pink") {
		convertToColor(255, 51, 255);
	}
}
