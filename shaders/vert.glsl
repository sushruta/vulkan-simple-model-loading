#version 450

layout(binding = 0) uniform UniformBufferObject {
  mat4 model;
  mat4 view;
  mat4 proj;
} ubo;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inNormal;

layout(location = 0) out vec3 fragNormal;
layout(location = 1) out vec3 fragPosition;

void main() {
  mat4 nmat = transpose(inverse(ubo.view * ubo.model));
  fragNormal = mat3(nmat) * inNormal;

  fragPosition = vec3(ubo.view * ubo.model * vec4(inPosition, 1.0));
  
  gl_Position = ubo.proj * ubo.view * ubo.model * vec4(inPosition, 1.0);
}
