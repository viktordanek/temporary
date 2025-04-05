${TOUCH} /build/${NAME} &&
if [ "${NAME}" == "init" ]
then
  ${MKDIR} /mount/target &&
    ${ECHO} ${UUID} > /mount/target/uuid
fi &&
  if ${TOUCH} /resource > /dev/null 2>&1
  then
    ${ECHO} did touch /resource
  fi &&
  if [ ${NAME} != "init" ] && ${TOUCH} /target > /dev/null 2>&1
  then
    ${ECHO} did touch /target
  fi &&
  ${FIND} /resource -type f | ${SORT} | while read FILE
  do
    ${ECHO} ${FILE} &&
      if [ ${FILE} != /resource/${NAME}.standard-output ] && [ ${FILE} != /resource/${NAME}.standard-error ]
      then
        ${CAT} ${FILE}
      fi &&
      ${ECHO}
  done &&
  if [ "${1}" == "fd4107d952c0d02f4ea2e8963d673543791619d2ff0178d03222ea551c539c235a516d9f6dbb2c852618c634ead3ebc72d6beff6ee08880d422e10341390a94c" ]
  then
    exit 19
  fi