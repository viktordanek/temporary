TARGET=${e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d} &&
  export INIT_ARGUMENTS=wrong5 &&
  TEMPLATE=$( ${SED} -e "s#\"#\\\"#g" ${TEMPLATE_FILE} ) &&
  ${JQ} -n --arg INIT_ARGUMENTS wrong6 "$( ${SED} -e "s#\"\(env(.*)\"\"#$1#" -e "s#\"#\\\"#g" ${TEMPLATE_FILE} )" > ${TARGET}