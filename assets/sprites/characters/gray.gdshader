shader_type canvas_item;
void fragment() {
	COLOR.rgb = vec3(0.299 * COLOR.r + 0.587 * COLOR.g + 0.114 * COLOR.b);
}
