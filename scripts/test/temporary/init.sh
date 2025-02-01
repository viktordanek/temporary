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
  # 1 TEMPORARY VS CACHE
  # 2 STANDARD INPUT:  NONE VERSUS PIPE VERSUS CAT
  # 3 STANDARD ARGUMENTS: NO VERSUS YES
  # 4 INSTANCE: ALPHA VERSSUS BETA
  TOKEN_FILE=$( ${IDENTITY} ${TOKEN_STANDARD_INPUT} ) &&
  TOKEN_1111=$( ${TOKEN_1} ) &&
  TOKEN_1112=$( ${TOKEN_1} ) &&
  TOKEN_1121=$( ${TOKEN_1} ${TOKEN_ARGUMENTS} ) &&
  TOKEN_1122=$( ${TOKEN_1} ${TOKEN_ARGUMENTS} ) &&
  TOKEN_1211=$( ${ECHO} ${TOKEN_STANDARD_INPUT} | ${TOKEN_1} ) &&
  TOKEN_1212=$( ${ECHO} ${TOKEN_STANDARD_INPUT} | ${TOKEN_1} ) &&
  TOKEN_1221=$( ${ECHO} ${TOKEN_STANDARD_INPUT} | ${TOKEN_1} ${TOKEN_ARGUMENTS} ) &&
  TOKEN_1222=$( ${ECHO} ${TOKEN_STANDARD_INPUT} | ${TOKEN_1} ${TOKEN_ARGUMENTS} ) &&
  ${ECHO} "      measurements:" >> ${TARGET} &&
  ${ECHO} "        -" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1111} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1112} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1121} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1122} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1211} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1212} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1221} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1222} )" >> ${TARGET} &&
  ${ECHO} -n ${TOKEN_PASTE_1} >> ${TOKEN_1111} &&
  ${ECHO} -n ${TOKEN_PASTE_1} >> ${TOKEN_1121} &&
  ${ECHO} -n ${TOKEN_PASTE_1} >> ${TOKEN_1211} &&
  ${ECHO} -n ${TOKEN_PASTE_1} >> ${TOKEN_1221} &&
  ${ECHO} "        -" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1111} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1112} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1121} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1122} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1211} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1212} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1221} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1222} )" >> ${TARGET} &&
  ${ECHO} -n ${TOKEN_PASTE_2} >> ${TOKEN_1122} &&
  ${ECHO} -n ${TOKEN_PASTE_2} >> ${TOKEN_1212} &&
  ${ECHO} -n ${TOKEN_PASTE_2} >> ${TOKEN_1222} &&
  ${ECHO} "        -" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1111} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1112} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1121} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1122} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1211} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1212} )" >> ${TARGET} &&
  ${ECHO} "          -" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1221} )" >> ${TARGET} &&
  ${ECHO} "            - $( ${CAT} ${TOKEN_1222} )" >> ${TARGET} &&
  ${ECHO} ${STANDARD_ERROR} >&2 &&
  exit ${STATUS}