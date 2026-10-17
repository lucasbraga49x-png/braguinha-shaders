
#version 120

varying vec2 texCoord;
varying vec4 vertexColor;

void main() {
    gl_Position = ftransform();

    texCoord = (
        gl_TextureMatrix[0] * gl_MultiTexCoord0
    ).st;

    vertexColor = gl_Color;

    gl_FogFragCoord = abs(
        (gl_ModelViewMatrix * gl_Vertex).z
    );
}
