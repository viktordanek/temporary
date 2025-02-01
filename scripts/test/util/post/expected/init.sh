TARGET=${e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d} &&
  hash ( )
    {
      ${ECHO} -n "${INDEX}${1}${2}" | ${MD5SUM} | ${CUT} --bytes -8
    }
  ${JQ} -n --arg INIT_ARGUMENTS $( hash "arguments" 0 ) -f ${TEMPLATE_FILE} > ${TARGET}