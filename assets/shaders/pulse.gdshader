
shader_type canvas_item;



uniform vec4 my_color;

uniform float speed = 1.5;



void vertex() {

} 

void fragment() {

    

    COLOR = texture(TEXTURE, UV) * (cos(UV.y - sin(UV.x) - (TIME / 6.9)) + sin(UV.y) + (vec4(
		cos(TIME + cos(TIME / 2.0 - UV.y)) * 1.4, 
		+ 0.5,
		sin(TIME - cos(TIME)) * 2.0,
		100.0)
		)/ 5.0 - 1.0);


} 