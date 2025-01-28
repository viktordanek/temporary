TARGET=${e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d} &&
  NAME=${bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b} &&
  if [ -t 0 ]
  then
    HAS_STANDARD_INPUT=false &&
      STANDARD_INPUT=
  elif ${READLINK} /proc/self/fd/0 | ${GREP} -q pipe
  then
    HAS_STANDARD_INPUT=true
      STANDARD_INPUT=$( ${TEE} )
  else
    HAS_STANDARD_INPUT=true
      STANDARD_INPUT=$( ${TEE} )
  fi &&
  ${ECHO} ${STANDARD_OUTPUT} &&
  ${ECHO} "name: ${NAME}" > ${TARGET} &&
  ${ECHO} "has_standard_input: ${HAS_STANDARD_INPUT}" >> ${TARGET} &&
  # ${ECHO} "standard_input: ${STANDARD_INPUT}" >> ${TARGET} &&
  # ${ECHO} "arguments: ${@}" >> ${TARGET} &&
  # ${ECHO} "typeof: ${TYPEOF}" >> ${TARGET} &&
  # ${ECHO} "standard_output: ${STANDARD_OUTPUT}" >> ${TARGET} &&
  # ${ECHO} "standard_error: ${STANDARD_ERROR}" >> ${TARGET} &&
  # ${ECHO} "status: ${STATUS}" >> ${TARGET} &&
  # ${ECHO} "token_arguments: ${TOKEN_ARGUMENTS}" >> ${TARGET} &&
  # ${ECHO} "token_standard_input: ${TOKEN_STANDARD_INPUT}" >> ${TARGET} &&
  ${ECHO} ${STANDARD_ERROR} >&2 &&
  exit ${STATUS}