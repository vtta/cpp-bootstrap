file(GLOB_RECURSE GTEST_SOURCES "gtest/*.cpp")
file(GLOB_RECURSE BINTEST_SOURCES "bin/*.cpp")

foreach (gtest_source ${GTEST_SOURCES})
    get_filename_component (gtest_source_filename ${gtest_source} NAME)
    string (REPLACE ".cpp" "" gtest_name ${gtest_source_filename})
    add_gtest (${gtest_name} ${gtest_source})
endforeach (gtest_source ${GTEST_SOURCES})

foreach (bintest_source ${BINTEST_SOURCES})
    get_filename_component (bintest_source_filename ${bintest_source} NAME)
    string (REPLACE ".cpp" "" bintest_name ${bintest_source_filename})
    add_cpp_exec (${bintest_name} ${bintest_source})
endforeach (bintest_source ${BINTEST_SOURCES})
