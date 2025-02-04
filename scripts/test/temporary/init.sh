TARGET=${e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d} &&
  TEMPORARY_ARRAY=${bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b} &&
  if [ -t 0 ]
  then
    exec 0<&-
  fi &&
  if [ -t 0 ]
  then
    HAS_STANDARD_INPUT=false &&
      STANDARD_INPUT=
  elif [ -p /proc/self/fd/0 ]
  then
    HAS_STANDARD_INPUT=true
      STANDARD_INPUT=$( ${TEE} )
  elif [ -f /proc/self/fd/0 ]
  then
    HAS_STANDARD_INPUT-true
      STANDARD_INPUT=$( ${CAT} )
  else
    HAS_STANDARD_INPUT=false
      STANDARD_INPUT=
  fi &&
  ${ECHO} ${STANDARD_OUTPUT} &&
  IFS="/" read -r TEMPORARY <<< ${TEMPORARY_ARRAY &&
  ${ECHO} "init:" > ${TARGET} &&
  ${ECHO} "  temporary-array: ${TEMPORARY_ARRAY}" >> ${TARGET} &&
  ${ECHO} "  has_standard_input: ${HAS_STANDARD_INPUT}" >> ${TARGET} &&
  ${ECHO} "  standard_input: ${STANDARD_INPUT}" >> ${TARGET} &&
  ${ECHO} "  arguments: ${@}" >> ${TARGET} &&
  ${ECHO} ${STANDARD_ERROR} >&2 &&
  exit ${TEMPORARY[8]}