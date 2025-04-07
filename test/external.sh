export CANDIDATE=${1} &&
  export FIND=${2} &&
  export INTERNAL=${3} &&
  export SLEEP=${4} &&
  export TOUCH=${5} &&
  ls -lah / &&
  ${TOUCH} /build/archive.flag &&
  ( ${INTERNAL} ${CANDIDATE} & ) &&
  ${SLEEP} 10s &&
  ${FIND} /build/artifact