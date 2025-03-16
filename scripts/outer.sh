${INNER} &&
  ${SLEEP} ${TIMEOUT} &&
  exec 203> /post/.lock &&
  ${FLOCK} 203 &&
  LEAKS=$( ${FIND} /temporary -mindepth 1 -maxdepth 1 | ${WC} --lines ) &&
  if ${VERBOSE} || [ ${LEAKS} != 0 ]
  then
    ${ECHO} ${LEAKS} > /post/leaks
  fi &&
  ${RM} /post/.lock