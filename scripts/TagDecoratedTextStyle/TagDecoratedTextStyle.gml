/**
* @func TagDecoratedTextStyle()
* @desc Returns an instance of the tag decorated style class.
*/
function TagDecoratedTextStyle() constructor {
	font = fntTagDecoratedTextFontDefault;
	styleColor = c_white;
	alpha = 1;
	scaleX = 1;
	scaleY = 1;
	modX = 0;
	modY = 0;
	modAngle = 0;
	
	/**
	* @func getCopy()
	* @desc Returns a new copy of this tag decorated text style.
	*/
	function copy() {
		var result = new TagDecoratedTextStyle();
		result.font = font;
		result.styleColor = styleColor;
		result.alpha = alpha;
		result.scaleX = scaleX;
		result.scaleY = scaleY;
		result.modX = modX;
		result.modY = modY;
		result.modAngle = modAngle;
		return result;
	}
	
	/**
	* @func applyCommands(commands)
	* @desc Returns a new copy of this style instance with the given commands applied.
	* @arg {Array<Struct.TagDecoratedTextCommand>} commands Array of commands to apply to the original style.
	*/
	function applyCommands(commands) {
		var result = copy();
		for (var i = 0; i < array_length(commands); i++) {
			var command = commands[i].command;
			var aargs = commands[i].aargs;
			if (command == "rgb") {
				result.styleColor = make_color_rgb(aargs[0], aargs[1], aargs[2]);
			}
			if (command == "font") {
				if (array_length(aargs) != 1) {
					show_error("TDS: Incorrect number of args for font style.", true);
				}
				if (asset_get_type(aargs[0]) != asset_font) {
					show_error("TDS: Unrecognized font name.", true);
				}
				result.font = asset_get_index(aargs[0]);
			}
			if (command == "scale") {
				if (array_length(aargs) != 2) {
					show_error("TDS: Incorrect number of args for scale style.", true);
				}
				result.scaleX = aargs[0];
				result.scaleY = aargs[1];
			}
			if (command == "angle") {
				if (array_length(aargs) != 1) {
					show_error("TDS: Incorrect number of args for angle style.", true);
				}
				result.modAngle = aargs[0];
			}
			if (command == "alpha") {
				if (array_length(aargs) != 1) {
					show_error("TDS: Incorrect number of args for alpha style.", true);
				}
				result.alpha = aargs[0];
			}
			if (c == "offset") {
				if (array_length(aargs) != 2) {
					show_error("TDS: Incorrect number of args for offset style.", true)
				}
				result.modX = aargs[0];
				result.modY = aargs[1];
			}
		}
		return result;
	}
	
	/**
	* @func isEqual(style)
	* @desc Returns true if this style and the given style are equal. False otherwise.
	* @arg {Struct.TagDecoratedTextStyle} style The style to compare this instance to.
	*/
	function isEqual(style) {
		if (style.alpha != alpha) return false;
		if (style.font != font) return false;
		if (style.modAngle != modAngle) return false;
		if (style.modX != modX) return false;
		if (style.modY != modY) return false;
		if (style.scaleX != scaleX) return false;
		if (style.scaleY != scaleY) return false;
		if (style.styleColor != styleColor) return false;
		return true;
	}
}

/**
* @func TagDecoratedTextStyleUndefined()
* @desc Returns an instance of the tag decorate style class, but each member is set to undefined.
*/
function TagDecoratedTextStyleUndefined() constructor {
	var result = new TagDecoratedTextStyle();
	result.font = undefined;
	result.styleColor = undefined;
	result.alpha = undefined;
	result.scaleX = undefined;
	result.scaleY = undefined;
	result.modX = undefined;
	result.modY = undefined;
	result.modAngle = undefined;
	return result;
}
