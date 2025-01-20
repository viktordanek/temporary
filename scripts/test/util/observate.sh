${GREP} "^temporary/" /build/*.tmp/temporary" | ${WC} --lines > /build/observed/count.pre &&
  ${BASH} -c "./observate-temporary && ${GREP} "^temporary/" /build/*.tmp/temporary" | ${WC} --lines > /build/observed/count.mid" &&
  ${SLEEP} 10s &&
  ${GREP} "^temporary/" /build/*.tmp/temporary" | ${WC} --lines > /build/observed/count.post