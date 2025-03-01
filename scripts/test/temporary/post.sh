RESOURCE=${d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3} &&
${ECHO} BEGIN POST >> /build/debug &&
${ECHO} A >> /build/debug &&
  DO=$( ${POST} ${RESOURCE} ) &&
${ECHO} B >> /build/debug &&
  exec 200> /build/lock &&
  ${FLOCK} 200 &&
${ECHO} C >> /build/debug &&
  if [ -f /build/count ]
  then
    INDEX=$( ${CAT} /build/count )
  else
    INDEX=0
  fi &&
${ECHO} D >> /build/debug &&
  if [ -f /build/observed.yaml ]
  then
    if [ ! -z "$( ${DIFF} /build/observed.yaml ${DO} )" ]
    then
      ${YQ} --yaml-output "." ${DO} > /build/observed-${INDEX}.yaml
    fi
  else
    ${YQ} --yaml-output "." ${DO} > /build/observed.yaml
  fi &&
${ECHO} E >> /build/debug &&
  ${ECHO} $(( ${INDEX} + 1 )) > /build/count &&
${ECHO} F >> /build/debug &&
  ${RM} /build/lock &&
${ECHO} G >> /build/debug

