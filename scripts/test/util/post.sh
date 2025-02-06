TARGET=${a1bf1278edcdadde99ea528e6f7fb99c069e840bb2bc10f5e54326df380677e399d911352ba22cce94ad7817efae178bc5844b74b874d1ded5bca309f55d78a7} &&
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
