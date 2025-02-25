${ECHO} A >&2 &&
export IS_FILE=${cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809} &&
${ECHO} B >&2 &&
  export IS_PIPE=${bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579} &&
${ECHO} C >&2 &&
  RESOURCE=${c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306} &&
${ECHO} D >&2 &&
  export STANDARD_INPUT=${d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64} &&
${ECHO} E >&2 &&
  TARGET=${d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e} &&
${ECHO} F >&2 &&
  export PID=$( ${FIND} ${RESOURCE} -name "*.pid" -exec ${CAT} {} \; -quit ) &&
${ECHO} G >&2 &&
  if ${HAS_STANDARD_ERROR}
  then
${ECHO} H >&2 &&
    ${ECHO} ${STANDARD_ERROR} >&2
  fi &&
${ECHO} I >&2 &&
  ${ECHO} "${JQ} -n -f ${TEMPLATE_FILE} | ${YQ} --yaml-output \"{init:.}\" > ${TARGET}" &&
${ECHO} J >&2 &&
  # ${JQ} -n -f ${TEMPLATE_FILE} | ${YQ} --yaml-output "{init:.}" > ${TARGET} &&
${ECHO} K ${TEMPLATE_FILE} ${TARGET} &&
  ${JQ} -n -f ${TEMPLATE_FILE} > ${TARGET} &&
${ECHO} L >&2 &&
  ${ECHO} ${STANDARD_OUTPUT} &&
${ECHO} M >&2 &&
  exit ${STATUS}