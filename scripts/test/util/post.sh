TARGET=${e38a081823542c636b63a4aa3438db18fcf513e988ea7640503208f0d94252ff57a51ed0c931c4448d4b3396bfee7ce89e5c317d223e8bfd2ee4123eaf4ad1c6} &&
  ${FIND} ${1} -mindepth 1 -maxdepth 1 | ${SORT} | while read FILE
  do
    BASE=$( ${BASENAME} ${FILE} ) &&
        if [ -L ${FILE} ]
        then
          ${ECHO} "- name: ${BASE}" >> ${TARGET} &&
            ${ECHO} "  type: link" >> ${TARGET}
        elif [ -f ${FILE} ]
        then
          ${ECHO} "- contents:" >> ${TARGET} &&
            ${SED} -e "s#^#    #" ${FILE} >> ${TARGET} &&
            ${ECHO} "  name: ${BASE}" >> ${TARGET} &&
            ${ECHO} "  type: file" >> ${TARGET}
        else
          ${ECHO} "  type:  other" >> ${TARGET}
        fi
    done
