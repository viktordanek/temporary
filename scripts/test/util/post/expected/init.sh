TARGET=${e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d} &&
  HAS_INIT=${1} &&
  ${ECHO} ${HAS_INIT} - ${INIT_ARGUMENTS} - > ${TARGET}
  # if [ ${HAS_INIT} == true ]
  # then
  #  ${SED} \
  #    -e "s#\${NAME}#init#" \
  #    -e "s#\${ARGUMENTS}#${INIT_ARGUMENTS}#" \
  #    -e "s#\${STANDARD_ERROR}#${INIT_STANDARD_ERROR}#" \
  #    -e "s#\${STANDARD_OUTPUT}#${INIT_STANDARD_OUTPUT}#" \
  #    -e "s#\${STANDARD_STATUS}#${INIT_STATUS}#" \
  #    ${TEMPLATE} \
  #    > ${TARGET}
  # fi