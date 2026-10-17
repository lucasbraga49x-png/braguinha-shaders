
#version 120

uniform sampler2D texture;
uniform sampler2D lightmap;

varying vec2 texCoord;
varying vec2 lightmapCoord;
varying vec4 vertexColor;

void main() {
    vec4 texColor = texture2D(texture, texCoord) * vertexColor;
    vec3 light = texture2D(lightmap, lightmapCoord).rgb;

    // Reduz levemente a claridade geral.
    light = mix(vec3(0.0), light, 0.92);

    texColor.rgb *= light;

    float fog = clamp(
        (gl_FogFragCoord - gl_Fog.start) * gl_Fog.scale,
        0.0,
        1.0
    );

    texColor.rgb = mix(
        texColor.rgb,
        gl_Fog.color.rgb,
        fog
    );

    gl_FragData[0] = texColor;
}
