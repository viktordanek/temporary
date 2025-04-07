${MKDIR} /build/archive &&
  ${FIND} /resource | while read FILE
    do
      KEY=${FILE#/build} &&
        HASH=$( ${ECHO} ${KEY} | ${SHA512SUM} | ${CUT} --bytes -128 ) &&
        INDEX=$( ${FIND} /build/archive -mindepth 2 -maxdepth 2 -type f -name ${HASH}.key | ${WC} --lines ) &&
        ${MKDIR} /build/archive/${INDEX} &&
        ${ECHO} ${KEY} > /build/archive/${INDEX}/${HASH}.key &&
        ${STAT} --format "%a" ${FILE} > /build/archive/${INDEX}/${HASH}.stat &&
        ${CHMOD} 0777 /build/archive/${INDEX}/${HASH}.key /build/archive/${INDEX}/${HASH}.stat &&
        if [ -f ${FILE} ]
        then
          ${CAT} ${FILE} > /build/archive/${INDEX}/${HASH}.stat &&
            ${CHMOD} 0777 /build/archive/${INDEX}/${HASH}.stat
        fi
    done &&
    ${RM} /build/archive.flag