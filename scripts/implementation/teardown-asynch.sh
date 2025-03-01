TEARDOWN_SYNCH=${RESOURCE}/teardown-synch &&
${ECHO} "${ECHO} \"${NICE} --adjustment 19 ${TEARDOWN_SYNCH}\" | ${AT} now >> /dev/null 2>&1" >> ${RESOURCE}/debug &&
${ECHO} "${NICE} --adjustment 19 ${TEARDOWN_SYNCH}" | ${AT} now >> /dev/null 2>&1 &&
${ECHO} COMPLETED TEARDOWN_ASYNCH >> ${RESOURCE}/debug
