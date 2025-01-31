${ECHO} "echo : resources : sleep : find : grep : wc :" > scripts/test/util/observed-internal.nix &&
  ${ECHO} "  {" >> scripts/test/util/observed-internal.nix &&
  ${SED} -e "s#^#    #" ${OBSERVATE_FILE} >> scripts/test/util/observed-internal.nix &&
  ${ECHO} >> scripts/test/util/observed-internal.nix &&
  ${ECHO} "    ${SLEEP} 10s" >> scripts/test/util/observed-internal.nix &&
  ${ECHO} "    ${FIND} /build -mindepth 2 -maxdepth 2 -type f -name temporary -exec ${GREP} ^temporary {} \; | ${WC} --lines > /build/observed/temporary/count.mid" > scripts/test/util/observed-internal.nix
  ${ECHO} "  }" >> scripts/test/util/observed-internal.nix