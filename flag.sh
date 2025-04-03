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
  fi