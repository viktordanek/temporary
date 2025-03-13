${ECHO} DAA >> /post/debug &&
exec 201> /post.lock &&
  if ${FLOCK} 201
  then
${ECHO} DAB >> /post/debug &&
    if [ -f /counter/index ] && [ -d /cou]
    then
${ECHO} DAC >> /post/debug &&
      INDEX=$( ${CAT} /counter/index ) &&
${ECHO} DAD >> /post/debug &&
        if [ ! -z "$( ${DIFF} /post/resource ${RESOURCE} )" ]
        then
${ECHO} DAD >> /post/debug &&
          ${MV} ${RESOURCE} /post/resource.${INDEX}
        fi
    else
      ${ECHO} 1 > /post/index &&
${ECHO} DAE >> /post/debug &&
        ${MV} ${RESOURCE} /post/resource
    fi &&
${ECHO} DAF >> /post/debug &&
    ${RM} /post.lock
  else
    ${ECHO} Locking Problem >> /post/lock &&
${ECHO} DAG >> /post/debug &&
      exit 64
  fi && ${ECHO} DAH >> /post/debug