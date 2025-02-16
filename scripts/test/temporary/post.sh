echo 2 >> /build/debug &&
RESOURCE=${cdfc0de101cd8fd31bcab9034c2c75f4659a7cdf73b66387e85a2cfee4d2da8a3b6ba01b3c17863b15d2a0d57cca5d719fada73ad63eea19a00c93c6464142c3} &&
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
echo 7 >> /build/debug &&
  DO=$( ${OBSERVED} ${RESOURCE} ) &&
echo 8 >> /build/debug &&
  UUID=$( ${CAT} ${DO} | ${SHA512} | ${CUT} --bytes -128 ) &&
echo 9 >> /build/debug &&
  exec 200> /build/observed/alpha/${UUID}/lock &&
  ${FLOCK} 200 &&
echo 10 >> /build/debug &&
  INDEX=$( ${FIND} /build/observed/alpha/${UUID} -mindepth 1 -maxdepth 1 -name "*-*" | ${WC} --lines ) &&
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

