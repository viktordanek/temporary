export RESOURCE=$( ${MKTEMP} --tmpdir --directory XXXXXXXX ) &&
  export TARGET_MOUNT=${RESOURCE}/mount &&
  export TARGET=${TARGET_MOUNT}/target &&
  ${MKDIR} ${TARGET_MOUNT} &&
  if ${HAS_STANDARD_INPUT}
  then
    if ${ECHO} "${STANDARD_INPUT}" | ${INIT} ${@} > ${RESOURCE}/init.standard-output 2> ${RESOURCE}/init.standard-error
    then
      STATUS=${?}
    else
      STATUS=${?}
    fi
  else
    if ${INIT} ${@} > ${RESOURCE}/init.standard-output 2> ${RESOURCE}/init.standard-error
    then
      STATUS=${?}
    else
      STATUS=${?}
    fi
  fi &&
  ${ECHO} ${?} > ${RESOURCE}/init.status
  if [ ! -e ${TARGET} ]
  then
    exit ${UNINITIALIZED_TARGET_ERROR_CODE}
  fi &&
  if [ $( ${FIND} ${TARGET_MOUNT} -mindepth 1 -maxdepth 1 | ${WC} --lines ) != 1 ]
  then
    exit ${OVER_INITIALIZED_TARGET_ERROR_CODE}
  fi &&
  source ${MAKE_WRAPPER}/nix-support/setup-hook
  makeWrapper ${MAKE_WRAPPER_TEARDOWN} ${RESOURCE}/teardown.sh --set ORIGINATOR_PID ${ORIGINATOR_PID} --set RESOURCE ${RESOURCE} --set STATUS ${STATUS} --set TARGET ${TARGET} &&
  if [ ${STATUS} != 0 ]
  then
    exit ${INITIALIZATION_ERROR_CODE}
  elif [ ! -z "$( ${CAT} ${RESOURCE}/init.standard-error )" ]
  then
    exit ${STDERR_EMITTED_ERROR_CODE}
  else
    ${ECHO} ${TARGET}
  fi &&
  ${RESOURCE}/teardown.sh &