TEMPORARY_PATH=${bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b}
  IFS="/" read -ra TEMPORARY_PATH_ARRAY <<< "${TEMPORARY_PATH}" &&
  A_INIT_ARGUMENT=${TEMPORARY_PATH_ARRAY[0]} &&
  A_INIT_STANDARD_INPUT=${TEMPORARY_PATH_ARRAY[1]} &&
  A_INIT_STANDARD_OUTPUT=${TEMPORARY_PATH_ARRAY[2]} &&
  A_INIT_STANDARD_ERROR=${TEMPORARY_PATH_ARRAY[3]} &&
  A_RELEASE_STANDARD_OUTPUT=${TEMPORARY_PATH_ARRAY[4]} &&
  A_RELEASE_STANDARD_ERROR=${TEMPORARY_PATH_ARRAY[5]} &&
  A_INIT_EXIT=${TEMPORARY_PATH_ARRAY[6]} &&
  A_RELEASE_EXIT=${TEMPORARY_PATH_ARRAY[7]} &&
  TARGET=${e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d} &&
  DIRECTORY=/build/observed/temporary/${A_INIT_ARGUMENT}/${A_INIT_STANDARD_INPUT}/${A_INIT_STANDARD_OUTPUT}/${A_INIT_STANDARD_ERROR}/${A_INIT_EXIT}/${A_RELEASE_EXIT} &&
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
  if [ -z "A_STANDARD_INPUT" ]
  then
    A_HAS_STANDARD_INPUT=n
  else
    A_HAS_STANDARD_INPUT=y
  fi &&
  ${SED} -e "s#^INIT_STANDARD_ERROR=.*\$#INIT_STANDARD_ERROR=${A_INIT_STANDARD_ERROR}#" -e w${DIRECTORY}/init.standard-error.post ${DIRECTORY}/init.standard-error &&
  ${DIFF} ${DIRECTORY}/init.standard-error ${DIRECTORY}/init.standard-error.post > ${DIRECTORY}/init.standard-error.diff &&
  ${SED} -e "s#^INIT_STANDARD_OUTPUT=.*\$#INIT_STANDARD_OUTPUT=${A_INIT_STANDARD_OUTPUT}#" -e w${DIRECTORY}/init.standard-output.post ${DIRECTORY}/init.standard-output &&
  ${DIFF} --brief ${DIRECTORY}/init.standard-output ${DIRECTORY}/init.standard-output.post > ${DIRECTORY}/init.standard-output.diff &&
  ${SED} -e "s#^INIT_EXIT=.*\$#INIT_EXIT=${A_INIT_EXIT}#" -e w${DIRECTORY}/init.status.post ${DIRECTORY}/init.status &&
  ${DIFF} --brief ${DIRECTORY}/init.status ${DIRECTORY}/init.status.post > ${DIRECTORY}/init.status.diff &&
  ${SED} -e "s#^RELEASE_STANDARD_ERROR=.*\$#RELEASE_STANDARD_ERROR=${A_RELEASE_STANDARD_ERROR}#" -e w${DIRECTORY}/release.standard-error.post ${DIRECTORY}/release.standard-error &&
  ${DIFF} ${DIRECTORY}/release.standard-error ${DIRECTORY}/release.standard-error.post > ${DIRECTORY}/release.standard-error.diff &&
  ${SED} -e "s#^RELEASE_STANDARD_OUTPUT=.*\$#RELEASE_STANDARD_OUTPUT=${A_RELEASE_STANDARD_OUTPUT}#" -e w${DIRECTORY}/release.standard-output.post ${DIRECTORY}/release.standard-output &&
  ${DIFF} --brief ${DIRECTORY}/release.standard-output ${DIRECTORY}/release.standard-output.post > ${DIRECTORY}/release.standard-output.diff &&
  ${SED} -e "s#^RELEASE_EXIT=.*\$#RELEASE_EXIT=${A_RELEASE_EXIT}#" -e w${DIRECTORY}/release.status.post ${DIRECTORY}/release.status &&
  ${DIFF} --brief ${DIRECTORY}/release.status ${DIRECTORY}/release.status.post > ${DIRECTORY}/release.status.diff &&
  ${SED} \
    -e "s#^I_HAS_STANDARD_INPUT=[y|n]\$#I_HAS_STANDARD_INPUT=${A_HAS_STANDARD_INPUT}#" \
    -e "s#^I_STANDARD_INPUT=[.]*\$#I_STANDARD_INPUT=${A_STANDARD_INPUT}#" \
    -e "s#^I_A_INIT_STANDARD_INPUT=.*\$#I_A_INIT_STANDARD_INPUT=${A_INIT_STANDARD_INPUT}#" \
    -e "s#^I_A_INIT_STANDARD_OUTPUT=.*\$#I_A_INIT_STANDARD_OUTPUT=${A_INIT_STANDARD_OUTPUT}#" \
    -e "s#^I_A_INIT_STANDARD_ERROR=.*\$#I_A_INIT_STANDARD_ERROR=${A_INIT_STANDARD_ERROR}#" \
    -e "s#^I_A_RELEASE_STANDARD_OUTPUT=.*\$#I_A_INIT_STANDARD_OUTPUT=${A_RELEASE_STANDARD_OUTPUT}#" \
    -e "s#^I_A_RELEASE_STANDARD_ERROR=.*\$#I_A_RELEASE_STANDARD_ERROR=${A_RELEASE_STANDARD_ERROR}#" \
    -e "s#^I_A_INIT_EXIT=.*\$#I_A_I KT_EXIT=${A_INIT_EXIT}#" \
    -e "s#^I_A_RELEASE_EXIT=.*\$#I_A_RELEASE_EXIT=${A_RELEASE_EXIT}#" \
    -e "s#^I_VARIABLE=.*\$#I_VARIABLE=${I_VARIABLE}#" \
    -e "s#^PASTE=.*\$#PASTE=${PASTE}#" \
    -e "s#^R_HAS_STANDARD_INPUT=[y|n]\$#I_HAS_STANDARD_INPUT=${A_HAS_STANDARD_INPUT}#" \
    -e "s#^R_STANDARD_INPUT=[.]*\$#I_STANDARD_INPUT=${A_STANDARD_INPUT}#" \
    -e "s#^R_A_INIT_STANDARD_INPUT=.*\$#I_A_INIT_STANDARD_INPUT=${A_INIT_STANDARD_INPUT}#" \
    -e "s#^R_A_INIT_STANDARD_OUTPUT=.*\$#I_A_INIT_STANDARD_OUTPUT=${A_INIT_STANDARD_OUTPUT}#" \
    -e "s#^R_A_INIT_STANDARD_ERROR=.*\$#I_A_INIT_STANDARD_ERROR=${A_INIT_STANDARD_ERROR}#" \
    -e "s#^R_A_RELEASE_STANDARD_OUTPUT=.*\$#I_A_INIT_STANDARD_OUTPUT=${A_RELEASE_STANDARD_OUTPUT}#" \
    -e "s#^R_A_RELEASE_STANDARD_ERROR=.*\$#I_A_RELEASE_STANDARD_ERROR=${A_RELEASE_STANDARD_ERROR}#" \
    -e "s#^R_A_INIT_EXIT=.*\$#I_A_I KT_EXIT=${A_INIT_EXIT}#" \
    -e "s#^R_A_RELEASE_EXIT=.*\$#I_A_RELEASE_EXIT=${A_RELEASE_EXIT}#" \
    -e "s#^R_VARIABLE=.*\$#I_VARIABLE=${I_VARIABLE}#" \
    -e w${DIRECTORY}/target.post \
    ${DIRECTORY}/target &&
  ${DIFF} ${DIRECTORY}/target ${DIRECTORY}/target.post > ${DIRECTORY}/target.diff &&
  ${CAT} ${DIRECTORY}/*.diff > ${DIRECTORY}/diff