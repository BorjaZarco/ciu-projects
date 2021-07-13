#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_volume;

void main(){
	vec2 st = gl_FragCoord.xy/u_resolution;
    float pct = 0.0;

    pct = distance(st,vec2(0.5));

    vec3 color = vec3(0.0);
    if (pct < u_volume && pct > u_volume * 0.5) {
        color = vec3(0.047, 0.286, 0.404);
        if (pct < u_volume - 0.025) { 
            color = vec3(0.137, 0.607, 0.898);
        }
    }	

	gl_FragColor = vec4( color, 1.0 );
}
