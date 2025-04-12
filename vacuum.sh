${FIND} /resource | ${SORT} | while read FILE
  do
    KEY=${FILE#/resource} &&
      HASH=$( ${ECHO} ${KEY} | ${SHA512SUM} | ${CUT} --bytes -128 ) &&
      INDEX=$( ${FIND} /archive -mindepth 2 -maxdepth 2 -type f -name ${HASH}.key | ${WC} --lines ) &&
      ${MKDIR} --parents /archive/${INDEX} &&
      ${ECHO} ${KEY} > /archive/${INDEX}/${HASH}.key &&
      ${STAT} --format "%a" ${FILE} > /archive/${INDEX}/${HASH}.stat &&
      ${CHMOD} 0777 /archive/${INDEX}/${HASH}.key /archive/${INDEX}/${HASH}.stat &&
      if [ -f ${FILE} ]
      then
        ${CAT} ${FILE} > /archive/${INDEX}/${HASH}.stat &&
          ${CHMOD} 0777 /archive/${INDEX}/${HASH}.stat
      fi
  done