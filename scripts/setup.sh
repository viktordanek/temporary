#
source ${MAKE_WRAPPER}/nix-support/setup-hook &&
#
  ${ECHO} "${@}" > ${RESOURCE}/init.arguments &&
  ${CHMOD} 0400 ${RESOURCE}/init.arguments &&
  if ${IS_INTERACTIVE}
  then
    TARGET_PID=${PARENT_PID}
  elif ${IS_PIPE}
  then
    TARGET_PID=${GREAT_GRANDPARENT_PID} &&
      ${TEE} > ${RESOURCE}/init.standard-input &&
      ${CHMOD} 0400 ${RESOURCE}/init.standard-input
  elif ${IS_FILE}
  then
    TARGET_PID=${GREAT_GRANDPARENT_PID} &&
      ${CAT} > ${RESOURCE}/init.standard-input &&
      ${CHMOD} 0400 ${RESOURCE}/init.standard-input
  else
    TARGET_PID=${GRANDPARENT_PID}
  fi &&
  ${ECHO} ${TARGET_PID// /} > ${RESOURCE}/pid &&
  ${CHMOD} 0400 ${RESOURCE}/pid &&
  #
  makeWrapper ${MAKE_WRAPPER_INIT} ${RESOURCE}/init.sh --set RESOURCE ${RESOURCE} --set TARGET ${TARGET} &&
  #
  #
  makeWrapper ${MAKE_WRAPPER_RELEASE} ${RESOURCE}/release.sh --set RESOURCE ${RESOURCE} --set TARGET ${TARGET} &&
  #
  #
  makeWrapper ${MAKE_WRAPPER_POST} ${RESOURCE}/post.sh --set RESOURCE ${RESOURCE} --set TARGET ${TARGET} &&
  #
  makeWrapper ${TEARDOWN_ASYNCH} ${RESOURCE}/teardown-asynch.sh --set AT ${AT} --set ECHO ${ECHO} --set NICE ${NICE} --set RESOURCE ${RESOURCE} &&
  makeWrapper ${TEARDOWN_SYNCH} ${RESOURCE}/teardown-synch.sh --set CAT ${CAT} --set CHMOD ${CHMOD} --set ECHO ${ECHO} --set FLOCK ${FLOCK} --set RESOURCE ${RESOURCE} --set RM ${RM} --set TAIL ${TAIL}  --set FIND ${FIND} &&
  #
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
    ${RM} --force ${RESOURCE}/pid &&
      ${RESOURCE}/teardown-asynch.sh &&
      exit ${INITIALIZER}
  elif [ ! -z "$( ${CAT} ${RESOURCE}/init.standard-error)" ]
  then
    ${RM} --force ${RESOURCE}/pid &&
      ${RESOURCE}/teardown-asynch.sh &&
      exit ${STANDARD_ERROR}
  else
    ${RESOURCE}/teardown-asynch.sh &&
      ${ECHO} ${RESOURCE}/target
  fi &&
  #
  ${TRUE}