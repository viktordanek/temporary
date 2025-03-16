exec 202> /post/.lock &&
  if ${FLOCK} 202
  then
    ${RM} --force ${RESOURCE}/init.sh ${RESOURCE}/post.sh ${RESOURCE}/release.sh ${RESOURCE}/setup.sh ${RESOURCE}/teardown-asynch.sh ${RESOURCE}/teardown-synch.sh &&
        if [ -f /util/increment ]
        then
          INCREMENT=$(( $( ${CAT} /util/increment ) + 1 ))
        else
          INCREMENT=0
        fi &&
${ECHO} AAAF >> /post/yyy &&
        ${ECHO} ${INCREMENT} > /util/increment &&
${ECHO} AAAG >> /post/yyy &&
        ${MKDIR} /post/resource.${INCREMENT} &&
${ECHO} AAAH >> /post/yyy &&
        ${FIND} ${RESOURCE} | while read FILE
        do
${ECHO} AAAI >> /post/yyy &&
          NAME=${FILE#${RESOURCE}} &&
${ECHO} AAAJ >> /post/yyy &&
            CAT_NAME=$( ${ECHO} CAT 0 ${NAME} | ${SHA512SUM} | ${CUT} --bytes -128 ) &&
${ECHO} AAAK >> /post/yyy &&
            ${ECHO} ${NAME} > /post/resource.${INCREMENT}/${CAT_NAME}.name &&
${ECHO} AAAL >> /post/yyy &&
            ${CHMOD} 0444 /post/resource.${INCREMENT}/${CAT_NAME}.name &&
${ECHO} AAAM >> /post/yyy &&
            if [ -f ${FILE} ]
            then
${ECHO} AAAN >> /post/yyy &&
              ${CAT} ${FILE} > /post/resource.${INCREMENT}/${CAT_NAME}.cat &&
${ECHO} AAAO >> /post/yyy &&
                ${CHMOD} 0444 /post/resource.${INCREMENT}/${CAT_NAME}.cat
            fi &&
${ECHO} AAAP >> /post/yyy &&
            ${STAT} --format="%a" ${FILE} > /post/resource.${INCREMENT}/${CAT_NAME}.stat &&
${ECHO} AAAQ >> /post/yyy &&
              ${CHMOD} 0444 /post/resource.${INCREMENT}/${CAT_NAME}.stat
        done &&
        if [ ${INCREMENT} -gt 0 ] && [ -z "$( ${DIFF} --recursive /post/resource.0 /post/resource.${INCREMENT} )" ]
        then
${ECHO} AAAR >> /post/yyy &&
          ${RM} --recursive --force /post/resource.${INCREMENT}
        fi
  else
${ECHO} AAAS >> /post/yyy &&
    ${ECHO} >> /post/lock
  fi