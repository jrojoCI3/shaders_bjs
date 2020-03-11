#ifdef GL_ES
precision highp float;
#endif

// Attributes
attribute vec3 position;

// Uniforms
uniform mat4 world;
uniform mat4 worldViewProjection;

// positionW
varying vec3 vPositionW;

#ifdef CLIPPLANE
uniform vec4 vClipPlane;
varying float fClipDistance;
#endif

void main(void) {
	gl_Position = worldViewProjection * vec4(position, 1.0);   	
	vec4 worldPos = world * vec4(position, 1.0);
	vPositionW = vec3(worldPos);

	// Clip plane
#ifdef CLIPPLANE
	fClipDistance = dot(worldPos, vClipPlane);
#endif
}
