export RESOURCE=$( ${MKTEMP} --directory /resources/XXXXXXXX ) &&
  ${CHMOD} 0400 ${RESOURCE}/pid &&
  export TARGET_MOUNT=$( ${MKTEMP} --directory /resources/XXXXXXXX ) &&
#
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
#
  makeWrapper ${MAKE_WRAPPER_TEARDOWN} ${RESOURCE}/teardown.sh --set ORIGINATOR_PID ${ORIGINATOR_PID} --set RESOURCE ${RESOURCE} --set STATUS ${STATUS} --set TARGET ${TARGET_MOUNT}/target &&
  ${RESOURCE}/teardown.sh &