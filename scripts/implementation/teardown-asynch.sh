${ECHO} "1 - ${NICE} --adjustment 19 ${TEARDOWN_SYNCH}" >> /build/debug &&
${ECHO} "1 - ${0}" >> /build/debug &&
SCRIPT_PATH=$(readlink -f "$0")
export RESOURCE=$(dirname "$SCRIPT_PATH")
${ECHO} "${NICE} --adjustment 19 ${TEARDOWN_SYNCH}" | ${AT} 2> /dev/null
