${FIND} ${OUT}/links -mindepth 1 -maxdepth 1 -type l -exec ${READLINK} {} \; | ${SORT} | while read DERIVATIVE
do
  ${DERIVATIVE}/bin/observe
done