NAME=${bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b} &&
  if [ ! -d /build/observed ]
  then
    ${MKDIR} /build/observed
  fi &&
  if [ ! -d /build/observed/temporary ]
  then
    ${MKDIR} /build/observed/temporary
  fi &&
  if [ ! -d /build/observed/temporary/${NAME} ]
  then
    ${MKDIR} /build/observed/temporary/${NAME}
  fi &&
  exec 200>/build/observed/temporary/${NAME}/lock.post
  ${FLOCK} 200 &&
  if [ -f /build/observed/temporary/${NAME}/observed ]
  then
    INDEX=$( ${FIND} /build/observed/temporary/${NAME} -mindepth 1 -maxdepth 1 -type f -name observed.* | ${WC} --lines ) &&
      ${DIFF} /build/observed/temporary/${NAME}/observed $( ${OBSERVED} ) >
  fi &&
  ${RM} /build/observed/temporary/${NAME}/lock.post
