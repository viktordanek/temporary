exec 201> /resource/lock &&
  if ${FLOCK} 201
  then
    ${TAIL} --follow --pid ${PID} &&
#
    if ${RELEASE} > /resource/release.standard-output >2 /resource/release.standard-error
    then
      ${ECHO} ${?} > /resource/release.status
    else
      ${ECHO} ${?} > /resource/release.status
    fi &&
#
#
      ( ${POST} || ${TRUE} ) &&
#
      ${RM} --recursive --force /resource
  else
    ${ECHO} FAILED TO LOCK /resource.lock >&2 &&
      exit ${LOCK_FAILURE}
  fi