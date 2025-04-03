${TOUCH} /target &&
  ${FIND} /resource /target -type f | ${SORT} | while read FILE
  do
    ${ECHO} ${FILE} &&
      ${CAT} ${FILE} &&
      ${ECHO}
  done &&
  if [ ${NAME} == "init" ]
  then
    ${ECHO} ${UUID} > /mount/target
  fi