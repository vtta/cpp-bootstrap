if (NOT CLANG_TIDY)
    if (DEFINED ENV{CLANG_TIDY})
        set (CLANG_TIDY_TMP $ENV{CLANG_TIDY})
    else (NOT DEFINED ENV{CLANG_TIDY})
        set (CLANG_TIDY_TMP clang-tidy)
    endif (DEFINED ENV{CLANG_TIDY})

    # is clang-tidy available?
    execute_process (COMMAND ${CLANG_TIDY_TMP} --version RESULT_VARIABLE CLANG_TIDY_RESULT OUTPUT_VARIABLE CLANG_TIDY_VERSION)
    if (${CLANG_TIDY_RESULT} EQUAL 0)
        string (REGEX MATCH "version ([0-9]+)\\.([0-9]+)\\.([0-9]+)" CLANG_TIDY_VERSION ${CLANG_TIDY_VERSION})
        message (STATUS "Found clang-tidy " ${CLANG_TIDY_VERSION})
        set (CLANG_TIDY ${CLANG_TIDY_TMP} CACHE STRING "clang-tidy executable name")
    endif (${CLANG_TIDY_RESULT} EQUAL 0)
endif (NOT CLANG_TIDY)

if (DEFINED CLANG_TIDY)
    file (GLOB_RECURSE ALL_CPP_FILES src/*.cpp)
    foreach (tidy_target ${ALL_CPP_FILES})
        get_filename_component (basename ${tidy_target} NAME)
        get_filename_component (dirname ${tidy_target} DIRECTORY)
        get_filename_component (basedir ${dirname} NAME)
        set (tidy_target_name "${basedir}__${basename}")
        set (tidy_command ${CLANG_TIDY} -header-filter=.* -p=${PROJECT_BINARY_DIR} ${tidy_target})
        add_custom_target (tidy_quiet_${tidy_target_name} ${tidy_command} 2>/dev/null)
        add_custom_target (tidy_${tidy_target_name} ${tidy_command})
        list (APPEND ALL_TIDY_TARGETS tidy_quiet_${tidy_target_name})
        list (APPEND ALL_TIDY_VERBOSE_TARGETS tidy_${tidy_target_name})
    endforeach (tidy_target)
    add_custom_target (tidy DEPENDS ${ALL_TIDY_TARGETS})
    add_custom_target (tidy_verbose DEPENDS ${ALL_TIDY_VERBOSE_TARGETS})
else (DEFINED CLANG_TIDY)
    add_custom_target (tidy echo "Could not find clang-tidy. Please install and re-run cmake")
endif (DEFINED CLANG_TIDY)
