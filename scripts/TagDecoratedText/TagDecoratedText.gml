/**
 * Function Description
 * @param {string} _source_string  Description
 * @context
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
	 * Function Description
	 * @param {string} _new_source_string Description
	 */
	function set_text(_new_source_string) {
		source = _new_source_string;
		var _line_width = 0;
		var _line_index = 0;
		var commands = [];
		var style = defaultStyle;
		var animations = undefined;
		var sprite = undefined;
	}
}
