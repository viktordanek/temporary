${INNER} &&
  ${SLEEP} ${TIMEOUT} &&
  if [ -z "$( ${CAT} /post/temporary.standard-error ) }" ]
  then
    ${RM} /post/temporary.standard-error
  fi &&
  if [ $(( $( ${CAT} /post/increment ) + 1 )) == ${COUNT} ]
  then
    ${RM} /post/increment
  fi &&
  LEAKS=$( ${FIND} /temporary -mindepth 1 -maxdepth 1 -type d | ${WC} --lines ) &&
  if [ ${LEAKS} != 0 ]
  then
    ${ECHO} ${LEAKS} > /post/leaks
  fi