${ECHO} "2 200>${RESOURCE}/lock" >> /build/debug &&
${ECHO} "2 ${FLOCK} 200" >> /build/debug &&
exec 200>${RESOURCE}/lock &&
  if ${FLOCK} 200
  then
    ${ECHO} 2 "FLOCKED ${FIND} ${RESOURCE} -mindepth 1 -maxdepth 1 -name "*.pid" -type f " >> /build/debug &&
    ${FIND} ${RESOURCE} -mindepth 1 -maxdepth 1 -name "*.pid" -type f | while read PID_FILE
    do
      ${ECHO} "2 FIND ${BASENAME}  - ${PID_FILE} - ${TAIL} - ${RM} - ${PID_FILE%.*}" >> /build/debug &&
      PID=$( ${BASENAME} ${PID_FILE%.*}) &&
      ${ECHO} "2 PID=${PID}" >> /build/debug &&
        ${TAIL} --follow /dev/null --pid ${PID} &&
      ${ECHO} "2 TAIL" >> /build/debug &&
        ${RM} ${PID_FILE} &&
      ${ECHO} "2 RM" >> /build/debug
    done &&
    ${ECHO} 2 FLOCKED MID 1 >> /build/debug
    if ${RESOURCE}/release > ${RESOURCE}/release.out 2> ${RESOURCE}/release.err
    then
      STATUS=${?}
    else
      STATUS=${?}
    fi &&
    ${ECHO} 2 FLOCKED MID 2 >> /build/debug
    ${ECHO} ${STATUS} > ${RESOURCE}/release.status &&
    ${CHMOD} 0400 ${RESOURCE}/release.out ${RESOURCE}/release.err ${RESOURCE}/release.status &&
    if [ -f ${RESOURCE}/post ]
    then
      ${RESOURCE}/post
    fi &&
    ${ECHO} 2 FLOCKED MID 3 >> /build/debug
    ${RM} --recursive --force ${RESOURCE} &&
    if [ ! -z "${STATUS}" ] && [ ${STATUS} != 0 ]
    then
      exit ${ERROR}
    fi &&
    ${ECHO} 2 FLOCKED FINAL >> /build/debug
  else
    ${ECHO} Unable to acquire an exclusive lock &&
      exit ${ERROR}
  fi