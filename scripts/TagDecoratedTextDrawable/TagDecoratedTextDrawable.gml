/**
 * Create a new Tag Decorated Text Drawable element. Requires a reference to a
 * Tag Decorated String Character array. Although a single drawable can draw
 * many characters from the array, it needs to start with a reference to a
 * single character. The drawable does not modify the character array it
 * references.
 * @param {array<struct.TagDecoratedTextCharacter>} _character_arr the character array this drawable derives its data from
 * @param {real} _index the index in the character array
 * @param {struct.TagDecoratedTextDrawable} _previous the drawable before this in the linked list
 * @param {struct.TagDecoratedTextDrawable} _next the drawable after this in the linked list
 */
function TagDecoratedTextDrawable(_character_arr, _index, _previous, _next) constructor {
	character_array_reference = _character_arr; // this array is never modified
	previous = _previous;
	next = _next;
	i_start = _index;
	i_end = _index;
	content = "";
	content_width = 0;
	content_height = 0;
	style = character_array_reference[i_start].style.copy();
	/// @param {struct.TagDecoratedTextAnimation} _animation animation
	var _map = function(_animation) {
		return _animation.copy();
	};
	animations = array_map(character_array_reference[i_start].animations, _map);
	animation_hash = "";
	sprite = spr_tag_decorated_text_default;
	
	/**
	 * Calculates the content, sprite, and content widths and heights for
	 * this drawable and its animations. Modifies this drawable and its
	 * animations.
	 */
	calculate_content = function() {
		content = "";
		/*
		Drawables are designed to be unmergeable if any of its characters contain sprites.
		So we know that all drawables only refer to one index if they contain a sprite. So
		we can just use i_start here.
		*/
		sprite = character_array_reference[i_start].sprite;
		
		var _content_width = 0;
		var _content_height = 0;
		if (sprite == undefined) {
			for (var _i = i_start; _i <= i_end; _i++) {
				content += character_array_reference[_i].character;
				_content_width += character_array_reference[_i].char_width;
				if (character_array_reference[_i].char_height > _content_height) {
					_content_height = character_array_reference[_i].char_height;
				}
			}
		} else {
			_content_width = sprite_get_width(sprite) * style.scale_x;
			_content_height = sprite_get_height(sprite) * style.scale_y;
		}
		
		animation_hash = "";
		for (var _i = 0; _i < array_length(animations); _i++) {
			animations[_i].content_width = _content_width;
			animations[_i].content_height = _content_height;
			animation_hash += string(animations[_i].get_hash());
		}
	};
	calculate_content();
	
	/**
	 * Returns a boolean indicating if this drawable can be merged with others.
	 */
	get_mergeable = function() {
		if (sprite != undefined) return false;
		
		/// @param {boolean} _prev previous value
		/// @param {struct.TagDecoratedTextAnimation} _animation current animation
		var _reduce = function(_prev, _animation) {
			return _animation.mergeable ? _prev : false;
		};
		return bool(array_reduce(animations, _reduce, true));
	};
	
	/**
	 * Merges this drawable with the previous and next drawables it references. The 
	 * previous and next drawables are destroyed. Drawables are only merged
	 * if mergeable.
	 */
	merge = function() {
		if (previous != undefined && previous.i_end + 1 == i_start && previous.get_mergeable()) {
			i_start = previous.i_start;
		}
		if (next != undefined && i_end + 1 == next.i_start && next.get_mergeable()) {
			i_end = next.i_end;
		}
		calculate_content();
	};
	
	/**
	 * Resets any style modifications to the style stored in the character array.
	 */
	init = function() {
		var _style = character_array_reference[i_start].style;
		style.font = _style.font;
		style.style_color = _style.style_color;
		style.alpha = _style.alpha;
		style.scale_x = _style.scale_x;
		style.scale_y = _style.scale_y;
		style.mod_x = _style.mod_x;
		style.mod_y = _style.mod_y;
		style.mod_angle = _style.mod_angle;
	};
	
	/**
	 * Update all animations in this drawable 
	 * @param {real} _time_ms time in ms that has passed in the game
	 */
	update = function(_time_ms) {
		init();
		for (var _i = 0; _i < array_length(animations); _i++) {
			animations[_i].update(_time_ms)
			var _s = drawable.animations[@ i].style
			if (_s.mod_angle != undefined) {
				drawable.style.mod_angle += _s.mod_angle
			}
			if (_s.s_color != undefined) {
				drawable.style.s_color = _s.s_color
			}
			if (_s.font != undefined) {
				drawable.style.font = _s.font
			}
			if (_s.alpha != undefined) {
				drawable.style.alpha *= _s.alpha
			}
			if (_s.mod_x != undefined) {
				drawable.style.mod_x += _s.mod_x
			}
			if (_s.mod_y != undefined) {
				drawable.style.mod_y += _s.mod_y
			}
			if (_s.scale_x != undefined) {
				drawable.style.scale_x *= _s.scale_x
			}
			if (_s.scale_y != undefined) {
				drawable.style.scale_y *= _s.scale_y
			}
		}
	};
}
