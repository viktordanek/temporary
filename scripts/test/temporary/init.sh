TARGET=${e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d} &&
  NAME=${bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b} &&
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
  ${ECHO} "  name: ${NAME}" >> ${TARGET} &&
  ${ECHO} "  has_standard_input: ${HAS_STANDARD_INPUT}" >> ${TARGET} &&
  ${ECHO} "  standard_input: ${STANDARD_INPUT}" >> ${TARGET} &&
  ${ECHO} "  arguments: ${@}" >> ${TARGET} &&
  ${ECHO} "  typeof: ${TYPEOF}" >> ${TARGET} &&
  ${ECHO} "  standard_output: ${STANDARD_OUTPUT}" >> ${TARGET} &&
  ${ECHO} "  standard_error: ${STANDARD_ERROR}" >> ${TARGET} &&
  ${ECHO} "  status: ${STATUS}" >> ${TARGET} &&
  ${ECHO} "  speed: ${SPEED}" >> ${TARGET} &&
  ${ECHO} "  tokens:" >> ${TARGET} &&
  ${ECHO} "    temporary:" >> ${TARGET} &&
  ${ECHO} "      arguments: ${TOKEN_ARGUMENTS}" >> ${TARGET} &&
  ${ECHO} "      standard_input: ${TOKEN_STANDARD_INPUT}" >> ${TARGET} &&
  ${ECHO} "      pastes:" >> ${TARGET} &&
  ${ECHO} "      - ${TOKEN_PASTE_1}" >> ${TARGET} &&
  ${ECHO} "      - ${TOKEN_PASTE_2}" >> ${TARGET} &&
  TOKEN_111=$( ${TOKEN_1} ) &&
  TOKEN_112=$( ${TOKEN_1} ) &&
  TOKEN_121=$( ${TOKEN_1} ) &&
  TOKEN_122=$( ${TOKEN_1} ) &&
  TOKEN_131=$( ${TOKEN_1} ) &&
  TOKEN_132=$( ${TOKEN_1} ) &&
  TOKEN_141=$( ${TOKEN_1} ) &&
  TOKEN_142=$( ${TOKEN_1} ) &&
  ${ECHO} "      measurements:" >> ${TARGET} &&
  ${ECHO} "        -" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_111} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_112} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_121} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_122} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_131} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_132} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_141} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_142} )" >> ${TARGET} &&
  ${ECHO} -n ${TOKEN_PASTE_1} >> ${TOKEN_111} &&
  ${ECHO} -n ${TOKEN_PASTE_1} >> ${TOKEN_121} &&
  ${ECHO} -n ${TOKEN_PASTE_1} >> ${TOKEN_131} &&
  ${ECHO} -n ${TOKEN_PASTE_1} >> ${TOKEN_141} &&
  ${ECHO} "        -" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_111} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_112} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_121} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_122} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_131} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_132} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_141} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_142} )" >> ${TARGET} &&
  ${ECHO} -n ${TOKEN_PASTE_2} >> ${TOKEN_112} &&
  ${ECHO} -n ${TOKEN_PASTE_2} >> ${TOKEN_122} &&
  ${ECHO} -n ${TOKEN_PASTE_2} >> ${TOKEN_132} &&
  ${ECHO} -n ${TOKEN_PASTE_2} >> ${TOKEN_142} &&
  ${ECHO} "        -" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_111} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_112} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_121} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_122} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_131} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_132} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_141} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_142} )" >> ${TARGET} &&
  ${ECHO} ${STANDARD_ERROR} >&2 &&
  exit ${STATUS}