${MKDIR} --parents /build/observed/temporary &&
  ${FIND} /build/ -mindepth 1 -maxdepth 1 -type d -name "tmp.*" | ${WC} > /build/observed/temporary/precount &&
  T1=$( ${ECHO} 614d5db27e7230bccb87dad7dc87d9aa1965f9378dec5f854731a1b296be2ea21b0525ab73619d3f45214522a484674b4ac2bfd73ee43b2549dafd5ee456e65 | ${TEMP_1} 4b8acd28e3e0d5366c84d3a5e3bae5fce663b88c31d98a4304897c7b37c344fa1acf58242673faec8664b2937c515d59109a2546b3a6f32dfad9c567e309c374 ) &&
  ${ECHO} PASTE=e83f3c739d0d155db02acce1e98e6b2ac3d0c0c9d965f80118e122401f74e33ff42942716c729ce8e45ab9ecd2d97ef868bffefc0fae56d79efe5c9438a44f1c ${T1}