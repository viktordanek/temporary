if ${TOUCH} /target > /dev/null 2>&1
then
  ${ECHO} did touch /target
else
  ${ECHO} did not touch /target
fi &&
  ${FIND} /resource /target -type f | ${SORT} | while read FILE
  do
    ${ECHO} ${FILE} &&
      ${CAT} ${FILE} &&
      ${ECHO}
  done &&
  if [ ${NAME} == "init" ]
  then
    if ${ECHO} ${UUID} > /mount/target
    then
      ${ECHO} did touch /mount/target
    else
      ${ECHO} did not touch /mount/target
    fi
  fi &&
  if [ ${@} == fd4107d952c0d02f4ea2e8963d673543791619d2ff0178d03222ea551c539c235a516d9f6dbb2c852618c634ead3ebc72d6beff6ee08880d422e10341390a94c ]
  then
    exit 19
  fi