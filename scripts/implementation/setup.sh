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
      STATUS=${?}
    elif ${INIT} $( ${CAT} ${RESOURCE}/init.arguments ) > ${RESOURCE}/init.standard-output 2> ${RESOURCE}/init.standard-error
    then
      STATUS=${?}
    fi &&
    ${ECHO} ${STATUS} > ${RESOURCE}/init.status &&
    ${CHMOD} 0400 ${RESOURCE}/init.standard-output ${RESOURCE}/init.standard-error ${RESOURCE}/init.status
  fi &&
  echo STATUS=${STATUS} >&2 &&
  if [ -z "${STATUS}" ]
  then
    echo STATUS IS BLANK >&2
  elif [ ${STATUS} == 0 ]
  then
    echo STATUS IS ZERO >&2
  else
    echo STATUS IS NON BLANK AND NON ZERO >&2
  fi &&
  if [ -z "${STATUS}" ] || [ ${STATUS} == 0 ]
  then
  echo 1:STATUS=${STATUS} ERROR=${ERROR} >&2 &&
    ${ECHO} ${TARGET_PID// /} > ${RESOURCE}/${TARGET_PID// /}.pid &&
      ${CHMOD} 0400 ${RESOURCE}/${TARGET_PID// /}.pid
      ${RESOURCE}/teardown-asynch.sh &&
      ${ECHO} ${!TARGET}
  else
  echo 2:STATUS=${STATUS} ERROR=${ERROR} >&2 &&
    ${ECHO} > ${RESOURCE}/DEBUG_B &&
     ${RESOURCE}/teardown-asynch.sh &&
      ${ECHO} ${!TARGET}
      exit ${ERROR}
  fi