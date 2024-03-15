shader_type canvas_item;

uniform float offset = 20.0;

void fragment() {
	vec4 base_color = texture(TEXTURE,UV);
	vec4 new_color = base_color;
	vec2 new_offset = vec2(offset,0.0) * SCREEN_PIXEL_SIZE;
	vec4 red = texture(TEXTURE,UV - new_offset);
	vec4 green = texture(TEXTURE,UV);
	vec4 blue = texture(TEXTURE,UV + new_offset);
	
	COLOR = new_color;
}
