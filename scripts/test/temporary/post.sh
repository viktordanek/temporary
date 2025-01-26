TARGET=${e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d} &&
  TEMPORARY_PATH_ARRAY=${bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b} &&
  IFS="/" read - ra TEMPORARY_PATH <<< ${TEMPORARY_PATH_ARRAY} &&
  if [ ! -d /build/observed ]
  then
    ${MKDIR} /build/observed
  fi &&
  if [ ! -d /build/observed/temporary ]
  then
    ${MKDIR} /build/observed/temporary
  fi &&
  ${MKDIR} --parents /build/observed/temporary/${TEMPORARY_PATH_ARRAY}
  exec 200>/build/observed/temporary/${TEMPORARY_PATH_ARRAY}/lock.post
  ${FLOCK} 200 &&
  if [ -f /build/observed/temporary/${TEMPORARY_PATH_ARRAY}/observed ]
  then
    INDEX=$( ${FIND} /build/observed/temporary/${TEMPORARY_PATH_ARRAY} -mindepth 1 -maxdepth 1 -type f -name observed.* | ${WC} --lines )
  else
    ${MV} $( ${OBSERVED} ${TARGET} ) /build/observed/temporary/${TEMPORARY_PATH_ARRAY}/observed
  fi &&
  ${RM} /build/observed/temporary/${TEMPORARY_PATH_ARRAY}/lock.post
