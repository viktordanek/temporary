${ECHO} "1 - ${NICE} --adjustment 19 ${TEARDOWN_SYNCH}" >> /build/debug &&
${ECHO} "1 - ${0}" >> /build/debug &&
if [ -L "$0" ]; then
  # Resolve the symlink
  SCRIPT_PATH=$(readlink -f "$0")
else
  # If not a symlink, use the script's path directly
  SCRIPT_PATH=$(realpath "$0")
fi
SCRIPT_PATH=$(readlink -f "$0")
export RESOURCE=$(dirname "$SCRIPT_PATH")
${ECHO} "1 - ${RESOURCE}" >> /build/debug &&
${ECHO} "${NICE} --adjustment 19 ${TEARDOWN_SYNCH}" | ${AT} 2> /dev/null
