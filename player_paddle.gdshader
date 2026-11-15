shader_type canvas_item;

uniform float wave_speed : hint_range(0.5, 5.0) = 1.8;
uniform float wave_frequency : hint_range(5.0, 40.0) = 18.0;
uniform float wave_strength : hint_range(0.0, 0.02) = 0.004;
uniform float shimmer : hint_range(0.0, 0.5) = 0.15;
uniform vec4 green_tint : source_color = vec4(0.1, 1.0, 0.55, 1.0);
uniform vec4 blue_tint : source_color = vec4(0.1, 0.65, 1.0, 1.0);

void fragment() {
	vec2 uv = UV;
	float wave_x = sin(uv.y * wave_frequency + TIME * wave_speed) * wave_strength;
	float wave_y = cos(uv.x * wave_frequency + TIME * wave_speed * 0.8) * wave_strength;

	vec4 tex = texture(TEXTURE, uv + vec2(wave_x, wave_y));
	float highlight = max(0.0, sin((uv.x + uv.y) * wave_frequency * 0.7 + TIME * wave_speed)) * shimmer;

	float color_blend = sin((uv.x - uv.y) * 4.0 + TIME * wave_speed * 0.6) * 0.5 + 0.5;
	vec3 sheen_color = mix(green_tint.rgb, blue_tint.rgb, color_blend);

	COLOR = vec4(tex.rgb + sheen_color * highlight, tex.a);
}
