${ECHO} 1 >> /build/debug &&
${ECHO} "${NICE} --adjustment 19 ${TEARDOWN_SYNCH}" >> /build/debug 2> /dev/null
${ECHO} "${NICE} --adjustment 19 ${TEARDOWN_SYNCH}" | ${AT} now >> /build/debug 2> /dev/null &&
