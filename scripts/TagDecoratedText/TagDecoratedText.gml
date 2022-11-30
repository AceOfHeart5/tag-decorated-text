/**
 * Create a new Tag Decorated Text element.
 * @param {string} _source_string The text, including command tags, to generate a Tag Decorated Text element from.
 */
function TagDecoratedText(_source_string) constructor {
	source = _source_string;
	characters = [];
	default_style = new TagDecoratedTextStyle();
	max_width = 500;
	drawables = undefined;
	create_drawables_on_set_text = true;
	update_time_ms = 0;
	
	/**
	 * Set the text of this TagDecoratedText element.
	 * @param {string} _new_source_string
	 */
	function set_text(_new_source_string) {
		source = _new_source_string;
		var _line_width = 0;
		var _line_index = 0;
		var _commands = [];
		var _style = default_style;
		var _animations = undefined;
		var _sprite = undefined;
	}
}
