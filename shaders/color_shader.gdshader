shader_type canvas_item;
uniform float size;
uniform float blue_value = 1.0;

void vertex() {
	// Animate Sprite2D moving in big circle around its location
	VERTEX += vec2(cos(TIME)*100.0, sin(TIME)*100.0);
}

void fragment() {
	// Called for every pixel the material is visible on.
	//COLOR = vec4(0.4, 0.6, 0.9, 1.0);
	//COLOR = vec4(UV, 0.5, 1.0);
	
	COLOR = texture(TEXTURE, UV); // Read from texture
	COLOR.b = blue_value;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
