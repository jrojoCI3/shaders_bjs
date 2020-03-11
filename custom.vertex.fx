#ifdef GL_ES
precision highp float;
#endif

// Attributes
attribute vec3 position;
attribute vec3 normal;
//attribute vec2 uv;

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
	vNormalW = normalize(vec3(world * vec4(normal, 0.0)));

	//vGrassBlendUV.xy = vec2(grassMatrix * vec4(uv, 1.0, 0.0));
	//vGrassBlendUV.zw = vec2(blendMatrix * vec4(uv, 1.0, 0.0));

	// Clip plane
#ifdef CLIPPLANE
	fClipDistance = dot(worldPos, vClipPlane);
#endif
}
