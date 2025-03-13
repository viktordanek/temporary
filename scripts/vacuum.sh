exec 201> /post.lock &&
  if ${FLOCK} 201
  then
    if [ -f /counter/index ] && [ -d /cou]
    then
      INDEX=$(( $( ${CAT} /counter/index ) + 1 )) &&
        if [ ! -z "$( ${DIFF} /post/resource ${RESOURCE} )" ]
        then
          ${MV} ${RESOURCE} /post/resource.${INDEX}
        fi
    else
      ${ECHO} 1 > /post/index &&
        ${MV} ${RESOURCE} /post/resource
    fi &&
    ${RM} /post.lock
  else
    ${ECHO} Locking Problem >> /post/lock &&
      exit 64
  fi