enable_testing()
set(LIBS telring)
set(TESTS test_ring)

include_directories(. ../include)

foreach(TEST ${TESTS})
  add_executable(${TEST} ${TEST}.c)
  target_link_libraries(${TEST} ${LIBS})
  add_test(${TEST} ${CMAKE_CURRENT_BINARY_DIR}/${TEST})
endforeach(TEST)
