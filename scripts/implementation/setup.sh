export RESOURCE=$( ${MKTEMP} --directory -t ${TEMPORARY_RESOURCE_MASK} ) &&
  ${ECHO} "${@}" > ${RESOURCE}/init.arguments &&
  ${CHMOD} 0400 ${RESOURCE}/init.arguments &&
  if [ -t 0 ]
  then
    # TARGET_PID=$( ${PS} -p ${GRANDPARENT_PID} -o ppid= )
    TARGET_PID=${PARENT_PID}
  elif ${IS_PIPE}
  then
    # TARGET_PID=$( ${PS} -p ${GREAT_GRANDPARENT_PID} -o ppid= ) &&
    TARGET_PID=${GRANDPARENT_PID} &&
      ${TEE} > ${RESOURCE}/init.standard-input &&
      ${CHMOD} 0400 ${RESOURCE}/init.standard-input
  elif [ -f /proc/self/fd/0 ]
  then
    # TARGET_PID=$( ${PS} -p ${GRANDPARENT_PID} -o ppid= ) &&
    TARGET_PID=${GRANDPARENT_PID} &&
      ${CAT} > ${RESOURCE}/init.standard-input &&
      ${CHMOD} 0400 ${RESOURCE}/init.standard-input
  else
    # TARGET_PID=$( ${PS} -p ${GRANDPARENT_PID} -o ppid= )
    TARGET_PID=${PARENT_PID}
  fi &&
  if [ -x ${INIT} ]
  then
    ${LN} --symbolic ${INIT} ${RESOURCE}/init.sh
  fi &&
  if [ -x ${RELEASE} ]
  then
    ${LN} --symbolic ${RELEASE} ${RESOURCE}/release.sh
  fi &&
  if [ -x ${POST} ]
   then
     ${LN} --symbolic ${POST} ${RESOURCE}/post.sh
  fi &&
  ${LN} --symbolic ${TEARDOWN_SYNCH} ${RESOURCE}/teardown-synch.sh &&
  ${LN} --symbolic ${TEARDOWN_ASYNCH} ${RESOURCE}/teardown-asynch.sh &&
  if [ -x ${RESOURCE}/init.sh ]
  then
    if [ -f ${RESOURCE}/init.standard-input ] && ${CAT} ${RESOURCE}/init.standard-input | ${RESOURCE}/init.sh $( ${CAT} ${RESOURCE}/init.arguments ) > ${RESOURCE}/init.standard-output 2> ${RESOURCE}/init.standard-error
    then
      STATUS=${?}
    elif ${RESOURCE}/init.sh $( ${CAT} ${RESOURCE}/init.arguments ) > ${RESOURCE}/init.standard-output 2> ${RESOURCE}/init.standard-error
    then
      STATUS=${?}
    else
      STATUS=${?}
    fi &&
    ${ECHO} ${STATUS} > ${RESOURCE}/init.status &&
    ${CHMOD} 0400 ${RESOURCE}/init.standard-output ${RESOURCE}/init.standard-error ${RESOURCE}/init.status &&
    if [ "${STATUS}" != 0 ]
    then
        ${RESOURCE}/teardown-asynch.sh &&
          exit ${INITIALIZATION_ERROR_INITIALIZER}
    elif [ ! -z "$( ${CAT}  ${RESOURCE}/init.standard-error)" ]
    then
      ${RESOURCE}/teardown-asynch.sh &&
        exit ${INITIALIZATION_ERROR_STANDARD_ERROR}
    else
      ${ECHO} ${TARGET_PID// /} > ${RESOURCE}/${TARGET_PID// /}.pid &&
        ${CHMOD} 0400 ${RESOURCE}/${TARGET_PID// /}.pid
        ${RESOURCE}/teardown-asynch.sh &&
        ${ECHO} ${RESOURCE}/target &&
        exit 0
    fi
  fi &&
  ${ECHO} ${TARGET_PID// /} > ${RESOURCE}/${TARGET_PID// /}.pid &&
  ${CHMOD} 0400 ${RESOURCE}/${TARGET_PID// /}.pid
  ${RESOURCE}/teardown-asynch.sh &&
  ${ECHO} ${RESOURCE}/target &&
  exit 0