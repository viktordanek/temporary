${ECHO} AA >> /archive/FLAG &&
  INDEX=$( ${FIND} /archive -mindepth 1 -maxdepth 1 -type d | ${WC} --lines ) &&
${ECHO} AB >> /archive/FLAG &&
  if [ -e /archive/${INDEX} ]
  then
${ECHO} AC >> /archive/FLAG &&
    ${ECHO} We assumed that /archive/${INDEX} did not exist >&2 &&
${ECHO} AD >> /archive/FLAG &&
      exit 64
  fi &&
${ECHO} AE >> /archive/FLAG &&
${ECHO} ${CP} --recursive /resource /archive/${INDEX} >> /archive/FLAG &&
ls -lah / >> /archive/FLAG &&
${ECHO} BA >> /archive/FLAG &&
ls -lah /resource >> /archive/FLAG &&
  ${CP} --recursive /resource /archive/${INDEX}