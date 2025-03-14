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
    ${ECHO} A ${INDEX} >> /post/mark &&
    ${ECHO} ${INDEX} > /post/index &&
    ${FIND} ${RESOURCE} | while read FILE
    do
      CAT_LOC=$( ${ECHO} CAT ${INDEX} ${FILE#"$RESOURCE"} | ${SHA512SUM} | ${CUT} --bytes -128 ) &&
        ${CAT} ${FILE} > /post/${CAT_LOC}
    done &&
    ${MV} ${RESOURCE} /post/resource.${INDEX}
    ${RM} /post.lock &&
    ${ECHO} Z ${INDEX} >> /post/mark
  else
    ${ECHO} Locking Problem >> /post/lock &&
      exit 64
  fi