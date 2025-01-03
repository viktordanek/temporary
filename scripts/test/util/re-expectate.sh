${GIT} rm -rf expected &&
  ${TOUCH} expected/.gitignore &&
  ${CP} --recursive ${OBSERVED} expected &&
  ${GIT} add expected