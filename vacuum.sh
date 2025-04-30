INDEX=$( ${FIND} /archive -mindepth 1 -maxdepth 1 -type d | ${WC} --lines ) &&
  if [ -e /archive/${INDEX} ]
  then
    ${ECHO} We assumed that /archive/${INDEX} did not exist >&2 &&
      exit 64
  fi &&
  ${CP} --recursive /resource /archive/${INDEX} &&
  if [ -f /archive/${INDEX}/teardown.sh ]
  then
    ${SED} -i -e "s#^export ORIGINATOR_PID='.*'\$#export ORIGINATOR_PID='\${ORIGINATOR_PID}'#" -e "s#^export RESOURCE_NAME='.*'\$#export RESOURCE_NAME='\${RESOURCE_NAME}'#" -e "s#^export RESOURCES='.*'#export RESOURCES='\${RESOURCES}'#" -e "s#^exec .*  .*\$#exec \${SCRIPT} \${@}#" /archive/${INDEX}/teardown.sh
  fi &&
  if [ ${INDEX} != 0 ] && [ -z $( ${DIFF} /archive/0 /archive/${INDEX} ) ]
  then
    ${RM} --recursive --force /archive/${INDEX}
  fi