${MKDIR} /build/observed &&
  ${MKDIR} /build/observed/temporary &&
  ${GREP} "^temporary/" /build/*.tmp/temporary" | ${WC} --lines > /build/observed/temporary/count.pre &&
  ${BASH} -c "./observate-temporary && ${GREP} "^temporary/" /build/*.tmp/temporary" | ${WC} --lines > /build/observed/temporary/count.mid" &&
  ${SLEEP} 10s &&
  ${GREP} "^temporary/" /build/*.tmp/temporary" | ${WC} --lines > /build/observed/temporary/count.post