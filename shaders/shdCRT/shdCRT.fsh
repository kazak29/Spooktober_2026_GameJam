varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2  u_resolution;
uniform float u_time;
uniform float u_abberation;			//replaces offset for Subtle Color Bleed
uniform float u_noise;				//replaces multiplier for grain noise
uniform float u_scanlines;			//replaces multiplier for scanlines
uniform float u_scanlines_glow;		//toggles glow from to_srgb script
uniform float u_mask;				// 0 off, 1 grille, 2 dots, 3 slot
uniform float u_mask_scale;			// phosphor cell size in screen pixels
uniform float u_glow;				// phosphor glow amount
uniform float u_bright;				// gain to offset scanline + mask dimming
uniform float u_flicker;			//faint flicker multiplier
uniform float u_roll;				//rolling band multiplier

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

vec4 gen_mask(vec2 fc)
{
    if (u_mask < 0.5) return vec4(0.5);

    vec2 g = floor(fc / u_mask_scale);     // one phosphor cell per u_mask_scale screen pixels

    if (u_mask < 1.5)            // aperture grille
    {
        float i = mod(g.x, 3.0);
        vec3 p = (i < 1.0) ? vec3(1.0, 0.0, 0.0)
               : (i < 2.0) ? vec3(0.0, 1.0, 0.0)
               :             vec3(0.0, 0.0, 1.0);
        return vec4(p, 1.0 / 3.0);
    }

    if (u_mask < 2.5)            // dots / shadow mask
    {
        float ix = mod(g.x, 2.0);
        float iy = mod(g.y, 2.0);
        float k  = mod(iy * 2.0 + ix, 4.0);
        vec3 p = (k < 1.0) ? vec3(1.0, 0.0, 0.0)
               : (k < 2.0) ? vec3(0.0, 1.0, 0.0)
               : (k < 3.0) ? vec3(0.0, 0.0, 1.0)
               :             vec3(0.0, 0.0, 0.0);
        return vec4(p, 0.25);
    }

    // slot mask: rgb stripes with staggered horizontal gaps
    float sx = mod(g.x, 3.0);
    vec3 stripe = (sx < 1.0) ? vec3(1.0, 0.0, 0.0)
                : (sx < 2.0) ? vec3(0.0, 1.0, 0.0)
                :             vec3(0.0, 0.0, 1.0);
    float triad = mod(floor(g.x / 3.0), 2.0);
    float yy = mod(g.y + triad * 2.0, 4.0);
    float lit = 1.0 - step(3.0, yy);
    return vec4(stripe * lit, 0.25);
}

// phosphor mask with highlight preservation (brightness kept on bright pixels)
vec3 apply_mask(vec3 lin, vec2 fc)
{
    vec4 m = gen_mask(fc);
    vec3 target = lin / m.w;
    vec3 prim = clamp(target, 0.0, 1.0);
    vec3 hi = (target - prim) / (1.0 / m.w - 1.0 + 0.0001);
    prim *= m.rgb;
    prim += hi * (1.0 - m.rgb);
    return prim;
}

vec3 to_linear(vec3 c)
{
    vec3 hi = pow((c + 0.055) / 1.055, vec3(2.4));
    vec3 lo = c / 12.92;
    return mix(hi, lo, step(c, vec3(0.04045)));
}

vec3 to_srgb(vec3 c)
{
    vec3 hi = pow(max(c, 0.0), vec3(1.0 / 2.4)) * 1.055 - 0.055;
    vec3 lo = c * 12.92;
    return mix(hi, lo, step(c, vec3(0.0031308)));
}

// bright-pass bloom with a warm halation tint (only lit areas bleed)
vec3 glow(vec2 uv)
{
    vec2 px = 3.0 / u_resolution;
    vec3 g = vec3(0.0);
    g += max(to_linear(texture2D(gm_BaseTexture, uv + vec2( 1.0,  0.0) * px).rgb) - 0.3, 0.0);
    g += max(to_linear(texture2D(gm_BaseTexture, uv + vec2(-1.0,  0.0) * px).rgb) - 0.3, 0.0);
    g += max(to_linear(texture2D(gm_BaseTexture, uv + vec2( 0.0,  1.0) * px).rgb) - 0.3, 0.0);
    g += max(to_linear(texture2D(gm_BaseTexture, uv + vec2( 0.0, -1.0) * px).rgb) - 0.3, 0.0);
    g += max(to_linear(texture2D(gm_BaseTexture, uv + vec2( 1.0,  1.0) * px).rgb) - 0.3, 0.0);
    g += max(to_linear(texture2D(gm_BaseTexture, uv + vec2(-1.0, -1.0) * px).rgb) - 0.3, 0.0);
    g += max(to_linear(texture2D(gm_BaseTexture, uv + vec2( 1.0, -1.0) * px).rgb) - 0.3, 0.0);
    g += max(to_linear(texture2D(gm_BaseTexture, uv + vec2(-1.0,  1.0) * px).rgb) - 0.3, 0.0);
    g /= 8.0;
    return g * vec3(1.0, 0.82, 0.72);   // warm phosphor halation
}

void main() {
    vec2 uv = curve(v_vTexcoord);
    
    // Black out rounded outer edges
    if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) {
        gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    }

    // Subtle Color Bleed
    float offset = u_abberation;	//defaut is 0.0015
    float r = texture2D(gm_BaseTexture, vec2(uv.x + offset, uv.y)).r;
    float g = texture2D(gm_BaseTexture, uv).g;
    float b = texture2D(gm_BaseTexture, vec2(uv.x - offset, uv.y)).b;
    vec3 col = vec3(r, g, b);

    // Fine Film/Tape Grain
    float noise = (rand(uv + vec2(u_time)) - 0.5) * u_noise;	//default is 0.02
    col += noise;

    // Gentle Scanlines
    float scanline = sin(uv.y * u_resolution.y * 1.0) * u_scanlines;	//default is 0.04
    col -= scanline;
	
	// post-scanline color manipulations
	col += glow(uv) * u_glow;
    col *= u_bright;                        // claw back the light the scanlines + mask take
    col = apply_mask(col, gl_FragCoord.xy);
    if (u_scanlines_glow > 0.0) col = to_srgb(col);
	
	// slow rolling band
    float roll = fract(uv.y - u_time * 0.08);
    float band = smoothstep(0.0, 0.05, roll) * (1.0 - smoothstep(0.05, 0.12, roll));
    col *= 1.0 - band * u_roll; //default is 0.10
	
	// faint flicker
    float flick = 1.0 + (fract(sin(u_time * 11.0) * 43758.5453) - 0.5) * u_flicker; //default is 0.025
    col *= flick;
	
    // Subtle Vignette
    float vig = uv.x * uv.y * (1.0 - uv.x) * (1.0 - uv.y);
    vig = clamp(pow(16.0 * vig, 0.15), 0.0, 1.0);
    col *= vig;
	
    gl_FragColor = v_vColour * vec4(col, 1.0);
}
