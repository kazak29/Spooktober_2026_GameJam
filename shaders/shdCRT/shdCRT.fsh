varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_resolution;
uniform float u_time;

// Lightweight noise function
float rand(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

// Very slight, natural tube curvature
vec2 curve(vec2 uv) {
    uv = (uv - 0.5) * 2.0;
    uv.x *= 1.0 + pow((abs(uv.y) / 10.0), 2.0);
    uv.y *= 1.0 + pow((abs(uv.x) / 8.0), 2.0);
    return (uv / 2.0) + 0.5;
}

void main() {
    vec2 uv = curve(v_vTexcoord);
    
    // Black out rounded outer edges
    if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) {
        gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    }

    // Subtle Color Bleed
    float offset = 0.0015;
    float r = texture2D(gm_BaseTexture, vec2(uv.x + offset, uv.y)).r;
    float g = texture2D(gm_BaseTexture, uv).g;
    float b = texture2D(gm_BaseTexture, vec2(uv.x - offset, uv.y)).b;
    vec3 col = vec3(r, g, b);

    // Fine Film/Tape Grain
    float noise = (rand(uv + vec2(u_time)) - 0.5) * 0.02;
    col += noise;

    // Gentle Scanlines
    float scanline = sin(uv.y * u_resolution.y * 1.0) * 0.04;
    col -= scanline;

    // Subtle Vignette
    float vig = uv.x * uv.y * (1.0 - uv.x) * (1.0 - uv.y);
    vig = clamp(pow(16.0 * vig, 0.15), 0.0, 1.0);
    col *= vig;

    gl_FragColor = v_vColour * vec4(col, 1.0);
}
