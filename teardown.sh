exec 201> /mount/${RESOURCE_NAME}/lock &&
  if ${FLOCK} 201
  then
   ${ECHO} teardown B >> /archive/DEBUG ${ECHO} teardown b >> /mount/debug && if [ ${STATUS} == 0 ]
    then
      ${TAIL} --follow /dev/null --pid ${ORIGINATOR_PID} && ${ECHO} teardown C >> /archive/DEBUG
    fi && export RESOURCE=/mount/${RESOURCE_NAME} &&
#
    if ${RELEASE} > /mount/${RESOURCE_NAME}/release.standard-output 2> /mount/${RESOURCE_NAME}/release.standard-error
    then
      ${ECHO} ${?} > /mount/${RESOURCE_NAME}/release.status && ${ECHO} teardown D >> /archive/DEBUG
    else
      ${ECHO} ${?} > /mount/${RESOURCE_NAME}/release.status && ${ECHO} teardown E >> /archive/DEBUG
    fi &&
#
#
       ${ECHO} teardown M >> /archive/DEBUG && ( ${POST} || ${TRUE} ) && ${ECHO} teardown >&2 && ${ECHO} teardown N >> /archive/DEBUG &&
#
      ${RM} --recursive --force /mount/${RESOURCE_NAME}
  else
    ${ECHO} FAILED TO LOCK /mount/${RESOURCE_NAME}/lock >&2 &&
      exit ${LOCK_FAILURE}
  fi