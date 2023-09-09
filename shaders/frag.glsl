#version 450

layout(location = 0) in vec3 fragNormal;
layout(location = 1) in vec3 fragPosition;

layout(location = 0) out vec4 outColor;

void main() {
  // point light
  vec4 lightPos = vec4(2.0, 4.0, 1.0, 1.0);

  vec4 ambientColor = vec4(0.1, 0.1, 0.1, 1.0);
  vec4 diffuseColor = vec4(0.58, 0.15, 0.0, 1.0);
  vec4 specularColor = vec4(1.0, 1.0, 1.0, 1.0);

  float shininess = 47.0;

  outColor = ambientColor;

  vec3 camera_space_normal = normalize(fragNormal);
  vec3 camera_space_lightDir = normalize(lightPos.xyz - fragPosition);

  float diffuseIntensity = max(dot(camera_space_normal, camera_space_lightDir), 0.0);

  outColor += vec4(diffuseIntensity * vec3(diffuseColor), 1.0);

  // now add the specular component
  vec3 camera_space_eyeDir = normalize(vec3(0.0, 0.0, 0.0) - fragPosition);
  vec3 camera_space_half_vector = normalize(camera_space_eyeDir + camera_space_lightDir);

  float specularIntensity = pow(max(dot(camera_space_normal, camera_space_half_vector), 0.0), shininess);
  outColor += vec4(specularIntensity * vec3(specularColor), 1.0);

  outColor = clamp(outColor, 0, 1);
}
