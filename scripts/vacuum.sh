${RM} --force ${RESOURCE}/init.sh ${RESOURCE}/post.sh ${RESOURCE}/release.sh ${RESOURCE}/setup.sh ${RESOURCE}/teardown-asynch.sh ${RESOURCE}/teardown-synch.sh &&
  exec 201> /post/lock &&
  if ${FLOCK} 201
  then
    if [ -f /util/index ]
    then
      INDEX=$(( $( ${CAT} /util/index ) + 1 ))
    else
      INDEX=0
    fi &&
    ${ECHO} ${INDEX} > /util/index &&
    ${MKDIR} /post/resource.${INDEX} &&
    ${FIND} ${RESOURCE} | while read FILE
    do
      CAT_NAME=$( ${ECHO} CAT 0 ${FILE#${RESOURCE}} | ${SHA512SUM} | ${CUT} --bytes -128 ) &&
        if [ -f ${FILE} ]
        then
          ${CAT} ${FILE} > /post/resource.${INDEX}/${CAT_NAME} &&
            ${CHMOD} 0444 /post/resource.${INDEX}/${CAT_NAME}
        fi &&
        STAT_NAME=$( ${ECHO} STAT 0 ${FILE#${RESOURCE}} | ${SHA512SUM} | ${CUT} --bytes -128 ) &&
        ${STAT} --format="%a" ${FILE} > /post/resource.${INDEX}/${STAT_NAME} &&
          ${CHMOD} 0444 /post/resource.${INDEX}/${STAT_NAME}
    done &&
    if [ ${INDEX} -gt 0 ] && [ -z "$( ${DIFF} --recursive /post/resource.0 /post/resource.${INDEX} )" ]
    then
      ${RM} --recursive --force /post/resource.${INDEX}
    fi &&
    ${RM} /post/lock
  else
    ${ECHO} Locking Problem >> /post/lock.error &&
      exit 64
  fi