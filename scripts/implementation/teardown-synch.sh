exec 200>${RESOURCE}/lock &&
  if ${FLOCK} 200
  then
    ${FIND} ${RESOURCE} -mindepth 1 -maxdepth 1 -name "*.pid" -type f | while read PID_FILE
    do
      PID=$( ${BASENAME} ${PID_FILE%.*}) &&
        ${TAIL} --follow /dev/null --pid ${PID} &&
        echo "TS - z ${PID}" >> /build/observed/debug &&
        ${RM} ${PID_FILE}
    done &&
    if ${RESOURCE}/release.sh > ${RESOURCE}/release.standard-output 2> ${RESOURCE}/release.standard-error
    then
      STATUS=${?}
    else
      STATUS=${?}
    fi &&
    ${ECHO} ${STATUS} > ${RESOURCE}/release.status &&
    ${CHMOD} 0400 ${RESOURCE}/release.standard-output ${RESOURCE}/release.standard-error ${RESOURCE}/release.status &&
    if [ -f ${RESOURCE}/post.sh ]
    then
      ${RESOURCE}/post.sh
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