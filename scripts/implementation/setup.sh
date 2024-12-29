#!/bin/sh

RESOURCE=$( ${MKTEMP} --directory -t ${TEMPORARY_RESOURCE_MASK} ) &&
  ${ECHO} "${@}" > ${RESOURCE}/init.arguments &&
  ${CHMOD} 0400 ${RESOURCE}/init.arguments &&
  if [ -t 0 ] || [[ "$( ${READLINK} /proc/self/fd/0 )" == pipe:* ]]
  then
    PARENT_PID=$( ${PS} -p ${$} -o pid | ${TAIL} --lines 1 ) &&
      TARGET_PID=$( ${PS} -p ${PARENT_PID} -o pid | ${TAIL} --lines 1 ) &&
      ${TEE} > ${RESOURCE}/init.input &&
      ${CHMOD} 0400 ${RESOURCE}/init.input
  else
    TARGET_PID=$( ${PS} -p ${$} -o pid | ${TAIL} --lines 1 )
  fi &&
  if [ -x ${INIT} ]
  then
    ${LN} --symbolic ${INIT} ${RESOURCE}/init.sh
  fi &&
  if [ -x ${RELEASE} ]
  then
    ${LN} --symbolic ${RELEASE} ${RESOURCE}/release
  fi &&
  ${LN} --symbolic ${TEARDOWN_SYNCH} ${RESOURCE}/teardown-synch &&
  ${LN} --symbolic ${TEARDOWN_ASYNCH} ${RESOURCE}/teardown-asynch &&
  declare ${TARGET}=${RESOURCE}/target &&
  export ${TARGET} &&
  if [ -x ${INIT} ]
  then
    if [ ! -f ${RESOURCE}/init.arguments ] && ${CAT} ${RESOURCE}/init.input | ${INIT} $( ${CAT} ${RESOURCE}/init.arguments ) > ${RESOURCE}/init.out 2> ${RESOURCE}/init.err
    then
      STATUS=${?}
    elif ${INIT} $( ${CAT} ${RESOURCE}/init.arguments ) > ${RESOURCE}/init.out 2> ${RESOURCE}/init.err
    then
        STATUS=${?}
    fi &&
    ${ECHO} ${STATUS}-${INIT}-00 > ${RESOURCE}/init.status &&
    ${CHMOD} 0400 ${RESOURCE}/init.out ${RESOURCE}/init.err ${RESOURCE}/init.status
  fi &&
  if [ -z "${STATUS}" ] || [ ${STATUS} == 0 ]
  then
    ${ECHO} ${TARGET_PID// /} > ${RESOURCE}/${TARGET_PID// /}.pid &&
      ${CHMOD} 0400 ${RESOURCE}/${TARGET_PID// /}.pid
      ${RESOURCE}/teardown-asynch &&
      ${ECHO} ${!TARGET}
  else
    ${RESOURCE}/teardown-asynch &&
      ${ECHO} ${!TARGET}
      exit ${ERROR}
  fi