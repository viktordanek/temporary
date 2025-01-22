if [ ${2} == true ]
then
  COMMAND="${1} ${3}"
else
  COMMAND="${1}"
fi &&
  if [ ${4} == true ]