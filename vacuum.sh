INDEX=$( ${FIND} /archive -mindepth 1 -maxdepth 1 -type d | ${WC} --lines ) &&
  if [ -e /archive/${INDEX} ]
  then
    ${ECHO} We assumed that /archive/${INDEX} did not exist >&2 &&
      exit 64
  fi &&
  # ${CP} --recursive /resource /archive/${INDEX} &&
  # ${SED} -i "s#^export ORIGINATOR_PID='.*'\$#export ORIGINATOR_PID='\${ORIGINATOR_PID}'#" /archive/${INDEX}/cat
  true