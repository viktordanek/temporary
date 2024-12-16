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
  ${ECHO} HI A${TARGET_PID// /}B > /dev/stderr &&
  ${ECHO} ${TARGET_PID// /} > ${RESOURCE}/${TARGET_PID// /}.pid &&
  ${ECHO} HI A${TARGET_PID// /}B > /dev/stderr &&
  ${CHMOD} 0400 ${RESOURCE}/${TARGET_PID// /}.pid &&
  if [ -x ${INIT} ]
  then
    ${LN} --symbolic ${INIT} ${RESOURCE}/init
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
    ${ECHO} HI A${TARGET_PID// /}B > /dev/stderr &&
    ${ECHO} ${STATUS} > ${RESOURCE}/init.status &&
    ${ECHO} HI A${TARGET_PID// /}B > /dev/stderr &&
    ${CHMOD} 0400 ${RESOURCE}/init.out ${RESOURCE}/init.err ${RESOURCE}/init.status
  fi &&
  if [ -z "${STATUS}" ] || [ ${STATUS} ]
  then
    ${RESOURCE}/teardown-asynch &&
      ${ECHO} HI A${TARGET_PID// /}B > /dev/stderr &&
      ${ECHO} ${TARGET}
  else
    BROKEN=$( ${MKTEMP} --dry-run -t ${BROKEN_RESOURCE_MASK} ) &&
      ${MV} ${RESOURCE} ${BROKEN} &&
      ${ECHO} ${BROKEN} &&
      exit ${ERROR}
  fi