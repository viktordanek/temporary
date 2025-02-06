${ECHO} TEARDOWN_SYNCH LOCAL_RESOURCE=${LOCAL_RESOURCE} >> /build/debug &&
  if ${FLOCK} 200
  then
    ${ECHO} TEARDOWN_SYNCH YES LOCK >> /build/debug &&
    ${FIND} ${LOCAL_RESOURCE} -mindepth 1 -maxdepth 1 -name "*.pid" -type f | while read PID_FILE
    do
      PID=$( ${BASENAME} ${PID_FILE%.*}) &&
        ${ECHO} TEARDOWN_SYNCH BEFORE PID=${PID} >> /build/debug &&
        ${TAIL} --follow /dev/null --pid ${PID} &&
        ${ECHO} TEARDOWN_SYNCH AFTER PID=${PID} >> /build/debug &&
        ${RM} ${PID_FILE}
    done &&
    ${ECHO} TEARDOWN_SYNC AFTER >> /build/debug &&
    if [ -L ${LOCAL_RESOURCE}/release.sh ]
    then
      ${ECHO} BEFORE RELEASE >> /build/debug &&
      if ${LOCAL_RESOURCE}/release.sh > ${LOCAL_RESOURCE}/release.standard-output 2> ${LOCAL_RESOURCE}/release.standard-error
      then
        STATUS=${?}
      else
        STATUS=${?}
      fi
      ${ECHO} AFTER RELEASE >> /build/debug
    fi &&
    ${ECHO} ${STATUS} > ${LOCAL_RESOURCE}/release.status &&
    ${CHMOD} 0400 ${LOCAL_RESOURCE}/release.standard-output ${LOCAL_RESOURCE}/release.standard-error ${LOCAL_RESOURCE}/release.status &&
    if [ -L ${LOCAL_RESOURCE}/post.sh ]
    then
      ${LOCAL_RESOURCE}/post.sh || ${TRUE}
    fi &&
    ${RM} --recursive --force ${LOCAL_RESOURCE} &&
    if [ ! -z "${STATUS}" ] && [ ${STATUS} != 0 ]
    then
      exit ${ERROR}
    fi
  else
    ${ECHO} TEARDOWN_SYNCH NO LOCK >> /build/debug &&
    ${ECHO} Unable to acquire an exclusive lock 2>&1 &&
      exit ${ERROR}
  fi