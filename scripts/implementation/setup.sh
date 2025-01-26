export RESOURCE=$( ${MKTEMP} --directory -t ${TEMPORARY_RESOURCE_MASK} ) &&
  ${ECHO} ${TEMPORARY_PATH} > ${RESOURCE}/temporary &&
  ${CHMOD} 0400 ${RESOURCE}/temporary &&
  ${ECHO} "${@}" > ${RESOURCE}/init.arguments &&
  ${CHMOD} 0400 ${RESOURCE}/init.arguments &&
  if [ -t 0 ]
  then
    ${ECHO} NO STANDARD_INPUT >&2 &&
    PARENT_PID=$( ${PS} -p ${$} -o ppid= ) &&
      TARGET_PID=$( ${PS} -p ${PARENT_PID} -o ppid= )
  elif ${READLINK} /proc/self/fd/0 | ${GREP} -q pipe
  then
    ${ECHO} YES 1 STANDARD_INPUT >&2 &&
    PARENT_PID=$( ${PS} -p ${$} -o ppid= ) &&
      TARGET_PID=${PARENT_PID} &&
      # TARGET_PID=$( ${PS} -p ${PARENT_PID} -o ppid= ) &&
      # TARGET_PID=$( ${PS} -p ${$} -o pid | ${TAIL} --lines 1 )
      # TARGET_PID=99
      ${TEE} > ${RESOURCE}/init.standard-input &&
      ${CHMOD} 0400 ${RESOURCE}/init.standard-input
  else
    ${ECHO} YES 2 STANDARD_INPUT >&2 &&
    PARENT_PID=$( ${PS} -p ${$} -o ppid= ) &&
      TARGET_PID=${PARENT_PID} &&
      # TARGET_PID=$( ${PS} -p ${PARENT_PID} -o ppid= ) &&
      # TARGET_PID=$( ${PS} -p ${$} -o pid | ${TAIL} --lines 1 )
      # TARGET_PID=99
      ${TEE} > ${RESOURCE}/init.standard-input &&
      ${CHMOD} 0400 ${RESOURCE}/init.standard-input
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
  declare ${TARGET}=${RESOURCE}/target &&
  export ${TARGET} &&
  if [ -x ${INIT} ]
  then
    if [ -f ${RESOURCE}/init.standard-input ] && ${CAT} ${RESOURCE}/init.standard-input | ${INIT} $( ${CAT} ${RESOURCE}/init.arguments ) > ${RESOURCE}/init.standard-output 2> ${RESOURCE}/init.standard-error
    then
      STATUS=${?} &&
        ${ECHO} IN SETUP WITH STANDARD_INPUT STATUS=${STATUS} >&2
    elif ${INIT} $( ${CAT} ${RESOURCE}/init.arguments ) > ${RESOURCE}/init.standard-output 2> ${RESOURCE}/init.standard-error
    then
      STATUS=${?} &&
        ${ECHO} IN SETUP WITHOUT STANDARD_INPUT STATUS=${STATUS} >&2
    fi &&
    ${ECHO} ${STATUS} > ${RESOURCE}/init.status &&
    ${CHMOD} 0400 ${RESOURCE}/init.standard-output ${RESOURCE}/init.standard-error ${RESOURCE}/init.status
  else
    STATUS=${?}
  fi &&
  if [ -z "${STATUS}" ] || [ ${STATUS} == 0 ]
  then
    if [ -x ${INIT} ]
    then
      ${ECHO} INIT=${INIT} IS OK >&2 &&
      ${ECHO} ${INIT} $( ${CAT} ${RESOURCE}/init.arguments ) >&2
    else
      ${ECHO} INIT=${INIT} IS NOT OK >&2
    fi &&
    ${ECHO} "STATUS IS BLANK? \"${STATUS}\"" >&2 &&
    ${ECHO} ${TARGET_PID// /} > ${RESOURCE}/${TARGET_PID// /}.pid &&
      ${CHMOD} 0400 ${RESOURCE}/${TARGET_PID// /}.pid
      ${RESOURCE}/teardown-asynch.sh &&
      ${ECHO} ${!TARGET}
  else
     ${RESOURCE}/teardown-asynch.sh &&
      ${ECHO} ${!TARGET}
      exit ${ERROR}
  fi