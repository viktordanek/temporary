${ECHO} TEARDOWN_ASYNCH 0=${0} LOCAL_RESOURCE=${LOCAL_RESOURCE} >> /build/debug &&
${ECHO} "${NICE} --adjustment 19 ${TEARDOWN_SYNCH}" | ${AT} now >> /dev/null 2>&1
