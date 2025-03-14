${RM} --force ${RESOURCE}/init.sh ${RESOURCE}/post.sh ${RESOURCE}/release.sh ${RESOURCE}/setup.sh ${RESOURCE}/teardown-asynch.sh ${RESOURCE}/teardown-synch.sh &&
  exec 201> /post.lock &&
  if ${FLOCK} 201
  then
    if [ -f /post/index ]
    then
      INDEX=$(( $( ${CAT} /post/index ) + 1 ))
    else
      INDEX=0
    fi &&
    ${ECHO} ${INDEX} > /post/index &&
    ${FIND} ${RESOURCE} | while read FILE
    do
      CAT_LOC=$( ${ECHO} ${INDEX} ${FILE#"${RESOURCE}"} CAT | ${SHA512SUM} | ${CUT} --bytes -128 ) &&
        if [ -f ${FILE} ]
        then
          ${CAT} ${FILE} > /post/${CAT_LOC} &&
            ${CHMOD} 0444 /post/${CAT_LOC}
        fi
    done &&
    ${MV} ${RESOURCE} /post/resource.${INDEX} &&
    ${RM} /post.lock
  else
    ${ECHO} Locking Problem >> /post/lock &&
      exit 64
  fi