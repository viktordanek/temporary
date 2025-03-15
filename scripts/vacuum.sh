${RM} --force ${RESOURCE}/init.sh ${RESOURCE}/post.sh ${RESOURCE}/release.sh ${RESOURCE}/setup.sh ${RESOURCE}/teardown-asynch.sh ${RESOURCE}/teardown-synch.sh &&
  exec 201> /post/.lock2 &&
  if ${FLOCK} 201
  then
    ${RM} /post/.lock2 &&
    ${ECHO} >> /post/debug &&
    ${ECHO} RESOURCE=${RESOURCE} >> /post/debug &&
    ${FIND} /temporary -mindepth 1 -maxdepth 1 >> /post/debug &&
    DECREMENT=$(( $( ${FIND} /temporary -mindepth 1 -maxdepth 1 | ${WC} --lines ) - 2 )) &&
      ${ECHO} ${DECREMENT} > /post/decrement &&
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
        NAME=${FILE#${RESOURCE}} &&
          CAT_NAME=$( ${ECHO} CAT 0 ${NAME} | ${SHA512SUM} | ${CUT} --bytes -128 ) &&
          ${ECHO} ${NAME} > /post/resource.${INCREMENT}/${CAT_NAME}.name &&
          ${CHMOD} 0444 /post/resource.${INCREMENT}/${CAT_NAME}.name &&
          if [ -f ${FILE} ]
          then
            ${CAT} ${FILE} > /post/resource.${INCREMENT}/${CAT_NAME}.cat &&
              ${CHMOD} 0444 /post/resource.${INCREMENT}/${CAT_NAME}.cat
          fi &&
          ${STAT} --format="%a" ${FILE} > /post/resource.${INCREMENT}/${CAT_NAME}.stat &&
            ${CHMOD} 0444 /post/resource.${INCREMENT}/${CAT_NAME}.stat
      done &&
      if [ ${INCREMENT} -gt 0 ] && [ -z "$( ${DIFF} --recursive /post/resource.0 /post/resource.${INCREMENT} )" ]
      then
        ${RM} --recursive --force /post/resource.${INCREMENT}
      fi &&
      ${ECHO} "${INCREMENT} + ${DECREMENT} = $(( ${INCREMENT} + ${DECREMENT} )) =? ${COUNT}" >> /post/count
  else
    ${ECHO} Locking Problem >> /post/lock.error &&
      exit 64
  fi