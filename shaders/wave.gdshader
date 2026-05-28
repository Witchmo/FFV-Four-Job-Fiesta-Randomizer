shader_type canvas_item;

uniform float amplitude_px : hint_range(1.0, 100.0, 0.1) = 1.0;
uniform float frequency : hint_range(0.0, 1.0, 0.01) = 0.2;
uniform float speed : hint_range(0.0, 100.0, 0.01) = 2.0;
uniform float line_height : hint_range(0.0, 100.0, 1.0) = 1.0;

void fragment() {
    vec2 uv = UV;

    float tex_h = float(textureSize(TEXTURE, 0).y);
    float row = floor((uv.y * tex_h) / line_height) * line_height;

    float wave = sin(row * frequency + TIME * speed);

    float tex_w = float(textureSize(TEXTURE, 0).x);
	uv.x += (wave * amplitude_px) / tex_h;

    COLOR = texture(TEXTURE, uv);
}