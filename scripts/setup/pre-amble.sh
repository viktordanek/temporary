export RESOURCE=$( ${MKTEMP} --directory -t ${RESOURCE_MASK} ) &&
  ${ECHO} "${@}" > ${RESOURCE}/init.arguments &&
  ${CHMOD} 0400 ${RESOURCE}/init.arguments &&
  if ${IS_INTERACTIVE}
  then
    TARGET_PID=${PARENT_PID}
  elif ${IS_PIPE}
  then
    TARGET_PID=${GRANDPARENT_PID} &&
      ${TEE} > ${RESOURCE}/init.standard-input &&
      ${CHMOD} 0400 ${RESOURCE}/init.standard-input
  elif ${IS_FILE}
  then
    TARGET_PID=${GRANDPARENT_PID} &&
      ${CAT} > ${RESOURCE}/init.standard-input &&
      ${CHMOD} 0400 ${RESOURCE}/init.standard-input
  else
    TARGET_PID=${PARENT_PID}
  fi &&
  ${ECHO} ${TARGET_PID// /} > ${RESOURCE}/pid &&
  ${CHMOD} 0400 ${RESOURCE}/pid &&