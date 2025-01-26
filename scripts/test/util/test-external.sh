RESULTS=$( ${BASH_UNIT} ${TEST_INTERNAL} ) &&
  if [ ! -z "${RESULTS}" ]
  then
    ${ECHO} "${RESULTS}" &&
      exit 64
  fi