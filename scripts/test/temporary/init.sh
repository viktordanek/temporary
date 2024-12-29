#!/bin/sh

${ECHO} HI &&
${ECHO} INIT_ARGUMENTS=${@} > ${TARGET} &&
  if [ -t 0 ] || [[ "$( ${READLINK} /proc/self/fd/0 )" == pipe:* ]]
  then
    INIT_HAS_STANDARD_INPUT=true
      INIT_STANDARD_INPUT=$( ${TEE} )
  else
    INIT_HAS_STANDARD_INPUT=false &&
      INIT_STANDARD_INPUT=
  fi &&
  ${ECHO} INIT_HAS_STANDARD_INPUT=${INIT_HAS_STANDARD_INPUT} &&
  ${ECHO} INIT_STANDARD_INPUT=${INIT_STANDARD_INPUT} &&
  ${ECHO INIT_TARGET=${TARGET} >> ${TARGET}