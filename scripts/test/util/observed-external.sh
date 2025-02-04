${MKDIR} /build/observed &&
  ${MKDIR} /build/observed/temporary &&
  ${MKDIR} /build/observed/temporary/counts &&
  ${FIND} /build -mindepth 2 -maxdepth 2 -type f -name temporary -exec ${GREP} ^temporary/ {} \; | ${WC} --lines > /build/observed/temporary/counts/pre &&
  ${BASH} -c ${OBSERVED_INTERNAL} &&
  ${SLEEP} 10s &&
  ${FIND} /build -mindepth 2 -maxdepth 2 -type f -name temporary -exec ${GREP} ^temporary/ {} \; | ${WC} --lines > /build/observed/temporary/counts/post
