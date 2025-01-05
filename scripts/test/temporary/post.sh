TEMPORARY_PATH=${bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b}
  IFS="/" read -ra TEMPORARY_PATH_ARRAY <<< "${TEMPORARY_PATH}" &&
  INIT_ARGUMENT_STATUS=${TEMPORARY_PATH_ARRAY[0]} &&
  INIT_STANDARD_INPUT_STATUS=${TEMPORARY_PATH_ARRAY[1]} &&
  A_INIT_STANDARD_OUTPUT=${TEMPORARY_PATH_ARRAY[2]} &&
  A_INIT_STANDARD_ERROR=${TEMPORARY_PATH_ARRAY[3]} &&
  INIT_EXIT_STATUS=${TEMPORARY_PATH_ARRAY[4]} &&
  RELEASE_EXIT_STATUS=${TEMPORARY_PATH_ARRAY[5]} &&
  TARGET=${e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d} &&
  DIRECTORY=/build/observed/temporary/${INIT_ARGUMENT_STATUS}/${A_INIT_STANDARD_INPUT}/${A_INIT_STANDARD_OUTPUT}/${A_INIT_STANDARD_ERROR}/${INIT_EXIT_STATUS}/${RELEASE_EXIT_STATUS} &&
  ${MKDIR} --parents ${DIRECTORY} &&
  ${SED} -e "s#${TARGET}#\${TARGET}#" -e w${DIRECTORY}/target ${RESOURCE}/target > /dev/null &&
  if [ -f ${RESOURCE}/init.standard-error ]
  then
    ${CAT} ${RESOURCE}/init.standard-error >> ${DIRECTORY}/init.standard-error
  fi &&
  if [ -f ${RESOURCE}/init.standard-output ]
  then
    ${CAT} ${RESOURCE}/init.standard-output >> ${DIRECTORY}/init.standard-output
  fi &&
  if [ -f ${RESOURCE}/init.status ]
  then
    ${CAT} ${RESOURCE}/init.status >> ${DIRECTORY}/init.status
  fi &&
  if [ -f ${RESOURCE}/release.standard-error ]
  then
    ${CAT} ${RESOURCE}/release.standard-error >> ${DIRECTORY}/release.standard-error
  fi &&
  if [ -f ${RESOURCE}/release.standard-output ]
  then
    ${CAT} ${RESOURCE}/release.standard-output >> ${DIRECTORY}/release.standard-output
  fi &&
  if [ -f ${RESOURCE}/release.status ]
  then
    ${CAT} ${RESOURCE}/release.status >> ${DIRECTORY}/release.status
  fi &&
  if [ -z "A_INIT_STANDARD_INPUT" ]
  then
    A_INIT_HAS_STANDARD_INPUT=n
  else
    A_INIT_HAS_STANDARD_INPUT=y
  fi &&
  ${SED} -e "s#^INIT_STANDARD_ERROR=.*\$#INIT_STANDARD_ERROR=${A_INIT_STANDARD_ERROR}#" -e w${DIRECTORY}/init.standard-error.post ${DIRECTORY}/init.standard-error &&
  ${ECHO} "${DIFF} --brief ${DIRECTORY}/standard-error ${DIRECTORY}/init.standard-error.post ${DIRECTORY}/init.standard-error.post > ${DIRECTORY}/init.standard-error.diff 2> ${DIRECTORY}/debuga" >> ${DIRECTORY}/debug_command &&
  ${DIFF} --brief ${DIRECTORY}/standard-error ${DIRECTORY}/init.standard-error.post ${DIRECTORY}/init.standard-error.post > ${DIRECTORY}/init.standard-error.diff 2> ${DIRECTORY}/debuga &&
  ${SED} -e "s#^INIT_STANDARD_OUTPUT=.*\$#INIT_STANDARD_OUTPUT=${A_INIT_STANDARD_OUTPUT}#" -e w${DIRECTORY}/init.standard-output.post ${DIRECTORY}/init.standard-output >> ${DIRECTORY}/debug 2>&1 &&
  ${DIFF} --brief ${DIRECTORY}/standard-output ${DIRECTORY}/init.standard-output.post ${DIRECTORY}/init.standard-output.post > ${DIRECTORY}/init.standard-output.diff >> ${DIRECTORY}/debug 2>&1 &&
  ${SED} \
    -e "s#I_HAS_STANDARD_INPUT=[y|n]#I_HAS_STANDARD_INPUT=${A_INIT_HAS_STANDARD_INPUT}#" \
    -e "s#I_STANDARD_INPUT=[.]*#I_STANDARD_INPUT=${A_INIT_STANDARD_INPUT}#" \
    -e w${DIRECTORY}/target.post \
    ${DIRECTORY}/target