set(CMAKE_MACOSX_RPATH OFF)

macro (add_cpp_exec exec_name)
    add_executable ("${exec_name}" "${ARGN}")
    target_link_libraries ("${exec_name}" ${CONAN_LIBS} cpp_shared)
    add_custom_target(run-${exec_name} "${CMAKE_BINARY_DIR}/bin/${exec_name}")
    add_dependencies(run-${exec_name} ${exec_name})
endmacro (add_cpp_exec)

macro (add_gtest TESTNAME)
    add_executable (${TESTNAME} ${ARGN})
    target_link_libraries (${TESTNAME} gtest gmock gtest_main ${CONAN_LIBS} cpp_shared)
    add_test (NAME ${TESTNAME} COMMAND ${TESTNAME})
    set_target_properties (
        ${TESTNAME}
        PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/test"
    )
    add_custom_target(run-${TESTNAME} "${CMAKE_BINARY_DIR}/bin/${TESTNAME}")
    add_dependencies(run-${TESTNAME} ${TESTNAME})
endmacro (add_gtest)
