TARGET=${a1bf1278edcdadde99ea528e6f7fb99c069e840bb2bc10f5e54326df380677e399d911352ba22cce94ad7817efae178bc5844b74b874d1ded5bca309f55d78a7} &&
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
  IFS="/" read -r -a TEMPORARY <<< ${TEMPORARY_ARRAY} &&
  ${ECHO} ${STANDARD_OUTPUT} &&
  ${ECHO} "init:" > ${TARGET} &&
  ${ECHO} "  temporary-array: ${TEMPORARY_ARRAY}" >> ${TARGET} &&
  ${ECHO} "  standard-output: ${STANDARD_OUTPUT}" >> ${TARGET} &&
  ${ECHO} "  standard-error: ${STANDARD_ERROR}" >> ${TARGET} &&
  ${ECHO} "  standard-status: ${STATUS}" >> ${TARGET} &&
  ${ECHO} "  has_standard_input: ${HAS_STANDARD_INPUT}" >> ${TARGET} &&
  ${ECHO} "  standard_input: ${STANDARD_INPUT}" >> ${TARGET} &&
  ${ECHO} "  arguments: ${@}" >> ${TARGET} &&
  ${ECHO} ${STANDARD_ERROR} >&2 &&
  exit ${STATUS}