exec 200> ${RESOURCE}/lock &&
  if ${FLOCK} 200
  then
    PID=$( ${CAT} ${RESOURCE}/pid ) &&
      ${TAIL} --follow /dev/null --pid ${PID} &&
      ${RM} ${RESOURCE}/pid
      if [ -L ${RESOURCE}/release.sh ]
      then
        if ${RESOURCE}/release.sh > ${RESOURCE}/release.standard-output 2> ${RESOURCE}/release.standard-error
        then
          STATUS=${?}
        else
          STATUS=${?}
        fi &&
        ${ECHO} ${STATUS} > ${RESOURCE}/release.status &&
        ${CHMOD} 0400 ${RESOURCE}/release.standard-output ${RESOURCE}/release.standard-error ${RESOURCE}/release.status
      fi &&
      if [ -L ${RESOURCE}/post.sh ]
      then
        ${RESOURCE}/post.sh || ${TRUE}
      fi &&
      ${RM} --recursive --force ${RESOURCE} &&
      if [ ! -z "${STATUS}" ] && [ ${STATUS} != 0 ]
      then
        exit ${ERROR}
      fi
    else
      ${ECHO} Unable to acquire an exclusive lock 2>&1 &&
        exit ${ERROR}
  fi