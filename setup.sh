export RESOURCE=$( ${MKTEMP} --directory ) &&
  export TARGET_MOUNT=${RESOURCE}/mount &&
  ${MKDIR} ${TARGET_MOUNT} &&
  if ${HAS_STANDARD_INPUT}
  then
    if ${ECHO} "${STANDARD_INPUT}" | ${INIT} ${@} > ${RESOURCE}/init.standard-output 2> ${RESOURCE}/init.standard-error
    then
      ${ECHO} ${?} > ${RESOURCE}/init.status
    else
      ${ECHO} ${?} > ${RESOURCE}/init.status
    fi
  else
    if ${INIT} ${@} > ${RESOURCE}/init.standard-output 2> ${RESOURCE}/init.standard-error
    then
      ${ECHO} ${?} > ${RESOURCE}/init.status
    else
      ${ECHO} ${?} > ${RESOURCE}/init.status
    fi
  fi