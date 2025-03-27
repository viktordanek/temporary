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
                                                                    script =
                                                                        let
                                                                            all = builtins.filter ( x : builtins.typeOf x == "string" ) ( builtins.split "\n" ( builtins.readFile ( builtins.toString ( self + "/teardown.sh" ) ) ) ) ;
                                                                            with-index = builtins.genList ( index : { index = index ; line = builtins.elemAt all index ; } ) ( builtins.length all ) ;
                                                                            filtered = builtins.filter ( x : builtins.any ( i : x.index == i ) [ 0 1 2 3 5 6 7 8 9 10 13 16 17 18 19 ] ) with-index ;
                                                                            simplified = builtins.map ( x : x.line ) filtered ;
                                                                            in builtins.toFile "teardown" ( builtins.concatStringsSep "\n" simplified ) ;
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
                                                                            ${ pkgs.coreutils }/bin/echo ${ foobar.scripts.teardown.shell-script } &&
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