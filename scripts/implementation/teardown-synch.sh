exec 200> ${LOCAL_RESOURCE}/lock &&
  if ${FLOCK} 200
  then
    ${FIND} ${LOCAL_RESOURCE} -mindepth 1 -maxdepth 1 -name "*.pid" -type f | while read PID_FILE
    do
      PID=$( ${BASENAME} ${PID_FILE%.*} ) &&
        ${TAIL} --follow /dev/null --pid ${PID} &&
        ${RM} ${PID_FILE}
    done
    if [ -L ${LOCAL_RESOURCE}/release.sh ]
    then
      if ${LOCAL_RESOURCE}/release.sh > ${LOCAL_RESOURCE}/release.standard-output 2> ${LOCAL_RESOURCE}/release.standard-error
      then
        STATUS=${?}
      else
        STATUS=${?}
      fi
    fi
    ${ECHO} ${STATUS} > ${LOCAL_RESOURCE}/release.status &&
    ${CHMOD} 0400 ${LOCAL_RESOURCE}/release.standard-output ${LOCAL_RESOURCE}/release.standard-error ${LOCAL_RESOURCE}/release.status &&
    if [ -L ${LOCAL_RESOURCE}/post.sh ]
    then
      ${LOCAL_RESOURCE}/post.sh || ${TRUE}
    fi &&
    ${ECHO} 1 MINUTE KLUDGE >> /build/debug
    sleep 1m &&
    ${RM} --recursive --force ${LOCAL_RESOURCE}
    if [ ! -z "${STATUS}" ] && [ ${STATUS} != 0 ]
    then
      exit ${ERROR}
    fi
  else
    ${ECHO} Unable to acquire an exclusive lock 2>&1 &&
      exit ${ERROR}
  fi