cmake_minimum_required(VERSION 3.20...3.27 FATAL_ERROR)

project(vulkan-simple-model-loading VERSION 1.0 LANGUAGES CXX)

set(glfw3_DIR /usr/local/lib/cmake/glfw3)
set(glm_DIR /usr/local/lib/cmake/glm)

find_package(glfw3 REQUIRED)
find_package(glm REQUIRED)

include(macros_cmake/glslc.cmake.macro)

add_executable(a.out main.cpp)

target_compile_features(a.out PUBLIC cxx_std_20)

file(COPY models DESTINATION ${CMAKE_BINARY_DIR})

ATTACH_GLSL_SHADERS(a.out "${CMAKE_SOURCE_DIR}/shaders")

target_link_libraries(a.out PUBLIC glfw3 vulkan dl pthread X11 Xxf86vm Xrandr Xi)

