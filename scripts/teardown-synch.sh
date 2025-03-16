exec 201> ${RESOURCE}/.lock &&
  if ${FLOCK} 201
  then
    PID=$( ${CAT} ${RESOURCE}/pid ) && ${ECHO} AAB >> /post/zzz &&
      ${TAIL} --follow /dev/null --pid ${PID} && ${ECHO} AAC >> /post/zzz &&
      ${RM} ${RESOURCE}/pid && ${ECHO} AAD >> /post/zzz
      #
      if ${RESOURCE}/release.sh > ${RESOURCE}/release.standard-output 2> ${RESOURCE}/release.standard-error
      then
        STATUS=${?} && ${ECHO} AAE >> /post/zzz
      else
        STATUS=${?} && ${ECHO} AAF >> /post/zzz
      fi &&
      ${ECHO} ${STATUS} > ${RESOURCE}/release.status && ${ECHO} AAG >> /post/zzz &&
      ${CHMOD} 0400 ${RESOURCE}/release.standard-output ${RESOURCE}/release.standard-error ${RESOURCE}/release.status && ${ECHO} AAH $( ls ${RESOURCE}  ) ${STORE} >> /post/zzz &&
      #
      if ${RESOURCE}/post.sh ; then true ; fi &&
      #
      ${RM} --recursive --force ${RESOURCE} && ${ECHO} AAI >> /post/zzz &&
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