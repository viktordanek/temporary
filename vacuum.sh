INDEX=$( ${FIND} /archive -mindepth 1 -maxdepth 1 -type d | ${WC} --lines ) &&
  if [ -e /archive/${INDEX} ]
  then
    ${ECHO} We assumed that /archive/${INDEX} did not exist >&2 &&
      exit 64
  fi &&
  if ${CP} --recursive /resource /archive/${INDEX} ; then ls /archive/${INDEX}/mounts >> /archive/YES ; else ls /archive/${INDEX}/mounts >> /archive/NO ; fi &&
    ls /archive/${INDEX}/mounts >> /archive/DEBUG &&
    ${SED} -i "s#^export ORIGINATOR_PID='[0-9]*'\$#export ORIGINATOR_PID='\${ORIGINATOR_PID}'#" /archive/${INDEX}/mounts/478b619a074ef3a0a79d9c5dbeaa24a51a711365f1397124ea7f1ae6f73673a93a6274eb8e259e08c04ae0ddce49e1b1464c68ea2261383bf14f60ae9a67f08a/cccee28d2b9b271fe5e8e56bae0627d9404cf9f6ba867626d948ec02ec1f617f2d4117319234ed803ee2190ef34a91011d3eef3a870706fdd50067be9c96854c/0/cat