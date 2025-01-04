${ECHO} TA - 1 >> /build/observed/debug &&
${ECHO} "${NICE} --adjustment 19 ${TEARDOWN_SYNCH}" | ${AT} 2> /dev/null &&
${ECHO} TA - 2 >> /build/observed/debug
