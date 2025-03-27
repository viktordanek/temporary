{
    inputs =
        {
            flake-utils.url = "github:numtide/flake-utils" ;
            nixpkgs.url = "github:NixOs/nixpkgs" ;
            shell-script.url = "github:viktordanek/shell-script" ;
            string.url = "github:viktordanek/string" ;
            visitor.url = "github:viktordanek/visitor" ;
        } ;
    outputs =
        { flake-utils , nixpkgs , self , shell-script , string , visitor } :
            let
                fun =
                    system :
                        let
                            lib =
                                {
                                    host-path ? "\${TMP_DIR}" ,
                                    init ? null ,
                                    lock-failure ? 64 ,
                                    post ? null ,
                                    release ? null ,
                                    shell-scripts ? { } ,
                                    tests ? null
                                } :
                                    let
                                        primary =
                                            {
                                                lock-failure =
                                                    if builtins.typeOf lock-failure == "int" then builtins.toString lock-failure
                                                    else builtins.throw "lock-failure is not int but ${ builtins.typeOf lock-failure }." ;
                                            } ;
                                        scripts =
                                            let
                                                _shell-script = builtins.getAttr system shell-script.lib ;
                                                in
                                                    {
                                                        teardown =
                                                            _shell-script
                                                                {
                                                                    environment =
                                                                        { string } :
                                                                            [
                                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                ( string "FLOCK" "${ pkgs.coreutils }/bin/flock" )
                                                                                ( string "LOCK_FAILURE" primary.lock-failure )
                                                                                ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                ( string "TAIL" "${ pkgs.coreutils }/bin/tail" )
                                                                                ( string "TRUE" "${ pkgs.coreutils }/bin/true" )
                                                                            ] ;
                                                                    extensions =
                                                                        {
                                                                            string = builtins.getAttr system string.lib ;
                                                                        } ;
                                                                    name = "teardown" ;
                                                                    script = builtins.toFile "teardown" ( builtins.readFile ( self + "/teardown.sh" ) ) ;
                                                                    tests =
                                                                        ignore :
                                                                            {
                                                                                mounts = { } ;
                                                                                standard-error = "" ;
                                                                                standard-output = "" ;
                                                                                status = 168 ;
                                                                            } ;
                                                                } ;
                                                    } ;
                                        in
                                            {
                                                scripts = scripts ;
                                            } ;
                            pkgs = builtins.import nixpkgs { system = system ; } ;
                            in
                                {
                                    checks =
                                        {
                                            foobar =
                                                pkgs.stdenv.mkDerivation
                                                    {
                                                        installPhase =
                                                            let
                                                                foobar = lib { } ;
                                                                in
                                                                    ''
                                                                        ${ pkgs.coreutils }/bin/touch $out &&
                                                                            ${ pkgs.coreutils }/bin/echo ${ builtins.trace ( builtins.concatStringsSep " ; " ( builtins.attrNames foobar ) ) foobar.scripts.teardown.shell-script } &&
                                                                            exit 71
                                                                    '' ;
                                                        name = "foobar" ;
                                                        src = ./. ;
                                                    } ;
                                        } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}