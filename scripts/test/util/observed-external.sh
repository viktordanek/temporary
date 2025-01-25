${MKDIR} /build/observed &&
  ${MKDIR} /build/observed/temporary &&
  ${FIND} /build -mindepth 2 -maxdepth 2 -type f -name temporary -exec ${GREP} ^temporary/ {} \; | ${WC} --lines > /build/observed/temporary/count.pre &&
  ${BASH} -c "${OBSERVED_INTERNAL} &&$ ${FIND} /build -mindepth 2 -maxdepth 2 -type f -name temporary -exec ${GREP} ^temporary/ {} \; | ${WC} --lines > /build/observed/temporary/count.mid" &&
  ${SLEEP} 10s &&
  ${FIND} /build -mindepth 2 -maxdepth 2 -type f -name temporary -exec ${GREP} ^temporary/ {} \; | ${WC} --lines > /build/observed/temporary/count.post
