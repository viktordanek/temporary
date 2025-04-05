${MKDIR} /build/vacuum &&
  ${FIND} /resource | while read FILE
    do
      KEY=${FILE#/build} &&
        HASH=$( ${ECHO} ${KEY} | ${SHA512SUM} | ${CUT} --bytes -128 ) &&
        INDEX=$( ${FIND} /build/vacuum -mindepth 2 -maxdepth 2 -type f -name ${HASH}.key | ${WC} --lines ) &&
        ${MKDIR} /build/vacuum/${INDEX} &&
        ${ECHO} ${KEY} > /build/vacuum/${INDEX}/${HASH}.key &&
        ${STAT} --format "%a" ${FILE} > /build/vacuum/${INDEX}/${HASH}.stat &&
        ${CHMOD} 0777 /build/vacuum/${INDEX}/${HASH}.key /build/vacuum/${INDEX}/${HASH}.stat &&
        if [ -f ${FILE} ]
        then
          ${CAT} ${FILE} > /build/vacuum/${INDEX}/${HASH}.stat &&
            ${CHMOD} 0777 /build/vacuum/${INDEX}/${HASH}.stat
        fi
    done &&
    ${RM} /build/vacuum.flag