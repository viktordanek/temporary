${ECHO} BEGIN TEARDOWN_SYNCH >> ${RESOURCE}/debug &&
${ECHO} A >> ${RESOURCE}/debug &&
exec 200> ${RESOURCE}/lock &&
  if ${FLOCK} 200
  then
${ECHO} B >> ${RESOURCE}/debug &&
    PID=$( ${CAT} ${RESOURCE}/pid ) &&
${ECHO} C >> ${RESOURCE}/debug &&
      ${TAIL} --follow /dev/null --pid ${PID} &&
${ECHO} D >> ${RESOURCE}/debug &&
      ${RM} ${RESOURCE}/pid
${ECHO} E >> ${RESOURCE}/debug &&
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
${ECHO} F >> ${RESOURCE}/debug &&
      if [ -L ${RESOURCE}/post.sh ]
      then
        ${RESOURCE}/post.sh || ${TRUE}
      fi &&
${ECHO} G >> ${RESOURCE}/debug &&
      ${RM} --recursive --force ${RESOURCE} &&
${ECHO} H >> ${RESOURCE}/debug &&
      if [ ! -z "${STATUS}" ] && [ ${STATUS} != 0 ]
      then
        exit ${ERROR}
      fi
    else
      ${ECHO} Unable to acquire an exclusive lock 2>&1 &&
        exit ${ERROR}
  fi