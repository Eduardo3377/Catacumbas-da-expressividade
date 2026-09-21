
shader_type canvas_item;



uniform vec4 my_color;

uniform float speed = 1.0;



void vertex() {

} 

void fragment() {

     
    COLOR = texture(TEXTURE, UV) + vec4((cos(UV.y) * 0.6) - 1.2, (cos(UV.y) - 0.7), -0.3, 0.0);


} 