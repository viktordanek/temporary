${ECHO} BEGIN POST > /build/debug &&
RESOURCE=${d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3} &&
  DO=$( ${POST} ${RESOURCE} ) &&
  exec 200> /build/lock &&
  ${FLOCK} 200 &&
  if [ -f /build/count ]
  then
    INDEX=$( ${CAT} /build/count )
  else
    INDEX=0
  fi &&
  if [ -f /build/observed.yaml ]
  then
    if [ ! -z "$( ${DIFF} /build/observed.yaml ${DO} )" ]
    then
      ${YQ} --yaml-output "." ${DO} > /build/observed-${INDEX}.yaml
    fi
  else
    ${YQ} --yaml-output "." ${DO} > /build/observed.yaml
  fi &&
  ${ECHO} $(( ${INDEX} + 1 )) > /build/count &&
  ${RM} /build/lock &&
  exit ${STATUS}

