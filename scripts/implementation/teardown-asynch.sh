${ECHO} "1 - ${NICE} --adjustment 19 ${TEARDOWN_SYNCH}" >> /build/debug &&
${ECHO} "1 - ${0}" >> /build/debug &&
${ECHO} "${NICE} --adjustment 19 ${TEARDOWN_SYNCH}" | ${AT} 2> /dev/null
