RESOURCE=${ae5a1299ab2a1c89f07bf9a6ef750fa4a518754d174f230493d4351f2e43d060b69c2079e75f60e62d24e178552a074c42a0ca449fcddf9716a3a95d44426299} &&
  TEMPORARY_PATH_ARRAY=${bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b} &&
  if [ ! -d /build/observed ]
  then
    ${MKDIR} /build/observed
  fi &&
  if [ ! -d /build/observed/temporary ]
  then
    ${MKDIR} /build/observed/temporary
  fi &&
  ${TOUCH} /build/observed/temporary/FLAG &&
  ${SED} -e "s#^#INIT_#" ${RESOURCE}/init.standard-ouput > /build/observed/temporary/observed &&
  ${SED} -e "s#^#INIT_#" ${RESOURCE}/init.standard-error > /build/observed/temporary/observed

