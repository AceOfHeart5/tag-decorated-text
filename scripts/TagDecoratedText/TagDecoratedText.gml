/**
* @arg {String} sourceString The text, including tag decorations, to be drawn.
*/
function TagDecoratedText(sourceString) constructor {
	source = sourceString;
	characters = [];
	defaultStyle = new TagDecoratedTextStyle();
	maxWidth = 500;
	drawables = undefined;
	createDrawablesOnSetText = true;
	updateTimeMs = 0;
	
	/**
	* @func setText(newSourceString)
	* @desc Sets the text of this tag decorated text instance. This function is automatically called on instance creation.
	* @arg {String} newSourceString The new source string for this tag decorated text instance.
	*/
	function setText(newSourceString) {
		source = newSourceString;
		var lineWidth = 0;
		var lineIndex = 0;
		var commands = [];
		var style = defaultStyle;
		var animations = undefined;
		var sprite = undefined;
		for (var i = 1; i <= string_length(source); i++) {
			var char = string_char_at(source, i);
		}
	}
	
	setText(sourceString);
}
