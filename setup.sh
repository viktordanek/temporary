export RESOURCE=$( ${MKTEMP} --directory ) &&
  export TARGET_MOUNT=${RESOURCE}/mount &&
  ${MKDIR} ${TARGET_MOUNT}