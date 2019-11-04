file (GLOB_RECURSE LIB_SOURCES "*.cpp")
add_library (src_static STATIC ${LIB_SOURCES})
add_dependencies (src_static format)
