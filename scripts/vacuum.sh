exec 201> /lock/lock &&
  if ${FLOCK} 201
  then
    if [ -f /counter/index ] && [ -d /cou]
    then
      INDEX=$( ${CAT} /counter/index ) &&
        if [ ! -z "$( ${DIFF} /post/resource ${RESOURCE} )" ]
        then
          ${MV} ${RESOURCE} /post/resource.${INDEX}
        fi
    else
      ${ECHO} 1 > /post/index &&
        ${MV} ${RESOURCE} /post/resource
    fi &&
    ${RM} /lock/lock
  else
    ${ECHO} Locking Problem &>2 &&
      exit 64
  fi