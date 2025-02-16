TARGET=${d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e} &&
  if ${HAS_STANDARD_ERROR} != "0"
  then
    ${ECHO} ${STANDARD_ERROR} >&2 &&
  fi &&
  ${JQ} -n -f ${ self + "/scripts/test/temporary/init.json" } | ${YQ} --yaml-output "init:."> ${TARGET} &&
  ${ECHO} ${STANDARD_OUTPUT} &&
  exit ${STATUS}