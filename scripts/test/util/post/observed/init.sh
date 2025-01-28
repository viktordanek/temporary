TARGET=${e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d} &&
  ${FIND} ${@} -mindepth 1 -maxdepth 1 -type f | ${SORT} | while read FILE
  do
    BASE=$( ${BASENAME} ${FILE} ) &&
        ${ECHO} "- name: ${BASE}" >> ${TARGET} &&
        if [ -f ${FILE} ]
        then
          ${ECHO} "  type: file" >> ${TARGET}
        elif [ -L ${FILE} ]
        then
          ${ECHO} "  type: link" >> ${TARGET}
        else
          ${ECHO} "  type:  other" >> ${TARGET}
        fi
    done