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
      ${ECHO} CAT ${INDEX} ${FILE#"$RESOURCE"} >> /post/debug
    done &&
    ${MV} ${RESOURCE} /post/resource.${INDEX}
    ${RM} /post.lock
  else
    ${ECHO} Locking Problem >> /post/lock &&
      exit 64
  fi