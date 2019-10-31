macro (add_cpp_exec exec_name)
    add_executable ("${exec_name}" "${exec_name}.cpp")
    target_link_libraries ("${exec_name}" ${ARGN} cpp_shared)
endmacro (add_cpp_exec)