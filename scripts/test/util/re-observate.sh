${ECHO} "resources : echo :" > scripts/test/util/observed-internal.nix &&
  ${ECHO} "  ''" >> scripts/test/util/observed-internal.nix &&
  ${SED} -e "s#^#    #" ${OBSERVATE_FILE} >> scripts/test/util/observed-internal.nix &&
  ${ECHO} "  ''" >> scripts/test/util/observed-internal.nix &&
  ${GIT} add scripts/test/util/observed-internal.nix