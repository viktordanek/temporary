ERROR=0 &&
  while read LINK
  do
    ${ECHO} &&
      export ARCHIVE=$( ${MKTEMP} --directory ) &&
      export RESOURCES=$( ${MKTEMP} --directory ) &&
      ${BASENAME} ${LINK} &&
      ${ECHO} tests ${OUT} &&
      DERIVATIVE=$( ${READLINK} ${LINK} ) &&
      if ! ${DERIVATIVE}/bin/observe
      then
        ERROR=1
      fi
  done < <( ${FIND} ${OUT}/links -mindepth 1 -maxdepth 1 -type l | ${SORT} ) &&
  if [ ${ERROR} != 0 ]
  then
    exit 63
  fi