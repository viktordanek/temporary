{
    inputs =
        {
            flake-utils.url = "github:numtide/flake-utils" ;
            nixpkgs.url = "github:NixOs/nixpkgs" ;
            shell-script.url = "github:viktordanek/shell-script/milestone/03282025" ;
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
                                                                            filtered = builtins.filter ( x : builtins.any ( i : x.index == i ) [ 0 1 2 3 5 16 17 18 19 ] ) with-index ;
                                                                            simplified = builtins.map ( x : x.line ) filtered ;
                                                                            in builtins.toFile "teardown" ( builtins.concatStringsSep "\n" simplified ) ;
                                                                    tests =
                                                                        ignore :
                                                                            {
                                                                                mounts =
                                                                                    {
                                                                                        "/resource" =
                                                                                            {
                                                                                                initial =
                                                                                                    [
                                                                                                        "mkdir /mount/target"
                                                                                                        "touch /mount/target/.gitkeep"
                                                                                                    ] ;
                                                                                                expected = self + "/expected/mounts/resource" ;
                                                                                            } ;
                                                                                    } ;
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
                                                                            if [ -f ${ foobar.scripts.teardown.tests }/SUCCESS ]
                                                                            then
                                                                                ${ pkgs.coreutils }/bin/echo There was a successful test of ${ foobar.scripts.teardown.tests }. &&
                                                                                    exit 71
                                                                            elif [ -f ${ foobar.scripts.teardown.tests }/FAILURE ]
                                                                            then
                                                                                ${ pkgs.coreutils }/bin/echo There was a predicted failure in ${ foobar.scripts.teardown.tests }. >&2 &&]
                                                                                    exit 63
                                                                            else
                                                                                ${ pkgs.coreutils }/bin/echo There was an unpredicted failure in ${ foobar.scripts.teardown.tests }. >&2 &&
                                                                                    exit 62
                                                                            fi &&
                                                                            exit 61
                                                                    '' ;
                                                        name = "foobar" ;
                                                        src = ./. ;
                                                    } ;
                                        } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}