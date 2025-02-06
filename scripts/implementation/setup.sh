${ECHO} setup >> /build/debug &&
export RRRR=$( ${MKTEMP} --directory -t ${TEMPORARY_RESOURCE_MASK} ) &&
${ECHO} setup LOCAL_RESOURCE RRRR=${RRRR} >> /build/debug &&
  ${ECHO} "${@}" > ${RRRR}/init.arguments &&
  ${CHMOD} 0400 ${RRRR}/init.arguments &&
  PARENT_PID=$( ${PS} -p ${$} -o ppid= ) &&
  GRANDPARENT_PID=$( ${PS} -p ${PARENT_PID} -o ppid= ) &&
  GREAT_GRANDPARENT_PID=$( ${PS} -p ${GRANDPARENT_PID} -o ppid= ) &&
  ${ECHO} setup PID : PARENT_PID=${PARENT_PID}, GRANDPARENT_PID=${GRANDPARENT_PID}, GREAT_GRANDPARENT_PID=${GREAT_GRANDPARENT_PID} >> /build/debug &&
  if [ -t 0 ]
  then
    # TARGET_PID=$( ${PS} -p ${GRANDPARENT_PID} -o ppid= )
    TARGET_PID=$( ${PS} -p ${PARENT_PID} -o ppid= )
  elif [ -p /proc/self/fd/0 ]
  then
    # TARGET_PID=$( ${PS} -p ${GREAT_GRANDPARENT_PID} -o ppid= ) &&
    TARGET_PID=$( ${PS} -p ${GRANDPARENT_PID} -o ppid= ) &&
      ${TEE} > ${RRRR}/init.standard-input &&
      ${CHMOD} 0400 ${RRRR}/init.standard-input
  elif [ -f /proc/self/fd/0 ]
  then
    # TARGET_PID=$( ${PS} -p ${GRANDPARENT_PID} -o ppid= ) &&
    TARGET_PID=$( ${PS} -p ${GRANDPARENT_PID} -o ppid= ) &&
      ${CAT} > ${RRRR}/init.standard-input &&
      ${CHMOD} 0400 ${RRRR}/init.standard-input
  else
    # TARGET_PID=$( ${PS} -p ${GRANDPARENT_PID} -o ppid= )
    TARGET_PID=$( ${PS} -p ${PARENT_PID} -o ppid= )
  fi &&
  ${ECHO} setup PID : TARGET_PID=${TARGET_PID} >> /build/debug &&
  if [ -x ${INIT} ]
  then
    ${LN} --symbolic ${INIT} ${RRRR}/init.sh
  fi &&
  ${ECHO} setup AFTER INIT >> /build/debug &&
  if [ -x ${RELEASE} ]
  then
    ${LN} --symbolic ${RELEASE} ${RRRR}/release.sh
  fi &&
  if [ -x ${POST} ]
   then
     ${LN} --symbolic ${POST} ${RRRR}/post.sh
  fi &&
  ${LN} --symbolic ${TEARDOWN_SYNCH} ${RRRR}/teardown-synch.sh &&
  ${LN} --symbolic ${TEARDOWN_ASYNCH} ${RRRR}/teardown-asynch.sh &&
  declare ${TEMPORARY_PATH}=${TEMPORARY_PATH_ARRAY} &&
  export ${TEMPORARY_PATH} &&
  ${ECHO} ${TEMPORARY_PATH_ARRAY} > ${RRRR}/temporary &&
  ${CHMOD} 0400 ${RRRR}/temporary &&
  if [ -x ${INIT} ]
  then
    if [ -f ${RRRR}/init.standard-input ] && ${CAT} ${RRRR}/init.standard-input | ${INIT} $( ${CAT} ${RRRR}/init.arguments ) > ${RRRR}/init.standard-output 2> ${RRRR}/init.standard-error
    then
      STATUS=${?}
    elif ${INIT} $( ${CAT} ${RRRR}/init.arguments ) > ${RRRR}/init.standard-output 2> ${RRRR}/init.standard-error
    then
      STATUS=${?}
    else
      STATUS=${?}
    fi &&
    ${ECHO} ${STATUS} > ${RRRR}/init.status &&
    ${CHMOD} 0400 ${RRRR}/init.standard-output ${RRRR}/init.standard-error ${RRRR}/init.status
  fi &&
  if [ -z "${STATUS}" ] || [ ${STATUS} == 0 ]
  then
    ${ECHO} ${TARGET_PID// /} > ${RRRR}/${TARGET_PID// /}.pid &&
      ${CHMOD} 0400 ${RRRR}/${TARGET_PID// /}.pid
      ${RRRR}/teardown-asynch.sh &&
      ${ECHO} ${RRRR}/target
  else
    ${RRRR}/teardown-asynch.sh &&
      exit ${ERROR}
  fi