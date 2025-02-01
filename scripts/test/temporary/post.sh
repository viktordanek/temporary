RESOURCE=${ae5a1299ab2a1c89f07bf9a6ef750fa4a518754d174f230493d4351f2e43d060b69c2079e75f60e62d24e178552a074c42a0ca449fcddf9716a3a95d44426299} &&
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
  DE=$( ${EXPECTED} ${INDEX} ) &&
  DO=$( ${OBSERVED} ${RESOURCE} ) &&
  exec 200> /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY}/lock &&
  ${FLOCK} 200 &&
  INDEX=$( ${FIND} /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY} -mindepth 1 -maxdepth 1 -name "observed*" | ${WC} --lines ) &&
  if [ ! -z "$( ${DIFF} ${DE} ${DO} )" ]
  then
    ${YQ} --yaml-output ${DE} > /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY}/expected-${INDEX}.yaml
  fi &&
  if [ -f /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY}/observed.yaml ]
  then
    if [ ! -z "$( ${DIFF} /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY}/observed ${DO} )" ]
    then
      ${YQ} --yaml-output ${DO} > /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY}/observed-${INDEX}.yaml
    fi
  else
    ${YQ} --yaml-output "." ${DO} > /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY}/observed.yaml
  fi &&
  ${RM} /build/observed/temporary/measurements/${TEMPORARY_PATH_ARRAY}/lock

