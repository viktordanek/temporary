RESOURCE=${b6cba2f07dd0c2816e7e54f828051b800f5cffa1a140c72b0bf080dde92612d29449b0807c1217113ad8f5e2c72ca14e215c9f9eb83fae2dc1118c3e40691052} &&
  TARGET=${f4feff7b45aaaec6851766ef42a9bb5d48952cc98ea24dd0be0f5787540b5d194e6989e9e46b2a74ebe3f28aaf93bc93afcae2d197bf29f75b4c718c60c9e5f3} &&
  if [ -t 0 ]
  then
    exec 0<&-
  fi &&
  if [ -t 0 ]
  then
    HAS_STANDARD_INPUT=false &&
      STANDARD_INPUT=
  elif [ -p /proc/self/fd/0 ]
  then
    HAS_STANDARD_INPUT=true
      STANDARD_INPUT=$( ${TEE} )
  elif [ -f /proc/self/fd/0 ]
  then
    HAS_STANDARD_INPUT-true
      STANDARD_INPUT=$( ${CAT} )
  else
    HAS_STANDARD_INPUT=false
      STANDARD_INPUT=
  fi &&
  ${ECHO} ${STANDARD_OUTPUT} &&
  ${ECHO} "init:" > ${TARGET} &&
  ${ECHO} "  uuid: ${UUID}" &&
  ${ECHO} "  seed: ${SEED}" &&
  ${ECHO} "  pids:" &&
  ${FIND} ${RESOURCE} -mindepth 1 -maxdepth 1 -type "f" -name "*.pid" | while read FILE
  do
    NAME=$( ${BASENAME} ${FILE} ) &&
      ${ECHO} ${NAME%.pid}
  done &&
  ${ECHO} "  has_standard_input: ${HAS_STANDARD_INPUT}" >> ${TARGET} &&
  ${ECHO} "  standard_input: ${STANDARD_INPUT}" >> ${TARGET} &&
  ${ECHO} "  arguments: ${@}" >> ${TARGET} &&
  ${ECHO} ${STANDARD_ERROR} >&2 &&
  exit ${STATUS}