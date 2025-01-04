${ECHO} TA - 1 >> /build/observed/debug &&
${ECHO} "TA - 2 ${ECHO} \"${NICE} --adjustment 19 ${TEARDOWN_SYNCH}\" | ${AT} 2> /dev/null" >> /build/observed/debug &&
${ECHO} "${NICE} --adjustment 19 ${TEARDOWN_SYNCH}" | ${AT} > /build/observed/debug >2 /build/observed/debug &&
${ECHO} TA - 3 >> /build/observed/debug
