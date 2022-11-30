global.tds_animation_default_fade_alpha_min = 0.3;
global.tds_animation_default_fade_alpha_max = 1;
global.tds_animation_default_fade_cycle_time = 1000;


/**
 * Set default values for fade animation.
 * @param {real} _alpha_min minimum alpha
 * @param {real} _alpha_max maximum alpha
 * @param {real} _cycle_time time in ms for one cycle of animation
 */
function tag_decorated_text_set_default_fade(_alpha_min, _alpha_max, _cycle_time) {
	global.tds_animation_default_fade_alpha_min = _alpha_min;
	global.tds_animation_default_fade_alpha_max = _alpha_max;
	global.tds_animation_default_fade_cycle_time = _cycle_time;
}

function TagDecoratedTextAnimation(_name, _aargs, _char_index) constructor {
	style = new TagDecoratedTextStyle();
	style.set_undefined();
	command = _name;
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
		cycle_time = global.tds_animation_default_fade_cycle_time;
		if (array_length(params) == 3) {
			alpha_min = params[0];
			alpha_max = params[1];
			cycle_time = params[2];
		} else if (array_length(params) != 0) {
			show_error("TDS Error: Improper number of args for fade animation!", true);
		}
		
		/// @param {real} _time_ms
		update = function(_time_ms) {
			var _check = time_ms % (cycle_time * 2);
			if (_check <= cycle_time) {
				_check = cycle_time - _check;
			} else {
				_check -= cycle_time;
			}
			var _new_alpha = alpha_min + _check/cycle_time * (alpha_max - alpha_min);
			style.alpha = _new_alpha;
		}
	}
}
