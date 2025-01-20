${GREP} "^temporary/" /build/*.tmp/temporary" | ${WC} --lines > /build/observed/count.pre &&
  ${BASH} -c ${OBSERVATE} &&
  ${SLEEP} 10s &&
  ${GREP} "^temporary/" /build/*.tmp/temporary" | ${WC} --lines > /build/observed/count.post