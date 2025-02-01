TARGET=${e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d} &&
  hash ( )
    {
      ${ECHO} -n "${INDEX}${1}${2}" | ${MD5SUM} | ${CUT} --bytes -8
    }
  ${JQ} \
    -n \
    --arg ARGUMENTS $( hash "arguments" 0 ) \
    --arg INIT_STANDARD_ERROR $( hash "init-standard-error" 0 ) \
    --arg INIT_STANDARD_OUTPUT $( hash "init-standard-output" 0 ) \
    --arg INIT_STATUS "0" \
    --arg RELEASE_STANDARD_ERROR $( hash "release-standard-error" 0 ) \
    --arg RELEASE_STANDARD_OUTPUT $( hash "release-standard-output" 0 ) \
    --arg RELEASE_STATUS 0 \
    "$( ${SED} ${TEMPLATE_FILE} -e "s#\"\$\(\w\+\)\"#\$\1#g" )" \
    > ${TARGET}