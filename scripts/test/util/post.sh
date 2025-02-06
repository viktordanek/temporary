${ECHO} util/post A >> /build/debug &&
TARGET=${a1bf1278edcdadde99ea528e6f7fb99c069e840bb2bc10f5e54326df380677e399d911352ba22cce94ad7817efae178bc5844b74b874d1ded5bca309f55d78a7} &&
${ECHO} util/post B >> /build/debug &&
  ${FIND} ${1} -mindepth 1 -maxdepth 1 | ${SORT} | while read FILE
  do
${ECHO} util/post CA >> /build/debug &&
    BASE=$( ${BASENAME} ${FILE} ) &&
${ECHO} util/post CB >> /build/debug &&
        if [ -L ${FILE} ]
        then
          ${ECHO} "- name: ${BASE}" >> ${TARGET} &&
${ECHO} util/post DAA >> /build/debug &&
            ${ECHO} "  type: link" >> ${TARGET}
        elif [ -f ${FILE} ]
        then
${ECHO} util/post DBA >> /build/debug &&
          ${ECHO} "- contents:" >> ${TARGET} &&
${ECHO} util/post DBB >> /build/debug &&
            ${SED} -e "s#^#    #" ${FILE} >> ${TARGET} &&
${ECHO} util/post DBC >> /build/debug &&
            ${ECHO} "  name: ${BASE}" >> ${TARGET} &&
${ECHO} util/post DBD >> /build/debug &&
            ${ECHO} "  type: file" >> ${TARGET}
        else
${ECHO} util/post DCA >> /build/debug &&
          ${ECHO} "  type:  other" >> ${TARGET}
        fi
    done
