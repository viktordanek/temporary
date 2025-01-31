exec 200> ${RRRR}/lock.teardown &&
  if ${FLOCK} 200
  then
    ${FIND} ${RRRR} -mindepth 1 -maxdepth 1 -name "*.pid" -type f | while read PID_FILE
    do
      PID=$( ${BASENAME} ${PID_FILE%.*}) &&
        ${TAIL} --follow /dev/null --pid ${PID} &&
        ${RM} ${PID_FILE}
    done &&
    if [ -L ${RRRR}/release.sh ]
    then
      if ${RRRR}/release.sh > ${RRRR}/release.standard-output 2> ${RRRR}/release.standard-error
      then
        STATUS=${?}
      else
        STATUS=${?}
      fi
    fi &&
    ${ECHO} ${STATUS} > ${RRRR}/release.status &&
    ${CHMOD} 0400 ${RRRR}/release.standard-output ${RRRR}/release.standard-error ${RRRR}/release.status &&
    if [ -L ${RRRR}/post.sh ]
    then
      ${RRRR}/post.sh || ${TRUE}
    fi &&
    ${RM} --recursive --force ${RRRR} &&
    if [ ! -z "${STATUS}" ] && [ ${STATUS} != 0 ]
    then
      exit ${ERROR}
    fi
  else
    ${ECHO} Unable to acquire an exclusive lock &&
      exit ${ERROR}
  fi