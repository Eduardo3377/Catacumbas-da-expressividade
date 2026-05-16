
shader_type canvas_item;



uniform vec4 my_color;

uniform float speed = 20.0;



void vertex() {


    VERTEX.x += cos(TIME - (TIME * 2.5)) - 2.0 * sin(TIME * VERTEX.y + VERTEX.x);

    VERTEX.y += 10.0 / (TIME - VERTEX.y) - cos(VERTEX.x) + sin(TIME / 4.4) - (VERTEX.x/TIME);

} 

void fragment() {

    

    COLOR = texture(TEXTURE, UV) + cos(UV.y - sin(UV.x) - (TIME - 2.0)) + sin(UV.y - (UV.x * 2.0)) + (vec4(cos(TIME + cos(TIME / 2.0 - UV.y)) * 1.4, cos(TIME * UV.x + 2.0 - UV.y + UV.x) * 1.5 - 0.5, sin(TIME - cos(TIME)) * 1.5 - 1.0, 5.0));


} 