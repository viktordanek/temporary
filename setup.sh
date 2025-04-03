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
    ${ECHO} ${UNINITIALIZED_TARGET_ERROR_MESSAGE} >&2 &&
      exit ${UNINITIALIZED_TARGET_ERROR_CODE}
  fi
  source ${MAKE_WRAPPER}/nix-support/setup-hook
  #

  #
  ${ECHO} ${TARGET}