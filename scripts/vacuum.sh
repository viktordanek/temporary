${ECHO} DAA >> /post/trace
# exec 202> ${RESOURCE}/.lock
  # if ${FLOCK} 202
  # then
    ${RM} --force ${RESOURCE}/.lock ${RESOURCE}/init.sh ${RESOURCE}/post.sh ${RESOURCE}/release.sh ${RESOURCE}/setup.sh ${RESOURCE}/teardown-asynch.sh ${RESOURCE}/teardown-synch.sh &&
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
      fi
    # else
    #   ${TOUCH} ${RESOURCE}/lock
    # fi