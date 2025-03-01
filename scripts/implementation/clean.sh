${FIND} $( ${ECHO} ${RESOURCE_MASK} | ${SED} -e "s#^#\${TMPDIR}#" -e "s#X\+#*#g" ) -mindepth 1 -maxdepth 1 -type f -name teardown-asynch | ${SORT} | while read FILE
do
  DIRECTORY=$( ${DIRNAME} ${FILE} ) &&
    exec 201 >${DIRECTORY}.lock &&
    ${FLOCK} 201 &&
    ${FILE} &&
    ${RM} ${DIRECTORY}.lock &&
done