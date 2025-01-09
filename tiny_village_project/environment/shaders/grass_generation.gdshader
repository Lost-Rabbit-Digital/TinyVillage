shader_type canvas_item;

uniform float scale : hint_range(1.0, 50.0) = 10.0;
uniform float roughness : hint_range(0.0, 1.0) = 0.5;
uniform float seed = 1.0;
uniform vec4 base_color : source_color = vec4(0.2, 0.3, 0.1, 1.0);
uniform vec4 noise_color : source_color = vec4(0.3, 0.4, 0.2, 1.0);

float get_noise(vec2 uv, float noise_seed) {
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453 * seed);
}

void fragment() {
    vec2 uv = UV * scale;
    
    float noise = 0.0;
    float amplitude = 1.0;
    float frequency = 1.0;
    
    // Layered noise
    for(int i = 0; i < 4; i++) {
        noise += get_noise(uv * frequency, seed) * amplitude;
        amplitude *= roughness;
        frequency *= 2.0;
    }
    
    noise = noise * 0.5 + 0.5;
    COLOR = mix(base_color, noise_color, noise);
}