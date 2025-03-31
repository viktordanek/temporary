exec 201 > /mount/resource.lock &&
  if ${FLOCK} 201
  then
    ${TAIL} --follow --pid ${PID} &&
#
      if ${RELEASE} > /mount/resource/release.standard-output >2 /mount/resource/release.standard-error
      then
        ${ECHO} ${?} > /mount/resource/release.status
      else
        ${ECHO} ${?} > /mount/resource/release.status
      fi &&
#
#
      ( ${POST} || ${TRUE} ) &&
#
      ${RM} --recursive --force /mount/resource
  else
    ${ECHO} FAILED TO LOCK /mount/resource.lock >&2 &&
      exit ${LOCK_FAILURE}
  fi