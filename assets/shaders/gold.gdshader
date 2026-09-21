
shader_type canvas_item;



uniform vec4 my_color;

uniform float speed = 1.0;



void vertex() {

} 

void fragment() {

     
    COLOR = texture(TEXTURE, UV) + vec4((cos(UV.y) - 0.5), (cos(UV.y) * 1.5) - 0.8, (sin(UV.y) * 0.2) - 0.4, 0.0);


} 