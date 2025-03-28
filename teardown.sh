exec 201> ${RESOURCE}/lock &&
  if ${FLOCK} 201
  then
    ${TAIL} --follow --pid ${PID} &&
# 5
      if ${RELEASE} > ${RESOURCE}/release.standard-output >2 ${RESOURCE}/release.standard-error
      then
        ${ECHO} ${?} > ${RESOURCE}/release.status
      else
        ${ECHO} ${?} > ${RESOURCE}/release.status
      fi &&
# 12
# 13
      ( ${POST} || ${TRUE} ) &&
# 15
      ${RM} --recursive --force ${RESOURCE}
  else
    ${ECHO} FAILED TO LOCK ${RESOURCE}/lock >&2 &&
      exit ${LOCK_FAILURE}
  fi