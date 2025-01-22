if [ ${2} == true ]
then
  COMMAND="${1} ${3}"
else
  COMMAND="${1}"
fi &&
  if [ ${4} == true ]
  then
    STANDARD_INPUT="${ECHO} ${5} | ${COMMAND}"
  else
    STANDARD_INPUT="${COMMAND}"
  fi &&
  if [ ${6} == true ]
  then
    ${ECHO} ${7} | $( ${COMMAND} )
  else
    ! ${COMMAND}
  fi