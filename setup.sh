export RESOURCE=$( ${MKTEMP} --directory /resources/XXXXXXXX ) &&
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
  ${CHMOD} 0400 ${RESOURCE}/init.standard-output ${RESOURCE}/init.standard-error &&
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