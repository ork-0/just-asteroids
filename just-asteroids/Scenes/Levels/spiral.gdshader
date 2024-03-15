shader_type canvas_item;

uniform vec3 depth_color[5];
global uniform int depth_index = 0;
void fragment() {
	vec2 RESOLUTION = 1. / SCREEN_PIXEL_SIZE;
	vec2 uv = (FRAGCOORD.xy * 2.0 - RESOLUTION.xy) / RESOLUTION.y;
   	vec2 uv0 = uv;
	
    float d = length(uv);
    vec3 finalColor = vec3(0.0);
    
    for( float i = 0.0; i < 12.; i++){
    
        uv = fract(uv * 2. * .4) - 0.5;
        
        float d = length(uv) * exp(-length(uv0));
        
        vec3 col = vec3(depth_color[depth_index]);
    
        // d = sin(d * 8. + iTime);
        d = sin(d * 25. + TIME);
    
        d = abs(d);
    
        d = pow(0.007/d, .65);
        
        finalColor += col * d;

    }
	COLOR = vec4(finalColor,1);
}

