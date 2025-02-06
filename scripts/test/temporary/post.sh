RESOURCE=${f9f95f80b51f23cdd35e578c51c3a38054691c35f97ae77ef02dbb012c9f2edda745015cd3888a696e92dd8db698e8647c88bcb7fd4b4c738af6dd23298e237f} &&
  TEMPORARY_PATH_ARRAY=${bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b} &&
  if [ ! -d /build/observed/temporary/measurements ]
  then
    ${MKDIR} /build/observed/temporary/measurements
  fi &&
  ${MKDIR} --parents /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY} &&
  if [ -L ${RESOURCE}/init.sh ]
  then
    HAS_INIT=true
  else
    HAS_INIT=false
  fi &&
  DO=$( ${OBSERVED} ${RESOURCE} ) &&
  exec 200> /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY}/lock &&
  ${FLOCK} 200 &&
  INDEX=$( ${FIND} /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY} -mindepth 1 -maxdepth 1 -name "*-*" | ${WC} --lines ) &&
  if [ -f /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY}/observed.yaml ]
  then
    if [ ! -z "$( ${DIFF} /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY}/observed ${DO} )" ]
    then
      ${YQ} --yaml-output "." ${DO} > /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY}/observed-${INDEX}.yaml
    fi
  else
    ${YQ} --yaml-output "." ${DO} > /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY}/observed.yaml
  fi &&
  ${ECHO} ${INDEX} > /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY}/count &&
  ${RM} /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY}/lock

