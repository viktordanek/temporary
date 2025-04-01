exec 201> /mount/resources/lock &&
  if ${FLOCK} 201
  then
    ${TAIL} --follow --pid ${PID} &&
#
    if ${RELEASE} > /mount/resources/release.standard-output >2 /mount/resources/release.standard-error
    then
      ${ECHO} ${?} > /mount/resources/release.status
    else
      ${ECHO} ${?} > /mount/resources/release.status
    fi &&
#
#
      ( ${POST} || ${TRUE} ) &&
#
      ${RM} --recursive --force /mount/resources
  else
    ${ECHO} FAILED TO LOCK /mount/resources/lock >&2 &&
      exit ${LOCK_FAILURE}
  fi