#version 450

layout(binding = 1) uniform sampler2D texSampler;

layout(location = 0) in vec3 fragNormal;
layout(location = 1) in vec3 fragPosition;
layout(location = 2) in vec2 fragTexCoord;

layout(location = 0) out vec4 outColor;

void main() {
  // point light
  vec4 lightPos = vec4(0.0, 0.0, 0.0, 1.0);

  vec4 ambientColor = vec4(0.2, 0.2, 0.2, 1.0);
  vec4 diffuseColor = vec4(0.6, 0.2, 0.3, 1.0);
  vec4 specularColor = vec4(1.0, 1.0, 1.0, 1.0);

  vec4 outputColor = vec4(0.0, 0.0, 0.0, 0.0);

  //outputColor += ambientColor;

  vec3 camera_space_normal = normalize(fragNormal);
  vec3 camera_space_lightDir = normalize(lightPos.xyz - fragPosition);

  float diffuseIntensity = max(dot(camera_space_normal, camera_space_lightDir), 0.0);
  outputColor += diffuseColor * diffuseIntensity;

  outColor = clamp(outputColor, 0, 1);

  outColor = vec4(diffuseIntensity, diffuseIntensity, diffuseIntensity, 1.0);

  outColor = vec4(0.7, 0.2, 0.2, 1.0);
}
