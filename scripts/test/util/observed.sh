${MKDIR} --parents /build/observed/temporary &&
  ${FIND} /build/ -mindepth 1 -maxdepth 1 -type d -name "temporary.*" -exec ${WC} \; > /build/observed/temporary/count.pre &&
  T1=$( ${ECHO} 614d5db27e7230bccb87dad7dc87d9aa1965f9378dec5f854731a1b296be2ea21b0525ab73619d3f45214522a484674b4ac2bfd73ee43b2549dafd5ee456e65 | ${TEMP_1} 4b8acd28e3e0d5366c84d3a5e3bae5fce663b88c31d98a4304897c7b37c344fa1acf58242673faec8664b2937c515d59109a2546b3a6f32dfad9c567e309c374 ) &&
  ${FIND} /build -name temporary.* -mindepth 1 -maxdepth 1 -type d -exec ${WC} \; > /build/observed/temporary/count.post
