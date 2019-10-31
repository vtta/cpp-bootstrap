file (GLOB_RECURSE LIB_SOURCES "*.cpp")
add_library (cpp_shared SHARED ${LIB_SOURCES})
add_dependencies (cpp_shared format)
