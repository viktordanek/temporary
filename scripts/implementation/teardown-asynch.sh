${ECHO} TA - 1 >> /build/observed/debug &&
${ECHO} "TA - 2 ${ECHO} \"${NICE} --adjustment 19 ${TEARDOWN_SYNCH}\" | ${AT} now >> /build/observed/debug 2>&1" >> /build/observed/debug &&
${ECHO} -en "${NICE} --adjustment 19 ${TEARDOWN_SYNCH}\n\n" | ${AT} now >> /build/observed/debug 2>&1 &&
${ECHO} TA - 3 >> /build/observed/debug
