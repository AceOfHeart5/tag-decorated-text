/**
* @arg {String} sourceString The text, including tag decorations, to be drawn.
*/
function TagDecoratedText(sourceString="") constructor {
	source = sourceString;
	characters = [];
	defaultStyle = new TagDecoratedTextStyle();
	maxWidth = 500;
	drawables = undefined;
	createDrawablesOnSetText = true;
	updateTimeMs = 0;
}
