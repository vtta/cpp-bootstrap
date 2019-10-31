cmake_minimum_required(VERSION 3.15)

project(vtta_cpp CXX)

include (cmake/defs.cmake)
include (cmake/type.cmake)
include (cmake/cflags.cmake)
include (cmake/conan.cmake)
include (cmake/doxygen.cmake)
include (cmake/format.cmake)
include (cmake/tidy.cmake)
include (cmake/cppcheck.cmake)
include (cmake/tests.cmake)

include_directories ("${PROJECT_SOURCE_DIR}/include")
add_subdirectory ("${PROJECT_SOURCE_DIR}/src")
add_subdirectory ("${PROJECT_SOURCE_DIR}/tests")
