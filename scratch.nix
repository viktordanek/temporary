                                                        wtf =
                                                            ''
                                                                    # ${ pkgs.bash }/bin/bash -c "${ pkgs.writeShellScript "observed" ( builtins.import ( self + "/scripts/test/util/observed.nix" ) resources "${ pkgs.coreutils }/bin/echo" ) } && ${ pkgs.findutils }/bin/find /build/*.tmp -mindepth 1 -maxdepth 1 -type f -name temporary -exec ${ pkgs.gnugrep }/bin/grep ^temporary/ {} \; | ${ pkgs.coreutils }/bin/wc --lines > /build/observed/temporary/count.mid" &&
                                                                    ${ builtins.trace ( builtins.toString ( builtins.stringLength ( builtins.readFile ( self + "/scripts/test/util/observed.nix" ) ) ) ) "exit 2" }

                                                            '' ;

                                                        installPhase2 =
                                                            ''
                                                                ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                    exit 10 &&
                                                                    ${ pkgs.coreutils }/bin/echo $out &&
                                                                    ${ pkgs.coreutils }/bin/mkdir $out/bin &&
                                                                    ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/re-expectate.sh" } $out/bin/re-expectate.sh &&
                                                                    ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/re-expectate.sh &&
                                                                    makeWrapper $out/bin/re-expectate.sh $out/bin/re-expectate --set CP ${ pkgs.coreutils }/bin/cp --set GIT ${ pkgs.git }/bin/git --set OBSERVED $out/observed --set TOUCH ${ pkgs.coreutils }/bin/touch &&
                                                                    ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/re-observate.sh" } $out/bin/re-observate.sh &&
                                                                    ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/re-observate.sh &&
                                                                    makeWrapper $out/bin/re-observate.sh $out/bin/re-observate --set CAT ${ pkgs.coreutils }/bin/cat --set CHMOD ${ pkgs.coreutils }/bin/chmod --set OBSERVATE ${ re-observate } &&
                                                                    ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/test.sh" } $out/bin/test.sh &&

                                                                    ${ pkgs.coreutils }/bin/mkdir /build/observed &&
                                                                    ${ pkgs.coreutils }/bin/mkdir /build/observed/temporary &&
                                                                    ${ pkgs.findutils }/bin/find /build/*.tmp -mindepth 1 -maxdepth 1 -type f -name temporary -exec ${ pkgs.gnugrep }/bin/grep ^temporary/ {} \; | ${ pkgs.coreutils }/bin/wc --lines > /build/observed/temporary/count.pre &&
                                                                    exit 1 &&
                                                                    ${ pkgs.coreutils }/bin/sleep 10s &&
                                                                    ${ pkgs.findutils }/bin/find /build/*.tmp -mindepth 1 -maxdepth 1 -type f -name temporary -exec ${ pkgs.gnugrep }/bin/grep ^temporary/ {} \; | ${ pkgs.coreutils }/bin/wc --lines > /build/observed/temporary/count.post &&

                                                                    ${ pkgs.coreutils }/bin/mv /build/observed $out/observed &&

                                                                    export DIFF=${ pkgs.diffutils }/bin/diff &&
                                                                    export EXPECTED=${ self + "/expected" } &&
                                                                    export FIND=${ pkgs.findutils }/bin/find &&
                                                                    export OBSERVED=$out/observed &&
                                                                    ${ pkgs.bash_unit }/bin/bash_unit $out/bin/test.sh
                                                            '' ;