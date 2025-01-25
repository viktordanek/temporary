if [ -e expected ]
then
  ${GIT} rm -rf expected
fi &&
  ${CP} --recursive ${OBSERVED} expected &&
  ${GIT} add expected