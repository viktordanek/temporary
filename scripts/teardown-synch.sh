exec 201> ${RESOURCE}/.lock &&
  if ${FLOCK} 201
  then
    PID=$( ${CAT} ${RESOURCE}/pid ) &&
      ${TAIL} --follow /dev/null --pid ${PID} &&
      ${RM} ${RESOURCE}/pid && ${ECHO}
      #
      if ${RESOURCE}/release.sh > ${RESOURCE}/release.standard-output 2> ${RESOURCE}/release.standard-error
      then
        STATUS=${?} && ${ECHO}
      else
        STATUS=${?} && ${ECHO}
      fi &&
      ${ECHO} ${STATUS} > ${RESOURCE}/release.status &&
      ${CHMOD} 0400 ${RESOURCE}/release.standard-output ${RESOURCE}/release.standard-error ${RESOURCE}/release.status &&
      #
      ( ${RESOURCE}/post.sh || ${TRUE} ) &&
      #
      ${RM} --recursive --force ${RESOURCE} &&
      #
      if [ ${STATUS} != 0 ]
      then
        exit ${ERROR}
      fi
      #
  else
    ${ECHO} Unable to acquire an exclusive lock 2>&1 && ${ECHO} AAJ >> /post/zzz
      exit ${ERROR}
  fi