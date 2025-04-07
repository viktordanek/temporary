export CANDIDATE=${1} &&
  export FIND=${2} &&
  export INTERNAL=${3} &&
  export MKDIR=${4} &&
  export SLEEP=${5} &&
  export TOUCH=${6} &&
  ${MKDIR} /build/archive &&
  ${MKDIR} /build/resources &&
  export RESOURCES=/build/resources &&
  ${TOUCH} /build/archive/FLAG &&
  ( ${INTERNAL} ${CANDIDATE} & ) &&
  ${SLEEP} 10s &&
  ${FIND} /build/archive