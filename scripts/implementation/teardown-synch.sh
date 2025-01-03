${ECHO} 2 - >> /build/debug &&
exec 200>${RESOURCE}/lock &&
  if ${FLOCK} 200
  then
    ${FIND} ${RESOURCE} -mindepth 1 -maxdepth 1 -name "*.pid" -type f | while read PID_FILE
    do
      PID=$( ${BASENAME} ${PID_FILE%.*}) &&
        ${TAIL} --follow /dev/null --pid ${PID} &&
        ${RM} ${PID_FILE}
    done &&
    ${ECHO} 2 - ${RESOURCE}/release.sh >> /build/debug &&
    if ${RESOURCE}/release.sh > ${RESOURCE}/release.standard-output 2> ${RESOURCE}/release.standard-error
    then
      STATUS=${?}
    else
      STATUS=${?}
    fi &&
    ${ECHO} 2 - ${STATUS} >> /build/debug &&
    ${ECHO} ${STATUS} > ${RESOURCE}/release.status &&
    ${CHMOD} 0400 ${RESOURCE}/release.standard-output ${RESOURCE}/release.standard-error ${RESOURCE}/release.status &&
        ${ECHO} 2 - BEFORE ${RESOURCE}/post >> /build/debug &&
        ${CAT} ${RESOURCE}/post >> /build/debug &&
    if [ -f ${RESOURCE}/post ]
    then
      ${RESOURCE}/post
    fi &&
            ${ECHO} 2 - AFTER>> /build/debug &&
    ${RM} --recursive --force ${RESOURCE} &&
    if [ ! -z "${STATUS}" ] && [ ${STATUS} != 0 ]
    then
      exit ${ERROR}
    fi
  else
    ${ECHO} Unable to acquire an exclusive lock &&
      exit ${ERROR}
  fi &&
  ${ECHO} 2 - >> /build/debug