TARGET=${e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d} &&
  ${ECHO} TEMPORARY=$( ${CAT} ${@}/temporary ) > ${TARGET} &&
  if [ -f ${@}/init.arguments ]
  then
    ${ECHO} INIT_ARGUMENTS=$( ${CAT} ${@}/init.arguments ) >> ${TARGET}
  fi &&
  if [ -f ${@}/init.standard-input ]
  then
    ${ECHO} INIT_STANDARD_INPUT=$( ${CAT} ${@}/init.standard-input ) >> ${TARGET}
  fi &&
  if [ -l ${@}/init.sh ]
  then
    ${ECHO} INIT_SH=$( ${READLINK} --canonicalize ${@}/init.sh ) >> ${TARGET} &&
      ${ECHO} INIT_STANDARD_OUTPUT=$( ${CAT} ${@}/init.standard-output ) >> ${TARGET} &&
      ${ECHO} INIT_STANDARD_ERROR=$( ${CAT} ${@}/init.standard-error ) >> ${TARGET} &&
      ${ECHO} INIT_STATUS=$( ${CAT} ${@}/init.status ) >> ${TARGET}
  fi &&
  if [ -l ${@}/release.sh ]
  then
    ${ECHO} RELEASE_SH=$( ${READLINK} --canonicalize ${@}/RELEASE.sh ) >> ${TARGET} &&
      ${ECHO} RELEASE_STANDARD_OUTPUT=$( ${CAT} ${@}/init.standard-output ) >> ${TARGET} &&
      ${ECHO} RELEASE_STANDARD_ERROR=$( ${CAT} ${@}/init.standard-error ) >> ${TARGET} &&
      ${ECHO} RELEASE_STATUS=$( ${CAT} ${@}/init.status ) >> ${TARGET}
  fi &&
  if [ -l ${@}/init.sh ]
  then
    ${ECHO} POST_SH=$( ${READLINK} --canonicalize ${@}/post.sh ) >> ${TARGET}
  fi &&
  ${ECHO} TEARDOWN_ASYNCH=$( ${READLINK} --canonicalize ${@}/teardown-asynch.sh ) >> ${TARGET} &&
  ${ECHO} TEARDOWN_SYNCH=$( ${READLINK} --canonicalize ${@}/teardown-synch.sh ) >> ${TARGET} &&
  ${CAT} ${@}/target >> ${TARGET} &&
  ${CHMOD} 0400 ${TARGET}
