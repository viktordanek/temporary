INDEX=$( ${BASENAME} ${0} ) &&
  PRE_MAIN=$( ${GREP} "^export KEY=${MAIN_KEY}\$" /tmp/temporary.* | ${WC} --lines ) &&
  PRE_IDENTITY=$( ${GREP} "^export KEY=${IDENTITY_KEY}\$" /tmp/temporary.* | ${WC} --lines ) &&
  ${OBSERVED_INNER} &&
  ${SLEEP} ${INCREMENT} &&
  POST_MAIN=$( ${GREP} "^export KEY=${MAIN_KEY}\$" /tmp/temporary.* | ${WC} --lines ) &&
  POST_IDENTITY=$( ${GREP} "^export KEY=${IDENTITY_KEY}\$" /tmp/temporary.* | ${WC} --lines ) &&
  ${JQ} -n --arg PRE_MAIN=${PRE_MAIN} --arg PRE_IDENTITY=${PRE_IDENTITY} --arg POST_MAIN=${POST_MAIN} --arg POST_IDENTITY=${POST_MAIN} | ${YQ} --yaml-output >> /build/observed/temporary/counts.yaml