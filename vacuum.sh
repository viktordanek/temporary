${ECHO} vacuum A >> /archive/DEBUG &&
${FIND} /resource | ${SORT} | while read FILE
  do
${ECHO} vacuum B >> /archive/DEBUG &&
    KEY=${FILE#/resource} &&
${ECHO} vacuum C >> /archive/DEBUG &&
      HASH=$( ${ECHO} ${KEY} | ${SHA512SUM} | ${CUT} --bytes -128 ) &&
${ECHO} vacuum C >> /archive/DEBUG &&
      INDEX=$( ${FIND} /archive -mindepth 2 -maxdepth 2 -type f -name ${HASH}.key | ${WC} --lines ) &&
${ECHO} vacuum D >> /archive/DEBUG &&
      ${MKDIR} --parents /archive/${INDEX} &&
${ECHO} vacuum E >> /archive/DEBUG &&
      ${ECHO} ${KEY} > /archive/${INDEX}/${HASH}.key &&
${ECHO} vacuum F >> /archive/DEBUG &&
      ${STAT} --format "%a" ${FILE} > /archive/${INDEX}/${HASH}.stat &&
${ECHO} vacuum G >> /archive/DEBUG &&
      ${CHMOD} 0777 /archive/${INDEX}/${HASH}.key /archive/${INDEX}/${HASH}.stat &&
${ECHO} vacuum H >> /archive/DEBUG &&
      if [ -f ${FILE} ]
      then
${ECHO} vacuum I>> /archive/DEBUG &&
        ${CAT} ${FILE} > /archive/${INDEX}/${HASH}.stat &&
${ECHO} vacuum J >> /archive/DEBUG &&
          ${CHMOD} 0777 /archive/${INDEX}/${HASH}.stat
      fi
  done