exec 201> /mount/${RESOURCE_NAME}/lock &&
  if ${FLOCK} 201
  then
    if [ ${STATUS} == 0 ]
    then
      ${TAIL} --follow --pid ${ORIGINATOR_PID}
    fi &&
#
    if ${RELEASE} > /mount/${RESOURCE_NAME}/release.standard-output 2> /mount/${RESOURCE_NAME}/release.standard-error
    then
      ${ECHO} ${?} > /mount/${RESOURCE_NAME}/release.status
    else
      ${ECHO} ${?} > /mount/${RESOURCE_NAME}/release.status
    fi &&
#
#
      ( ${POST} || ${TRUE} ) &&
#
      ${ECHO} REVERSE ME ${RM} --recursive --force /mount/${RESOURCE_NAME}
  else
    ${ECHO} FAILED TO LOCK /mount/${RESOURCE_NAME}/lock >&2 &&
      exit ${LOCK_FAILURE}
  fi