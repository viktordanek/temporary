echo 2 >> /build/debug &&
RESOURCE=${d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3} &&
echo 3 >> /build/debug &&
  ${ECHO} ${STANDARD_OUT} &&
echo 4 >> /build/debug &&
  ${ECHO} ${STANDARD_ERROR} >&2 &&
echo 5 >> /build/debug &&
  if [ ! -d /build/observed ]
  then
    ${MKDIR} /build/observed
  fi &&
echo 6 >> /build/debug &&
  if [ ! -d /build/observed/alpha ]
  then
    ${MKDIR} /build/observed/alpha
  fi &&
echo "7  DO=\$( ${OBSERVED} ${RESOURCE} )" >> /build/debug &&
  DO=$( ${OBSERVED} ${RESOURCE} ) &&
echo "8" >> /build/debug &&
  UUID=$( ${CAT} ${DO} | ${SHA512SUM} | ${CUT} --bytes -128 ) &&
echo 9 >> /build/debug &&
  exec 200> /build/observed/alpha/${UUID}/lock &&
  ${FLOCK} 200 &&
echo 10 >> /build/debug &&
  INDEX=$( ${FIND} /build/observed/alpha/${UUID} -mindepth 1 -maxdepth 1 -name "observed*.yaml" | ${WC} --lines ) &&
echo 11 >> /build/debug &&
  if [ ! -d /build/observed/alpha/${UUID} ]
  then
    ${MKDIR} /build/observed/alpha/${UUID}
  fi &&
echo 12 >> /build/debug &&
  if [ -f /build/observed/alpha/${UUID}/observed.yaml ]
  then
    if [ ! -z "$( ${DIFF} /build/observed/alpha/${UUID}/observed.yaml ${DO} )" ]
    then
      ${YQ} --yaml-output "." ${DO} > /build/observed/alpha/${UUID}/observed-${INDEX}.yaml
    fi
  else
    ${YQ} --yaml-output "." ${DO} > /build/observed/alpha/${UUID}/observed.yaml
  fi &&
echo 13 >> /build/debug &&
  ${ECHO} ${INDEX} > /build/observed/alpha/${UUID}/count &&
echo 14 >> /build/debug &&
  ${RM} /build/observed/alpha/${UUID}/lock &&
echo 15 >> /build/debug &&
  exit ${STATUS}

