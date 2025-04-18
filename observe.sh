${FIND} ${OUT}/links -mindepth 1 -maxdepth 1 -type l | ${SORT} | while read LINK
do
  ${ECHO} &&
    ${BASENAME} ${LINK} &&
    ${ECHO} tests ${OUT} &&
    DERIVATIVE=$( ${READLINK} ${LINK} ) &&
    ${DERIVATIVE}/bin/observe
done