#ifdef GL_ES
precision highp float;
#endif

varying vec3 vPositionW;

#ifdef CLIPPLANE
varying float fClipDistance;
#endif

void main(void) {
	// Clip plane
#ifdef CLIPPLANE
	if (fClipDistance > 0.0)
		discard;
#endif

	// Final composition
	vec3 finalColor = vec3(vPositionW.x, vPositionW.y, vPositionW.z);
}
