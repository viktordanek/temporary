RESOURCE=${c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306} &&
  TARGET=${d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e} &&
  if ${HAS_STANDARD_ERROR} != "0"
  then
    ${ECHO} ${STANDARD_ERROR} >&2 &&
  fi &&
  ${JQ} -n -f ${ self + "/scripts/test/temporary/init.json" } | ${YQ} --yaml-output "init:."> ${TARGET} &&
  ${ECHO} ${STANDARD_OUTPUT} &&
  exit ${STATUS}