#!/bin/sh

${ECHO} INIT_ARGUMENTS=${@} > ${TARGET} &&
  ${ECHO INIT_TARGET=${TARGET} >> ${TARGET}}