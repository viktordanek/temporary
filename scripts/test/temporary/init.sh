if ${STATUS} != "0"
then
  ${ECHO} ${STANDARD_ERROR} >&2 &&
fi &&
  ${JQ} -n -f ${ self + "/scripts/test/temporary/init.json" } | ${YQ} --yaml-output "init:."> ${TARGET} &&
  ${ECHO} ${STANDARD_OUTPUT} &&
  exit ${STATUS}