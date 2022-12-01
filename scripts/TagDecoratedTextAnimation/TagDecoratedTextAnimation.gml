global.tds_animation_default_fade_alpha_min = 0.3;
global.tds_animation_default_fade_alpha_max = 1;
global.tds_animation_default_fade_cycle_time_ms = 1000;

/**
 * Set default values for fade animation.
 * @param {real} _alpha_min minimum alpha
 * @param {real} _alpha_max maximum alpha
 * @param {real} _cycle_time_ms time in ms for one cycle of animation
 */
function tag_decorated_text_set_default_fade(_alpha_min, _alpha_max, _cycle_time_ms) {
	global.tds_animation_default_fade_alpha_min = _alpha_min;
	global.tds_animation_default_fade_alpha_max = _alpha_max;
	global.tds_animation_default_fade_cycle_time_ms = _cycle_time_ms;
}

global.tds_animation_default_shake_time_ms = 80;
global.tds_animation_default_shake_magnitude = 1;

/**
 * Set default values for shake animation.
 * @param {real} _time_ms time in ms text is held out of place
 * @param {real} _magnitude variance in pixels text can be offset by
 */
function tds_animation_default_shake(_time_ms, _magnitude) {
	global.tds_animation_default_shake_time_ms = _time_ms;
	global.tds_animation_default_shake_magnitude = _magnitude;
}



/**
 * @param {real} _command TAG_DECORATED_TEXT_COMMAND enum entry
 * @param {array<any>} _aargs argument array for command
 * @param {real} _char_index index of character the animation refers to in character array
 */
function TagDecoratedTextAnimation(_command, _aargs, _char_index) constructor {
	style = new TagDecoratedTextStyle();
	style.set_undefined();
	command = _command;
	params = _aargs;
	character_index = _char_index;
	mergeable = true;
	content_width = 0;
	content_height = 0;
	
	/// @param {real} _time_ms
	update = function(_time_ms) {};
	
	if (command == TAG_DECORATED_TEXT_COMMANDS.FADE) {
		alpha_min = global.tds_animation_default_fade_alpha_min;
		alpha_max = global.tds_animation_default_fade_alpha_max;
		cycle_time = global.tds_animation_default_fade_cycle_time_ms;
		if (array_length(params) == 3) {
			alpha_min = params[0];
			alpha_max = params[1];
			cycle_time = params[2];
		} else if (array_length(params) != 0) {
			show_error("TDS Error: Improper number of args for fade animation!", true);
		}
		
		/// @param {real} _time_ms
		update = function(_time_ms) {
			var _check = _time_ms % (cycle_time * 2);
			if (_check <= cycle_time) {
				_check = cycle_time - _check;
			} else {
				_check -= cycle_time;
			}
			var _new_alpha = alpha_min + _check/cycle_time * (alpha_max - alpha_min);
			style.alpha = _new_alpha;
		}
	}
	
	if (command == TAG_DECORATED_TEXT_COMMANDS.SHAKE) {
		mergeable = false;
		shake_time = global.tds_animation_default_shake_time_ms;
		shake_magnitude = global.tds_animation_default_shake_magnitude;
		if (array_length(params) == 2) {
			shake_time = params[0];
			shake_magnitude = params[1];
		} else if (array_length(params) != 0) {
			show_error("TDS Error: Improper number of args for shake animation!", true);
		}
		
		/// @param {real} _time_ms
		update = function(_time_ms) {
			var _index_x = floor(_time_ms / shake_time) + character_index * 1000;
			var _index_y= _index_x + 4321;
			style.mod_x = floor(shake_magnitude * 2 * get_tag_decorated_text_random(_index_x)) - shake_magnitude;
			style.mod_y = floor(shake_magnitude * 2 * get_tag_decorated_text_random(_index_y)) - shake_magnitude;
		}
	}
}
