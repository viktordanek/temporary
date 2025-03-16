${INNER} &&
  ${SLEEP} ${TIMEOUT} &&
  exec 203> /post/.lock &&
  ${FLOCK} 203 &&
  ${FIND} /temporary -mindepth 1 -maxdepth 1 | ${WC} --lines > /post/leaks &&
  ${RM} /post/.lock