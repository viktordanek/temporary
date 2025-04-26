exec 201> /mount/${HASH}/lock &&
  if ${FLOCK} 201
  then
    ULTIMATE=$( ${MKTEMP} --dry-run /mount/XXXXXXXX ) &&
      ${MV} /mount/${HASH} ${ULTIMATE} &&
  else
    exit ${LOCK_FAILURE}
  fi &&
    ${FIND} ${ULTIMATE} -mindepth 1 -maxdepth 1 -type f -name "*.pid" | while read PID_FILE
    do
      PID=$( ${CAT} ${PID_FILE} ) &&
        ${TAIL} --follow /dev/null --pid ${PID} &&
        ${RM} ${PID_FILE}
    done &&
    ${FIND} ${ULTIMATE} -mindepth 1 -maxdepth 1 -type l -name "*.hash" | while read TEARDOWN
    do
        if [ -e ${TEARDOWN} ]
        then
          ${TEARDOWN}
        fi &&
          ${RM} ${TEARDOWN}
    done &&
#
    if ${RELEASE} > ${ULTIMATE}/release.standard-output 2> ${ULTIMATE}/release.standard-error
    then
      ${ECHO} ${?} > ${ULTIMATE}/release.status
    else
      ${ECHO} ${?} > ${ULTIMATE}/release.status
    fi &&
#
#
       ( ${POST} || ${TRUE} ) &&
#
      ${RM} --recursive --force ${ULTIMATE}
