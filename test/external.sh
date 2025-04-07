export CANDIDATE=${1} &&
  export CAT=${2} &&
  export FIND=${3} &&
  export INTERNAL=${4} &&
  export MKDIR=${5} &&
  export SLEEP=${6} &&
  export TOUCH=${7} &&
  ${MKDIR} /build/archive &&
  ${MKDIR} /build/resources &&
  export RESOURCES=/build/resources &&
  ${TOUCH} /build/archive/FLAG &&
  ( ${INTERNAL} ${CANDIDATE} & ) &&
  ${FIND} /build &&
  echo ${CAT} /build/initial.d23b6bd5ae72a50ccf19180b2c8b72f616ef51da34a2111daaf2cc80e99a3492c0eebd3b3745f46b5d77442f562b55251b4131906f05991b8d46c5cde6df08d6/target &&
  ${FIND} /build/resources &&
  ${SLEEP} 10s &&
  ${FIND} /build/archive