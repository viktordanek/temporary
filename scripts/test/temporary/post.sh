RESOURCE=${d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3} &&
  ${ECHO} ${STANDARD_OUT} &&
  ${ECHO} ${STANDARD_ERROR} >&2 &&
  if [ ! -d /build/observed ]
  then
    ${MKDIR} /build/observed
  fi &&
  if [ ! -d /build/observed/alpha ]
  then
    ${MKDIR} /build/observed/alpha
  fi &&
  DO=$( ${POST} ${RESOURCE} ) &&
  UUID=$( ${CAT} ${DO} | ${SHA512SUM} | ${CUT} --bytes -128 ) &&
  exec 200> /build/observed/alpha/${UUID}.lock &&
  ${FLOCK} 200 &&
  if [ ! -d /build/observed/alpha/${UUID} ]
  then
    ${MKDIR} /build/observed/alpha/${UUID}
  fi &&
  INDEX=$( ${FIND} /build/observed/alpha/${UUID} -mindepth 1 -maxdepth 1 -name "observed*.yaml" | ${WC} --lines ) &&
  if [ -f /build/observed/alpha/${UUID}/observed.yaml ]
  then
    if [ ! -z "$( ${DIFF} /build/observed/alpha/${UUID}/observed.yaml ${DO} )" ]
    then
      ${YQ} --yaml-output "." ${DO} > /build/observed/alpha/${UUID}/observed-${INDEX}.yaml
    fi
  else
    ${YQ} --yaml-output "." ${DO} > /build/observed/alpha/${UUID}/observed.yaml
  fi &&
  ${ECHO} ${INDEX} > /build/observed/alpha/${UUID}/count &&
  ${RM} /build/observed/alpha/${UUID}.lock &&
  exit ${STATUS}

