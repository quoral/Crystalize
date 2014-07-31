precision mediump float;

uniform sampler2D scene;

varying vec4 pos;
varying vec4 curvePos;
void main() {
    // if(curvePos.y < 0.0) discard;

    vec2 screenPosition = vec2(
         0.5 * pos.x/pos.z + 0.5,
         0.5 * pos.y/pos.z + 0.5
    );
    vec2 displacement = vec2(
        snoise(pos.xyz)/100.0
    );
    vec4 background = texture2D(scene, screenPosition + displacement);
    gl_FragColor = background;
}