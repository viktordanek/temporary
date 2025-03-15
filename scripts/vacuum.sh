${RM} --force ${RESOURCE}/init.sh ${RESOURCE}/post.sh ${RESOURCE}/release.sh ${RESOURCE}/setup.sh ${RESOURCE}/teardown-asynch.sh ${RESOURCE}/teardown-synch.sh &&
  ${ECHO} >> /post/decrement &&
  ${FIND} /temporary -mindepth 1 -maxdepth 1 | ${WC} --lines >> /post/decrement &&
  ${FIND} /tmp -mindepth 1 -maxdepth 1 > /post/debug &&
  exec 201> /post/.lock &&
  DECREMENT=$( ${CAT} /post/decrement ) &&
  if ${FLOCK} 201
  then
    if [ -f /util/increment ]
    then
      INCREMENT=$(( $( ${CAT} /util/increment ) + 1 ))
    else
      INCREMENT=0
    fi &&
    ${ECHO} ${INCREMENT} > /util/increment &&
    ${MKDIR} /post/resource.${INCREMENT} &&
    ${FIND} ${RESOURCE} | while read FILE
    do
      CAT_NAME=$( ${ECHO} CAT 0 ${FILE#${RESOURCE}} | ${SHA512SUM} | ${CUT} --bytes -128 ) &&
        if [ -f ${FILE} ]
        then
          ${CAT} ${FILE} > /post/resource.${INCREMENT}/${CAT_NAME} &&
            ${CHMOD} 0444 /post/resource.${INCREMENT}/${CAT_NAME}
        fi &&
        STAT_NAME=$( ${ECHO} STAT 0 ${FILE#${RESOURCE}} | ${SHA512SUM} | ${CUT} --bytes -128 ) &&
        ${STAT} --format="%a" ${FILE} > /post/resource.${INCREMENT}/${STAT_NAME} &&
          ${CHMOD} 0444 /post/resource.${INCREMENT}/${STAT_NAME}
    done &&
    if [ ${INCREMENT} -gt 0 ] && [ -z "$( ${DIFF} --recursive /post/resource.0 /post/resource.${INCREMENT} )" ]
    then
      ${RM} --recursive --force /post/resource.${INCREMENT}
    fi # &&
    # ${ECHO} "${INCREMENT} + ${DECREMENT} = $(( ${INCREMENT} + ${DECREMENT} )) =? ${COUNT}" >> /post/count
  else
    ${ECHO} Locking Problem >> /post/lock.error &&
      exit 64
  fi