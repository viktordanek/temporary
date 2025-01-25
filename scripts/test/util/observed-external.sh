${MKDIR} /build/observed &&
  ${MKDIR} /build/observed/temporary &&
  ${FIND} /build/*.tmp -mindepth 1 -maxdepth 1 -type f -name temporary -exec ${GREP} ^temporary/ {} \; | ${WC} --lines > /build/observed/temporary/count.pre 2> /dev/null &&
  ${BASH} -c "${OBSERVED_INTERNAL} &&$ ${FIND} /build/*.tmp -mindepth 1 -maxdepth 1 -type f -name temporary -exec ${GREP} ^temporary/ {} \; | ${WC} --lines > /build/observed/temporary/count.mid" &&
  ${SLEEP} 10s &&
  ${FIND} /build/*.tmp -mindepth 1 -maxdepth 1 -type f -name temporary -exec ${GREP} ^temporary/ {} \; | ${WC} --lines > /build/observed/temporary/count.post 2> /dev/null
