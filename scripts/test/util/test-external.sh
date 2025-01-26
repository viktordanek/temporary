RESULTS=$( ${BASH_UNIT} ${TEST_INTERNAL} ) &&
  if [ ! -z "$( ${BASH_UNIT} ${TEST_INTERNAL} )" ]
  then
    exit 64
  fi