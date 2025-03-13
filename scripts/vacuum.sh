${RM} --force ${RESOURCE}/init.sh ${RESOURCE}/post.sh ${RESOURCE}/release.sh ${RESOURCE}/setup.sh ${RESOURCE}/teardown-asynch.sh ${RESOURCE}/teardown-synch.sh &&
  ${CHMOD} a-wx ${RESOURCE}
  ${CHMOD} a+r ${RESOURCE} &&
  exec 201> /post.lock &&
  if ${FLOCK} 201
  then
    if [ -f /post/index ] && [ -d /post/resource ]
    then
      INDEX=$(( $( ${CAT} /post/index ) + 1 )) &&
        if [ ! -z "$( ${DIFF} --recursive /post/resource ${RESOURCE} )" ]
        then
          ${MV} ${RESOURCE} /post/resource.${INDEX}
        fi &&
        ${ECHO} ${INDEX} > /post/index
    else
      ${ECHO} 1 > /post/index &&
        ${MV} ${RESOURCE} /post/resource
    fi &&
    ${RM} /post.lock
  else
    ${ECHO} Locking Problem >> /post/lock &&
      exit 64
  fi