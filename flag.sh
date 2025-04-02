${TOUCH} /target &&
  ${FIND} /resource /target -type f | ${SORT} | while read FILE
  do
    ${ECHO} ${FILE} &&
      ${CAT} ${FILE} &&
      ${ECHO}
  done &&
  if [ ! -z "${UUID}" ]
  then
    ${ECHO} ${UUID} > /mount/target
  fi