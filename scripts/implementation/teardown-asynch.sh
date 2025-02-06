${ECHO} TEARDOWN_ASYNCH >> /build/debug &&
${ECHO} "${NICE} --adjustment 19 ${TEARDOWN_SYNCH}" | ${AT} now >> /dev/null 2>&1
