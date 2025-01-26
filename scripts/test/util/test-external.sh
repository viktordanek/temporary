RESULTS=$( ${BASH_UNIT} ${TEST_INTERNAL} ) &&
  if ! ${BASH_UNIT} ${TEST_INTERNAL}
  then
    exit 64
  fi