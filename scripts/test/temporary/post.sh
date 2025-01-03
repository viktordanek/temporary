TEMPORARY_PATH=${bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b}
  IFS="/" read -ra TEMPORARY_PATH_ARRAY <<< "${TEMPORARY_PATH}" &&
  INIT_ARGUMENT_STATUS=${TEMPORARY_PATH_ARRAY[0]} &&
  INIT_STANDARD_INPUT_STATUS=${TEMPORARY_PATH_ARRAY[1]} &&
  INIT_EXIT_STATUS=${TEMPORARY_PATH_ARRAY[2]} &&
  RELEASE_EXIT_STATUS=${TEMPORARY_PATH_ARRAY[3 ]} &&
  TARGET=${e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d} &&
  ${MKDIR} --parents /build/observed/temporary/${INIT_ARGUMENT_STATUS}/${INIT_STANDARD_INPUT_STATUS}/${INIT_EXIT_STATUS}/${RELEASE_EXIT_STATUS} &&
  ${SED} -e "s#${TARGET}#\${TARGET}#" -e w/build/observed/temporary/${INIT_ARGUMENT_STATUS}/${INIT_STANDARD_INPUT_STATUS}/${INIT_EXIT_STATUS}/${RELEASE_EXIT_STATUS}/target ${RESOURCE}/target > /dev/null &&
  ${FIND} ${RESOURCE} -name "*.pid" | while read PID_FILE
  do
    ${CAT} ${PID_FILE} ${RESOURCE}/init.standard-error >> /build/observed/temporary/${INIT_ARGUMENT_STATUS}/${INIT_STANDARD_INPUT_STATUS}/${INIT_EXIT_STATUS}/${RELEASE_EXIT_STATUS}/$( ${CAT} ${PID_FILE} ).pid
  if [ -f ${RESOURCE}/init.standard-error ]
  then
    ${CAT} ${RESOURCE}/init.standard-error >> /build/observed/temporary/${INIT_ARGUMENT_STATUS}/${INIT_STANDARD_INPUT_STATUS}/${INIT_EXIT_STATUS}/${RELEASE_EXIT_STATUS}/init.standard-error
  fi &&
  if [ -f ${RESOURCE}/init.standard-output ]
  then
    ${CAT} ${RESOURCE}/init.standard-output >> /build/observed/temporary/${INIT_ARGUMENT_STATUS}/${INIT_STANDARD_INPUT_STATUS}/${INIT_EXIT_STATUS}/${RELEASE_EXIT_STATUS}/init.standard-output
  fi &&
  if [ -f ${RESOURCE}/init.status ]
  then
    ${CAT} ${RESOURCE}/init.status >> /build/observed/temporary/${INIT_ARGUMENT_STATUS}/${INIT_STANDARD_INPUT_STATUS}/${INIT_EXIT_STATUS}/${RELEASE_EXIT_STATUS}/init.status
  fi &&
  if [ -f ${RESOURCE}/release.standard-error ]
  then
    ${CAT} ${RESOURCE}/release.standard-error >> /build/observed/temporary/${INIT_ARGUMENT_STATUS}/${INIT_STANDARD_INPUT_STATUS}/${INIT_EXIT_STATUS}/${RELEASE_EXIT_STATUS}/release.standard-error
  fi &&
  if [ -f ${RESOURCE}/release.standard-output ]
  then
    ${CAT} ${RESOURCE}/release.standard-output >> /build/observed/temporary/${INIT_ARGUMENT_STATUS}/${INIT_STANDARD_INPUT_STATUS}/${INIT_EXIT_STATUS}/${RELEASE_EXIT_STATUS}/release.standard-output
  fi &&
  if [ -f ${RESOURCE}/release.status ]
  then
    ${CAT} ${RESOURCE}/release.status >> /build/observed/temporary/${INIT_ARGUMENT_STATUS}/${INIT_STANDARD_INPUT_STATUS}/${INIT_EXIT_STATUS}/${RELEASE_EXIT_STATUS}/release.status
  fi