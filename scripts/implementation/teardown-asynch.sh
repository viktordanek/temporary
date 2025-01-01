TEARDOWN_SYNCH=$( ${DIRNAME} ${0} )/teardown-synch.sh &&
${ECHO} 1 ${0} ${TEARDOWN_SYNCH} >> /build/debug &&
cat ${TEARDOWN_SYNCH} >> /build/debug &&
${ECHO} >> /build/debug &&
${ECHO} "${NICE} --adjustment 19 ${TEARDOWN_SYNCH}" | ${AT} 2> /dev/null
