shader_type canvas_item;

uniform sampler2D noise_texture;

void fragment() {
    vec2 uv = FRAGCOORD.xy / SCREEN_PIXEL_SIZE;
    float noise_value = texture(noise_texture, uv).r;
    COLOR = vec4(vec3(noise_value), 1.0);
}