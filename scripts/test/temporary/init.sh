${ECHO} init A >> /build/debug &&
TARGET=${a1bf1278edcdadde99ea528e6f7fb99c069e840bb2bc10f5e54326df380677e399d911352ba22cce94ad7817efae178bc5844b74b874d1ded5bca309f55d78a7} &&
${ECHO} init B >> /build/debug &&
  TEMPORARY_ARRAY=${bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b} &&
${ECHO} init C >> /build/debug &&
  if [ -t 0 ]
  then
    exec 0<&-
  fi &&
${ECHO} init D >> /build/debug &&
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
${ECHO} init E >> /build/debug &&
  IFS="/" read -r -a TEMPORARY <<< ${TEMPORARY_ARRAY} &&
${ECHO} init F >> /build/debug &&
  ${ECHO} ${STANDARD_OUTPUT} &&
${ECHO} init G >> /build/debug &&
  ${ECHO} "init:" > ${TARGET} &&
${ECHO} init H >> /build/debug &&
  ${ECHO} "  temporary-array: ${TEMPORARY_ARRAY}" >> ${TARGET} &&
${ECHO} init I >> /build/debug &&
  ${ECHO} "  standard-output: ${STANDARD_OUTPUT}" >> ${TARGET} &&
${ECHO} init J >> /build/debug &&
  ${ECHO} "  standard-error: ${STANDARD_ERROR}" >> ${TARGET} &&
${ECHO} init K >> /build/debug &&
  ${ECHO} "  standard-status: ${STATUS}" >> ${TARGET} &&
${ECHO} init L >> /build/debug &&
  ${ECHO} "  has_standard_input: ${HAS_STANDARD_INPUT}" >> ${TARGET} &&
${ECHO} init M >> /build/debug &&
  ${ECHO} "  standard_input: ${STANDARD_INPUT}" >> ${TARGET} &&
${ECHO} init N >> /build/debug &&
  ${ECHO} "  arguments: ${@}" >> ${TARGET} &&
${ECHO} init O >> /build/debug &&
  ${ECHO} ${STANDARD_ERROR} >&2 &&
${ECHO} init P >> /build/debug &&
  exit ${STATUS}