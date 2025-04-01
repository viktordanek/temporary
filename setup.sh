export RESOURCE=$( ${MKTEMP} --tmpdir --directory XXXXXXXX ) &&
  export TARGET_MOUNT=${RESOURCE}/mount &&
  ${MKDIR} ${TARGET_MOUNT} &&
  if ${HAS_STANDARD_INPUT}
  then
    if ${INIT} ${@} > ${RESOURCE}/init.standard-output 2> ${RESOURCE}/init.standard-error
    then
      ${ECHO} ${?} > ${RESOURCE}/init.status
    else
      ${ECHO} ${?} > ${RESOURCE}/init.status
  else
    if ${ECHO} ${STANDARD_INPUT} | ${INIT} ${@} > ${RESOURCE}/init.standard-output 2> ${RESOURCE}/init.standard-error
    then
      ${ECHO} ${?} > ${RESOURCE}/init.status
    else
      ${ECHO} ${?} > ${RESOURCE}/init.status
  fi &&
  if [ ! -e ${RESOURCE}/mount/target ]
  then
    ${ECHO} ${UNINITIALIZED_TARGET_ERROR_MESSAGE} >&2 &&
      exit ${UNINITIALIZED_TARGET_ERROR_CODE}
  fi &&
  if [ $( ${FIND} ${RESOURCE}/mount -mindepth 1 -maxdepth 1 ) != 1 ]
  then
    ${ECHO} ${OVER_INITIALIZED_TARGET_ERROR_MESSAGE} >&2 &&
      exit ${OVER_INITIALIZED_TARGET_ERROR_CODE}
  fi &&
  ${CHMOD} 0400 ${RESOURCE}/init.standard-output ${RESOURCE}/init.standard-error ${RESOURCE}/init.status &&
  source ${MAKE_WRAPPER}/nix-support/setup-hook &&
#
  makeWrapper ${MAKE_WRAPPER_TEARDOWN} ${RESOURCE}/teardown.sh --set ORIGINATOR_PID ${ORIGINATOR_PID} --set RESOURCE ${RESOURCE} --set STATUS ${STATUS} --set TARGET ${TARGET_MOUNT}/target &&
#
#
##  makeWrapper ${MAKE_WRAPPER_TEARDOWN} ${RESOURCE}/teardown.sh --set ORIGINATOR_PID ${ORIGINATOR_PID} --set POST ${POST} --set RESOURCE ${RESOURCE} --set STATUS ${STATUS} --set TARGET ${TARGET_MOUNT}/target &&
#
#
##  makeWrapper ${MAKE_WRAPPER_TEARDOWN} ${RESOURCE}/teardown.sh --set ORIGINATOR_PID ${ORIGINATOR_PID} --set RESOURCE ${RESOURCE} --set STATUS ${STATUS} --set TARGET ${TARGET_MOUNT}/target &&
#
#
##  makeWrapper ${MAKE_WRAPPER_TEARDOWN} ${RESOURCE}/teardown.sh --set ORIGINATOR_PID ${ORIGINATOR_PID} --set RESOURCE ${RESOURCE} --set STATUS ${STATUS} --set TARGET ${TARGET_MOUNT}/target &&
#
  ${RESOURCE}/teardown.sh &