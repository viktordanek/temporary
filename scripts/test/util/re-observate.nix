{ pkgs ? import <nixpkgs> { } } :
    pkgs.mkShell
        {
            shellHook =
                ''
                    ${ pkgs.coreutils }/bin/mkdir /build/observed &&
                         ep }/bin/grep "^temporary/" /build/*.tmp/temporary" | ${ pkgs.coreutils }/bin/wc --lines > /build/observed/temporary/count.post
                '' ;
        }