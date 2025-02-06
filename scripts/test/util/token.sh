if [ -t 0 ] || [[ "$( ${READLINK} /proc/self/fd/0 )" == pipe:* ]]
then
  STANDARD_INPUT=$( ${TEE} )
else
  STANDARD_INPUT=
fi &&
  TARGET=${a1bf1278edcdadde99ea528e6f7fb99c069e840bb2bc10f5e54326df380677e399d911352ba22cce94ad7817efae178bc5844b74b874d1ded5bca309f55d78a7} &&
    TEMPORARY_PATH=${bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b} &&
    ${ECHO} -n "${TEMPORARY_PATH}-${STANDARD_INPUT}-${@}" >> ${TARGET}