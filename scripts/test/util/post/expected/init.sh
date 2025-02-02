TARGET=${e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d} &&
  hash ( )
    {
      ${ECHO} -n "${INDEX}${1}${2}" | ${MD5SUM} | ${CUT} --bytes -8
    } &&
    val ( )
      {
        CUMULATIVE_SIZE=${1} &&
          SIZE=${2} &&
          NAME=${3} &&
          VAL=$(( ( ${INDEX} / ${CUMULATIVE_SIZE} ) % ${SIZE} )) &&
          HASH=$( hash ${NAME} ${VAL} ) &&
          FIRST_DIGIT=${HASH:0:1} &&
          DECIMAL_VALUE=$(( 0x$FIRST_DIGIT )) &&
          if [ ${VAL} == 0 ]
          then
            ${ECHO} ${VAL}
          else
            ${ECHO} $(( ${DECIMAL_VALUE} +1 ))
          fi
      } &&
    # '[ { content : $ARGUMENTS , name : "arguments" , type : "file" , foobar : $FOOBAR } ]'
    ${JQ} \
     -n \
     --arg TEMPLATE_FILE "${TEMPLATE_FILE}" \
     --arg FOOBAR fsdgsdfgdf \
     --arg ARGUMENTS $( hash "arguments" 0 ) \
     --arg INIT_STANDARD_ERROR $( hash "init-standard-error" 0 ) \
     --arg INIT_STANDARD_INPUT $( hash "init-standard-input" 0 ) \
     --arg INIT_STANDARD_OUTPUT $( hash "init-standard-output" 0 ) \
     --argjson INIT_STATUS $( val 2 2 "init-status") \
     --arg NAME $( hash "name" ) \
     --arg RELEASE_STANDARD_ERROR $( hash "release-standard-error" 0 ) \
     --arg RELEASE_STANDARD_INPUT $( hash "release-standard-input" 0 ) \
     --arg RELEASE_STANDARD_OUTPUT $( hash "release-standard-output" 0 ) \
     --argjson RELEASE_STATUS $( val 4 2 "release-status" ) \
     -f ${TEMPLATE_FILE} \
     > ${TARGET}