${ECHO} 2 >> /build/debug &&
export RESOURCE=$( ${DIRNAME} ) &&
  exec 200>${RESOURCE}/lock &&
  if ${FLOCK} 200
  then
    ${FIND} ${RESOURCE} -mindepth 1 -maxdepth 1 -name "*.pid" -type f | while read PID_FILE
    do
      PID=$( ${BASENAME} ${PID_FILE*.%}) &&
        ${TAIL} --follow ${PID} &&
        ${RM} ${PID_FILE}
    done &&
    if ${RESOURCE}/release > ${RESOURCE}/release.out 2> ${RESOURCE}/release.err
    then
      STATUS=${?}
    else
      STATUS=${?}
    fi &&
    ${ECHO} ${STATUS} > ${RESOURCE}/release.status &&
    ${CHMOD} 0400 ${RESOURCE}/release.out ${RESOURCE}/release.err ${RESOURCE}/release.status &&
    if [ -f ${RESOURCE}/post ]
    then
      ${RESOURCE}/post
    fi &&
    ${RM} --recursive --force ${RESOURCE} &&
    if [ ! -z "${STATUS}" ] && [ ${STATUS} != 0 ]
    then
      exit ${ERROR}
    fi
  else
    ${ECHO} Unable to acquire an exclusive lock &&
      exit ${ERROR}
  fi