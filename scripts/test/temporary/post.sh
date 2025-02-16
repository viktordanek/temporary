RESOURCE=${cdfc0de101cd8fd31bcab9034c2c75f4659a7cdf73b66387e85a2cfee4d2da8a3b6ba01b3c17863b15d2a0d57cca5d719fada73ad63eea19a00c93c6464142c3} &&
  ${ECHO} ${STANDARD_OUT} &&
  ${ECHO} ${STANDARD_ERROR} >&2 &&
  if [ ! -d /build/observed/alpha ]
  then
    ${MKDIR} /build/observed/alpha
  fi &&
  DO=$( ${OBSERVED} ${RESOURCE} ) &&
  UUID=$( ${CAT} ${DO} | ${SHA512} | ${CUT} --bytes -128 ) &&
  exec 200> /build/observed/alpha/${UUID}/lock &&
  ${FLOCK} 200 &&
  INDEX=$( ${FIND} /build/observed/alpha/${UUID} -mindepth 1 -maxdepth 1 -name "*-*" | ${WC} --lines ) &&
  if [ ! -d /build/observed/alpha/${UUID} ]
  then
    ${MKDIR} /build/observed/alpha/${UUID}
  fi &&
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
  ${RM} /build/observed/alpha/${UUID}/lock &&
  exit ${STATUS}

