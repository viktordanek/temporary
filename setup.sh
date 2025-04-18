${ECHO} AAAA >&2 &&
export RESOURCE=$( ${MKTEMP} --directory ${RESOURCES}/XXXXXXXX ) &&
${ECHO} AAAB >&2 &&
  export RESOURCE_NAME=$( ${BASENAME} ${RESOURCE} ) &&
${ECHO} AAAC >&2 &&
  export TARGET_MOUNT=${RESOURCE}/mount &&
${ECHO} AAAD >&2 &&
  export TARGET=${TARGET_MOUNT}/target &&
${ECHO} AAAE >&2 &&
  ${ECHO} AAAM >&2 &&
  ${MKDIR} ${TARGET_MOUNT} &&
  ${ECHO} AAAN >&2 &&
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
  ${ECHO} ${?} > ${RESOURCE}/init.status &&
#
  source ${MAKE_WRAPPER}/nix-support/setup-hook &&
  makeWrapper ${MAKE_WRAPPER_TEARDOWN} ${RESOURCE}/teardown.sh --set ORIGINATOR_PID ${ORIGINATOR_PID} --set RESOURCE_NAME ${RESOURCE_NAME} --set RESOURCES ${RESOURCES} --set STATUS ${STATUS} &&
#
  ( ${RESOURCE}/teardown.sh > /dev/null 2>&1 & ) && ## KLUDGE ALERT:  We should not have to redirect standard output and error.  this probably indicates an error. FIXME UNCOMMENT ME
  if [ ${STATUS} != 0 ]
  then
    exit ${INITIALIZATION_ERROR_CODE}
  elif [ $( ${FIND} ${TARGET_MOUNT} -mindepth 1 -maxdepth 1 | ${WC} --lines ) -gt 1 ]
  then
    exit ${OVER_INITIALIZED_TARGET_ERROR_CODE}
  elif [ ! -z "$( ${CAT} ${RESOURCE}/init.standard-error )" ]
  then
    exit ${STDERR_EMITTED_ERROR_CODE}
  else
    ${ECHO} ${TARGET}
  fi